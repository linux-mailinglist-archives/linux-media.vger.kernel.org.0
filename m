Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECDC47E3832
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 10:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbjKGJwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 04:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbjKGJwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 04:52:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD91C120
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 01:52:31 -0800 (PST)
Received: from umang.jain (unknown [103.251.226.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC094D8B;
        Tue,  7 Nov 2023 10:52:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699350730;
        bh=mVZw58PmnS5quV9zKtKHRwX2pxDr03xVM5+OTkd3h3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vzKqlz5wWaAz04tfbF6gvRRuWqLMZzwPCAlC6EKxnps/0KHVeTZaYTo/rNheit4E+
         NsptlMYhJDUuaAAz8U4uZmhEqaiH0Is7j/yrBoeNzI6aBY5xWEIN5pzIoDAEBoJ472
         Mk2RlhYXni+3QtvUR2YRV0uObVFVo4gat9dzN3fY=
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
Subject: [PATCH 6/9] staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
Date:   Tue,  7 Nov 2023 04:51:53 -0500
Message-ID: <20231107095156.365492-7-umang.jain@ideasonboard.com>
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

Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Add a new enum vchiq_log_type and log_type() helper to faciliate the
type of logging in dev_dbg(). This will help to determine the type of
logging("error", "warning", "debug", "trace") to dynamic debug.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  54 ++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
 .../interface/vchiq_arm/vchiq_core.c          | 126 ++++++++++--------
 .../interface/vchiq_arm/vchiq_core.h          |  23 +++-
 .../interface/vchiq_arm/vchiq_dev.c           |  47 ++++---
 5 files changed, 143 insertions(+), 113 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 9fb3e240d9de..2cb2a6503058 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -696,8 +696,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance) {
-		vchiq_log_error(state->dev, VCHIQ_CORE,
-				"%s: error allocating vchiq instance\n", __func__);
+		dev_dbg(state->dev, "%s: %s: %s: error allocating vchiq instance\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), __func__);
 		ret = -ENOMEM;
 		goto failed;
 	}
@@ -969,8 +969,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 	} else {
 		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
 		if (!waiter) {
-			vchiq_log_error(service->state->dev, VCHIQ_CORE,
-					"%s - out of memory", __func__);
+			dev_dbg(service->state->dev, "%s: %s: %s - out of memory\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), __func__);
 			return -ENOMEM;
 		}
 	}
@@ -1344,8 +1344,8 @@ vchiq_keepalive_vchiq_callback(struct vchiq_instance *instance,
 			       struct vchiq_header *header,
 			       unsigned int service_user, void *bulk_user)
 {
-	vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
-			"%s callback reason %d", __func__, reason);
+	dev_dbg(instance->state->dev, "%s: %s: %s callback reason %d\n",
+		log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, reason);
 	return 0;
 }
 
@@ -1369,22 +1369,22 @@ vchiq_keepalive_thread_func(void *v)
 
 	ret = vchiq_initialise(&instance);
 	if (ret) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_initialise failed %d", __func__, ret);
+		dev_dbg(state->dev, "%s: %s: %s vchiq_initialise failed %d\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, ret);
 		goto exit;
 	}
 
 	status = vchiq_connect(instance);
 	if (status) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_connect failed %d", __func__, status);
+		dev_dbg(state->dev, "%s: %s: %s vchiq_connect failed %d\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, status);
 		goto shutdown;
 	}
 
 	status = vchiq_add_service(instance, &params, &ka_handle);
 	if (status) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_open_service failed %d", __func__, status);
+		dev_dbg(state->dev, "%s: %s: %s vchiq_open_service failed %d\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, status);
 		goto shutdown;
 	}
 
@@ -1392,8 +1392,8 @@ vchiq_keepalive_thread_func(void *v)
 		long rc = 0, uc = 0;
 
 		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
-			vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-					"%s interrupted", __func__);
+			dev_dbg(state->dev, "%s: %s: %s interrupted\n",
+				log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__);
 			flush_signals(current);
 			continue;
 		}
@@ -1413,16 +1413,15 @@ vchiq_keepalive_thread_func(void *v)
 			atomic_inc(&arm_state->ka_use_ack_count);
 			status = vchiq_use_service(instance, ka_handle);
 			if (status) {
-				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-						"%s vchiq_use_service error %d", __func__, status);
+				dev_dbg(state->dev, "%s: %s: %s vchiq_use_service error %d\n",
+					log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, status);
 			}
 		}
 		while (rc--) {
 			status = vchiq_release_service(instance, ka_handle);
 			if (status) {
-				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-						"%s vchiq_release_service error %d", __func__,
-						status);
+				dev_dbg(state->dev, "%s: %s: %s vchiq_release_service error %d\n",
+					log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__, status);
 			}
 		}
 	}
