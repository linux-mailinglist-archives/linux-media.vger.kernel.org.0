Return-Path: <linux-media+bounces-1641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0852804CCB
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 09:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 007111C20E2D
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 08:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275DF2C18D;
	Tue,  5 Dec 2023 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rw9P3g34"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF699C
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 00:42:17 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.73])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F19434DB;
	Tue,  5 Dec 2023 09:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701765696;
	bh=v93HBZ7R8LJu0PkIp3jPISWjOgnt4Jn2W7X5Ca4hAzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rw9P3g34Zd8WsuNmkTvzIXTRYEMVtds833NvrfNAWkCiKmiZrdRCVTWP9qX5/sSkS
	 AvwjikAsr2RSk8ZfkAJA9mxaciycRgVDb6UdPNz4RccP4035xo4a4J2/l9qhrfggCf
	 n7Re1IgVu0F+0halKuAY/Ep6JQL8uvl+9fzjqGV4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v3 3/4] staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
Date: Tue,  5 Dec 2023 14:11:56 +0530
Message-ID: <20231205084157.73819-4-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205084157.73819-1-umang.jain@ideasonboard.com>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop vchiq_log_trace() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Meanwhile at it, drop the usage of __func__ from the logs.
Dynamic debug supports this via the 'f'  decorator flag.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  53 ++++-----
 .../interface/vchiq_arm/vchiq_core.c          | 101 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |   4 -
 .../interface/vchiq_arm/vchiq_dev.c           |  15 ++-
 4 files changed, 78 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 56326b59a718..e337b8387647 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -255,8 +255,7 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
 				      GFP_KERNEL);
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - %pK", __func__, pagelist);
+	dev_dbg(instance->state->dev, "arm: %pK\n", pagelist);
 
 	if (!pagelist)
 		return NULL;
@@ -407,8 +406,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - %pK, %d", __func__, pagelistinfo->pagelist, actual);
+	dev_dbg(instance->state->dev, "arm: %pK, %d\n", pagelistinfo->pagelist, actual);
 
 	/*
 	 * NOTE: dma_unmap_sg must be called before the
@@ -708,8 +706,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 	ret = 0;
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, ret);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
 
 	return ret;
 }
@@ -742,8 +739,7 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 
 	mutex_unlock(&state->mutex);
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
 	free_bulk_waiter(instance);
 	kfree(instance);
@@ -763,8 +759,8 @@ int vchiq_connect(struct vchiq_instance *instance)
 	struct vchiq_state *state = instance->state;
 
 	if (mutex_lock_killable(&state->mutex)) {
-		vchiq_log_trace(state->dev, VCHIQ_CORE,
-				"%s: call to mutex_lock failed", __func__);
+		dev_dbg(state->dev,
+			"core: call to mutex_lock failed\n");
 		status = -EAGAIN;
 		goto failed;
 	}
@@ -776,8 +772,7 @@ int vchiq_connect(struct vchiq_instance *instance)
 	mutex_unlock(&state->mutex);
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
 	return status;
 }
@@ -808,8 +803,7 @@ vchiq_add_service(struct vchiq_instance *instance,
 		status = -EINVAL;
 	}
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
 	return status;
 }
@@ -840,8 +834,7 @@ vchiq_open_service(struct vchiq_instance *instance,
 	}
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
 
 	return status;
 }
@@ -1010,8 +1003,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
 		/* Out of space - wait for the client */
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-		vchiq_log_trace(instance->state->dev, VCHIQ_CORE,
-				"%s - completion queue full", __func__);
+		dev_dbg(instance->state->dev, "core: completion queue full\n");
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
 			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
@@ -1099,11 +1091,11 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	vchiq_service_get(service);
 	rcu_read_unlock();
 
