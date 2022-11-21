Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6B7632F48
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 22:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbiKUVt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 16:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbiKUVti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 16:49:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CDEDB864;
        Mon, 21 Nov 2022 13:49:24 -0800 (PST)
Received: from umang.jainideasonboard.com (unknown [103.86.18.138])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6731174C;
        Mon, 21 Nov 2022 22:49:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669067362;
        bh=5vWA5wjz4rGuYqMACmowEmbAPShvvxlqcmTfMjtrj5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H0QPDcPnkxMDaE2hRRgbX1l1F2tC37uulnkKDclGjgauKikrjrMqYvPhgteuiBr8F
         szKeMnXg/WhcxMk2rDyun+vUpN4OMjm8uXT7dTzN68hPtAFwc+BHCLc2CDxa54AMTT
         vO/8mOq5DfvRT+M21iey47UKIYW++dfLmfmZbh5M=
From:   Umang Jain <umang.jain@ideasonboard.com>
To:     linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        David Plowman <david.plowman@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 04/14] staging: mmal-vchiq: Add support for event callbacks
Date:   Tue, 22 Nov 2022 03:17:12 +0530
Message-Id: <20221121214722.22563-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121214722.22563-1-umang.jain@ideasonboard.com>
References: <20221121214722.22563-1-umang.jain@ideasonboard.com>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The bcm2835-isp will use the event mechanism to report things such as
stream start event. It is signalled by the cmd field of the buffer
being non-zero.

Add support for passing this information out to the client.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/vchiq-mmal/mmal-common.h    |   1 +
 .../vc04_services/vchiq-mmal/mmal-msg.h       |  35 ++++
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 170 ++++++++++++++++--
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |   4 +
 4 files changed, 196 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
