Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46527E3834
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbjKGJwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjKGJwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CB011A
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:39 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58E67468;
        Tue,  7 Nov 2023 10:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350737;
        bh=wRBknlToqM44Q7j3BP0Y2c750SE0b7/gU4HhkeW2Qxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bzo6hVzaM3DeMyQ1iwSm8qLgiqweFGOlQiLb1R6B9CBCwmxjHmRpoSb6SUtCIHdWo
         1gpIJ9xQDwhd5tLRpaIrL8CQcq9vESEP3O4pMsLkE9agJD/21bwJKp14arzF956+Wx
         aM5B3Jtyhtrh49b/gWv/Ov50+1WR76Gpx5I7ArsU=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 8/9] staging: vc04_services: Drop vchiq_log_trace() in favour of dev_dbg
Date:   Tue,  7 Nov 2023 04:51:55 -0500
Message-ID: <20231107095156.365492-9-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107095156.365492-1-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drop vchiq_log_trace() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  75 +++++++-----
 .../interface/vchiq_arm/vchiq_core.c          | 115 ++++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |   4 -
 .../interface/vchiq_arm/vchiq_dev.c           |  17 +--
 4 files changed, 116 insertions(+), 95 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index bc0ee8b9d1c3..5bf22ff8ba83 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -255,8 +255,8 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
 				      GFP_KERNEL);
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - %pK", __func__, pagelist);
+	dev_dbg(instance->state->dev,
+		"%s: %s: %s - %pK\n", log_cat(VCHIQ_ARM), log_type(TRACE), __func__, pagelist);
 
 	if (!pagelist)
 		return NULL;
