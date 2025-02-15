package emfsyncer.solution.pull

import de.hub.mse.ttc2020.benchmark.AbstractTask
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EPackage
import emf_syncer.EMFSyncer

class Task_4_M2_M1_M2 extends AbstractTask {
	val EMFSyncer syncer
	
	new (EPackage model1, EPackage model2) {
		super(model1, model2);
		syncer = new EMFSyncer(#['scenario4_v2'], model1, newArrayList(Task_2_M2_M1_M2.mapping))
	}
	
	override migrate(EObject instance) {
		val container_v2 = instance as scenario4_v2.Container
		return syncer.forwardSync(container_v2) as scenario4_v1.Container
	}
	
	override migrateBack(EObject instance) {
		val container_v1 = instance as scenario4_v1.Container
		return syncer.backSync(container_v1) as scenario4_v2.Container
	}
	
	override modify(EObject instance) {	}
	
}