@@ -1457,7 +1456,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __func__);
+		dev_dbg(state->dev, "%s: %s: %s null service ptr\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1740,10 +1740,11 @@ vchiq_check_service(struct vchiq_service *service)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (ret) {
-		vchiq_log_error(service->state->dev, VCHIQ_SUSPEND,
-				"%s ERROR - %p4cc:%d service count %d, state count %d", __func__,
-				&service->base.fourcc, service->client_id,
-				service->service_use_count, arm_state->videocore_use_count);
+		dev_dbg(service->state->dev,
+			"%s: %s: %s ERROR - %p4cc:%d service count %d, state count %d\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), __func__,
+			&service->base.fourcc, service->client_id, service->service_use_count,
+			arm_state->videocore_use_count);
 		vchiq_dump_service_use_state(service->state);
 	}
 out:
@@ -1776,9 +1777,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 					      (void *)state,
 					      threadname);
 	if (IS_ERR(arm_state->ka_thread)) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"vchiq: FATAL: couldn't create thread %s",
-				threadname);
+		dev_dbg(state->dev, "%s: %s: vchiq: FATAL: couldn't create thread %s\n",
+			log_cat(VCHIQ_SUSPEND), log_type(ERROR), threadname);
 	} else {
 		wake_up_process(arm_state->ka_thread);
 	}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 21f9fa1a1713..2b4cbea5f259 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -39,9 +39,9 @@ void vchiq_add_connected_callback(struct vchiq_device *device, void (*callback)(
 		callback();
 	} else {
 		if (g_num_deferred_callbacks >= MAX_CALLBACKS) {
-			vchiq_log_error(&device->dev, VCHIQ_CORE,
-					"There already %d callback registered - please increase MAX_CALLBACKS",
-					g_num_deferred_callbacks);
+			dev_dbg(&device->dev,
+				"%s: %s: There already %d callback registered - please increase MAX_CALLBACKS\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), g_num_deferred_callbacks);
 		} else {
 			g_deferred_callback[g_num_deferred_callbacks] =
 				callback;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 8a9eb0101c2e..5bc7c66e71e1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -741,10 +741,10 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 		 */
 		complete(&quota->quota_event);
 	} else if (count == 0) {
-		vchiq_log_error(state->dev, VCHIQ_CORE,
-				"service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
-				port, quota->message_use_count, header, msgid, header->msgid,
-				header->size);
+		dev_dbg(state->dev,
+			"%s: %s: service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), port, quota->message_use_count,
+			header, msgid, header->msgid, header->size);
 		WARN(1, "invalid message use count\n");
 	}
 	if (!BITSET_IS_SET(service_found, port)) {
@@ -766,9 +766,10 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_use->%d",
 					state->id, port, header->size, header, count - 1);
 		} else {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
-					port, count, header, msgid, header->msgid, header->size);
+			dev_dbg(state->dev,
+				"%s: %s: service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR),
+				port, count, header, msgid, header->msgid, header->size);
 			WARN(1, "bad slot use count\n");
 		}
 	}
@@ -831,9 +832,10 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 
 			pos += calc_stride(header->size);
 			if (pos > VCHIQ_SLOT_SIZE) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"pfq - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
-						pos, header, msgid, header->msgid, header->size);
+				dev_dbg(state->dev,
+					"%s: %s: pfq - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x\n",
+					log_cat(VCHIQ_CORE), log_type(ERROR), pos, header, msgid,
+					header->msgid, header->size);
 				WARN(1, "invalid slot position\n");
 			}
 		}
@@ -1167,8 +1169,8 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 		int oldmsgid = header->msgid;
 
 		if (oldmsgid != VCHIQ_MSGID_PADDING)
-			vchiq_log_error(state->dev, VCHIQ_CORE, "%d: qms - msgid %x, not PADDING",
-					state->id, oldmsgid);
+			dev_dbg(state->dev, "%s: %s: %d: qms - msgid %x, not PADDING\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), state->id, oldmsgid);
 	}
 
 	vchiq_log_debug(state->dev, VCHIQ_SYNC,
@@ -1616,10 +1618,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 
 		if (!service) {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"%d: prs %s@%pK (%d->%d) - invalid/closed service %d",
-					state->id, msg_type_str(type), header, remoteport,
-					localport, localport);
+			dev_dbg(state->dev,
+				"%s: %s: %d: prs %s@%pK (%d->%d) - invalid/closed service %d\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), state->id, msg_type_str(type),
+				header, remoteport, localport, localport);
 			goto skip_message;
 		}
 		break;