@@ -407,8 +407,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - %pK, %d", __func__, pagelistinfo->pagelist, actual);
+	dev_dbg(instance->state->dev, "%s: %s: %s - %pK, %d\n",
+		log_cat(VCHIQ_ARM), log_type(TRACE), __func__, pagelistinfo->pagelist, actual);
 
 	/*
 	 * NOTE: dma_unmap_sg must be called before the
@@ -712,8 +712,9 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 	ret = 0;
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, ret);
+	dev_dbg(state->dev,
+		"%s: %s: %s(%p): returning %d\n", __func__,
+		log_cat(VCHIQ_CORE), log_type(TRACE), instance, ret);
 
 	return ret;
 }
@@ -746,8 +747,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 
 	mutex_unlock(&state->mutex);
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev,
+		"%s: %s: %s(%p): returning %d\n", __func__,
+		log_cat(VCHIQ_CORE), log_type(TRACE), instance, status);
 
 	free_bulk_waiter(instance);
 	kfree(instance);
@@ -767,8 +769,9 @@ int vchiq_connect(struct vchiq_instance *instance)
 	struct vchiq_state *state = instance->state;
 
 	if (mutex_lock_killable(&state->mutex)) {
-		vchiq_log_trace(state->dev, VCHIQ_CORE,
-				"%s: call to mutex_lock failed", __func__);
+		dev_dbg(state->dev,
+			"%s: %s: %s: call to mutex_lock failed\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE), __func__);
 		status = -EAGAIN;
 		goto failed;
 	}
@@ -780,8 +783,9 @@ int vchiq_connect(struct vchiq_instance *instance)
 	mutex_unlock(&state->mutex);
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev,
+		"%s: %s: %s(%p): returning %d\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE), __func__, instance, status);
 
 	return status;
 }
@@ -812,8 +816,9 @@ vchiq_add_service(struct vchiq_instance *instance,
 		status = -EINVAL;
 	}
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev,
+		"%s: %s: %s(%p): returning %d\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE), __func__, instance, status);
 
 	return status;
 }
@@ -844,8 +849,9 @@ vchiq_open_service(struct vchiq_instance *instance,
 	}
 
 failed:
-	vchiq_log_trace(state->dev, VCHIQ_CORE,
-			"%s(%p): returning %d", __func__, instance, status);
+	dev_dbg(state->dev,
+		"%s: %s: %s(%p): returning %d\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE), __func__, instance, status);
 
 	return status;
 }
@@ -1015,8 +1021,9 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
 		/* Out of space - wait for the client */
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-		vchiq_log_trace(instance->state->dev, VCHIQ_CORE,
-				"%s - completion queue full", __func__);
+		dev_dbg(instance->state->dev,
+			"%s: %s: %s - completion queue full\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE), __func__);
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
 			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
@@ -1104,11 +1111,12 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	vchiq_service_get(service);
 	rcu_read_unlock();
 
-	vchiq_log_trace(service->state->dev, VCHIQ_ARM,
-			"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
-			__func__, (unsigned long)user_service, service->localport,
-			user_service->userdata, reason, (unsigned long)header,
-			(unsigned long)instance, (unsigned long)bulk_userdata);
+	dev_dbg(service->state->dev,
+		"%s: %s: %s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx\n",
+		log_cat(VCHIQ_ARM), log_type(TRACE),
+		__func__, (unsigned long)user_service, service->localport,
+		user_service->userdata, reason, (unsigned long)header,
+		(unsigned long)instance, (unsigned long)bulk_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&msg_queue_spinlock);
@@ -1117,8 +1125,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			vchiq_log_trace(service->state->dev, VCHIQ_ARM,
-					"%s - msg queue full", __func__);
+			dev_dbg(service->state->dev,
+				"%s: %s: %s - msg queue full\n",
+				log_cat(VCHIQ_ARM), log_type(TRACE), __func__);
 			/*
 			 * If there is no MESSAGE_AVAILABLE in the completion
 			 * queue, add one
@@ -1466,8 +1475,9 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	local_uc = ++arm_state->videocore_use_count;
 	++(*entity_uc);
 
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
-			__func__, entity, *entity_uc, local_uc);
+	dev_dbg(state->dev, "%s: %s: %s %s count %d, state count %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(TRACE), __func__,
+		entity, *entity_uc, local_uc);
 
 	write_unlock_bh(&arm_state->susp_res_lock);
 
@@ -1486,7 +1496,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 out:
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
+	dev_dbg(state->dev, "%s: %s: %s exit %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(TRACE), __func__, ret);
 	return ret;
 }
 
@@ -1524,14 +1535,16 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	--arm_state->videocore_use_count;
 	--(*entity_uc);
 
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
-			__func__, entity, *entity_uc, arm_state->videocore_use_count);
+	dev_dbg(state->dev, "%s: %s: %s %s count %d, state count %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(TRACE), __func__,
+		entity, *entity_uc, arm_state->videocore_use_count);
 
 unlock:
 	write_unlock_bh(&arm_state->susp_res_lock);
 
 out:
-	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
+	dev_dbg(state->dev, "%s: %s: %s exit %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(TRACE), __func__, ret);
 	return ret;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 20055aea29f5..f8578d4c81bc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -459,9 +459,10 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 {
 	int status;
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE, "%d: callback:%d (%s, %pK, %pK)",
-			service->state->id, service->localport, reason_names[reason],
-			header, bulk_userdata);
+	dev_dbg(service->state->dev, "%s: %s: %d: callback:%d (%s, %pK, %pK)\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE),
+		service->state->id, service->localport, reason_names[reason],
+		header, bulk_userdata);
 	status = service->base.callback(service->instance, reason, header, service->handle,
 					bulk_userdata);
 	if (status && (status != -EAGAIN)) {
@@ -763,8 +764,9 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			 * it has dropped below its quota
 			 */
 			complete(&quota->quota_event);
-			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_use->%d",
-					state->id, port, header->size, header, count - 1);
+			dev_dbg(state->dev, "%s: %s: %d: pfq:%d %x@%pK - slot_use->%d\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE),
+				state->id, port, header->size, header, count - 1);
 		} else {
 			dev_dbg(state->dev,
 				"%s: %s: service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
@@ -810,9 +812,10 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 		 */
 		rmb();
 
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq %d=%pK %x %x",
-				state->id, slot_index, data, local->slot_queue_recycle,
-				slot_queue_available);
+		dev_dbg(state->dev, "%s: %s: %d: pfq %d=%pK %x %x\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE),
+			state->id, slot_index, data, local->slot_queue_recycle,
+			slot_queue_available);
 
 		/* Initialise the bitmask for services which have used this slot */
 		memset(service_found, 0, length);
@@ -982,10 +985,11 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		       ((tx_end_index != quota->previous_tx_index) &&
 			(quota->slot_use_count == quota->slot_quota))) {
 			spin_unlock(&quota_spinlock);
-			vchiq_log_trace(state->dev, VCHIQ_CORE,
-					"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
-					state->id, service->localport, msg_type_str(type), size,
-					quota->message_use_count, quota->slot_use_count);
+			dev_dbg(state->dev,
+				"%s: %s: %d: qm:%d %s,%zx - quota stall (msg %d, slot %d)\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE),
+				state->id, service->localport, msg_type_str(type), size,
+				quota->message_use_count, quota->slot_use_count);
 			VCHIQ_SERVICE_STATS_INC(service, quota_stalls);
 			mutex_unlock(&state->slot_mutex);
 			if (wait_for_completion_interruptible(&quota->quota_event))
@@ -1075,10 +1079,10 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		spin_unlock(&quota_spinlock);
 
 		if (slot_use_count)
-			vchiq_log_trace(state->dev, VCHIQ_CORE,
-					"%d: qm:%d %s,%zx - slot_use->%d (hdr %p)", state->id,
-					service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
-					size, slot_use_count, header);
+			dev_dbg(state->dev, "%s: %s: %d: qm:%d %s,%zx - slot_use->%d (hdr %p)\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE), state->id,
+				service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
+				size, slot_use_count, header);
 
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
@@ -1207,11 +1211,12 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-	vchiq_log_trace(state->dev, VCHIQ_SYNC,
-			"Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d",
-			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
-			VCHIQ_MSG_DSTPORT(msgid), size);
+	dev_dbg(state->dev,
+		"%s: %s: Sent Sync Msg %s(%u) to %p4cc s:%u d:%d len:%d\n",
+		log_cat(VCHIQ_SYNC), log_type(TRACE),
+		msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+		&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
+		VCHIQ_MSG_DSTPORT(msgid), size);
 
 	remote_event_signal(&state->remote->sync_trigger);
 
@@ -1300,11 +1305,12 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 {
 	int status = 0;
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
-			"%d: nb:%d %cx - p=%x rn=%x r=%x",
-			service->state->id, service->localport,
-			(queue == &service->bulk_tx) ? 't' : 'r',
-			queue->process, queue->remote_notify, queue->remove);
+	dev_dbg(service->state->dev,
+		"%s: %s: %d: nb:%d %cx - p=%x rn=%x r=%x\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE),
+		service->state->id, service->localport,
+		(queue == &service->bulk_tx) ? 't' : 'r',
+		queue->process, queue->remote_notify, queue->remove);
 
 	queue->remote_notify = queue->process;
 
@@ -1427,11 +1433,12 @@ abort_outstanding_bulks(struct vchiq_service *service,
 {
 	int is_tx = (queue == &service->bulk_tx);
 
-	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
-			"%d: aob:%d %cx - li=%x ri=%x p=%x",
-			service->state->id, service->localport,
-			is_tx ? 't' : 'r', queue->local_insert,
-			queue->remote_insert, queue->process);
+	dev_dbg(service->state->dev,
+		"%s: %s: %d: aob:%d %cx - li=%x ri=%x p=%x\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE),
+		service->state->id, service->localport,
+		is_tx ? 't' : 'r', queue->local_insert,
+		queue->remote_insert, queue->process);
 
 	WARN_ON((int)(queue->local_insert - queue->process) < 0);
 	WARN_ON((int)(queue->remote_insert - queue->process) < 0);
@@ -1770,10 +1777,11 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 					state->id, msg_type_str(type), header, remoteport,
 					localport, bulk->actual, &bulk->data);
 
-			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs:%d %cx li=%x ri=%x p=%x",
-					state->id, localport,
-					(type == VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
-					queue->local_insert, queue->remote_insert, queue->process);
+			dev_dbg(state->dev, "%s: %s: %d: prs:%d %cx li=%x ri=%x p=%x\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE),
+				state->id, localport,
+				(type == VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
+				queue->local_insert, queue->remote_insert, queue->process);
 
 			DEBUG_TRACE(PARSE_LINE);
 			WARN_ON(queue->process == queue->local_insert);
@@ -1786,13 +1794,13 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_PADDING:
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PADDING@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "%s: %s: %d: prs PADDING@%pK,%x\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE), state->id, header, size);
 		break;
 	case VCHIQ_MSG_PAUSE:
 		/* If initiated, signal the application thread */
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "%s: %s: %d: prs PAUSE@%pK,%x\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE), state->id, header, size);
 		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
 			dev_dbg(state->dev, "%s: %s: %d: PAUSE received in state PAUSED\n",
 				log_cat(VCHIQ_CORE), log_type(ERROR), state->id);
@@ -1808,8 +1816,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
 		break;
 	case VCHIQ_MSG_RESUME:
-		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs RESUME@%pK,%x",
-				state->id, header, size);
+		dev_dbg(state->dev, "%s: %s: %d: prs RESUME@%pK,%x\n",
+			log_cat(VCHIQ_CORE), log_type(TRACE), state->id, header, size);
 		/* Release the slot mutex */
 		mutex_unlock(&state->slot_mutex);
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_CONNECTED);
@@ -2048,10 +2056,9 @@ sync_func(void *v)
 		svc_fourcc = service ? service->base.fourcc
 				     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_trace(state->dev, VCHIQ_SYNC,
-				"Rcvd Msg %s from %p4cc s:%d d:%d len:%d",
-				msg_type_str(type), &svc_fourcc,
-				remoteport, localport, size);
+		dev_dbg(state->dev, "%s: %s: Rcvd Msg %s from %p4cc s:%d d:%d len:%d\n",
+			log_cat(VCHIQ_SYNC), log_type(TRACE),
+			msg_type_str(type), &svc_fourcc, remoteport, localport, size);
 		if (size > 0)
 			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
