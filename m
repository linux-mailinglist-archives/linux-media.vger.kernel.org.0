Return-Path: <linux-media+bounces-1296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C57FC52C
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 21:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0821FB216C1
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 20:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D888E40C14;
	Tue, 28 Nov 2023 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cOFuyOSY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E13219B7
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 12:19:48 -0800 (PST)
Received: from umang.jain (unknown [103.238.109.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D15F51DD2;
	Tue, 28 Nov 2023 21:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701202752;
	bh=q9pNAoX26M/9Y8IVZOQ6It9tKZJMGsy+N+kJlyb+Tc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOFuyOSY5J8S4yDiFuOef62WlnymIUTRz4Mny6Pfbkvfbz5/lXOwwtX+RCW99suD2
	 lyYSJVfjLsRLKGUicjxqiO3A3JqstLM6wAyhzelvTiaslv96QMLOmRe2EBcF3ZMuEU
	 D7ha3CzzLjkgYGdwDYwgQIFZb1NzeDGusglipUes=
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
Subject: [PATCH v2 5/5] staging: vc04_services: Drop vchiq_log_debug() in favour of dev_dbg
Date: Wed, 29 Nov 2023 01:49:26 +0530
Message-ID: <20231128201926.489269-6-umang.jain@ideasonboard.com>
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

Drop vchiq_log_debug() macro which wraps dev_dbg(). Introduce the usage
of dev_dbg() directly.

Meanwhile at it, drop the usage of __func__ from the logs.
Dynamic debug supports this via the 'f'  decorator flag.

Remove the entry from TODO regarding custom logging. VC04 is now
aligned according to the standard kernel logging mechanisms.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO  |   5 -
 .../interface/vchiq_arm/vchiq_arm.c           |  45 +++--
 .../interface/vchiq_arm/vchiq_core.c          | 159 ++++++++----------
 .../interface/vchiq_arm/vchiq_core.h          |  26 ---
 .../interface/vchiq_arm/vchiq_dev.c           |  32 ++--
 5 files changed, 106 insertions(+), 161 deletions(-)

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
index fc919e2cc9a1..0db5541e42cb 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -310,9 +310,8 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 						   type == PAGELIST_READ, pages);
 
 		if (actual_pages != num_pages) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"%s - only %d/%d pages locked",
-					__func__, actual_pages, num_pages);
+			dev_dbg(instance->state->dev, "arm: debug: Only %d/%d pages locked\n",
+				actual_pages, num_pages);
 
 			/* This is probably due to the process being killed */
 			if (actual_pages > 0)
@@ -554,8 +553,8 @@ static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state
 		return -ENXIO;
 	}
 
-	vchiq_log_debug(&pdev->dev, VCHIQ_ARM, "vchiq_init - done (slots %pK, phys %pad)",
-			vchiq_slot_zero, &slot_phys);
+	dev_dbg(&pdev->dev, "arm: debug: vchiq_init - done (slots %pK, phys %pad)\n",
+		vchiq_slot_zero, &slot_phys);
 
 	vchiq_call_connected_callbacks();
 
@@ -718,9 +717,9 @@ void free_bulk_waiter(struct vchiq_instance *instance)
 	list_for_each_entry_safe(waiter, next,
 				 &instance->bulk_waiter_list, list) {
 		list_del(&waiter->list);
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"bulk_waiter - cleaned up %pK for pid %d",
-				waiter, waiter->pid);
+		dev_dbg(instance->state->dev,
+			"arm: debug: bulk_waiter - cleaned up %pK for pid %d\n",
+			waiter, waiter->pid);
 		kfree(waiter);
 	}
 }
@@ -980,9 +979,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"saved bulk_waiter %pK for pid %d", waiter,
-				current->pid);
+		dev_dbg(instance->state->dev, "arm: debug: saved bulk_waiter %pK for pid %d\n",
+			waiter, current->pid);
 	}
 
 	return status;
