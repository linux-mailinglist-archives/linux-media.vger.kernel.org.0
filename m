Return-Path: <linux-media+bounces-1294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9F7FC52A
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53FA4B2161D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C740BF9;
	Tue, 28 Nov 2023 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S5qFJX9h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BCE19B4
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:19:40 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E59101DD2;
	Tue, 28 Nov 2023 21:19:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202744;
	bh=9b/l5CegChm7AAGh8/jKh1jiEymJ41DPjjZtyZQH2rM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S5qFJX9hvXbNpkPvjsertdNdESaZ3AADd5yEzVb1E6+ND/XZZD58TaZTtn/KC3ej7
	 2jwvvfjS6paREkZZ0LUyWSOhRyy7eE473xUPnGNCFN/DT0sEmG1OEFPFw4KFxS9U20
	 Ste6jJ0yMYRN2KchV/Jp8i/dyIfbgmZ5Yk2JMoR4=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 2/5] staging: vc04_services: Drop vchiq_log_error() in favour of dev_dbg
Date: Wed, 29 Nov 2023 01:49:23 +0530
Message-ID: <20231128201926.489269-3-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128201926.489269-1-umang.jain@ideasonboard.com>
References: <20231128201926.489269-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Meanwhile at it, drop the usage of __func__ from the logs.
Dynamic debug supports this via the 'f'  decorator flag.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           |  49 ++++----
 .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
 .../interface/vchiq_arm/vchiq_core.c          | 112 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |   4 -
 .../interface/vchiq_arm/vchiq_dev.c           |  45 ++++---
 5 files changed, 99 insertions(+), 117 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 7978fb6dc4fb..348b7dfd76d8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -683,8 +683,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 		usleep_range(500, 600);
 	}
 	if (i == VCHIQ_INIT_RETRIES) {
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialized\n",
-				__func__);
+		dev_dbg(state->dev, "core: error: videocore not initialized\n");
 		ret = -ENOTCONN;
 		goto failed;
 	} else if (i > 0) {
@@ -694,8 +693,7 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance) {
-		vchiq_log_error(state->dev, VCHIQ_CORE,
-				"%s: error allocating vchiq instance\n", __func__);
+		dev_dbg(state->dev, "core: error: Cannot allocate vchiq instance\n");
 		ret = -ENOMEM;
 		goto failed;
 	}
@@ -967,8 +965,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 	} else {
 		waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
 		if (!waiter) {
-			vchiq_log_error(service->state->dev, VCHIQ_CORE,
-					"%s - out of memory", __func__);
+			dev_dbg(service->state->dev, "core: error: Out of memory\n");
 			return -ENOMEM;
 		}
 	}
@@ -1290,8 +1287,8 @@ vchiq_keepalive_vchiq_callback(struct vchiq_instance *instance,
 			       struct vchiq_header *header,
 			       unsigned int service_user, void *bulk_user)
 {
-	vchiq_log_error(instance->state->dev, VCHIQ_SUSPEND,
-			"%s callback reason %d", __func__, reason);
+	dev_dbg(instance->state->dev, "suspend: error: callback reason %d\n",
+		reason);
 	return 0;
 }
 
@@ -1315,22 +1312,19 @@ vchiq_keepalive_thread_func(void *v)
 
 	ret = vchiq_initialise(&instance);
 	if (ret) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_initialise failed %d", __func__, ret);
+		dev_dbg(state->dev, "suspend: error: vchiq_initialise failed %d\n", ret);
 		goto exit;
 	}
 
 	status = vchiq_connect(instance);
 	if (status) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_connect failed %d", __func__, status);
+		dev_dbg(state->dev, "suspend: error: vchiq_connect failed %d\n", status);
 		goto shutdown;
 	}
 
 	status = vchiq_add_service(instance, &params, &ka_handle);
 	if (status) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"%s vchiq_open_service failed %d", __func__, status);
+		dev_dbg(state->dev, "suspend: error: vchiq_open_service failed %d\n", status);
 		goto shutdown;
 	}
 
@@ -1338,8 +1332,7 @@ vchiq_keepalive_thread_func(void *v)
 		long rc = 0, uc = 0;
 
 		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
-			vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-					"%s interrupted", __func__);
+			dev_dbg(state->dev, "suspend: error: interrupted\n");
 			flush_signals(current);
 			continue;
 		}
