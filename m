Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 414B87D4F21
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjJXLpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbjJXLpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:45:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E048510D7
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:51 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C95629CC;
        Tue, 24 Oct 2023 13:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147877;
        bh=tvUXA04xvgT7ndwueIIDqe4UMeJC9w4Z20EIRakfPX8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RVqT4IYEupeSX4T7btcwKA0Z57IjsL0zxcXzjoDg9jDV0XPReJ7W0gPxKIplBJDqi
         aO9naiDdt4HxBiFFNpZTbgeZimh8ttuisVaIxEPQvurwu1a6r3wnS3WI2QDAucGw+1
         CzHvzQj6KtFoW3p78ynlU0XqQjbgUs7JGf6VfMqc=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 5/8] staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug
Date:   Tue, 24 Oct 2023 07:44:25 -0400
Message-ID: <20231024114428.443528-6-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert(and rename) vchiq_log_info() custom logging wrapping based on
printk to use dynamic debug. The wrapper is now renamed to
vchiq_log_debug() since most of the usage is around printing debug
information. The log category is dictated by enum vchiq_log_category
which will become the part of the debug string format that will be
logged to dynamic debug (for grep).

All the vchiq_log_info() calls are adjusted to use the
modified wrapper vchiq_log_debug().

The existing custom logging for vchiq_log_info() also tries
to log trace messages using SRVTRACE_LEVEL. This is simply
moved to use the vchiq_log_debug() directly.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  46 +++--
 .../interface/vchiq_arm/vchiq_core.c          | 171 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |   7 +-
 .../interface/vchiq_arm/vchiq_dev.c           |  41 +++--
 4 files changed, 137 insertions(+), 128 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 8e8c6ebfa0c8..7a51c2f62586 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -314,9 +314,9 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 						   type == PAGELIST_READ, pages);
 
 		if (actual_pages != num_pages) {
-			vchiq_log_info(vchiq_arm_log_level,
-				       "%s - only %d/%d pages locked",
-				       __func__, actual_pages, num_pages);
+			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+					"%s - only %d/%d pages locked",
+					__func__, actual_pages, num_pages);
 
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
@@ -559,8 +559,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 		return -ENXIO;
 	}
 
-	vchiq_log_info(vchiq_arm_log_level, "vchiq_init - done (slots %pK, phys %pad)",
-		       vchiq_slot_zero, &slot_phys);
+	vchiq_log_debug(&pdev->dev, VCHIQ_ARM, "vchiq_init - done (slots %pK, phys %pad)",
+			vchiq_slot_zero, &slot_phys);
 
 	vchiq_call_connected_callbacks();
 
@@ -730,8 +730,9 @@ void free_bulk_waiter(struct vchiq_instance *instance)
 	list_for_each_entry_safe(waiter, next,
 				 &instance->bulk_waiter_list, list) {
 		list_del(&waiter->list);
-		vchiq_log_info(vchiq_arm_log_level, "bulk_waiter - cleaned up %pK for pid %d",
-			       waiter, waiter->pid);
+		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+				"bulk_waiter - cleaned up %pK for pid %d",
+				waiter, waiter->pid);
 		kfree(waiter);
 	}
 }
@@ -991,8 +992,9 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_info(vchiq_arm_log_level, "saved bulk_waiter %pK for pid %d", waiter,
-			       current->pid);
+		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+				"saved bulk_waiter %pK for pid %d", waiter,
+				current->pid);
 	}
 
 	return status;
@@ -1015,10 +1017,12 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 		vchiq_log_trace(vchiq_arm_log_level, "%s - completion queue full", __func__);
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
-			vchiq_log_info(vchiq_arm_log_level, "service_callback interrupted");
+			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+					"service_callback interrupted");
 			return -EAGAIN;
 		} else if (instance->closing) {
-			vchiq_log_info(vchiq_arm_log_level, "service_callback closing");
+			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+					"service_callback closing");
 			return 0;
 		}
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
@@ -1120,8 +1124,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 				instance->completion_remove) < 0) {
 				int status;
 
-				vchiq_log_info(vchiq_arm_log_level,
-					       "Inserting extra MESSAGE_AVAILABLE");
+				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+						"Inserting extra MESSAGE_AVAILABLE");
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				status = add_completion(instance, reason, NULL, user_service,
 							bulk_userdata);