@@ -2076,8 +2083,9 @@ sync_func(void *v)
 			break;
 
 		case VCHIQ_MSG_DATA:
-			vchiq_log_trace(state->dev, VCHIQ_SYNC, "%d: sf DATA@%pK,%x (%d->%d)",
-					state->id, header, size, remoteport, localport);
+			dev_dbg(state->dev, "%s: %s: %d: sf DATA@%pK,%x (%d->%d)\n",
+				log_cat(VCHIQ_SYNC), log_type(TRACE),
+				state->id, header, size, remoteport, localport);
 
 			if ((service->remoteport == remoteport) &&
 			    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
@@ -3128,9 +3136,10 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	mutex_unlock(&state->slot_mutex);
 	mutex_unlock(&service->bulk_mutex);
 
-	vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: bt:%d %cx li=%x ri=%x p=%x",
-			state->id, service->localport, dir_char, queue->local_insert,
-			queue->remote_insert, queue->process);
+	dev_dbg(state->dev, "%s: %s: %d: bt:%d %cx li=%x ri=%x p=%x\n",
+		log_cat(VCHIQ_CORE), log_type(TRACE),
+		state->id, service->localport, dir_char, queue->local_insert,
+		queue->remote_insert, queue->process);
 
 waiting:
 	vchiq_service_put(service);