@@ -1359,16 +1352,15 @@ vchiq_keepalive_thread_func(void *v)
 			atomic_inc(&arm_state->ka_use_ack_count);
 			status = vchiq_use_service(instance, ka_handle);
 			if (status) {
-				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-						"%s vchiq_use_service error %d", __func__, status);
+				dev_dbg(state->dev, "suspend: error: vchiq_use_service error %d\n",
+					status);
 			}
 		}
 		while (rc--) {
 			status = vchiq_release_service(instance, ka_handle);
 			if (status) {
-				vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-						"%s vchiq_release_service error %d", __func__,
-						status);
+				dev_dbg(state->dev, "suspend: error: vchiq_release_service error %d\n",
+					status);
 			}
 		}
 	}
@@ -1403,7 +1395,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 			 service->client_id);
 		entity_uc = &service->service_use_count;
 	} else {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND, "%s null service ptr", __func__);
+		dev_dbg(state->dev, "suspend: error: null service ptr\n");
 		ret = -EINVAL;
 		goto out;
 	}
@@ -1686,10 +1678,10 @@ vchiq_check_service(struct vchiq_service *service)
 	read_unlock_bh(&arm_state->susp_res_lock);
 
 	if (ret) {
-		vchiq_log_error(service->state->dev, VCHIQ_SUSPEND,
-				"%s ERROR - %p4cc:%d service count %d, state count %d", __func__,
-				&service->base.fourcc, service->client_id,
-				service->service_use_count, arm_state->videocore_use_count);
+		dev_dbg(service->state->dev,
+			"suspend: error: %p4cc:%d service count %d, state count %d\n",
+			&service->base.fourcc, service->client_id, service->service_use_count,
+			arm_state->videocore_use_count);
 		vchiq_dump_service_use_state(service->state);
 	}
 out:
@@ -1722,9 +1714,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 					      (void *)state,
 					      threadname);
 	if (IS_ERR(arm_state->ka_thread)) {
-		vchiq_log_error(state->dev, VCHIQ_SUSPEND,
-				"vchiq: FATAL: couldn't create thread %s",
-				threadname);
+		dev_dbg(state->dev, "suspend: error: Couldn't create thread %s\n",
+			threadname);
 	} else {
 		wake_up_process(arm_state->ka_thread);
 	}
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 21f9fa1a1713..76ca546f5bfc 100644
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
+				"core: error: There already %d callback registered - please increase MAX_CALLBACKS\n",
+				g_num_deferred_callbacks);
 		} else {
 			g_deferred_callback[g_num_deferred_callbacks] =
 				callback;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index e0022acb4c58..025526e06242 100644
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
+			"core: error: service %d message_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
+			port, quota->message_use_count, header, msgid,
+			header->msgid, header->size);
 		WARN(1, "invalid message use count\n");
 	}
 	if (!BITSET_IS_SET(service_found, port)) {
@@ -766,9 +766,9 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_use->%d",
 					state->id, port, header->size, header, count - 1);
 		} else {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)",
-					port, count, header, msgid, header->msgid, header->size);
+			dev_dbg(state->dev,
+				"core: error: service %d slot_use_count=%d (header %pK, msgid %x, header->msgid %x, header->size %x)\n",
+				port, count, header, msgid, header->msgid, header->size);
 			WARN(1, "bad slot use count\n");
 		}
 	}
@@ -831,9 +831,9 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 
 			pos += calc_stride(header->size);
 			if (pos > VCHIQ_SLOT_SIZE) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"pfq - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
-						pos, header, msgid, header->msgid, header->size);
+				dev_dbg(state->dev,
+					"core: error: pfq - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x\n",
+					pos, header, msgid, header->msgid, header->size);
 				WARN(1, "invalid slot position\n");
 			}
 		}
@@ -1167,8 +1167,8 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 		int oldmsgid = header->msgid;
 
 		if (oldmsgid != VCHIQ_MSGID_PADDING)