@@ -1134,12 +1138,14 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			if (wait_for_completion_interruptible(&user_service->remove_event)) {
-				vchiq_log_info(vchiq_arm_log_level, "%s interrupted", __func__);
+				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+						"%s interrupted", __func__);
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EAGAIN;
 			} else if (instance->closing) {
-				vchiq_log_info(vchiq_arm_log_level, "%s closing", __func__);
+				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+						"%s closing", __func__);
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EINVAL;
@@ -1748,8 +1754,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 	char threadname[16];
 
-	vchiq_log_info(vchiq_susp_log_level, "%d: %s->%s", state->id,
-		       get_conn_state_name(oldstate), get_conn_state_name(newstate));
+	vchiq_log_debug(state->dev, VCHIQ_SUSPEND, "%d: %s->%s", state->id,
+			get_conn_state_name(oldstate), get_conn_state_name(newstate));
 	if (state->conn_state != VCHIQ_CONNSTATE_CONNECTED)
 		return;
 
@@ -1814,9 +1820,9 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init();
 
-	vchiq_log_info(vchiq_arm_log_level,
-		       "vchiq: platform initialised - version %d (min %d)",
-		       VCHIQ_VERSION, VCHIQ_VERSION_MIN);
+	vchiq_log_debug(&pdev->dev, VCHIQ_ARM,
+			"vchiq: platform initialised - version %d (min %d)",
+			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
 
 	/*
 	 * Simply exit on error since the function handles cleanup in
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 5f535003f25f..926b0f6ea82a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -103,8 +103,6 @@ static_assert((unsigned int)VCHIQ_PORT_MAX <
 
 #define BULK_INDEX(x) ((x) & (VCHIQ_NUM_SERVICE_BULKS - 1))
 
-#define SRVTRACE_LEVEL(srv) \
-	(((srv) && (srv)->trace) ? VCHIQ_LOG_TRACE : vchiq_core_msg_log_level)
 #define SRVTRACE_ENABLED(srv, lev) \
 	(((srv) && (srv)->trace) || (vchiq_core_msg_log_level >= (lev)))
 
@@ -227,10 +225,10 @@ static const char *msg_type_str(unsigned int msg_type)
 static inline void
 set_service_state(struct vchiq_service *service, int newstate)
 {
-	vchiq_log_info(vchiq_core_log_level, "%d: srv:%d %s->%s",
-		       service->state->id, service->localport,
-		       srvstate_names[service->srvstate],
-		       srvstate_names[newstate]);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: srv:%d %s->%s",
+			service->state->id, service->localport,
+			srvstate_names[service->srvstate],
+			srvstate_names[newstate]);
 	service->srvstate = newstate;
 }
 
@@ -255,8 +253,8 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_info(vchiq_core_log_level,
-		       "Invalid service handle 0x%x", handle);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+			"Invalid service handle 0x%x", handle);
 	return NULL;
 }
 
@@ -276,8 +274,8 @@ find_service_by_port(struct vchiq_state *state, unsigned int localport)
 		}
 		rcu_read_unlock();
 	}
-	vchiq_log_info(vchiq_core_log_level,
-		       "Invalid port %u", localport);
+	vchiq_log_debug(state->dev, VCHIQ_CORE,
+			"Invalid port %u", localport);
 	return NULL;
 }
 
@@ -297,8 +295,8 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_info(vchiq_core_log_level,
-		       "Invalid service handle 0x%x", handle);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+			"Invalid service handle 0x%x", handle);
 	return NULL;
 }
 
@@ -320,8 +318,8 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_info(vchiq_core_log_level,
-		       "Invalid service handle 0x%x", handle);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE,
+			"Invalid service handle 0x%x", handle);
 	return service;
 }
 
@@ -492,8 +490,8 @@ vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate)
 {
 	enum vchiq_connstate oldstate = state->conn_state;
 
-	vchiq_log_info(vchiq_core_log_level, "%d: %s->%s", state->id, conn_state_names[oldstate],
-		       conn_state_names[newstate]);
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s->%s", state->id, conn_state_names[oldstate],
+			conn_state_names[newstate]);
 	state->conn_state = newstate;
 	vchiq_platform_conn_state_changed(state, oldstate, newstate);
 }
@@ -1033,9 +1031,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		int tx_end_index;
 		int slot_use_count;
 
-		vchiq_log_info(vchiq_core_log_level, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-			       msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-			       VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
+				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 
 		WARN_ON(flags & (QMFLAGS_NO_MUTEX_LOCK |
 				 QMFLAGS_NO_MUTEX_UNLOCK));
@@ -1093,9 +1091,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
 	} else {
-		vchiq_log_info(vchiq_core_log_level, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-			       msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-			       VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
+				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 		if (size != 0) {
 			/*
 			 * It is assumed for now that this code path
@@ -1123,11 +1121,11 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			? service->base.fourcc
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_info(SRVTRACE_LEVEL(service),
-			       "Sent Msg %s(%u) to %c%c%c%c s:%u d:%d len:%zu",
-			       msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-			       VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
-			       VCHIQ_MSG_DSTPORT(msgid), size);
+		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
+				"Sent Msg %s(%u) to %c%c%c%c s:%u d:%d len:%zu",
+				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+				VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
+				VCHIQ_MSG_DSTPORT(msgid), size);
 	}
 
 	/* Make sure the new header is visible to the peer. */
@@ -1182,11 +1180,11 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 					state->id, oldmsgid);
 	}
 