@@ -1005,12 +1003,10 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 		dev_dbg(instance->state->dev, "core: trace: completion queue full\n");
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"service_callback interrupted");
+			dev_dbg(instance->state->dev, "arm: debug: service_callback interrupted\n");
 			return -EAGAIN;
 		} else if (instance->closing) {
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"service_callback closing");
+			dev_dbg(instance->state->dev, "arm: debug: service_callback closing\n");
 			return 0;
 		}
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
@@ -1112,8 +1108,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 				instance->completion_remove) < 0) {
 				int status;
 
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"Inserting extra MESSAGE_AVAILABLE");
+				dev_dbg(instance->state->dev,
+					"arm: debug: Inserting extra MESSAGE_AVAILABLE\n");
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				status = add_completion(instance, reason, NULL, user_service,
 							bulk_userdata);
@@ -1126,14 +1122,12 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			if (wait_for_completion_interruptible(&user_service->remove_event)) {
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"%s interrupted", __func__);
+				dev_dbg(instance->state->dev, "arm: debug: interrupted\n");
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EAGAIN;
 			} else if (instance->closing) {
-				vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-						"%s closing", __func__);
+				dev_dbg(instance->state->dev, "arm: debug: closing\n");
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
 				return -EINVAL;
@@ -1684,8 +1678,8 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 	struct vchiq_arm_state *arm_state = vchiq_platform_get_arm_state(state);
 	char threadname[16];
 
-	vchiq_log_debug(state->dev, VCHIQ_SUSPEND, "%d: %s->%s", state->id,
-			get_conn_state_name(oldstate), get_conn_state_name(newstate));
+	dev_dbg(state->dev, "suspend: debug: %d: %s->%s\n",
+		state->id, get_conn_state_name(oldstate), get_conn_state_name(newstate));
 	if (state->conn_state != VCHIQ_CONNSTATE_CONNECTED)
 		return;
 
@@ -1749,9 +1743,8 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	vchiq_debugfs_init();
 
-	vchiq_log_debug(&pdev->dev, VCHIQ_ARM,
-			"vchiq: platform initialised - version %d (min %d)",
-			VCHIQ_VERSION, VCHIQ_VERSION_MIN);
+	dev_dbg(&pdev->dev, "arm: debug: platform initialised - version %d (min %d)\n",
+		VCHIQ_VERSION, VCHIQ_VERSION_MIN);
 
 	/*
 	 * Simply exit on error since the function handles cleanup in
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f9aac82e918b..1095fb4bbc84 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -217,10 +217,10 @@ static const char *msg_type_str(unsigned int msg_type)
 static inline void
 set_service_state(struct vchiq_service *service, int newstate)
 {
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: srv:%d %s->%s",
-			service->state->id, service->localport,
-			srvstate_names[service->srvstate],
-			srvstate_names[newstate]);
+	dev_dbg(service->state->dev, "core: debug: %d: srv:%d %s->%s\n",
+		service->state->id, service->localport,
+		srvstate_names[service->srvstate],
+		srvstate_names[newstate]);
 	service->srvstate = newstate;
 }
 
@@ -245,8 +245,7 @@ find_service_by_handle(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev, "core: debug: Invalid service handle 0x%x\n", handle);
 	return NULL;
 }
 
@@ -266,8 +265,7 @@ find_service_by_port(struct vchiq_state *state, unsigned int localport)
 		}
 		rcu_read_unlock();
 	}
-	vchiq_log_debug(state->dev, VCHIQ_CORE,
-			"Invalid port %u", localport);
+	dev_dbg(state->dev, "core: debug: Invalid port %u\n", localport);
 	return NULL;
 }
 
@@ -287,8 +285,7 @@ find_service_for_instance(struct vchiq_instance *instance, unsigned int handle)
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev, "core: debug: Invalid service handle 0x%x\n", handle);
 	return NULL;
 }
 
@@ -310,8 +307,7 @@ find_closed_service_for_instance(struct vchiq_instance *instance, unsigned int h
 		return service;
 	}
 	rcu_read_unlock();
-	vchiq_log_debug(instance->state->dev, VCHIQ_CORE,
-			"Invalid service handle 0x%x", handle);
+	dev_dbg(instance->state->dev, "core: debug: Invalid service handle 0x%x\n", handle);
 	return service;
 }
 
@@ -482,8 +478,8 @@ vchiq_set_conn_state(struct vchiq_state *state, enum vchiq_connstate newstate)
 {
 	enum vchiq_connstate oldstate = state->conn_state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s->%s", state->id, conn_state_names[oldstate],
-			conn_state_names[newstate]);
+	dev_dbg(state->dev, "core: debug: %d: %s->%s\n",
+		state->id, conn_state_names[oldstate], conn_state_names[newstate]);
 	state->conn_state = newstate;
 	vchiq_platform_conn_state_changed(state, oldstate, newstate);
 }
@@ -1023,9 +1019,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		int tx_end_index;
 		int slot_use_count;
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		dev_dbg(state->dev, "core: debug: %d: qm %s@%pK,%zx (%d->%d)\n",
+			state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+			VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 
 		WARN_ON(flags & (QMFLAGS_NO_MUTEX_LOCK |
 				 QMFLAGS_NO_MUTEX_UNLOCK));
@@ -1080,9 +1076,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		VCHIQ_SERVICE_STATS_INC(service, ctrl_tx_count);
 		VCHIQ_SERVICE_STATS_ADD(service, ctrl_tx_bytes, size);
 	} else {
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: qm %s@%pK,%zx (%d->%d)", state->id,
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
-				VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
+		dev_dbg(state->dev, "core: debug: %d: qm %s@%pK,%zx (%d->%d)\n",
+			state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+			VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 		if (size != 0) {
 			/*
 			 * It is assumed for now that this code path
@@ -1110,11 +1106,9 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 			? service->base.fourcc
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-				"Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu",
-				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
-				&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid),
-				VCHIQ_MSG_DSTPORT(msgid), size);
+		dev_dbg(state->dev, "core_msg: debug: Sent Msg %s(%u) to %p4cc s:%u d:%d len:%zu\n",
+			msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
+			&svc_fourcc, VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid), size);
 	}
 
 	/* Make sure the new header is visible to the peer. */
