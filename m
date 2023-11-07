Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4227E3835
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbjKGJwt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbjKGJws (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB7BF3
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:43 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C8539CC;
        Tue,  7 Nov 2023 10:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350741;
        bh=X6Ms63fEvor/4MK9J9V+uHpTsmvqFg52OvqfZuXdfpE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H23QUivLZ6ipubycq44pYgwyCopYz6Jbo5W4oIPU7qVzy3AvNBk0ZnICwITPi1nUM
         JQDJOvqEswHYLV8FMqHBQEa9NC82XccYSKlPe2L4ZfA+pTrUdKCgAObp4r/NdhEoJt
         gqUZhmk746knaBIqRt4jhDeuSeMo+Emt4XYvPYNM=
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
Subject: [PATCH 9/9] staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg
Date:   Tue,  7 Nov 2023 04:51:56 -0500
Message-ID: <20231107095156.365492-10-umang.jain@ideasonboard.com>
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

Drop vchiq_log_debug() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Remove the entry from TODO regarding custom logging. VC04 is now
aligned according to the standard kernel logging mechanisms.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           |  53 ++---
 .../interface/vchiq_arm/vchiq_core.c          | 189 ++++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |   5 -
 .../interface/vchiq_arm/vchiq_dev.c           |  43 ++--
 5 files changed, 155 insertions(+), 140 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 6d9d4a800aa7..05eb5140d096 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -23,11 +23,6 @@ should properly handle a module unload. This also includes that all
 resources must be freed (kthreads, debugfs entries, ...) and global
 variables avoided.
 
-* Cleanup logging mechanism
-
-The driver should probably be using the standard kernel logging mechanisms
-such as dev_info, dev_dbg, and friends.
-
 * Documentation
 
 A short top-down description of this driver's architecture (function of
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 5bf22ff8ba83..4a2023919f5f 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -311,9 +311,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 						   type == PAGELIST_READ, pages);
 
 		if (actual_pages != num_pages) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"%s - only %d/%d pages locked",
-					__func__, actual_pages, num_pages);
+			dev_dbg(instance->state->dev, "%s: %s: %s - only %d/%d pages locked\n",
+				log_cat(VCHIQ_ARM), log_type(DEBUG),
+				__func__, actual_pages, num_pages);
 
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
@@ -556,8 +556,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 		return -ENXIO;
 	}
 
-	vchiq_log_debug(&pdev->dev, VCHIQ_ARM, "vchiq_init - done (slots %pK, phys %pad)",
-			vchiq_slot_zero, &slot_phys);
+	dev_dbg(&pdev->dev, "%s: %s: vchiq_init - done (slots %pK, phys %pad)\n",
+		log_cat(VCHIQ_ARM), log_type(DEBUG), vchiq_slot_zero, &slot_phys);
 
 	vchiq_call_connected_callbacks();
 
@@ -727,9 +727,9 @@ void free_bulk_waiter(struct vchiq_instance *instance)
 	list_for_each_entry_safe(waiter, next,
 				 &instance->bulk_waiter_list, list) {
 		list_del(&waiter->list);
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"bulk_waiter - cleaned up %pK for pid %d",
-				waiter, waiter->pid);
+		dev_dbg(instance->state->dev,
+			"%s: %s: bulk_waiter - cleaned up %pK for pid %d\n",
+			log_cat(VCHIQ_ARM), log_type(DEBUG), waiter, waiter->pid);
 		kfree(waiter);
 	}
 }
@@ -999,9 +999,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"saved bulk_waiter %pK for pid %d", waiter,
-				current->pid);
+		dev_dbg(instance->state->dev, "%s: %s: saved bulk_waiter %pK for pid %d\n",
+			log_cat(VCHIQ_ARM), log_type(DEBUG), waiter, current->pid);
 	}
 
 	return status;
@@ -1026,12 +1025,12 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 			log_cat(VCHIQ_CORE), log_type(TRACE), __func__);
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"service_callback interrupted");
+			dev_dbg(instance->state->dev, "%s: %s: service_callback interrupted\n",
+				log_cat(VCHIQ_ARM), log_type(DEBUG));
 			return -EAGAIN;
 		} else if (instance->closing) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"service_callback closing");