@@ -3666,9 +3675,11 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		*s++ = '\0';
 
 		if (label && (*label != '\0'))
-			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
+			dev_dbg(dev, "%s: %s: %s: %08x: %s\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE), label, addr, line_buf);
 		else
-			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
+			dev_dbg(dev, "%s: %s: %s: %08x: %s\n",
+				log_cat(VCHIQ_CORE), log_type(TRACE), label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 80d0100094e6..de0d49e58e39 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -75,10 +75,6 @@ static inline const char *log_type(enum vchiq_log_type t)
 #define vchiq_log_debug(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s debug: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
 #endif
-#ifndef vchiq_log_trace
-#define vchiq_log_trace(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s trace: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
-#endif
 
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 76e16128d4b1..7f5bba005653 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -585,10 +585,10 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	long ret = 0;
 	int i, rc;
 
-	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-			"%s - instance %pK, cmd %s, arg %lx", __func__, instance,
-			((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
-			ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
+	dev_dbg(instance->state->dev, "%s: %s: %s - instance %pK, cmd %s, arg %lx\n",
+		log_cat(VCHIQ_ARM), log_type(TRACE), __func__, instance,
+		((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
+		ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
 
 	switch (cmd) {
 	case VCHIQ_IOC_SHUTDOWN:
@@ -878,10 +878,11 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
 				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	} else {
-		vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
-				"  ioctl instance %pK, cmd %s -> status %d, %ld",
-				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+		dev_dbg(instance->state->dev,
+			"%s: %s: ioctl instance %pK, cmd %s -> status %d\n, %ld\n",
+			log_cat(VCHIQ_ARM), log_type(TRACE),
+			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	}
 
 	return ret;
-- 
2.41.0