-	vchiq_log_info(vchiq_sync_log_level,
-		       "%d: qms %s@%pK,%x (%d->%d)", state->id,
-		       msg_type_str(VCHIQ_MSG_TYPE(msgid)),
-		       header, size, VCHIQ_MSG_SRCPORT(msgid),
-		       VCHIQ_MSG_DSTPORT(msgid));
+	vchiq_log_debug(state->dev, VCHIQ_SYNC,
+			"%d: qms %s@%pK,%x (%d->%d)", state->id,
+			msg_type_str(VCHIQ_MSG_TYPE(msgid)),
+			header, size, VCHIQ_MSG_SRCPORT(msgid),
+			VCHIQ_MSG_DSTPORT(msgid));
 
 	callback_result =
 		copy_message_data(copy_callback, context,
@@ -1278,9 +1276,9 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 			VCHIQ_SLOT_QUEUE_MASK] =
 			SLOT_INDEX_FROM_INFO(state, slot_info);
 		state->remote->slot_queue_recycle = slot_queue_recycle + 1;
-		vchiq_log_info(vchiq_core_log_level, "%d: %s %d - recycle->%x", state->id, __func__,
-			       SLOT_INDEX_FROM_INFO(state, slot_info),
-			       state->remote->slot_queue_recycle);
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s %d - recycle->%x",
+				state->id, __func__, SLOT_INDEX_FROM_INFO(state, slot_info),
+				state->remote->slot_queue_recycle);
 
 		/*
 		 * A write barrier is necessary, but remote_event_signal
@@ -1397,9 +1395,8 @@ poll_services_of_group(struct vchiq_state *state, int group)
 
 		service_flags = atomic_xchg(&service->poll_flags, 0);
 		if (service_flags & BIT(VCHIQ_POLL_REMOVE)) {
-			vchiq_log_info(vchiq_core_log_level, "%d: ps - remove %d<->%d",
-				       state->id, service->localport,
-				       service->remoteport);
+			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - remove %d<->%d",
+					state->id, service->localport, service->remoteport);
 
 			/*
 			 * Make it look like a client, because
@@ -1411,8 +1408,8 @@ poll_services_of_group(struct vchiq_state *state, int group)
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_REMOVE);
 		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
-			vchiq_log_info(vchiq_core_log_level, "%d: ps - terminate %d<->%d",
-				       state->id, service->localport, service->remoteport);
+			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - terminate %d<->%d",
+					state->id, service->localport, service->remoteport);
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_TERMINATE);
 		}
@@ -1462,11 +1459,11 @@ abort_outstanding_bulks(struct vchiq_service *service,
 		if (queue->process != queue->local_insert) {
 			vchiq_complete_bulk(service->instance, bulk);
 
-			vchiq_log_info(SRVTRACE_LEVEL(service),
-				       "%s %c%c%c%c d:%d ABORTED - tx len:%d, rx len:%d",
-				       is_tx ? "Send Bulk to" : "Recv Bulk from",
-				       VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
-				       service->remoteport, bulk->size, bulk->remote_size);
+			vchiq_log_debug(service->state->dev, VCHIQ_CORE_MSG,
+					"%s %c%c%c%c d:%d ABORTED - tx len:%d, rx len:%d",
+					is_tx ? "Send Bulk to" : "Recv Bulk from",
+					VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+					service->remoteport, bulk->size, bulk->remote_size);
 		} else {
 			/* fabricate a matching dummy bulk */
 			bulk->data = 0;