+			dev_dbg(instance->state->dev, "%s: %s: service_callback closing\n",
+				log_cat(VCHIQ_ARM), log_type(DEBUG));
 			return 0;
 		}
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
@@ -1136,8 +1135,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 				instance->completion_remove) < 0) {
 				int status;
 
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"Inserting extra MESSAGE_AVAILABLE");
+				dev_dbg(instance->state->dev,
+					"%s: %s: Inserting extra MESSAGE_AVAILABLE\n",
+					log_cat(VCHIQ_ARM), log_type(DEBUG));
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				status = add_completion(instance, reason, NULL, user_service,
 							bulk_userdata);
@@ -1150,14 +1150,15 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			if (wait_for_completion_interruptible(&user_service->remove_event)) {
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"%s interrupted", __func__);
+				dev_dbg(instance->state->dev,
+					"%s: %s: %s interrupted\n",
+					log_cat(VCHIQ_ARM), log_type(DEBUG), __func__);
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EAGAIN;
 			} else if (instance->closing) {
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"%s closing", __func__);
+				dev_dbg(instance->state->dev, "%s: %s: %s closing",
+					log_cat(VCHIQ_ARM), log_type(DEBUG), __func__);
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EINVAL;
@@ -1773,8 +1774,9 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 	char threadname[16];
 
-	vchiq_log_debug(state->dev, VCHIQ_SUSPEND, "%d: %s->%s", state->id,
-			get_conn_state_name(oldstate), get_conn_state_name(newstate));
+	dev_dbg(state->dev, "%s: %s: %d: %s->%s\n",
+		log_cat(VCHIQ_SUSPEND), log_type(DEBUG), state->id,
+		get_conn_state_name(oldstate), get_conn_state_name(newstate));
 	if (state->conn_state != VCHIQ_CONNSTATE_CONNECTED)
 		return;
 
@@ -1838,9 +1840,8 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init();
 
-	vchiq_log_debug(&pdev->dev, VCHIQ_ARM,
-			"vchiq: platform initialised - version %d (min %d)",
-			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
+	dev_dbg(&pdev->dev, "%s: %s: vchiq: platform initialised - version %d (min %d)\n",
+		log_cat(VCHIQ_ARM), log_type(DEBUG), VCHIQ_VERSION, VCHIQ_VERSION_MIN);
 
 	/*
 	 * Simply exit on error since the function handles cleanup in
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f8578d4c81bc..ec02bc9b74f7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -217,10 +217,11 @@ static const char *msg_type_str(unsigned int msg_type)
 static inline void
 set_service_state(struct vchiq_service *service, int newstate)
 {
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: srv:%d %s->%s",
-			service->state->id, service->localport,
-			srvstate_names[service->srvstate],
-			srvstate_names[newstate]);
+	dev_dbg(service->state->dev, "%s: %s: %d: srv:%d %s->%s\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		service->state->id, service->localport,
+		srvstate_names[service->srvstate],
+		srvstate_names[newstate]);
 	service->srvstate = newstate;
 }
 
@@ -245,8 +246,9 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev,
+		"%s: %s: Invalid service handle 0x%x\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), handle);
 	return NULL;
 }
 
@@ -266,8 +268,8 @@ find_service_by_port(struct vchiq_state *state, unsigned int localport)
 		}
 		rcu_read_unlock();
 	}
-	vchiq_log_debug(state->dev, VCHIQ_CORE,
-			"Invalid port %u", localport);
+	dev_dbg(state->dev, "%s: %s: Invalid port %u\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), localport);
 	return NULL;
 }
 
@@ -287,8 +289,8 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev, "%s: %s: Invalid service handle 0x%x\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), handle);
 	return NULL;
 }
 
@@ -310,8 +312,8 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev, "%s: %s: Invalid service handle 0x%x\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), handle);
 	return service;
 }
 
@@ -483,8 +485,8 @@ vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate)
 {
 	enum vchiq_connstate oldstate = state->conn_state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s->%s", state->id, conn_state_names[oldstate],
-			conn_state_names[newstate]);
+	dev_dbg(state->dev, "%s: %s: %d: %s->%s\n", log_cat(VCHIQ_CORE), log_type(DEBUG),
+		state->id, conn_state_names[oldstate], conn_state_names[newstate]);
 	state->conn_state = newstate;
 	vchiq_platform_conn_state_changed(state, oldstate, newstate);
 }
@@ -1029,9 +1031,10 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		int tx_end_index;
 		int slot_use_count;
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		dev_dbg(state->dev, "%s: %s: %d: qm %s@%pK,%zx (%d->%d)\n",
+			log_cat(VCHIQ_SUSPEND), log_type(DEBUG),
+			state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+			VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 
 		WARN_ON(flags & (QMFLAGS_NO_MUTEX_LOCK |
 				 QMFLAGS_NO_MUTEX_UNLOCK));
@@ -1087,9 +1090,10 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
 	} else {
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		dev_dbg(state->dev, "%s: %s: %d: qm %s@%pK,%zx (%d->%d)\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG), state->id,
+			msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+			VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 		if (size != 0) {
 			/*
 			 * It is assumed for now that this code path
@@ -1117,11 +1121,10 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			? service->base.fourcc
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-				"Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu",
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-				&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
-				VCHIQ_MSG_DSTPORT(msgid), size);
+		dev_dbg(state->dev, "%s: %s: Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu\n",
+			log_cat(VCHIQ_CORE_MSG), log_type(DEBUG),
+			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid), size);
 	}
 
 	/* Make sure the new header is visible to the peer. */
@@ -1177,11 +1180,11 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 				log_cat(VCHIQ_CORE), log_type(ERROR), state->id, oldmsgid);
 	}
 