index b33129403a30..0443be8198ea 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
@@ -50,6 +50,7 @@ struct mmal_buffer {
 
 	struct mmal_msg_context *msg_context;
 
+	u32 cmd;		/* MMAL command. 0=data. */
 	unsigned long length;
 	u32 mmal_flags;
 	s64 dts;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
index 471413248a14..ef84b4e35608 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -346,6 +346,41 @@ struct mmal_msg_port_parameter_get_reply {
 /* event messages */
 #define MMAL_WORKER_EVENT_SPACE 256
 
+/* Four CC's for events */
+#define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
+
+#define MMAL_EVENT_ERROR		MMAL_FOURCC('E', 'R', 'R', 'O')
+#define MMAL_EVENT_EOS			MMAL_FOURCC('E', 'E', 'O', 'S')
+#define MMAL_EVENT_FORMAT_CHANGED	MMAL_FOURCC('E', 'F', 'C', 'H')
+#define MMAL_EVENT_PARAMETER_CHANGED	MMAL_FOURCC('E', 'P', 'C', 'H')
+
+/* Structs for each of the event message payloads */
+struct mmal_msg_event_eos {
+	u32 port_type;	/**< Type of port that received the end of stream */
+	u32 port_index;	/**< Index of port that received the end of stream */
+};
+
+/** Format changed event data. */
+struct mmal_msg_event_format_changed {
+	/* Minimum size of buffers the port requires */
+	u32 buffer_size_min;
+	/* Minimum number of buffers the port requires */
+	u32 buffer_num_min;
+	/* Size of buffers the port recommends for optimal performance.
+	 * A value of zero means no special recommendation.
+	 */
+	u32 buffer_size_recommended;
+	/* Number of buffers the port recommends for optimal
+	 * performance. A value of zero means no special recommendation.
+	 */
+	u32 buffer_num_recommended;
+
+	u32 es_ptr;
+	struct mmal_es_format format;
+	union mmal_es_specific_format es;
+	u8 extradata[MMAL_FORMAT_EXTRADATA_MAX_SIZE];
+};
+
 struct mmal_msg_event_to_host {
 	u32 client_component;	/* component context */
 
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index cb921c94996a..1c0047eead7e 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -143,6 +143,8 @@ struct mmal_msg_context {
 			/* Presentation and Decode timestamps */
 			s64 pts;
 			s64 dts;
+			/* MMAL buffer command flag */
+			u32 cmd;
 
 			int status;	/* context status */
 
@@ -230,18 +232,6 @@ release_msg_context(struct mmal_msg_context *msg_context)
 	kfree(msg_context);
 }
 
-/* deals with receipt of event to host message */
-static void event_to_host_cb(struct vchiq_mmal_instance *instance,
-			     struct mmal_msg *msg, u32 msg_len)
-{
-	pr_debug("unhandled event\n");
-	pr_debug("component:%u port type:%d num:%d cmd:0x%x length:%d\n",
-		 msg->u.event_to_host.client_component,
-		 msg->u.event_to_host.port_type,
-		 msg->u.event_to_host.port_num,
-		 msg->u.event_to_host.cmd, msg->u.event_to_host.length);
-}
-
 /* workqueue scheduled callback
  *
  * we do this because it is important we do not call any other vchiq
@@ -263,13 +253,18 @@ static void buffer_work_cb(struct work_struct *work)
 	buffer->mmal_flags = msg_context->u.bulk.mmal_flags;
 	buffer->dts = msg_context->u.bulk.dts;
 	buffer->pts = msg_context->u.bulk.pts;
+	buffer->cmd = msg_context->u.bulk.cmd;
 
-	atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
+	if (!buffer->cmd)
+		atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
 
 	msg_context->u.bulk.port->buffer_cb(msg_context->u.bulk.instance,
 					    msg_context->u.bulk.port,
 					    msg_context->u.bulk.status,
 					    msg_context->u.bulk.buffer);
+
+	if (buffer->cmd)
+		mutex_unlock(&msg_context->u.bulk.port->event_context_mutex);
 }
 
 /* workqueue scheduled callback to handle receiving buffers
@@ -347,6 +342,7 @@ static int bulk_receive(struct vchiq_mmal_instance *instance,
 	msg_context->u.bulk.buffer_used = rd_len;
 	msg_context->u.bulk.dts = msg->u.buffer_from_host.buffer_header.dts;
 	msg_context->u.bulk.pts = msg->u.buffer_from_host.buffer_header.pts;
+	msg_context->u.bulk.cmd = msg->u.buffer_from_host.buffer_header.cmd;
 
 	queue_work(msg_context->instance->bulk_wq,
 		   &msg_context->u.bulk.buffer_to_host_work);
@@ -449,6 +445,103 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	return ret;
 }
 
+/* deals with receipt of event to host message */
+static void event_to_host_cb(struct vchiq_mmal_instance *instance,
+			     struct mmal_msg *msg, u32 msg_len)
+{
+	/* FIXME: Not going to work on 64 bit */
+	struct vchiq_mmal_component *component =
+		(struct vchiq_mmal_component *)msg->u.event_to_host.client_component;
+	struct vchiq_mmal_port *port = NULL;
+	struct mmal_msg_context *msg_context;
+	u32 port_num = msg->u.event_to_host.port_num;
+
+	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
+		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
+		       __func__);
+		return;
+	}
+
+	switch (msg->u.event_to_host.port_type) {
+	case MMAL_PORT_TYPE_CONTROL:
+		if (port_num) {
+			pr_err("%s: port_num of %u >= number of ports 1",
+			       __func__, port_num);
+			return;
+		}
+		port = &component->control;
+		break;
+	case MMAL_PORT_TYPE_INPUT:
+		if (port_num >= component->inputs) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->inputs);
+			return;
+		}
+		port = &component->input[port_num];
+		break;
+	case MMAL_PORT_TYPE_OUTPUT:
+		if (port_num >= component->outputs) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->outputs);
+			return;
+		}
+		port = &component->output[port_num];
+		break;
+	case MMAL_PORT_TYPE_CLOCK:
+		if (port_num >= component->clocks) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->clocks);
+			return;
+		}
+		port = &component->clock[port_num];
+		break;
+	default:
+		break;
+	}
+
+	if (!mutex_trylock(&port->event_context_mutex)) {
+		pr_err("dropping event 0x%x\n", msg->u.event_to_host.cmd);
+		return;
+	}
+	msg_context = port->event_context;
+
+	if (msg->h.status != MMAL_MSG_STATUS_SUCCESS) {
+		/* message reception had an error */
+		//pr_warn
+		pr_err("%s: error %d in reply\n", __func__, msg->h.status);
+
+		msg_context->u.bulk.status = msg->h.status;
+	} else if (msg->u.event_to_host.length > MMAL_WORKER_EVENT_SPACE) {
+		/* data is not in message, queue a bulk receive */
+		pr_err("%s: payload not in message - bulk receive??! NOT SUPPORTED\n",
+		       __func__);
+		msg_context->u.bulk.status = -1;
+	} else {
+		memcpy(msg_context->u.bulk.buffer->buffer,
+		       msg->u.event_to_host.data,
+		       msg->u.event_to_host.length);
+
+		msg_context->u.bulk.buffer_used =
+		    msg->u.event_to_host.length;
+
+		msg_context->u.bulk.mmal_flags = 0;
+		msg_context->u.bulk.dts = MMAL_TIME_UNKNOWN;
+		msg_context->u.bulk.pts = MMAL_TIME_UNKNOWN;
+		msg_context->u.bulk.cmd = msg->u.event_to_host.cmd;
+
+		pr_debug("event component:%u port type:%d num:%d cmd:0x%x length:%d\n",
+			 msg->u.event_to_host.client_component,
+			 msg->u.event_to_host.port_type,
+			 msg->u.event_to_host.port_num,
+			 msg->u.event_to_host.cmd, msg->u.event_to_host.length);
+	}
+
+	schedule_work(&msg_context->u.bulk.work);
+}
+
 /* deals with receipt of buffer to host message */
 static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
 			      struct mmal_msg *msg, u32 msg_len)