@@ -1170,11 +1164,9 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 				state->id, oldmsgid);
 	}
 
-	vchiq_log_debug(state->dev, VCHIQ_SYNC,
-			"%d: qms %s@%pK,%x (%d->%d)", state->id,
-			msg_type_str(VCHIQ_MSG_TYPE(msgid)),
-			header, size, VCHIQ_MSG_SRCPORT(msgid),
-			VCHIQ_MSG_DSTPORT(msgid));
+	dev_dbg(state->dev, "sync: debug: %d: qms %s@%pK,%x (%d->%d)\n",
+		state->id, msg_type_str(VCHIQ_MSG_TYPE(msgid)), header, size,
+		VCHIQ_MSG_SRCPORT(msgid), VCHIQ_MSG_DSTPORT(msgid));
 
 	callback_result =
 		copy_message_data(copy_callback, context,
@@ -1260,9 +1252,9 @@ release_slot(struct vchiq_state *state, struct vchiq_slot_info *slot_info,
 			VCHIQ_SLOT_QUEUE_MASK] =
 			SLOT_INDEX_FROM_INFO(state, slot_info);
 		state->remote->slot_queue_recycle = slot_queue_recycle + 1;
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: %s %d - recycle->%x",
-				state->id, __func__, SLOT_INDEX_FROM_INFO(state, slot_info),
-				state->remote->slot_queue_recycle);
+		dev_dbg(state->dev, "core: debug: %d: %d - recycle->%x\n",
+			state->id, SLOT_INDEX_FROM_INFO(state, slot_info),
+			state->remote->slot_queue_recycle);
 
 		/*
 		 * A write barrier is necessary, but remote_event_signal
@@ -1381,8 +1373,8 @@ poll_services_of_group(struct vchiq_state *state, int group)
 
 		service_flags = atomic_xchg(&service->poll_flags, 0);
 		if (service_flags & BIT(VCHIQ_POLL_REMOVE)) {
-			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - remove %d<->%d",
-					state->id, service->localport, service->remoteport);
+			dev_dbg(state->dev, "core: debug: %d: ps - remove %d<->%d\n",
+				state->id, service->localport, service->remoteport);
 
 			/*
 			 * Make it look like a client, because
@@ -1394,8 +1386,8 @@ poll_services_of_group(struct vchiq_state *state, int group)
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_REMOVE);
 		} else if (service_flags & BIT(VCHIQ_POLL_TERMINATE)) {
-			vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: ps - terminate %d<->%d",
-					state->id, service->localport, service->remoteport);
+			dev_dbg(state->dev, "core: debug: %d: ps - terminate %d<->%d\n",
+				state->id, service->localport, service->remoteport);
 			if (vchiq_close_service_internal(service, NO_CLOSE_RECVD))
 				request_poll(state, service, VCHIQ_POLL_TERMINATE);
 		}
@@ -1447,11 +1439,11 @@ abort_outstanding_bulks(struct vchiq_service *service,
 		if (queue->process != queue->local_insert) {
 			vchiq_complete_bulk(service->instance, bulk);
 
-			vchiq_log_debug(service->state->dev, VCHIQ_CORE_MSG,
-					"%s %p4cc d:%d ABORTED - tx len:%d, rx len:%d",
-					is_tx ? "Send Bulk to" : "Recv Bulk from",
-					&service->base.fourcc,
-					service->remoteport, bulk->size, bulk->remote_size);
+			dev_dbg(service->state->dev,
+				"core_msg: debug: %s %p4cc d:%d ABORTED - tx len:%d, rx len:%d\n",
+				is_tx ? "Send Bulk to" : "Recv Bulk from",
+				&service->base.fourcc,
+				service->remoteport, bulk->size, bulk->remote_size);
 		} else {
 			/* fabricate a matching dummy bulk */
 			bulk->data = 0;