-	vchiq_log_debug(state->dev, VCHIQ_SYNC,
-			"%d: qms %s@%pK,%x (%d->%d)", state->id,
-			msg_type_str(VCHIQ_MSG_TYPE(msgid)),
-			header, size, VCHIQ_MSG_SRCPORT(msgid),
-			VCHIQ_MSG_DSTPORT(msgid));
+	dev_dbg(state->dev, "%s: %s: %d: qms %s@%pK,%x (%d->%d)\n",
+		log_cat(VCHIQ_SYNC), log_type(DEBUG), state->id,
+		msg_type_str(VCHIQ_MSG_TYPE(msgid)),
+		header, size, VCHIQ_MSG_SRCPORT(msgid),
+		VCHIQ_MSG_DSTPORT(msgid));
 
 	callback_result =
 		copy_message_data(copy_callback, context,
@@ -1268,9 +1271,10 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 			VCHIQ_SLOT_QUEUE_MASK] =
 			SLOT_INDEX_FROM_INFO(state, slot_info);
 		state->remote->slot_queue_recycle = slot_queue_recycle + 1;
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s %d - recycle->%x",
-				state->id, __func__, SLOT_INDEX_FROM_INFO(state, slot_info),
-				state->remote->slot_queue_recycle);
+		dev_dbg(state->dev, "%s: %s: %d: %s %d - recycle->%x\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG),
+			state->id, __func__, SLOT_INDEX_FROM_INFO(state, slot_info),
+			state->remote->slot_queue_recycle);
 
 		/*
 		 * A write barrier is necessary, but remote_event_signal
@@ -1390,8 +1394,9 @@ poll_services_of_group(struct vchiq_state *state, int group)
 
 		service_flags = atomic_xchg(&service->poll_flags, 0);
 		if (service_flags & BIT(VCHIQ_POLL_REMOVE)) {
-			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - remove %d<->%d",
-					state->id, service->localport, service->remoteport);
+			dev_dbg(state->dev, "%s: %s: %d: ps - remove %d<->%d\n",
+				log_cat(VCHIQ_CORE), log_type(DEBUG),
+				state->id, service->localport, service->remoteport);
 
 			/*
 			 * Make it look like a client, because
@@ -1403,8 +1408,9 @@ poll_services_of_group(struct vchiq_state *state, int group)
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_REMOVE);
 		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
-			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - terminate %d<->%d",
-					state->id, service->localport, service->remoteport);
+			dev_dbg(state->dev, "%s: %s: %d: ps - terminate %d<->%d\n",
+				log_cat(VCHIQ_CORE), log_type(DEBUG),
+				state->id, service->localport, service->remoteport);
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_TERMINATE);
 		}
@@ -1457,11 +1463,12 @@ abort_outstanding_bulks(struct vchiq_service *service,
 		if (queue->process != queue->local_insert) {
 			vchiq_complete_bulk(service->instance, bulk);
 
-			vchiq_log_debug(service->state->dev, VCHIQ_CORE_MSG,
-					"%s %p4cc d:%d ABORTED - tx len:%d, rx len:%d",
-					is_tx ? "Send Bulk to" : "Recv Bulk from",
-					&service->base.fourcc,
-					service->remoteport, bulk->size, bulk->remote_size);
+			dev_dbg(service->state->dev,
+				"%s: %s: %s %p4cc d:%d ABORTED - tx len:%d, rx len:%d\n",
+				log_cat(VCHIQ_CORE_MSG), log_type(DEBUG),
+				is_tx ? "Send Bulk to" : "Recv Bulk from",
+				&service->base.fourcc,
+				service->remoteport, bulk->size, bulk->remote_size);
 		} else {
 			/* fabricate a matching dummy bulk */
 			bulk->data = 0;