@@ -1330,6 +1423,7 @@ static int port_disable(struct vchiq_mmal_instance *instance,
 				mmalbuf->mmal_flags = 0;
 				mmalbuf->dts = MMAL_TIME_UNKNOWN;
 				mmalbuf->pts = MMAL_TIME_UNKNOWN;
+				mmalbuf->cmd = 0;
 				port->buffer_cb(instance,
 						port, 0, mmalbuf);
 			}
@@ -1631,6 +1725,43 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
 
+static void init_event_context(struct vchiq_mmal_instance *instance,
+			       struct vchiq_mmal_port *port)
+{
+	struct mmal_msg_context *ctx = get_msg_context(instance);
+
+	mutex_init(&port->event_context_mutex);
+
+	port->event_context = ctx;
+	ctx->u.bulk.instance = instance;
+	ctx->u.bulk.port = port;
+	ctx->u.bulk.buffer =
+		kzalloc(sizeof(*ctx->u.bulk.buffer), GFP_KERNEL);
+	if (!ctx->u.bulk.buffer)
+		goto release_msg_context;
+	ctx->u.bulk.buffer->buffer = kzalloc(MMAL_WORKER_EVENT_SPACE,
+					     GFP_KERNEL);
+	if (!ctx->u.bulk.buffer->buffer)
+		goto release_buffer;
+
+	INIT_WORK(&ctx->u.bulk.work, buffer_work_cb);
+	return;
+
+release_buffer:
+	kfree(ctx->u.bulk.buffer);
+release_msg_context:
+	release_msg_context(ctx);
+}
+
+static void free_event_context(struct vchiq_mmal_port *port)
+{
+	struct mmal_msg_context *ctx = port->event_context;
+
+	kfree(ctx->u.bulk.buffer->buffer);
+	kfree(ctx->u.bulk.buffer);
+	release_msg_context(ctx);
+}
+
 /* Initialise a mmal component and its ports
  *
  */
@@ -1680,6 +1811,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 	ret = port_info_get(instance, &component->control);
 	if (ret < 0)
 		goto release_component;
+	init_event_context(instance, &component->control);
 
 	for (idx = 0; idx < component->inputs; idx++) {
 		component->input[idx].type = MMAL_PORT_TYPE_INPUT;
@@ -1690,6 +1822,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->input[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->input[idx]);
 	}
 
 	for (idx = 0; idx < component->outputs; idx++) {
@@ -1701,6 +1834,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->output[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->output[idx]);
 	}
 
 	for (idx = 0; idx < component->clocks; idx++) {
@@ -1712,6 +1846,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->clock[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->clock[idx]);
 	}
 
 	*component_out = component;
@@ -1737,7 +1872,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_component *component)
 {
-	int ret;
+	int ret, idx;
 
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
@@ -1749,6 +1884,13 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	component->in_use = 0;
 
+	for (idx = 0; idx < component->inputs; idx++)
+		free_event_context(&component->input[idx]);
+	for (idx = 0; idx < component->outputs; idx++)
+		free_event_context(&component->output[idx]);
+	for (idx = 0; idx < component->clocks; idx++)
+		free_event_context(&component->clock[idx]);
+
 	mutex_unlock(&instance->vchiq_mutex);
 
 	return ret;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 6006e29232b3..e3ecd70b9951 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -79,6 +79,10 @@ struct vchiq_mmal_port {
 	vchiq_mmal_buffer_cb buffer_cb;
 	/* callback context */
 	void *cb_ctx;
+
+	/* ensure serialised use of the one event context structure */
+	struct mutex event_context_mutex;
+	struct mmal_msg_context *event_context;
 };
 
 struct vchiq_mmal_component {
-- 
2.37.3