@@ -1499,8 +1496,8 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 	payload = (struct vchiq_open_payload *)header->data;
 	fourcc = payload->fourcc;
-	vchiq_log_info(vchiq_core_log_level, "%d: prs OPEN@%pK (%d->'%c%c%c%c')",
-		       state->id, header, localport, VCHIQ_FOURCC_AS_4CHARS(fourcc));
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs OPEN@%pK (%d->'%c%c%c%c')",
+			state->id, header, localport, VCHIQ_FOURCC_AS_4CHARS(fourcc));
 
 	service = get_listening_service(state, fourcc);
 	if (!service)
@@ -1646,10 +1643,11 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		svc_fourcc = service
 			? service->base.fourcc
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
-		vchiq_log_info(SRVTRACE_LEVEL(service),
-			       "Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
-			       msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
-			       remoteport, localport, size);
+
+		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
+				"Rcvd Msg %s(%u) from %c%c%c%c s:%d d:%d len:%d",
+				msg_type_str(type), type, VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
+				remoteport, localport, size);
 		if (size > 0)
 			vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 	}
@@ -1675,9 +1673,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				header->data;
 			service->peer_version = payload->version;
 		}
-		vchiq_log_info(vchiq_core_log_level, "%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
-			       state->id, header, size, remoteport, localport,
-			       service->peer_version);
+		vchiq_log_debug(state->dev, VCHIQ_CORE,
+				"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
+				state->id, header, size, remoteport, localport,
+				service->peer_version);
 		if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 			service->remoteport = remoteport;
 			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
@@ -1690,21 +1689,21 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	case VCHIQ_MSG_CLOSE:
 		WARN_ON(size); /* There should be no data */
 
-		vchiq_log_info(vchiq_core_log_level, "%d: prs CLOSE@%pK (%d->%d)",
-			       state->id, header, remoteport, localport);
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CLOSE@%pK (%d->%d)",
+				state->id, header, remoteport, localport);
 
 		mark_service_closing_internal(service, 1);
 
 		if (vchiq_close_service_internal(service, CLOSE_RECVD) == -EAGAIN)
 			goto bail_not_ready;
 
-		vchiq_log_info(vchiq_core_log_level, "Close Service %c%c%c%c s:%u d:%d",
-			       VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
-			       service->localport, service->remoteport);
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "Close Service %c%c%c%c s:%u d:%d",
+				VCHIQ_FOURCC_AS_4CHARS(service->base.fourcc),
+				service->localport, service->remoteport);
 		break;
 	case VCHIQ_MSG_DATA:
-		vchiq_log_info(vchiq_core_log_level, "%d: prs DATA@%pK,%x (%d->%d)",
-			       state->id, header, size, remoteport, localport);
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs DATA@%pK,%x (%d->%d)",
+				state->id, header, size, remoteport, localport);
 
 		if ((service->remoteport == remoteport) &&
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
@@ -1723,7 +1722,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_CONNECT:
-		vchiq_log_info(vchiq_core_log_level, "%d: prs CONNECT@%pK", state->id, header);
+		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CONNECT@%pK",
+				state->id, header);
 		state->version_common =	((struct vchiq_slot_zero *)
 					 state->slot_data)->version;
 		complete(&state->connect);
@@ -1775,9 +1775,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			bulk->actual = *(int *)header->data;
 			queue->remote_insert++;
 