@@ -1494,8 +1501,9 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 	payload = (struct vchiq_open_payload *)header->data;
 	fourcc = payload->fourcc;
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs OPEN@%pK (%d->'%p4cc')",
-			state->id, header, localport, &fourcc);
+	dev_dbg(state->dev, "%s: %s: %d: prs OPEN@%pK (%d->'%p4cc')\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		state->id, header, localport, &fourcc);
 
 	service = get_listening_service(state, fourcc);
 	if (!service)
@@ -1641,10 +1649,9 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-			"Rcvd Msg %s(%u) from %p4cc s:%d d:%d len:%d",
-			msg_type_str(type), type, &svc_fourcc,
-			remoteport, localport, size);
+	dev_dbg(state->dev, "%s: %s: Rcvd Msg %s(%u) from %p4cc s:%d d:%d len:%d\n",
+		log_cat(VCHIQ_CORE_MSG), log_type(DEBUG),
+		msg_type_str(type), type, &svc_fourcc, remoteport, localport, size);
 	if (size > 0)
 		vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
@@ -1669,10 +1676,11 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				header->data;
 			service->peer_version = payload->version;
 		}
-		vchiq_log_debug(state->dev, VCHIQ_CORE,
-				"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
-				state->id, header, size, remoteport, localport,
-				service->peer_version);
+		dev_dbg(state->dev,
+			"%s: %s: %d: prs OPENACK@%pK,%x (%d->%d) v:%d\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG),
+			state->id, header, size, remoteport, localport,
+			service->peer_version);
 		if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 			service->remoteport = remoteport;
 			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
@@ -1686,21 +1694,23 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	case VCHIQ_MSG_CLOSE:
 		WARN_ON(size); /* There should be no data */
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CLOSE@%pK (%d->%d)",
-				state->id, header, remoteport, localport);
+		dev_dbg(state->dev, "%s: %s: %d: prs CLOSE@%pK (%d->%d)\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG),
+			state->id, header, remoteport, localport);
 
 		mark_service_closing_internal(service, 1);
 
 		if (vchiq_close_service_internal(service, CLOSE_RECVD) == -EAGAIN)
 			goto bail_not_ready;
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "Close Service %p4cc s:%u d:%d",
-				&service->base.fourcc,
-				service->localport, service->remoteport);
+		dev_dbg(state->dev, "%s: %s: Close Service %p4cc s:%u d:%d\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG),
+			&service->base.fourcc, service->localport, service->remoteport);
 		break;
 	case VCHIQ_MSG_DATA:
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs DATA@%pK,%x (%d->%d)",
-				state->id, header, size, remoteport, localport);
+		dev_dbg(state->dev, "%s: %s: %d: prs DATA@%pK,%x (%d->%d)\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG),
+			state->id, header, size, remoteport, localport);
 
 		if ((service->remoteport == remoteport) &&
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
@@ -1719,8 +1729,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_CONNECT:
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CONNECT@%pK",
-				state->id, header);
+		dev_dbg(state->dev, "%s: %s: %d: prs CONNECT@%pK\n",
+			log_cat(VCHIQ_CORE), log_type(DEBUG), state->id, header);
 		state->version_common =	((struct vchiq_slot_zero *)
 					 state->slot_data)->version;
 		complete(&state->connect);
@@ -1772,10 +1782,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			bulk->actual = *(int *)header->data;
 			queue->remote_insert++;
 