@@ -1484,8 +1476,8 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 
 	payload = (struct vchiq_open_payload *)header->data;
 	fourcc = payload->fourcc;
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs OPEN@%pK (%d->'%p4cc')",
-			state->id, header, localport, &fourcc);
+	dev_dbg(state->dev, "core: debug: %d: prs OPEN@%pK (%d->'%p4cc')\n",
+		state->id, header, localport, &fourcc);
 
 	service = get_listening_service(state, fourcc);
 	if (!service)
@@ -1630,10 +1622,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	svc_fourcc = service ? service->base.fourcc
 			     : VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG,
-			"Rcvd Msg %s(%u) from %p4cc s:%d d:%d len:%d",
-			msg_type_str(type), type, &svc_fourcc,
-			remoteport, localport, size);
+	dev_dbg(state->dev, "core_msg: debug: Rcvd Msg %s(%u) from %p4cc s:%d d:%d len:%d\n",
+		msg_type_str(type), type, &svc_fourcc, remoteport, localport, size);
 	if (size > 0)
 		vchiq_log_dump_mem(state->dev, "Rcvd", 0, header->data, min(16, size));
 
@@ -1657,10 +1647,10 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 				header->data;
 			service->peer_version = payload->version;
 		}
-		vchiq_log_debug(state->dev, VCHIQ_CORE,
-				"%d: prs OPENACK@%pK,%x (%d->%d) v:%d",
-				state->id, header, size, remoteport, localport,
-				service->peer_version);
+		dev_dbg(state->dev,
+			"core: debug: %d: prs OPENACK@%pK,%x (%d->%d) v:%d\n",
+			state->id, header, size, remoteport, localport,
+			service->peer_version);
 		if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 			service->remoteport = remoteport;
 			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