-	vchiq_log_trace(service->state->dev, VCHIQ_ARM,
-			"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
-			__func__, (unsigned long)user_service, service->localport,
-			user_service->userdata, reason, (unsigned long)header,
-			(unsigned long)instance, (unsigned long)bulk_userdata);
+	dev_dbg(service->state->dev,
+		"arm: service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx\n",
+		(unsigned long)user_service, service->localport,
+		user_service->userdata, reason, (unsigned long)header,
+		(unsigned long)instance, (unsigned long)bulk_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&msg_queue_spinlock);
@@ -1112,8 +1104,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			vchiq_log_trace(service->state->dev, VCHIQ_ARM,
-					"%s - msg queue full", __func__);
+			dev_dbg(service->state->dev, "arm: msg queue full\n");
 			/*
 			 * If there is no MESSAGE_AVAILABLE in the completion
 			 * queue, add one
@@ -1405,8 +1396,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	local_uc = ++arm_state->videocore_use_count;
 	++(*entity_uc);
 
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
-			__func__, entity, *entity_uc, local_uc);
+	dev_dbg(state->dev, "suspend: %s count %d, state count %d\n",
+		entity, *entity_uc, local_uc);
 
 	write_unlock_bh(&arm_state->susp_res_lock);
 
@@ -1425,7 +1416,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 out:
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
+	dev_dbg(state->dev, "suspend: exit %d\n", ret);
 	return ret;
 }
 
@@ -1463,14 +1454,14 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	--arm_state->videocore_use_count;
 	--(*entity_uc);
 
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
-			__func__, entity, *entity_uc, arm_state->videocore_use_count);
+	dev_dbg(state->dev, "suspend: %s count %d, state count %d\n",
+		entity, *entity_uc, arm_state->videocore_use_count);
 
 unlock:
 	write_unlock_bh(&arm_state->susp_res_lock);
 
 out:
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
+	dev_dbg(state->dev, "suspend: exit %d\n", ret);
 	return ret;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2fd793954001..d197e4504bd4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -459,9 +459,9 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 {
 	int status;
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE, "%d: callback:%d (%s, %pK, %pK)",
-			service->state->id, service->localport, reason_names[reason],
-			header, bulk_userdata);
+	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK)\n",
+		service->state->id, service->localport, reason_names[reason],
+		header, bulk_userdata);
 	status = service->base.callback(service->instance, reason, header, service->handle,
 					bulk_userdata);
 	if (status && (status != -EAGAIN)) {
@@ -763,8 +763,8 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			 * it has dropped below its quota
 			 */
 			complete(&quota->quota_event);
-			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_use->%d",
-					state->id, port, header->size, header, count - 1);
+			dev_dbg(state->dev, "core: %d: pfq:%d %x@%pK - slot_use->%d\n",
+				state->id, port, header->size, header, count - 1);
 		} else {
 			dev_err(state->dev,
 				"core: service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
@@ -809,9 +809,9 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 		 */
 		rmb();
 
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq %d=%pK %x %x",
-				state->id, slot_index, data, local->slot_queue_recycle,
-				slot_queue_available);
+		dev_dbg(state->dev, "core: %d: pfq %d=%pK %x %x\n",
+			state->id, slot_index, data, local->slot_queue_recycle,
+			slot_queue_available);
 
 		/* Initialise the bitmask for services which have used this slot */
 		memset(service_found, 0, length);
@@ -980,10 +980,10 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		       ((tx_end_index != quota->previous_tx_index) &&
 			(quota->slot_use_count == quota->slot_quota))) {
 			spin_unlock(&quota_spinlock);
-			vchiq_log_trace(state->dev, VCHIQ_CORE,
-					"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
-					state->id, service->localport, msg_type_str(type), size,
-					quota->message_use_count, quota->slot_use_count);
+			dev_dbg(state->dev,
+				"core: %d: qm:%d %s,%zx - quota stall (msg %d, slot %d)\n",
+				state->id, service->localport, msg_type_str(type), size,
+				quota->message_use_count, quota->slot_use_count);
 			VCHIQ_SERVICE_STATS_INC(service, quota_stalls);
 			mutex_unlock(&state->slot_mutex);
 			if (wait_for_completion_interruptible(&quota->quota_event))
@@ -1073,10 +1073,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		spin_unlock(&quota_spinlock);
 
 		if (slot_use_count)
-			vchiq_log_trace(state->dev, VCHIQ_CORE,
-					"%d: qm:%d %s,%zx - slot_use->%d (hdr %p)", state->id,
-					service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
-					size, slot_use_count, header);
+			dev_dbg(state->dev, "core: %d: qm:%d %s,%zx - slot_use->%d (hdr %p)\n",
+				state->id, service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
+				size, slot_use_count, header);
 
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
@@ -1205,11 +1204,11 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-	vchiq_log_trace(state->dev, VCHIQ_SYNC,
-			"Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d",
-			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
-			VCHIQ_MSG_DSTPORT(msgid), size);
+	dev_dbg(state->dev,
+		"sync: Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d\n",
+		msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+		&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
+		VCHIQ_MSG_DSTPORT(msgid), size);
 
 	remote_event_signal(&state->remote->sync_trigger);
 
@@ -1298,11 +1297,11 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 {
 	int status = 0;
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
-			"%d: nb:%d %cx - p=%x rn=%x r=%x",
-			service->state->id, service->localport,
-			(queue == &service->bulk_tx) ? 't' : 'r',
-			queue->process, queue->remote_notify, queue->remove);
+	dev_dbg(service->state->dev,
+		"core: %d: nb:%d %cx - p=%x rn=%x r=%x\n",
+		service->state->id, service->localport,
+		(queue == &service->bulk_tx) ? 't' : 'r',
+		queue->process, queue->remote_notify, queue->remove);
 
 	queue->remote_notify = queue->process;
 
@@ -1425,11 +1424,11 @@ abort_outstanding_bulks(struct vchiq_service *service,
 {
 	int is_tx = (queue == &service->bulk_tx);
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
-			"%d: aob:%d %cx - li=%x ri=%x p=%x",
-			service->state->id, service->localport,
-			is_tx ? 't' : 'r', queue->local_insert,
-			queue->remote_insert, queue->process);
+	dev_dbg(service->state->dev,
+		"core: %d: aob:%d %cx - li=%x ri=%x p=%x\n",
+		service->state->id, service->localport,
+		is_tx ? 't' : 'r', queue->local_insert,
+		queue->remote_insert, queue->process);
 
 	WARN_ON((int)(queue->local_insert - queue->process) < 0);
 	WARN_ON((int)(queue->remote_insert - queue->process) < 0);
@@ -1764,10 +1763,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 					state->id, msg_type_str(type), header, remoteport,
 					localport, bulk->actual, &bulk->data);
 
-			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs:%d %cx li=%x ri=%x p=%x",
-					state->id, localport,
-					(type == VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
-					queue->local_insert, queue->remote_insert, queue->process);
+			dev_dbg(state->dev, "core: %d: prs:%d %cx li=%x ri=%x p=%x\n",
+				state->id, localport,
+				(type == VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
+				queue->local_insert, queue->remote_insert, queue->process);
 
 			DEBUG_TRACE(PARSE_LINE);
 			WARN_ON(queue->process == queue->local_insert);
@@ -1780,13 +1779,13 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_PADDING:
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PADDING@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "core: %d: prs PADDING@%pK,%x\n",
+			state->id, header, size);
 		break;
 	case VCHIQ_MSG_PAUSE:
 		/* If initiated, signal the application thread */
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "core: %d: prs PAUSE@%pK,%x\n",
+			state->id, header, size);
 		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
 			dev_err(state->dev, "core: %d: PAUSE received in state PAUSED\n",
 				state->id);