-			vchiq_log_debug(state->dev, VCHIQ_CORE,
-					"%d: prs %s@%pK (%d->%d) %x@%pad",
-					state->id, msg_type_str(type), header, remoteport,
-					localport, bulk->actual, &bulk->data);
+			dev_dbg(state->dev, "%s: %s: %d: prs %s@%pK (%d->%d) %x@%pad\n",
+				log_cat(VCHIQ_CORE), log_type(DEBUG),
+				state->id, msg_type_str(type), header, remoteport,
+				localport, bulk->actual, &bulk->data);
 
 			dev_dbg(state->dev, "%s: %s: %d: prs:%d %cx li=%x ri=%x p=%x\n",
 				log_cat(VCHIQ_CORE), log_type(TRACE),
@@ -2070,9 +2080,10 @@ sync_func(void *v)
 					header->data;
 				service->peer_version = payload->version;
 			}
-			vchiq_log_debug(state->dev, VCHIQ_SYNC, "%d: sf OPENACK@%pK,%x (%d->%d) v:%d",
-					state->id, header, size, remoteport, localport,
-					service->peer_version);
+			dev_err(state->dev, "%s: %s: %d: sf OPENACK@%pK,%x (%d->%d) v:%d\n",
+				log_cat(VCHIQ_SYNC), log_type(DEBUG),
+				state->id, header, size, remoteport, localport,
+				service->peer_version);
 			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 				service->remoteport = remoteport;
 				set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
@@ -2476,9 +2487,10 @@ vchiq_add_service_internal(struct vchiq_state *state,
 	/* Bring this service online */
 	set_service_state(service, srvstate);
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG, "%s Service %p4cc SrcPort:%d",
-			(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
-			&params->fourcc, service->localport);
+	dev_dbg(state->dev, "%s: %s: %s Service %p4cc SrcPort:%d\n",
+		log_cat(VCHIQ_CORE_MSG), log_type(DEBUG),
+		(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
+		&params->fourcc, service->localport);
 
 	/* Don't unlock the service - leave it with a ref_count of 1. */
 
@@ -2574,8 +2586,8 @@ release_service_messages(struct vchiq_service *service)
 			int port = VCHIQ_MSG_DSTPORT(msgid);
 
 			if ((port == service->localport) && (msgid & VCHIQ_MSGID_CLAIMED)) {
-				vchiq_log_debug(state->dev, VCHIQ_CORE,
-						"  fsi - hdr %pK", header);
+				dev_dbg(state->dev, "%s: %s:  fsi - hdr %pK\n",
+					log_cat(VCHIQ_CORE), log_type(DEBUG), header);
 				release_slot(state, slot_info, header, NULL);
 			}
 			pos += calc_stride(header->size);
@@ -2685,8 +2697,9 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	int close_id = MAKE_CLOSE(service->localport,
 				  VCHIQ_MSG_DSTPORT(service->remoteport));
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: csi:%d,%d (%s)", service->state->id,
-			service->localport, close_recvd, srvstate_names[service->srvstate]);
+	dev_dbg(state->dev, "%s: %s: %d: csi:%d,%d (%s)\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), service->state->id,
+		service->localport, close_recvd, srvstate_names[service->srvstate]);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_CLOSED:
@@ -2798,8 +2811,9 @@ vchiq_terminate_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: tsi - (%d<->%d)", state->id,
-			service->localport, service->remoteport);
+	dev_dbg(state->dev, "%s: %s: %d: tsi - (%d<->%d)\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		state->id, service->localport, service->remoteport);
 
 	mark_service_closing(service);
 
@@ -2813,8 +2827,8 @@ vchiq_free_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: fsi - (%d)",
-			state->id, service->localport);
+	dev_dbg(state->dev, "%s: %s: %d: fsi - (%d)\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG), state->id, service->localport);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPENING:
@@ -2895,8 +2909,9 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: close_service:%d",
-			service->state->id, service->localport);
+	dev_dbg(service->state->dev, "%s: %s: %d: close_service:%d\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		service->state->id, service->localport);
 
 	if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
 	    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
@@ -2954,8 +2969,9 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: remove_service:%d",
-			service->state->id, service->localport);
+	dev_dbg(service->state->dev, "%s: %s: %d: remove_service:%d\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		service->state->id, service->localport);
 
 	if (service->srvstate == VCHIQ_SRVSTATE_FREE) {
 		vchiq_service_put(service);
@@ -3099,9 +3115,10 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	 */
 	wmb();
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: bt (%d->%d) %cx %x@%pad %pK",
-			state->id, service->localport, service->remoteport,
-			dir_char, size, &bulk->data, userdata);
+	dev_dbg(state->dev, "%s: %s: %d: bt (%d->%d) %cx %x@%pad %pK\n",
+		log_cat(VCHIQ_CORE), log_type(DEBUG),
+		state->id, service->localport, service->remoteport,
+		dir_char, size, &bulk->data, userdata);
 
 	/*
 	 * The slot mutex must be held when the service is being closed, so
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index de0d49e58e39..d66b60a9f6da 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -71,11 +71,6 @@ static inline const char *log_type(enum vchiq_log_type t)
 	return types_str[t];
 };
 
-#ifndef vchiq_log_debug
-#define vchiq_log_debug(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s debug: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
-#endif
-
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 7f5bba005653..a64d6333cf0a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -47,9 +47,10 @@ user_service_free(void *userdata)
 
 static void close_delivered(struct user_service *user_service)
 {
-	vchiq_log_debug(user_service->service->state->dev, VCHIQ_ARM,
-			"%s(handle=%x)",
-			__func__, user_service->service->handle);
+	dev_dbg(user_service->service->state->dev,
+		"%s: %s: %s(handle=%x)\n",
+		log_cat(VCHIQ_ARM), log_type(DEBUG),
+		__func__, user_service->service->handle);
 
 	if (user_service->close_pending) {
 		/* Allow the underlying service to be culled */
@@ -235,8 +236,9 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 			if (wait_for_completion_interruptible(&user_service->insert_event)) {
-				vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-						"DEQUEUE_MESSAGE interrupted");
+				dev_dbg(service->state->dev,
+					"%s: %s: DEQUEUE_MESSAGE interrupted\n",
+					log_cat(VCHIQ_ARM), log_type(DEBUG));
 				ret = -EINTR;
 				break;
 			}