@@ -1673,21 +1663,20 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 	case VCHIQ_MSG_CLOSE:
 		WARN_ON(size); /* There should be no data */
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CLOSE@%pK (%d->%d)",
-				state->id, header, remoteport, localport);
+		dev_dbg(state->dev, "core: debug: %d: prs CLOSE@%pK (%d->%d)\n",
+			state->id, header, remoteport, localport);
 
 		mark_service_closing_internal(service, 1);
 
 		if (vchiq_close_service_internal(service, CLOSE_RECVD) == -EAGAIN)
 			goto bail_not_ready;
 
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "Close Service %p4cc s:%u d:%d",
-				&service->base.fourcc,
-				service->localport, service->remoteport);
+		dev_dbg(state->dev, "core: debug: Close Service %p4cc s:%u d:%d\n",
+			&service->base.fourcc, service->localport, service->remoteport);
 		break;
 	case VCHIQ_MSG_DATA:
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs DATA@%pK,%x (%d->%d)",
-				state->id, header, size, remoteport, localport);
+		dev_dbg(state->dev, "core: debug: %d: prs DATA@%pK,%x (%d->%d)\n",
+			state->id, header, size, remoteport, localport);
 
 		if ((service->remoteport == remoteport) &&
 		    (service->srvstate == VCHIQ_SRVSTATE_OPEN)) {
@@ -1706,8 +1695,8 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_CONNECT:
-		vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: prs CONNECT@%pK",
-				state->id, header);
+		dev_dbg(state->dev, "core: debug: %d: prs CONNECT@%pK\n",
+			state->id, header);
 		state->version_common =	((struct vchiq_slot_zero *)
 					 state->slot_data)->version;
 		complete(&state->connect);
@@ -1758,10 +1747,9 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 			bulk->actual = *(int *)header->data;
 			queue->remote_insert++;
 
-			vchiq_log_debug(state->dev, VCHIQ_CORE,
-					"%d: prs %s@%pK (%d->%d) %x@%pad",
-					state->id, msg_type_str(type), header, remoteport,
-					localport, bulk->actual, &bulk->data);
+			dev_dbg(state->dev, "core: debug: %d: prs %s@%pK (%d->%d) %x@%pad\n",
+				state->id, msg_type_str(type), header, remoteport,
+				localport, bulk->actual, &bulk->data);
 
 			dev_dbg(state->dev, "core: trace: %d: prs:%d %cx li=%x ri=%x p=%x\n",
 				state->id, localport,
@@ -2052,9 +2040,9 @@ sync_func(void *v)
 					header->data;
 				service->peer_version = payload->version;
 			}
-			vchiq_log_debug(state->dev, VCHIQ_SYNC, "%d: sf OPENACK@%pK,%x (%d->%d) v:%d",
-					state->id, header, size, remoteport, localport,
-					service->peer_version);
+			dev_err(state->dev, "sync: debug: %d: sf OPENACK@%pK,%x (%d->%d) v:%d\n",
+				state->id, header, size, remoteport, localport,
+				service->peer_version);
 			if (service->srvstate == VCHIQ_SRVSTATE_OPENING) {
 				service->remoteport = remoteport;
 				set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
@@ -2455,9 +2443,9 @@ vchiq_add_service_internal(struct vchiq_state *state,
 	/* Bring this service online */
 	set_service_state(service, srvstate);
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE_MSG, "%s Service %p4cc SrcPort:%d",
-			(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
-			&params->fourcc, service->localport);
+	dev_dbg(state->dev, "core_msg: debug: %s Service %p4cc SrcPort:%d\n",
+		(srvstate == VCHIQ_SRVSTATE_OPENING) ? "Open" : "Add",
+		&params->fourcc, service->localport);
 
 	/* Don't unlock the service - leave it with a ref_count of 1. */
 
@@ -2552,8 +2540,7 @@ release_service_messages(struct vchiq_service *service)
 			int port = VCHIQ_MSG_DSTPORT(msgid);
 
 			if ((port == service->localport) && (msgid & VCHIQ_MSGID_CLAIMED)) {
-				vchiq_log_debug(state->dev, VCHIQ_CORE,
-						"  fsi - hdr %pK", header);
+				dev_dbg(state->dev, "core: debug:  fsi - hdr %pK\n", header);
 				release_slot(state, slot_info, header, NULL);
 			}
 			pos += calc_stride(header->size);
@@ -2661,8 +2648,9 @@ vchiq_close_service_internal(struct vchiq_service *service, int close_recvd)
 	int close_id = MAKE_CLOSE(service->localport,
 				  VCHIQ_MSG_DSTPORT(service->remoteport));
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: csi:%d,%d (%s)", service->state->id,
-			service->localport, close_recvd, srvstate_names[service->srvstate]);
+	dev_dbg(state->dev, "core: debug: %d: csi:%d,%d (%s)\n",
+		service->state->id, service->localport, close_recvd,
+		srvstate_names[service->srvstate]);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_CLOSED:
@@ -2772,8 +2760,8 @@ vchiq_terminate_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: tsi - (%d<->%d)", state->id,
-			service->localport, service->remoteport);
+	dev_dbg(state->dev, "core: debug: %d: tsi - (%d<->%d)\n",
+		state->id, service->localport, service->remoteport);
 
 	mark_service_closing(service);
 