@@ -1640,9 +1642,9 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
 	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
-		vchiq_log_error(state->dev, VCHIQ_CORE,
-				"header %pK (msgid %x) - size %x too big for slot",
-				header, (unsigned int)msgid, (unsigned int)size);
+		dev_dbg(state->dev, "%s: %s: header %pK (msgid %x) - size %x too big for slot\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR),
+			header, (unsigned int)msgid, (unsigned int)size);
 		WARN(1, "oversized for slot\n");
 	}
 
@@ -1668,8 +1670,9 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
 			complete(&service->remove_event);
 		} else {
-			vchiq_log_error(state->dev, VCHIQ_CORE, "OPENACK received in state %s",
-					srvstate_names[service->srvstate]);
+			dev_dbg(state->dev, "%s: %s: OPENACK received in state %s\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR),
+				srvstate_names[service->srvstate]);
 		}
 		break;
 	case VCHIQ_MSG_CLOSE:
@@ -1740,11 +1743,11 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			}
 			if ((int)(queue->remote_insert -
 				queue->local_insert) >= 0) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"%d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)",
-						state->id, msg_type_str(type), header, remoteport,
-						localport, queue->remote_insert,
-						queue->local_insert);
+				dev_dbg(state->dev,
+					"%s: %s: %d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)\n",
+					log_cat(VCHIQ_CORE), log_type(ERROR),
+					state->id, msg_type_str(type), header, remoteport,
+					localport, queue->remote_insert, queue->local_insert);
 				mutex_unlock(&service->bulk_mutex);
 				break;
 			}
@@ -1790,8 +1793,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
 				state->id, header, size);
 		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"%d: PAUSE received in state PAUSED", state->id);
+			dev_dbg(state->dev, "%s: %s: %d: PAUSE received in state PAUSED\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), state->id);
 			break;
 		}
 		if (state->conn_state != VCHIQ_CONNSTATE_PAUSE_SENT) {
@@ -1821,8 +1824,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		break;
 
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: prs invalid msgid %x@%pK,%x",
-				state->id, msgid, header, size);
+		dev_dbg(state->dev, "%s: %s: %d: prs invalid msgid %x@%pK,%x\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), state->id, msgid, header, size);
 		WARN(1, "invalid message\n");
 		break;
 	}
@@ -1932,7 +1935,8 @@ handle_poll(struct vchiq_state *state)
 			 * since the PAUSE should have flushed
 			 * through outstanding messages.
 			 */
-			vchiq_log_error(state->dev, VCHIQ_CORE, "Failed to send RESUME message");
+			dev_dbg(state->dev, "%s: %s: Failed to send RESUME message\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR));
 		}
 		break;
 	default:
@@ -2032,10 +2036,10 @@ sync_func(void *v)
 		service = find_service_by_port(state, localport);
 
 		if (!service) {
-			vchiq_log_error(state->dev, VCHIQ_SYNC,
-					"%d: sf %s@%pK (%d->%d) - invalid/closed service %d",
-					state->id, msg_type_str(type), header,
-					remoteport, localport, localport);
+			dev_dbg(state->dev,
+				"%s: %s: %d: sf %s@%pK (%d->%d) - invalid/closed service %d\n",
+				log_cat(VCHIQ_SYNC), log_type(ERROR), state->id, msg_type_str(type),
+				header, remoteport, localport, localport);
 			release_message_sync(state, header);
 			continue;
 		}
@@ -2078,15 +2082,16 @@ sync_func(void *v)
 			    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
 				if (make_service_callback(service, VCHIQ_MESSAGE_AVAILABLE, header,
 							  NULL) == -EAGAIN)
-					vchiq_log_error(state->dev, VCHIQ_SYNC,
-							"synchronous callback to service %d returns -EAGAIN",
-							localport);
+					dev_dbg(state->dev,
+						"%s: %s: synchronous callback to service %d returns -EAGAIN\n",
+						log_cat(VCHIQ_SYNC), log_type(ERROR), localport);
 			}
 			break;
 
 		default:
-			vchiq_log_error(state->dev, VCHIQ_SYNC, "%d: sf unexpected msgid %x@%pK,%x",
-					state->id, msgid, header, size);
+			dev_dbg(state->dev, "%s: %s: %d: sf unexpected msgid %x@%pK,%x\n",
+				log_cat(VCHIQ_SYNC), log_type(ERROR),
+				state->id, msgid, header, size);
 			release_message_sync(state, header);
 			break;
 		}