@@ -1802,8 +1801,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
 		break;
 	case VCHIQ_MSG_RESUME:
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs RESUME@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "core: %d: prs RESUME@%pK,%x\n",
+			state->id, header, size);
 		/* Release the slot mutex */
 		mutex_unlock(&state->slot_mutex);
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
@@ -2040,10 +2039,8 @@ sync_func(void *v)
 
 		svc_fourcc = service->base.fourcc;
 
-		vchiq_log_trace(state->dev, VCHIQ_SYNC,
-				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
-				msg_type_str(type), &svc_fourcc,
-				remoteport, localport, size);
+		dev_dbg(state->dev, "sync: Rcvd Msg %s from %p4cc s:%d d:%d len:%d\n",
+			msg_type_str(type), &svc_fourcc, remoteport, localport, size);
 		if (size > 0)
 			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
@@ -2068,8 +2065,8 @@ sync_func(void *v)
 			break;
 
 		case VCHIQ_MSG_DATA:
-			vchiq_log_trace(state->dev, VCHIQ_SYNC, "%d: sf DATA@%pK,%x (%d->%d)",
-					state->id, header, size, remoteport, localport);
+			dev_dbg(state->dev, "sync: %d: sf DATA@%pK,%x (%d->%d)\n",
+				state->id, header, size, remoteport, localport);
 
 			if ((service->remoteport == remoteport) &&
 			    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
@@ -3111,9 +3108,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	mutex_unlock(&state->slot_mutex);
 	mutex_unlock(&service->bulk_mutex);
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: bt:%d %cx li=%x ri=%x p=%x",
-			state->id, service->localport, dir_char, queue->local_insert,
-			queue->remote_insert, queue->process);
+	dev_dbg(state->dev, "core: %d: bt:%d %cx li=%x ri=%x p=%x\n",
+		state->id, service->localport, dir_char, queue->local_insert,
+		queue->remote_insert, queue->process);
 
 waiting:
 	vchiq_service_put(service);
@@ -3579,9 +3576,9 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		*s++ = '\0';
 
 		if (label && (*label != '\0'))
-			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
+			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
 		else
-			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
+			dev_dbg(dev, "core: %s: %08x: %s\n", label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index bc980a001711..36e34a7fc628 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -57,10 +57,6 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 #define vchiq_log_debug(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
-#ifndef vchiq_log_trace
-#define vchiq_log_trace(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s trace: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
-#endif
 
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index ba287cb4c87b..38841c9d8ef9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -582,10 +582,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	long ret = 0;
 	int i, rc;
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - instance %pK, cmd %s, arg %lx", __func__, instance,
-			((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
-			ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
+	dev_dbg(instance->state->dev, "arm: instance %pK, cmd %s, arg %lx\n", instance,
+		((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
+		ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
 
 	switch (cmd) {
 	case VCHIQ_IOC_SHUTDOWN:
@@ -873,10 +872,10 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
 				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	} else {
-		vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-				"  ioctl instance %pK, cmd %s -> status %d, %ld",
-				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+		dev_dbg(instance->state->dev,
+			"arm: ioctl instance %pK, cmd %s -> status %d\n, %ld\n",
+			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	}
 
 	return ret;
-- 
2.41.0