-			vchiq_log_info(vchiq_core_log_level, "%d: prs %s@%pK (%d->%d) %x@%pad",
-				       state->id, msg_type_str(type), header, remoteport, localport,
-				       bulk->actual, &bulk->data);
+			vchiq_log_debug(state->dev, VCHIQ_CORE,
+					"%d: prs %s@%pK (%d->%d) %x@%pad",
+					state->id, msg_type_str(type), header, remoteport,
+					localport, bulk->actual, &bulk->data);
 
 			vchiq_log_trace(vchiq_core_log_level, "%d: prs:%d %cx li=%x ri=%x p=%x",
 					state->id, localport,
@@ -2074,9 +2075,9 @@ sync_func(void *v)
 					header->data;
 				service->peer_version = payload->version;
 			}
-			vchiq_log_info(vchiq_sync_log_level, "%d: sf OPENACK@%pK,%x (%d->%d) v:%d",
-				       state->id, header, size, remoteport, localport,
-				       service->peer_version);
+			vchiq_log_debug(state->dev, VCHIQ_SYNC, "%d: sf OPENACK@%pK,%x (%d->%d) v:%d",
+					state->id, header, size, remoteport, localport,
+					service->peer_version);
 			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 				service->remoteport = remoteport;
 				set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
@@ -2478,9 +2479,9 @@ vchiq_add_service_internal(struct vchiq_state *state,
 	/* Bring this service online */
 	set_service_state(service, srvstate);
 
-	vchiq_log_info(vchiq_core_msg_log_level, "%s Service %c%c%c%c SrcPort:%d",
-		       (srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
-		       VCHIQ_FOURCC_AS_4CHARS(params->fourcc), service->localport);
+	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG, "%s Service %c%c%c%c SrcPort:%d",
+			(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
+			VCHIQ_FOURCC_AS_4CHARS(params->fourcc), service->localport);
 
 	/* Don't unlock the service - leave it with a ref_count of 1. */
 
@@ -2576,7 +2577,8 @@ release_service_messages(struct vchiq_service *service)
 			int port = VCHIQ_MSG_DSTPORT(msgid);
 
 			if ((port == service->localport) && (msgid & VCHIQ_MSGID_CLAIMED)) {
-				vchiq_log_info(vchiq_core_log_level, "  fsi - hdr %pK", header);
+				vchiq_log_debug(state->dev, VCHIQ_CORE,
+						"  fsi - hdr %pK", header);
 				release_slot(state, slot_info, header, NULL);
 			}
 			pos += calc_stride(header->size);
@@ -2684,8 +2686,8 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	int close_id = MAKE_CLOSE(service->localport,
 				  VCHIQ_MSG_DSTPORT(service->remoteport));
 
-	vchiq_log_info(vchiq_core_log_level, "%d: csi:%d,%d (%s)", service->state->id,
-		       service->localport, close_recvd, srvstate_names[service->srvstate]);
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: csi:%d,%d (%s)", service->state->id,
+			service->localport, close_recvd, srvstate_names[service->srvstate]);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_CLOSED:
@@ -2795,8 +2797,8 @@ vchiq_terminate_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_info(vchiq_core_log_level, "%d: tsi - (%d<->%d)", state->id,
-		       service->localport, service->remoteport);
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: tsi - (%d<->%d)", state->id,
+			service->localport, service->remoteport);
 
 	mark_service_closing(service);
 
@@ -2810,7 +2812,8 @@ vchiq_free_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_info(vchiq_core_log_level, "%d: fsi - (%d)", state->id, service->localport);
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: fsi - (%d)",
+			state->id, service->localport);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPENING:
@@ -2890,8 +2893,8 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_info(vchiq_core_log_level, "%d: close_service:%d",
-		       service->state->id, service->localport);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: close_service:%d",
+			service->state->id, service->localport);
 
 	if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
 	    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