@@ -2119,8 +2124,8 @@ vchiq_init_slots(struct device *dev, void *mem_base, int mem_size)
 	num_slots -= first_data_slot;
 
 	if (num_slots < 4) {
-		vchiq_log_error(dev, VCHIQ_CORE, "%s - insufficient memory %x bytes",
-				__func__, mem_size);
+		dev_dbg(dev, "%s: %s: %s - insufficient memory %x bytes\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), __func__, mem_size);
 		return NULL;
 	}
 
@@ -2501,11 +2506,11 @@ vchiq_open_service_internal(struct vchiq_service *service, int client_id)
 	} else if ((service->srvstate != VCHIQ_SRVSTATE_OPEN) &&
 		   (service->srvstate != VCHIQ_SRVSTATE_OPENSYNC)) {
 		if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT)
-			vchiq_log_error(service->state->dev, VCHIQ_CORE,
-					"%d: osi - srvstate = %s (ref %u)",
-					service->state->id,
-					srvstate_names[service->srvstate],
-					kref_read(&service->ref_count));
+			dev_dbg(service->state->dev,
+				"%s: %s: %d: osi - srvstate = %s (ref %u)\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR),
+				service->state->id, srvstate_names[service->srvstate],
+				kref_read(&service->ref_count));
 		status = -EINVAL;
 		VCHIQ_SERVICE_STATS_INC(service, error_count);
 		vchiq_release_service_internal(service);
@@ -2566,9 +2571,10 @@ release_service_messages(struct vchiq_service *service)
 			}
 			pos += calc_stride(header->size);
 			if (pos > VCHIQ_SLOT_SIZE) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
-						pos, header, msgid, header->msgid, header->size);
+				dev_dbg(state->dev,
+					"%s: %s: fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x\n",
+					log_cat(VCHIQ_CORE), log_type(ERROR), pos, header, msgid,
+					header->msgid, header->size);
 				WARN(1, "invalid slot position\n");
 			}
 		}
@@ -2622,8 +2628,9 @@ close_service_complete(struct vchiq_service *service, int failstate)
 	case VCHIQ_SRVSTATE_LISTENING:
 		break;
 	default:
-		vchiq_log_error(service->state->dev, VCHIQ_CORE, "%s(%x) called in state %s",
-				__func__, service->handle, srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev, "%s: %s: %s(%x) called in state %s\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), __func__, service->handle,
+			srvstate_names[service->srvstate]);
 		WARN(1, "%s in unexpected state\n", __func__);
 		return -EINVAL;
 	}
@@ -2678,8 +2685,9 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	case VCHIQ_SRVSTATE_LISTENING:
 	case VCHIQ_SRVSTATE_CLOSEWAIT:
 		if (close_recvd) {
-			vchiq_log_error(state->dev, VCHIQ_CORE, "%s(1) called in state %s",
-					__func__, srvstate_names[service->srvstate]);
+			dev_dbg(state->dev, "%s: %s: %s(1) called in state %s\n",
+				log_cat(VCHIQ_CORE), log_type(ERROR), __func__,
+				srvstate_names[service->srvstate]);
 		} else if (is_server) {
 			if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
 				status = -EINVAL;
@@ -2766,8 +2774,9 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		break;
 
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%s(%d) called in state %s", __func__,
-				close_recvd, srvstate_names[service->srvstate]);
+		dev_dbg(state->dev, "%s: %s: %s(%d) called in state %s\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), __func__,
+			close_recvd, srvstate_names[service->srvstate]);
 		break;
 	}
 
@@ -2806,8 +2815,9 @@ vchiq_free_service_internal(struct vchiq_service *service)
 	case VCHIQ_SRVSTATE_CLOSEWAIT:
 		break;
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: fsi - (%d) in state %s", state->id,
-				service->localport, srvstate_names[service->srvstate]);
+		dev_dbg(state->dev, "%s: %s: %d: fsi - (%d) in state %s\n",
+			log_cat(VCHIQ_CORE), log_type(ERROR), state->id,
+			service->localport, srvstate_names[service->srvstate]);
 		return;
 	}
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index cc7bb6ca832a..3583604430b3 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -39,6 +39,13 @@ enum vchiq_log_category {
 	VCHIQ_SUSPEND,
 };
 