-			vchiq_log_error(state->dev, VCHIQ_CORE, "%d: qms - msgid %x, not PADDING",
-					state->id, oldmsgid);
+			dev_dbg(state->dev, "core: error: %d: qms - msgid %x, not PADDING\n",
+				state->id, oldmsgid);
 	}
 
 	vchiq_log_debug(state->dev, VCHIQ_SYNC,
@@ -1616,10 +1616,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 
 		if (!service) {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"%d: prs %s@%pK (%d->%d) - invalid/closed service %d",
-					state->id, msg_type_str(type), header, remoteport,
-					localport, localport);
+			dev_dbg(state->dev,
+				"core: error: %d: prs %s@%pK (%d->%d) - invalid/closed service %d\n",
+				state->id, msg_type_str(type), header, remoteport,
+				localport, localport);
 			goto skip_message;
 		}
 		break;
@@ -1640,9 +1640,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 
 	if (((unsigned long)header & VCHIQ_SLOT_MASK) +
 	    calc_stride(size) > VCHIQ_SLOT_SIZE) {
-		vchiq_log_error(state->dev, VCHIQ_CORE,
-				"header %pK (msgid %x) - size %x too big for slot",
-				header, (unsigned int)msgid, (unsigned int)size);
+		dev_dbg(state->dev, "core: error: header %pK (msgid %x) - size %x too big for slot\n",
+			header, (unsigned int)msgid, (unsigned int)size);
 		WARN(1, "oversized for slot\n");
 	}
 
@@ -1668,8 +1667,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
 			complete(&service->remove_event);
 		} else {
-			vchiq_log_error(state->dev, VCHIQ_CORE, "OPENACK received in state %s",
-					srvstate_names[service->srvstate]);
+			dev_dbg(state->dev, "core: error: OPENACK received in state %s\n",
+				srvstate_names[service->srvstate]);
 		}
 		break;
 	case VCHIQ_MSG_CLOSE:
@@ -1740,11 +1739,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			}
 			if ((int)(queue->remote_insert -
 				queue->local_insert) >= 0) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"%d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)",
-						state->id, msg_type_str(type), header, remoteport,
-						localport, queue->remote_insert,
-						queue->local_insert);
+				dev_dbg(state->dev,
+					"core: error: %d: prs %s@%pK (%d->%d) unexpected (ri=%d,li=%d)\n",
+					state->id, msg_type_str(type), header, remoteport,
+					localport, queue->remote_insert, queue->local_insert);
 				mutex_unlock(&service->bulk_mutex);
 				break;
 			}
@@ -1790,8 +1788,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
 				state->id, header, size);
 		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
-			vchiq_log_error(state->dev, VCHIQ_CORE,
-					"%d: PAUSE received in state PAUSED", state->id);
+			dev_dbg(state->dev, "core: error: %d: PAUSE received in state PAUSED\n",
+				state->id);
 			break;
 		}
 		if (state->conn_state != VCHIQ_CONNSTATE_PAUSE_SENT) {
@@ -1821,8 +1819,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		break;
 
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: prs invalid msgid %x@%pK,%x",
-				state->id, msgid, header, size);
+		dev_dbg(state->dev, "core: error: %d: prs invalid msgid %x@%pK,%x\n",
+			state->id, msgid, header, size);
 		WARN(1, "invalid message\n");
 		break;
 	}
@@ -1932,7 +1930,7 @@ handle_poll(struct vchiq_state *state)
 			 * since the PAUSE should have flushed
 			 * through outstanding messages.
 			 */
-			vchiq_log_error(state->dev, VCHIQ_CORE, "Failed to send RESUME message");
+			dev_dbg(state->dev, "core: error: Failed to send RESUME message\n");
 		}
 		break;
 	default:
@@ -2032,10 +2030,10 @@ sync_func(void *v)
 		service = find_service_by_port(state, localport);
 
 		if (!service) {
-			vchiq_log_error(state->dev, VCHIQ_SYNC,
-					"%d: sf %s@%pK (%d->%d) - invalid/closed service %d",
-					state->id, msg_type_str(type), header,
-					remoteport, localport, localport);
+			dev_dbg(state->dev,
+				"sync: error: %d: sf %s@%pK (%d->%d) - invalid/closed service %d\n",
+				state->id, msg_type_str(type), header, remoteport,
+				localport, localport);
 			release_message_sync(state, header);
 			continue;
 		}