@@ -2948,8 +2951,8 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_info(vchiq_core_log_level, "%d: remove_service:%d",
-		       service->state->id, service->localport);
+	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: remove_service:%d",
+			service->state->id, service->localport);
 
 	if (service->srvstate == VCHIQ_SRVSTATE_FREE) {
 		vchiq_service_put(service);
@@ -3092,9 +3095,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	 */
 	wmb();
 
-	vchiq_log_info(vchiq_core_log_level, "%d: bt (%d->%d) %cx %x@%pad %pK",
-		       state->id, service->localport, service->remoteport,
-		       dir_char, size, &bulk->data, userdata);
+	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: bt (%d->%d) %cx %x@%pad %pK",
+			state->id, service->localport, service->remoteport,
+			dir_char, size, &bulk->data, userdata);
 
 	/*
 	 * The slot mutex must be held when the service is being closed, so
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index d1e5c50170da..e2d59dea653d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -69,10 +69,9 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 #define vchiq_log_warning(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
-#ifndef vchiq_log_info
-#define vchiq_log_info(cat, fmt, ...) \
-	do { if (cat >= VCHIQ_LOG_INFO) \
-		printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while (0)
+#ifndef vchiq_log_debug
+#define vchiq_log_debug(dev, cat, fmt, ...) \
+	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_trace
 #define vchiq_log_trace(cat, fmt, ...) \
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 2622a4477a67..403e96610460 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -47,9 +47,9 @@ user_service_free(void *userdata)
 
 static void close_delivered(struct user_service *user_service)
 {
-	vchiq_log_info(vchiq_arm_log_level,
-		       "%s(handle=%x)",
-		       __func__, user_service->service->handle);
+	vchiq_log_debug(user_service->service->state->dev, VCHIQ_ARM,
+			"%s(handle=%x)",
+			__func__, user_service->service->handle);
 
 	if (user_service->close_pending) {
 		/* Allow the underlying service to be culled */
@@ -235,8 +235,8 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 			if (wait_for_completion_interruptible(&user_service->insert_event)) {
-				vchiq_log_info(vchiq_arm_log_level,
-					       "DEQUEUE_MESSAGE interrupted");
+				vchiq_log_debug(service->state->dev, VCHIQ_ARM,
+						"DEQUEUE_MESSAGE interrupted");
 				ret = -EINTR;
 				break;
 			}
@@ -323,8 +323,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 			ret = -ESRCH;
 			goto out;
 		}
-		vchiq_log_info(vchiq_arm_log_level,
-			       "found bulk_waiter %pK for pid %d", waiter, current->pid);
+		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
+				"found bulk_waiter %pK for pid %d", waiter, current->pid);
 		userdata = &waiter->bulk_waiter;
 	} else {
 		userdata = args->userdata;
@@ -355,8 +355,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_info(vchiq_arm_log_level,
-			       "saved bulk_waiter %pK for pid %d", waiter, current->pid);
+		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
+				"saved bulk_waiter %pK for pid %d", waiter, current->pid);
 
 		ret = put_user(mode_waiting, mode);
 	}
@@ -455,8 +455,8 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 		mutex_lock(&instance->completion_mutex);
 		if (rc) {
 			DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-			vchiq_log_info(vchiq_arm_log_level,
-				       "AWAIT_COMPLETION interrupted");
+			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+					"AWAIT_COMPLETION interrupted");
 			ret = -EINTR;
 			goto out;
 		}
@@ -868,16 +868,17 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			ret = -EINTR;
 	}
 
-	if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK))
-		vchiq_log_info(vchiq_arm_log_level,
-			       "  ioctl instance %pK, cmd %s -> status %d, %ld",
-			       instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-			       ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
-	else
+	if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK)) {
+		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
+				"  ioctl instance %pK, cmd %s -> status %d, %ld",
+				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+	} else {
 		vchiq_log_trace(vchiq_arm_log_level,
 				"  ioctl instance %pK, cmd %s -> status %d, %ld",
 				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
 				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+	}
 
 	return ret;
 }
@@ -1170,7 +1171,7 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	struct vchiq_state *state = vchiq_get_state();
 	struct vchiq_instance *instance;
 
-	vchiq_log_info(vchiq_arm_log_level, "vchiq_open");
+	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
 
 	if (!state) {
 		vchiq_log_error(state->dev, VCHIQ_ARM,
@@ -1206,8 +1207,8 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	vchiq_log_info(vchiq_arm_log_level, "%s: instance=%lx", __func__,
-		       (unsigned long)instance);
+	vchiq_log_debug(state->dev, VCHIQ_ARM, "%s: instance=%lx", __func__,
+			(unsigned long)instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0