+enum vchiq_log_type {
+	ERROR,
+	WARN,
+	DEBUG,
+	TRACE,
+};
+
 static inline const char *log_cat(enum vchiq_log_category c)
 {
 	static const char * const strings[] = {
@@ -52,10 +59,18 @@ static inline const char *log_cat(enum vchiq_log_category c)
 	return strings[c];
 };
 
-#ifndef vchiq_log_error
-#define vchiq_log_error(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s error: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
-#endif
+static inline const char *log_type(enum vchiq_log_type t)
+{
+	static const char * const types_str[] = {
+		"error",
+		"warning",
+		"debug",
+		"trace",
+	};
+
+	return types_str[t];
+};
+
 #ifndef vchiq_log_warning
 #define vchiq_log_warning(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s warning: " fmt, log_cat(cat), ##__VA_ARGS__); } while (0)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 3425d2b199c2..76e16128d4b1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -271,9 +271,10 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			ret = -EFAULT;
 		}
 	} else {
-		vchiq_log_error(service->state->dev, VCHIQ_ARM,
-				"header %pK: bufsize %x < size %x",
-				header, args->bufsize, header->size);
+		dev_dbg(service->state->dev,
+			"%s: %s: header %pK: bufsize %x < size %x\n",
+			log_cat(VCHIQ_ARM), log_type(ERROR), header,
+			args->bufsize, header->size);
 		WARN(1, "invalid size\n");
 		ret = -EMSGSIZE;
 	}
@@ -318,8 +319,9 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		}
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
 		if (!waiter) {
-			vchiq_log_error(service->state->dev, VCHIQ_ARM,
-					"no bulk_waiter found for pid %d", current->pid);
+			dev_dbg(service->state->dev,
+				"%s: %s: no bulk_waiter found for pid %d\n",
+				log_cat(VCHIQ_ARM), log_type(ERROR), current->pid);
 			ret = -ESRCH;
 			goto out;
 		}
@@ -501,10 +503,11 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			msglen = header->size + sizeof(struct vchiq_header);
 			/* This must be a VCHIQ-style service */
 			if (args->msgbufsize < msglen) {
-				vchiq_log_error(service->state->dev, VCHIQ_ARM,
-						"header %pK: msgbufsize %x < msglen %x",
-						header, args->msgbufsize, msglen);
-						WARN(1, "invalid message size\n");
+				dev_dbg(service->state->dev,
+					"%s: %s: header %pK: msgbufsize %x < msglen %x\n",
+					log_cat(VCHIQ_ARM), log_type(ERROR), header,
+					args->msgbufsize, msglen);
+				WARN(1, "invalid message size\n");
 				if (ret == 0)
 					ret = -EMSGSIZE;
 				break;
@@ -618,9 +621,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		}
 		rc = mutex_lock_killable(&instance->state->mutex);
 		if (rc) {
-			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
-					"vchiq: connect: could not lock mutex for state %d: %d",
-					instance->state->id, rc);
+			dev_dbg(instance->state->dev,
+				"%s: %s: vchiq: connect: could not lock mutex for state %d: %d\n",
+				log_cat(VCHIQ_ARM), log_type(ERROR), instance->state->id, rc);
 			ret = -EINTR;
 			break;
 		}
@@ -630,8 +633,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (!status)
 			instance->connected = 1;
 		else
-			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
-					"vchiq: could not connect: %d", status);
+			dev_dbg(instance->state->dev,
+				"%s: %s: vchiq: could not connect: %d\n",
+				log_cat(VCHIQ_ARM), log_type(ERROR), status);
 		break;
 
 	case VCHIQ_IOC_CREATE_SERVICE: {
@@ -700,13 +704,14 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				vchiq_use_service_internal(service) :
 				vchiq_release_service_internal(service);
 			if (ret) {
-				vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
-						"%s: cmd %s returned error %ld for service %p4cc:%03d",
-						__func__, (cmd == VCHIQ_IOC_USE_SERVICE) ?
-						"VCHIQ_IOC_USE_SERVICE" :
-						"VCHIQ_IOC_RELEASE_SERVICE",
-						ret, &service->base.fourcc,
-						service->client_id);
+				dev_dbg(instance->state->dev,
+					"%s: %s: %s: cmd %s returned error %ld for service %p4cc:%03d\n",
+					log_cat(VCHIQ_SUSPEND), log_type(ERROR),
+					__func__, (cmd == VCHIQ_IOC_USE_SERVICE) ?
+					"VCHIQ_IOC_USE_SERVICE" :
+					"VCHIQ_IOC_RELEASE_SERVICE",
+					ret, &service->base.fourcc,
+					service->client_id);
 			}
 		} else {
 			ret = -EINVAL;
-- 
2.41.0

