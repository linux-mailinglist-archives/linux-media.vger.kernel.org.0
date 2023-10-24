Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B567D4F20
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 13:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjJXLpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjJXLpA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 07:45:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EEFF9
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 04:44:53 -0700 (PDT)
Received: from umang.jain (unknown [103.86.18.159])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 648EDB53;
        Tue, 24 Oct 2023 13:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698147879;
        bh=PFhp7JJtC1BzJHPmgadMtyDOLv32xf4N2UXk+oREQ4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rRrrHKanNwwGu+U4NnRr6tj2b4Xj6xKeJalAI2nQSAW6uMQUeC+dr0qcDDWznH6aV
         F8evYmv3VVotnc+whOGNdNCotKGwgxlLu/amHpo0O33Lb81alU452IjSIvKKEGutDt
         YKEb5mSS5zP7xv782KB8/2ex8zF2n8f4yz4ZlKhE=
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
Subject: [PATCH v2 6/8] staging: vc04: Convert vchiq_log_trace() to use dynamic debug
Date:   Tue, 24 Oct 2023 07:44:26 -0400
Message-ID: <20231024114428.443528-7-umang.jain@ideasonboard.com>
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

Move vchiq_log_trace() custom logging wrapper based on printk
to use dynamic debug. The log category is dictated by enum
vchiq_log_category which will become the part of the trace
string format that will be logged to dynamic debug (for grep).

All the vchiq_log_trace() calls are adjusted to use the
modified wrapper.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../interface/vchiq_arm/vchiq_arm.c           | 45 +++++++++++--------
 .../interface/vchiq_arm/vchiq_core.c          | 44 +++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          |  5 +--
 .../interface/vchiq_arm/vchiq_dev.c           |  4 +-
 4 files changed, 55 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 7a51c2f62586..a28b89908c92 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -259,7 +259,8 @@ create_pagelist(struct vchiq_instance *instance, char *buf, char __user *ubuf,
 	pagelist = dma_alloc_coherent(instance->state->dev, pagelist_size, &dma_addr,
 				      GFP_KERNEL);
 
-	vchiq_log_trace(vchiq_arm_log_level, "%s - %pK", __func__, pagelist);
+	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
+			"%s - %pK", __func__, pagelist);
 
 	if (!pagelist)
 		return NULL;
@@ -410,8 +411,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	struct page **pages = pagelistinfo->pages;
 	unsigned int num_pages = pagelistinfo->num_pages;
 
-	vchiq_log_trace(vchiq_arm_log_level, "%s - %pK, %d",
-			__func__, pagelistinfo->pagelist, actual);
+	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
+			"%s - %pK, %d", __func__, pagelistinfo->pagelist, actual);
 
 	/*
 	 * NOTE: dma_unmap_sg must be called before the
@@ -717,7 +718,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
 	ret = 0;
 
 failed:
-	vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __func__, instance, ret);
+	vchiq_log_trace(state->dev, VCHIQ_CORE,
+			"%s(%p): returning %d", __func__, instance, ret);
 
 	return ret;
 }
@@ -750,7 +752,8 @@ int vchiq_shutdown(struct vchiq_instance *instance)
 
 	mutex_unlock(&state->mutex);
 
-	vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __func__, instance, status);
+	vchiq_log_trace(state->dev, VCHIQ_CORE,
+			"%s(%p): returning %d", __func__, instance, status);
 
 	free_bulk_waiter(instance);
 	kfree(instance);
@@ -770,7 +773,8 @@ int vchiq_connect(struct vchiq_instance *instance)
 	struct vchiq_state *state = instance->state;
 
 	if (mutex_lock_killable(&state->mutex)) {
-		vchiq_log_trace(vchiq_core_log_level, "%s: call to mutex_lock failed", __func__);
+		vchiq_log_trace(state->dev, VCHIQ_CORE,
+				"%s: call to mutex_lock failed", __func__);
 		status = -EAGAIN;
 		goto failed;
 	}
@@ -782,7 +786,8 @@ int vchiq_connect(struct vchiq_instance *instance)
 	mutex_unlock(&state->mutex);
 
 failed:
-	vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __func__, instance, status);
+	vchiq_log_trace(state->dev, VCHIQ_CORE,
+			"%s(%p): returning %d", __func__, instance, status);
 
 	return status;
 }
@@ -813,7 +818,8 @@ vchiq_add_service(struct vchiq_instance *instance,
 		status = -EINVAL;
 	}
 
-	vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __func__, instance, status);
+	vchiq_log_trace(state->dev, VCHIQ_CORE,
+			"%s(%p): returning %d", __func__, instance, status);
 
 	return status;
 }
@@ -844,7 +850,8 @@ vchiq_open_service(struct vchiq_instance *instance,
 	}
 
 failed:
-	vchiq_log_trace(vchiq_core_log_level, "%s(%p): returning %d", __func__, instance, status);
+	vchiq_log_trace(state->dev, VCHIQ_CORE,
+			"%s(%p): returning %d", __func__, instance, status);
 
 	return status;
 }
@@ -1014,7 +1021,8 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	while ((insert - instance->completion_remove) >= MAX_COMPLETIONS) {
 		/* Out of space - wait for the client */
 		DEBUG_TRACE(SERVICE_CALLBACK_LINE);