@@ -2787,8 +2775,7 @@ vchiq_free_service_internal(struct vchiq_service *service)
 {
 	struct vchiq_state *state = service->state;
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: fsi - (%d)",
-			state->id, service->localport);
+	dev_dbg(state->dev, "core: debug: %d: fsi - (%d)\n", state->id, service->localport);
 
 	switch (service->srvstate) {
 	case VCHIQ_SRVSTATE_OPENING:
@@ -2868,8 +2855,8 @@ vchiq_close_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: close_service:%d",
-			service->state->id, service->localport);
+	dev_dbg(service->state->dev, "core: debug: %d: close_service:%d\n",
+		service->state->id, service->localport);
 
 	if ((service->srvstate == VCHIQ_SRVSTATE_FREE) ||
 	    (service->srvstate == VCHIQ_SRVSTATE_LISTENING) ||
@@ -2926,8 +2913,8 @@ vchiq_remove_service(struct vchiq_instance *instance, unsigned int handle)
 	if (!service)
 		return -EINVAL;
 
-	vchiq_log_debug(service->state->dev, VCHIQ_CORE, "%d: remove_service:%d",
-			service->state->id, service->localport);
+	dev_dbg(service->state->dev, "core: debug: %d: remove_service:%d\n",
+		service->state->id, service->localport);
 
 	if (service->srvstate == VCHIQ_SRVSTATE_FREE) {
 		vchiq_service_put(service);
@@ -3070,9 +3057,9 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	 */
 	wmb();
 
-	vchiq_log_debug(state->dev, VCHIQ_CORE, "%d: bt (%d->%d) %cx %x@%pad %pK",
-			state->id, service->localport, service->remoteport,
-			dir_char, size, &bulk->data, userdata);
+	dev_dbg(state->dev, "core: debug: %d: bt (%d->%d) %cx %x@%pad %pK\n",
+		state->id, service->localport, service->remoteport,
+		dir_char, size, &bulk->data, userdata);
 
 	/*
 	 * The slot mutex must be held when the service is being closed, so
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 36e34a7fc628..c8527551b58c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -32,32 +32,6 @@
 #define VCHIQ_SLOT_SIZE     4096
 #define VCHIQ_MAX_MSG_SIZE  (VCHIQ_SLOT_SIZE - sizeof(struct vchiq_header))
 
-enum vchiq_log_category {
-	VCHIQ_ARM,
-	VCHIQ_CORE,
-	VCHIQ_CORE_MSG,
-	VCHIQ_SYNC,
-	VCHIQ_SUSPEND,
-};
-
-static inline const char *log_category_str(enum vchiq_log_category c)
-{
-	static const char * const strings[] = {
-		"vchiq_arm",
-		"vchiq_core",
-		"vchiq_core_msg",
-		"vchiq_sync",
-		"vchiq_suspend",
-	};
-
-	return strings[c];
-};
-
-#ifndef vchiq_log_debug
-#define vchiq_log_debug(dev, cat, fmt, ...) \
-	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
-#endif
-
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
 #define VCHIQ_SLOT_QUEUE_MASK  (VCHIQ_MAX_SLOTS_PER_SIDE - 1)
 #define VCHIQ_SLOT_ZERO_SLOTS  DIV_ROUND_UP(sizeof(struct vchiq_slot_zero), \
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 424179df6259..98a60fee3d9a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -47,9 +47,8 @@ user_service_free(void *userdata)
 
 static void close_delivered(struct user_service *user_service)
 {
-	vchiq_log_debug(user_service->service->state->dev, VCHIQ_ARM,
-			"%s(handle=%x)",
-			__func__, user_service->service->handle);
+	dev_dbg(user_service->service->state->dev,
+		"arm: debug: (handle=%x)\n", user_service->service->handle);
 
 	if (user_service->close_pending) {
 		/* Allow the underlying service to be culled */
@@ -235,8 +234,7 @@ static int vchiq_ioc_dequeue_message(struct vchiq_instance *instance,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(DEQUEUE_MESSAGE_LINE);
 			if (wait_for_completion_interruptible(&user_service->insert_event)) {
-				vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-						"DEQUEUE_MESSAGE interrupted");
+				dev_dbg(service->state->dev, "arm: debug: DEQUEUE_MESSAGE interrupted\n");
 				ret = -EINTR;
 				break;
 			}
@@ -323,8 +321,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 			ret = -ESRCH;
 			goto out;
 		}
-		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-				"found bulk_waiter %pK for pid %d", waiter, current->pid);
+		dev_dbg(service->state->dev, "arm: debug: found bulk_waiter %pK for pid %d\n",
+			waiter, current->pid);
 		userdata = &waiter->bulk_waiter;
 	} else {
 		userdata = args->userdata;
@@ -355,8 +353,8 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		mutex_lock(&instance->bulk_waiter_list_mutex);
 		list_add(&waiter->list, &instance->bulk_waiter_list);
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		vchiq_log_debug(service->state->dev, VCHIQ_ARM,
-				"saved bulk_waiter %pK for pid %d", waiter, current->pid);
+		dev_dbg(service->state->dev, "arm: debug: saved bulk_waiter %pK for pid %d\n",
+			waiter, current->pid);
 
 		ret = put_user(mode_waiting, mode);
 	}
