Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD031C3598
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgEDJ0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56776 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgEDJ0j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DE2111FC;
        Mon,  4 May 2020 11:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584394;
        bh=vtGkog12vd6FBp8Cm5HUcfVOwismuLj2ST1JROgCHfA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MTZH1ukyCkVMJ6duBMLSdothgkSsH96UPsMGf2WEdzMzt0gIHTn/Qx1fnjKEgPysK
         jiNAJPymRqQKnYCXs6lBDgPt12X+4kBypJF9fy63BNYvmPj9mJj2DbNY/GRiMOwagR
         547fvFwU2lc5mAwfbzToS88WtL0upvLNk/LDQ2ZQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 15/34] staging: mmal-vchiq: Use vc-sm-cma to support zero copy
Date:   Mon,  4 May 2020 12:25:52 +0300
Message-Id: <20200504092611.9798-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

With the vc-sm-cma driver we can support zero copy of buffers between
the kernel and VPU. Add this support to vchiq-mmal.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>

staging: vc-sm-cma: Use a void* pointer as the handle within the kernel

The driver was using an unsigned int as the handle to the outside world,
and doing a nasty cast to the struct dmabuf when handed it back.
This breaks badly with a 64 bit kernel where the pointer doesn't fit
in an unsigned int.

Switch to using a void* within the kernel. Reality is that it is
a struct dma_buf*, but advertising it as such to other drivers seems
to encourage the use of it as such, and I'm not sure on the implications
of that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../vc04_services/vchiq-mmal/mmal-common.h    |  4 ++
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 66 ++++++++++++++++++-
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  1 +
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
index b78c180e0c79..3893a280fcfa 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
@@ -50,6 +50,10 @@ struct mmal_buffer {
 
 	struct mmal_msg_context *msg_context;
 
+	struct dma_buf *dma_buf;/* Exported dmabuf fd from videobuf2 */
+	void *vcsm_handle;	/* VCSM handle having imported the dmabuf */
+	u32 vc_handle;		/* VC handle to that dmabuf */
+
 	u32 cmd;		/* MMAL command. 0=data. */
 	unsigned long length;
 	u32 mmal_flags;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 63a46818184f..c65c262cffbb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -26,9 +26,12 @@
 #include <media/videobuf2-vmalloc.h>
 
 #include "mmal-common.h"
+#include "mmal-parameters.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
 
+#include "vc-sm-cma/vc_sm_knl.h"
+
 #define USE_VCHIQ_ARM
 #include "interface/vchi/vchi.h"
 
@@ -419,8 +422,13 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 
 	/* buffer header */
 	m.u.buffer_from_host.buffer_header.cmd = 0;
-	m.u.buffer_from_host.buffer_header.data =
-		(u32)(unsigned long)buf->buffer;
+	if (port->zero_copy) {
+		m.u.buffer_from_host.buffer_header.data = buf->vc_handle;
+	} else {
+		m.u.buffer_from_host.buffer_header.data =
+			(u32)(unsigned long)buf->buffer;
+	}
+
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
 	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
 		m.u.buffer_from_host.buffer_header.length = 0;
@@ -585,6 +593,22 @@ static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
 
 		msg_context->u.bulk.status = msg->h.status;
 
+	} else if (msg->u.buffer_from_host.is_zero_copy) {
+		/*
+		 * Zero copy buffer, so nothing to do.
+		 * Copy buffer info and make callback.
+		 */
+		msg_context->u.bulk.buffer_used =
+				msg->u.buffer_from_host.buffer_header.length;
+		msg_context->u.bulk.mmal_flags =
+				msg->u.buffer_from_host.buffer_header.flags;
+		msg_context->u.bulk.dts =
+				msg->u.buffer_from_host.buffer_header.dts;
+		msg_context->u.bulk.pts =
+				msg->u.buffer_from_host.buffer_header.pts;
+		msg_context->u.bulk.cmd =
+				msg->u.buffer_from_host.buffer_header.cmd;
+
 	} else if (msg->u.buffer_from_host.buffer_header.length == 0) {
 		/* empty buffer */
 		if (msg->u.buffer_from_host.buffer_header.flags &
@@ -1532,6 +1556,9 @@ int vchiq_mmal_port_parameter_set(struct vchiq_mmal_instance *instance,
 
 	mutex_unlock(&instance->vchiq_mutex);
 
+	if (parameter == MMAL_PARAMETER_ZERO_COPY && !ret)
+		port->zero_copy = !!(*(bool *)value);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_set);
@@ -1700,6 +1727,31 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 	unsigned long flags = 0;
 	int ret;
 
+	/*
+	 * We really want to do this in mmal_vchi_buffer_init but can't as
+	 * videobuf2 won't let us have the dmabuf there.
+	 */
+	if (port->zero_copy && buffer->dma_buf && !buffer->vcsm_handle) {
+		pr_debug("%s: import dmabuf %p\n", __func__, buffer->dma_buf);
+		ret = vc_sm_cma_import_dmabuf(buffer->dma_buf,
+					      &buffer->vcsm_handle);
+		if (ret) {
+			pr_err("%s: vc_sm_import_dmabuf_fd failed, ret %d\n",
+			       __func__, ret);
+			return ret;
+		}
+
+		buffer->vc_handle = vc_sm_cma_int_handle(buffer->vcsm_handle);
+		if (!buffer->vc_handle) {
+			pr_err("%s: vc_sm_int_handle failed %d\n",
+			       __func__, ret);
+			vc_sm_cma_free(buffer->vcsm_handle);
+			return ret;
+		}
+		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
+			 __func__, buffer->dma_buf, buffer->vc_handle);
+	}
+
 	ret = buffer_from_host(instance, port, buffer);
 	if (ret == -EINVAL) {
 		/* Port is disabled. Queue for when it is enabled. */
@@ -1733,6 +1785,16 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 		release_msg_context(msg_context);
 	buf->msg_context = NULL;
 
+	if (buf->vcsm_handle) {
+		int ret;
+
+		pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
+			 buf->vcsm_handle);
+		ret = vc_sm_cma_free(buf->vcsm_handle);
+		if (ret)
+			pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
+		buf->vcsm_handle = 0;
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 7a490f29737a..ae6c69ba16ee 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -49,6 +49,7 @@ typedef void (*vchiq_mmal_buffer_cb)(
 
 struct vchiq_mmal_port {
 	u32 enabled:1;
+	u32 zero_copy:1;
 	u32 handle;
 	u32 type; /* port type, cached to use on port info set */
 	u32 index; /* port index, cached to use on port info set */
-- 
Regards,

Laurent Pinchart