-		vchiq_log_trace(vchiq_arm_log_level, "%s - completion queue full", __func__);
+		vchiq_log_trace(instance->state->dev, VCHIQ_CORE,
+				"%s - completion queue full", __func__);
 		DEBUG_COUNT(COMPLETION_QUEUE_FULL_COUNT);
 		if (wait_for_completion_interruptible(&instance->remove_event)) {
 			vchiq_log_debug(instance->state->dev, VCHIQ_ARM,
@@ -1102,7 +1110,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	vchiq_service_get(service);
 	rcu_read_unlock();
 
-	vchiq_log_trace(vchiq_arm_log_level,
+	vchiq_log_trace(service->state->dev, VCHIQ_ARM,
 			"%s - service %lx(%d,%p), reason %d, header %lx, instance %lx, bulk_userdata %lx",
 			__func__, (unsigned long)user_service, service->localport,
 			user_service->userdata, reason, (unsigned long)header,
@@ -1115,7 +1123,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 			spin_unlock(&msg_queue_spinlock);
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
-			vchiq_log_trace(vchiq_arm_log_level, "%s - msg queue full", __func__);
+			vchiq_log_trace(service->state->dev, VCHIQ_ARM,
+					"%s - msg queue full", __func__);
 			/*
 			 * If there is no MESSAGE_AVAILABLE in the completion
 			 * queue, add one
@@ -1463,8 +1472,8 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	local_uc = ++arm_state->videocore_use_count;
 	++(*entity_uc);
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s %s count %d, state count %d", __func__, entity,
-			*entity_uc, local_uc);
+	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
+			__func__, entity, *entity_uc, local_uc);
 
 	write_unlock_bh(&arm_state->susp_res_lock);
 
@@ -1483,7 +1492,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 	}
 
 out:
-	vchiq_log_trace(vchiq_susp_log_level, "%s exit %d", __func__, ret);
+	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
 	return ret;
 }
 
@@ -1521,14 +1530,14 @@ vchiq_release_internal(struct vchiq_state *state, struct vchiq_service *service)
 	--arm_state->videocore_use_count;
 	--(*entity_uc);
 
-	vchiq_log_trace(vchiq_susp_log_level, "%s %s count %d, state count %d", __func__, entity,
-			*entity_uc, arm_state->videocore_use_count);
+	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s %s count %d, state count %d",
+			__func__, entity, *entity_uc, arm_state->videocore_use_count);
 
 unlock:
 	write_unlock_bh(&arm_state->susp_res_lock);
 
 out:
-	vchiq_log_trace(vchiq_susp_log_level, "%s exit %d", __func__, ret);
+	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
 	return ret;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 926b0f6ea82a..a1f2e14c64fa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -467,7 +467,7 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 {
 	int status;
 
-	vchiq_log_trace(vchiq_core_log_level, "%d: callback:%d (%s, %pK, %pK)",
+	vchiq_log_trace(service->state->dev, VCHIQ_CORE, "%d: callback:%d (%s, %pK, %pK)",
 			service->state->id, service->localport, reason_names[reason],
 			header, bulk_userdata);
 	status = service->base.callback(service->instance, reason, header, service->handle,
@@ -771,7 +771,7 @@ process_free_data_message(struct vchiq_state *state, u32 *service_found,
 			 * it has dropped below its quota
 			 */
 			complete(&quota->quota_event);
-			vchiq_log_trace(vchiq_core_log_level, "%d: pfq:%d %x@%pK - slot_use->%d",
+			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq:%d %x@%pK - slot_use->%d",
 					state->id, port, header->size, header, count - 1);
 		} else {
 			vchiq_log_error(state->dev, VCHIQ_CORE,
@@ -817,7 +817,7 @@ process_free_queue(struct vchiq_state *state, u32 *service_found,
 		 */
 		rmb();
 
-		vchiq_log_trace(vchiq_core_log_level, "%d: pfq %d=%pK %x %x",
+		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: pfq %d=%pK %x %x",
 				state->id, slot_index, data, local->slot_queue_recycle,
 				slot_queue_available);
 
@@ -988,7 +988,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		       ((tx_end_index != quota->previous_tx_index) &&
 			(quota->slot_use_count == quota->slot_quota))) {
 			spin_unlock(&quota_spinlock);
-			vchiq_log_trace(vchiq_core_log_level,
+			vchiq_log_trace(state->dev, VCHIQ_CORE,
 					"%d: qm:%d %s,%zx - quota stall (msg %d, slot %d)",
 					state->id, service->localport, msg_type_str(type), size,
 					quota->message_use_count, quota->slot_use_count);
@@ -1083,7 +1083,7 @@ queue_message(struct vchiq_state *state, struct vchiq_service *service,
 		spin_unlock(&quota_spinlock);
 
 		if (slot_use_count)
-			vchiq_log_trace(vchiq_core_log_level,
+			vchiq_log_trace(state->dev, VCHIQ_CORE,
 					"%d: qm:%d %s,%zx - slot_use->%d (hdr %p)", state->id,
 					service->localport, msg_type_str(VCHIQ_MSG_TYPE(msgid)),
 					size, slot_use_count, header);
@@ -1219,7 +1219,7 @@ queue_message_sync(struct vchiq_state *state, struct vchiq_service *service,
 			? service->base.fourcc
 			: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
 
-		vchiq_log_trace(vchiq_sync_log_level,
+		vchiq_log_trace(state->dev, VCHIQ_SYNC,
 				"Sent Sync Msg %s(%u) to %c%c%c%c s:%u d:%d len:%d",
 				msg_type_str(VCHIQ_MSG_TYPE(msgid)), VCHIQ_MSG_TYPE(msgid),
 				VCHIQ_FOURCC_AS_4CHARS(svc_fourcc), VCHIQ_MSG_SRCPORT(msgid),
@@ -1313,8 +1313,10 @@ notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *queue,
 {
 	int status = 0;
 
-	vchiq_log_trace(vchiq_core_log_level, "%d: nb:%d %cx - p=%x rn=%x r=%x", service->state->id,
-			service->localport, (queue == &service->bulk_tx) ? 't' : 'r',
+	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
+			"%d: nb:%d %cx - p=%x rn=%x r=%x",
+			service->state->id, service->localport,
+			(queue == &service->bulk_tx) ? 't' : 'r',
 			queue->process, queue->remote_notify, queue->remove);
 
 	queue->remote_notify = queue->process;
@@ -1438,9 +1440,11 @@ abort_outstanding_bulks(struct vchiq_service *service,
 {
 	int is_tx = (queue == &service->bulk_tx);
 
-	vchiq_log_trace(vchiq_core_log_level, "%d: aob:%d %cx - li=%x ri=%x p=%x",
-			service->state->id, service->localport, is_tx ? 't' : 'r',
-			queue->local_insert, queue->remote_insert, queue->process);
+	vchiq_log_trace(service->state->dev, VCHIQ_CORE,
+			"%d: aob:%d %cx - li=%x ri=%x p=%x",
+			service->state->id, service->localport,
+			is_tx ? 't' : 'r', queue->local_insert,
+			queue->remote_insert, queue->process);
 
 	WARN_ON((int)(queue->local_insert - queue->process) < 0);
 	WARN_ON((int)(queue->remote_insert - queue->process) < 0);
@@ -1780,7 +1784,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 					state->id, msg_type_str(type), header, remoteport,
 					localport, bulk->actual, &bulk->data);
 
-			vchiq_log_trace(vchiq_core_log_level, "%d: prs:%d %cx li=%x ri=%x p=%x",
+			vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs:%d %cx li=%x ri=%x p=%x",
 					state->id, localport,
 					(type == VCHIQ_MSG_BULK_RX_DONE) ? 'r' : 't',
 					queue->local_insert, queue->remote_insert, queue->process);
@@ -1796,12 +1800,12 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		}
 		break;
 	case VCHIQ_MSG_PADDING:
-		vchiq_log_trace(vchiq_core_log_level, "%d: prs PADDING@%pK,%x",
+		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PADDING@%pK,%x",
 				state->id, header, size);
 		break;
 	case VCHIQ_MSG_PAUSE:
 		/* If initiated, signal the application thread */
-		vchiq_log_trace(vchiq_core_log_level, "%d: prs PAUSE@%pK,%x",
+		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs PAUSE@%pK,%x",
 				state->id, header, size);
 		if (state->conn_state == VCHIQ_CONNSTATE_PAUSED) {
 			vchiq_log_error(state->dev, VCHIQ_CORE,
@@ -1818,7 +1822,7 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
 		vchiq_set_conn_state(state, VCHIQ_CONNSTATE_PAUSED);
 		break;
 	case VCHIQ_MSG_RESUME:
-		vchiq_log_trace(vchiq_core_log_level, "%d: prs RESUME@%pK,%x",
+		vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: prs RESUME@%pK,%x",
 				state->id, header, size);
 		/* Release the slot mutex */
 		mutex_unlock(&state->slot_mutex);
@@ -2059,7 +2063,7 @@ sync_func(void *v)
 			svc_fourcc = service
 				? service->base.fourcc
 				: VCHIQ_MAKE_FOURCC('?', '?', '?', '?');
-			vchiq_log_trace(vchiq_sync_log_level,
+			vchiq_log_trace(state->dev, VCHIQ_SYNC,
 					"Rcvd Msg %s from %c%c%c%c s:%d d:%d len:%d",
 					msg_type_str(type), VCHIQ_FOURCC_AS_4CHARS(svc_fourcc),
 					remoteport, localport, size);
@@ -2088,7 +2092,7 @@ sync_func(void *v)
 			break;
 
 		case VCHIQ_MSG_DATA:
-			vchiq_log_trace(vchiq_sync_log_level, "%d: sf DATA@%pK,%x (%d->%d)",
+			vchiq_log_trace(state->dev, VCHIQ_SYNC, "%d: sf DATA@%pK,%x (%d->%d)",
 					state->id, header, size, remoteport, localport);
 
 			if ((service->remoteport == remoteport) &&
@@ -3132,7 +3136,7 @@ int vchiq_bulk_transfer(struct vchiq_instance *instance, unsigned int handle,
 	mutex_unlock(&state->slot_mutex);
 	mutex_unlock(&service->bulk_mutex);
 
-	vchiq_log_trace(vchiq_core_log_level, "%d: bt:%d %cx li=%x ri=%x p=%x",
+	vchiq_log_trace(state->dev, VCHIQ_CORE, "%d: bt:%d %cx li=%x ri=%x p=%x",
 			state->id, service->localport, dir_char, queue->local_insert,
 			queue->remote_insert, queue->process);
 
@@ -3670,9 +3674,9 @@ void vchiq_log_dump_mem(struct device *dev, const char *label, u32 addr,
 		*s++ = '\0';
 
 		if (label && (*label != '\0'))
-			vchiq_log_trace(VCHIQ_LOG_TRACE, "%s: %08x: %s", label, addr, line_buf);
+			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
 		else
-			vchiq_log_trace(VCHIQ_LOG_TRACE, "%08x: %s", addr, line_buf);
+			vchiq_log_trace(dev, VCHIQ_CORE, "%s: %08x: %s", label, addr, line_buf);
 
 		addr += 16;
 		mem += 16;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index e2d59dea653d..7a36648d6dad 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,9 +74,8 @@ static inline const char *log_category_str(enum vchiq_log_category c)
 	do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
 #ifndef vchiq_log_trace
-#define vchiq_log_trace(cat, fmt, ...) \
-	do { if (cat >= VCHIQ_LOG_TRACE) \
-		printk(VCHIQ_LOG_PREFIX fmt "\n", ##__VA_ARGS__); } while (0)
+#define vchiq_log_trace(dev, cat, fmt, ...) \
+	do { dev_dbg(dev, "%s trace: " fmt, log_category_str(cat), ##__VA_ARGS__); } while (0)
 #endif
 
 #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 403e96610460..b6b5804689fa 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -582,7 +582,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	long ret = 0;
 	int i, rc;
 
-	vchiq_log_trace(vchiq_arm_log_level,
+	vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
 			"%s - instance %pK, cmd %s, arg %lx", __func__, instance,
 			((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
 			ioctl_names[_IOC_NR(cmd)] : "<invalid>", arg);
@@ -874,7 +874,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
 				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
 	} else {
-		vchiq_log_trace(vchiq_arm_log_level,
+		vchiq_log_trace(instance->state->dev, VCHIQ_ARM,
 				"  ioctl instance %pK, cmd %s -> status %d, %ld",
 				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
 				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
-- 
2.41.0