@@ -325,8 +327,9 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 			ret = -ESRCH;
 			goto out;
 		}
-		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-				"found bulk_waiter %pK for pid %d", waiter, current->pid);
+		dev_dbg(service->state->dev, "%s: %s: found bulk_waiter %pK for pid %d\n",
+			log_cat(VCHIQ_ARM), log_type(DEBUG),
+			waiter, current->pid);
 		userdata = &waiter->bulk_waiter;
 	} else {
 		userdata = args->userdata;
@@ -357,8 +360,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-				"saved bulk_waiter %pK for pid %d", waiter, current->pid);
+		dev_dbg(service->state->dev, "%s: %s: saved bulk_waiter %pK for pid %d\n",
+			log_cat(VCHIQ_ARM), log_type(DEBUG), waiter, current->pid);
 
 		ret = put_user(mode_waiting, mode);
 	}
@@ -457,8 +460,9 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 		mutex_lock(&instance->completion_mutex);
 		if (rc) {
 			DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"AWAIT_COMPLETION interrupted");
+			dev_dbg(instance->state->dev,
+				"%s: %s: AWAIT_COMPLETION interrupted\n",
+				log_cat(VCHIQ_ARM), log_type(DEBUG));
 			ret = -EINTR;
 			goto out;
 		}
@@ -873,10 +877,11 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 
 	if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK)) {
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"  ioctl instance %pK, cmd %s -> status %d, %ld",
-				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+		dev_dbg(instance->state->dev,
+			"%s: %s: ioctl instance %pK, cmd %s -> status %d, %ld\n",
+			log_cat(VCHIQ_ARM), log_type(DEBUG),
+			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	} else {
 		dev_dbg(instance->state->dev,
 			"%s: %s: ioctl instance %pK, cmd %s -> status %d\n, %ld\n",
@@ -1181,7 +1186,8 @@ static int vchiq_open(struct inode *inode, struct file *file)
 		return -ENOTCONN;
 	}
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
+	dev_dbg(state->dev, "%s: %s: vchiq_open\n",
+		log_cat(VCHIQ_ARM), log_type(DEBUG));
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
@@ -1211,8 +1217,9 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "%s: instance=%lx", __func__,
-			(unsigned long)instance);
+	dev_dbg(state->dev, "%s: %s: %s: instance=%lx\n",
+		log_cat(VCHIQ_ARM), log_type(DEBUG),
+		__func__, (unsigned long)instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0