@@ -455,8 +453,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 		mutex_lock(&instance->completion_mutex);
 		if (rc) {
 			DEBUG_TRACE(AWAIT_COMPLETION_LINE);
-			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-					"AWAIT_COMPLETION interrupted");
+			dev_dbg(instance->state->dev, "arm: debug: AWAIT_COMPLETION interrupted\n");
 			ret = -EINTR;
 			goto out;
 		}
@@ -867,10 +864,10 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	}
 
 	if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK)) {
-		vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
-				"  ioctl instance %pK, cmd %s -> status %d, %ld",
-				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
-				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
+		dev_dbg(instance->state->dev,
+			"arm: debug: ioctl instance %pK, cmd %s -> status %d, %ld\n",
+			instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
+			ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	} else {
 		dev_dbg(instance->state->dev,
 			"arm: trace: ioctl instance %pK, cmd %s -> status %d\n, %ld\n",
@@ -1169,7 +1166,7 @@ static int vchiq_open(struct inode *inode, struct file *file)
 	struct vchiq_state *state = vchiq_get_state();
 	struct vchiq_instance *instance;
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "vchiq_open");
+	dev_dbg(state->dev, "arm: debug: vchiq open\n");
 
 	if (!state) {
 		dev_dbg(state->dev, "arm: error: vchiq has no connection to VideoCore\n");
@@ -1204,8 +1201,7 @@ static int vchiq_release(struct inode *inode, struct file *file)
 	int ret = 0;
 	int i;
 
-	vchiq_log_debug(state->dev, VCHIQ_ARM, "%s: instance=%lx", __func__,
-			(unsigned long)instance);
+	dev_dbg(state->dev, "arm: debug: instance=%lx\n", (unsigned long)instance);
 
 	if (!state) {
 		ret = -EPERM;
-- 
2.41.0