@@ -2077,15 +2075,15 @@ sync_func(void *v)
 			    (service->srvstate == VCHIQ_SRVSTATE_OPENSYNC)) {
 				if (make_service_callback(service, VCHIQ_MESSAGE_AVAILABLE, header,
 							  NULL) == -EAGAIN)
-					vchiq_log_error(state->dev, VCHIQ_SYNC,
-							"synchronous callback to service %d returns -EAGAIN",
-							localport);
+					dev_dbg(state->dev,
+						"sync: error: synchronous callback to service %d returns -EAGAIN\n",
+						localport);
 			}
 			break;
 
 		default:
-			vchiq_log_error(state->dev, VCHIQ_SYNC, "%d: sf unexpected msgid %x@%pK,%x",
-					state->id, msgid, header, size);
+			dev_dbg(state->dev, "sync: error: %d: sf unexpected msgid %x@%pK,%x\n",
+				state->id, msgid, header, size);
 			release_message_sync(state, header);
 			break;
 		}
@@ -2118,8 +2116,7 @@ vchiq_init_slots(struct device *dev, void *mem_base, int mem_size)
 	num_slots -= first_data_slot;
 
 	if (num_slots < 4) {
-		vchiq_log_error(dev, VCHIQ_CORE, "%s - insufficient memory %x bytes",
-				__func__, mem_size);
+		dev_dbg(dev, "core: error: Insufficient memory %x bytes\n", mem_size);
 		return NULL;
 	}
 
@@ -2500,11 +2497,10 @@ vchiq_open_service_internal(struct vchiq_service *service, int client_id)
 	} else if ((service->srvstate != VCHIQ_SRVSTATE_OPEN) &&
 		   (service->srvstate != VCHIQ_SRVSTATE_OPENSYNC)) {
 		if (service->srvstate != VCHIQ_SRVSTATE_CLOSEWAIT)
-			vchiq_log_error(service->state->dev, VCHIQ_CORE,
-					"%d: osi - srvstate = %s (ref %u)",
-					service->state->id,
-					srvstate_names[service->srvstate],
-					kref_read(&service->ref_count));
+			dev_dbg(service->state->dev,
+				"core: error: %d: osi - srvstate = %s (ref %u)\n",
+				service->state->id, srvstate_names[service->srvstate],
+				kref_read(&service->ref_count));
 		status = -EINVAL;
 		VCHIQ_SERVICE_STATS_INC(service, error_count);
 		vchiq_release_service_internal(service);
@@ -2565,9 +2561,9 @@ release_service_messages(struct vchiq_service *service)
 			}
 			pos += calc_stride(header->size);
 			if (pos > VCHIQ_SLOT_SIZE) {
-				vchiq_log_error(state->dev, VCHIQ_CORE,
-						"fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x",
-						pos, header, msgid, header->msgid, header->size);
+				dev_dbg(state->dev,
+					"core: error: fsi - pos %x: header %pK, msgid %x, header->msgid %x, header->size %x\n",
+					pos, header, msgid, header->msgid, header->size);
 				WARN(1, "invalid slot position\n");
 			}
 		}
@@ -2621,8 +2617,8 @@ close_service_complete(struct vchiq_service *service, int failstate)
 	case VCHIQ_SRVSTATE_LISTENING:
 		break;
 	default:
-		vchiq_log_error(service->state->dev, VCHIQ_CORE, "%s(%x) called in state %s",
-				__func__, service->handle, srvstate_names[service->srvstate]);
+		dev_dbg(service->state->dev, "core: error: (%x) called in state %s\n",
+			service->handle, srvstate_names[service->srvstate]);
 		WARN(1, "%s in unexpected state\n", __func__);
 		return -EINVAL;
 	}
@@ -2677,8 +2673,8 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	case VCHIQ_SRVSTATE_LISTENING:
 	case VCHIQ_SRVSTATE_CLOSEWAIT:
 		if (close_recvd) {
-			vchiq_log_error(state->dev, VCHIQ_CORE, "%s(1) called in state %s",
-					__func__, srvstate_names[service->srvstate]);
+			dev_dbg(state->dev, "core: error: (1) called in state %s\n",
+				srvstate_names[service->srvstate]);
 		} else if (is_server) {
 			if (service->srvstate == VCHIQ_SRVSTATE_LISTENING) {
 				status = -EINVAL;
@@ -2765,8 +2761,8 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 		break;
 
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%s(%d) called in state %s", __func__,
-				close_recvd, srvstate_names[service->srvstate]);
+		dev_dbg(state->dev, "core: error: (%d) called in state %s\n",
+			close_recvd, srvstate_names[service->srvstate]);
 		break;
 	}
 
@@ -2805,8 +2801,8 @@ vchiq_free_service_internal(struct vchiq_service *service)
 	case VCHIQ_SRVSTATE_CLOSEWAIT:
 		break;
 	default:
-		vchiq_log_error(state->dev, VCHIQ_CORE, "%d: fsi - (%d) in state %s", state->id,
-				service->localport, srvstate_names[service->srvstate]);
+		dev_dbg(state->dev, "core: error: %d: fsi - (%d) in state %s\n",
+			state->id, service->localport, srvstate_names[service->srvstate]);
 		return;
 	}
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 564b5c707267..d7dcd17e4bff 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -53,10 +53,6 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 	return strings[c];
 };
 
-#ifndef vchiq_log_error
-#define vchiq_log_error(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
-#endif
 #ifndef vchiq_log_warning
 #define vchiq_log_warning(dev, cat, fmt, ...) \
 	do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 307a2d76cbb7..ec5d100481c4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -271,9 +271,9 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			ret = -EFAULT;
 		}
 	} else {
-		vchiq_log_error(service->state->dev, VCHIQ_ARM,
-				"header %pK: bufsize %x < size %x",
-				header, args->bufsize, header->size);
+		dev_dbg(service->state->dev,
+			"arm: error: header %pK: bufsize %x < size %x\n",
+			header, args->bufsize, header->size);
 		WARN(1, "invalid size\n");
 		ret = -EMSGSIZE;
 	}
@@ -318,8 +318,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		}
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
 		if (!waiter) {
-			vchiq_log_error(service->state->dev, VCHIQ_ARM,
-					"no bulk_waiter found for pid %d", current->pid);
+			dev_dbg(service->state->dev,
+				"arm: error: no bulk_waiter found for pid %d\n", current->pid);
 			ret = -ESRCH;
 			goto out;
 		}
@@ -501,10 +501,10 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			msglen = header->size + sizeof(struct vchiq_header);
 			/* This must be a VCHIQ-style service */
 			if (args->msgbufsize < msglen) {
-				vchiq_log_error(service->state->dev, VCHIQ_ARM,
-						"header %pK: msgbufsize %x < msglen %x",
-						header, args->msgbufsize, msglen);
-						WARN(1, "invalid message size\n");
+				dev_dbg(service->state->dev,
+					"arm: error: header %pK: msgbufsize %x < msglen %x\n",
+					header, args->msgbufsize, msglen);
+				WARN(1, "invalid message size\n");
 				if (ret == 0)
 					ret = -EMSGSIZE;
 				break;
@@ -618,9 +618,9 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		}
 		rc = mutex_lock_killable(&instance->state->mutex);
 		if (rc) {
-			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
-					"vchiq: connect: could not lock mutex for state %d: %d",
-					instance->state->id, rc);
+			dev_dbg(instance->state->dev,
+				"arm: error: vchiq: connect: could not lock mutex for state %d: %d\n",
+				instance->state->id, rc);
 			ret = -EINTR;
 			break;
 		}
@@ -630,8 +630,8 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (!status)
 			instance->connected = 1;
 		else
-			vchiq_log_error(instance->state->dev, VCHIQ_ARM,
-					"vchiq: could not connect: %d", status);
+			dev_dbg(instance->state->dev,
+				"arm: error: vchiq: could not connect: %d\n", status);
 		break;
 
 	case VCHIQ_IOC_CREATE_SERVICE: {
@@ -700,13 +700,13 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
+					"suspend: error: cmd %s returned error %ld for service %p4cc:%03d\n",
+					(cmd == VCHIQ_IOC_USE_SERVICE) ?
+					"VCHIQ_IOC_USE_SERVICE" :
+					"VCHIQ_IOC_RELEASE_SERVICE",
+					ret, &service->base.fourcc,
+					service->client_id);
 			}
 		} else {
 			ret = -EINVAL;
@@ -1173,8 +1173,7 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
 
 	if (!state) {
-		vchiq_log_error(state->dev, VCHIQ_ARM,
-				"vchiq has no connection to VideoCore");
+		dev_dbg(state->dev, "arm: error: vchiq has no connection to VideoCore\n");
 		return -ENOTCONN;
 	}
 
-- 
2.41.0


