Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D2B215E84
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgGFShs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729872AbgGFShr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:47 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E9341972;
        Mon,  6 Jul 2020 20:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060662;
        bh=0h90TIokBXqBDcBshKhAfr/P43OapWPvP+dZObDBg5o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d6RjRxbvxoXk8dA5f+yTouOmdrAeR00nz4NJw6N+ZTzabmvXkhttGpg4FdpH1caoA
         P1x9GwjYGCP26pzlwxr8N4S2R5R7EemeKaDn1Tj7a9u4nPkeQknJ0tDe46sRcVTr2j
         Nv/yoZWPMcw4U3R5OImmayCYvdYc7BLJMDWwFr44=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 021/108] media: ti-vpe: cal: Remove unused structure fields
Date:   Mon,  6 Jul 2020 21:35:42 +0300
Message-Id: <20200706183709.12238-22-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove structure fields that are never set, set and never read, or set
to a fixed value. This allows removal of a global variable and a macro.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 34 +++--------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 15f4cd205e10..89f6fd2e1300 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,10 +53,6 @@ static unsigned debug;
 module_param(debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-/* timeperframe: min/max and default */
-static const struct v4l2_fract
-	tpf_default = {.numerator = 1001,	.denominator = 30000};
-
 #define cal_dbg(level, caldev, fmt, arg...)	\
 		v4l2_dbg(level, debug, &caldev->v4l2_dev, fmt, ##arg)
 #define cal_info(caldev, fmt, arg...)	\
@@ -71,7 +67,6 @@ static const struct v4l2_fract
 #define ctx_err(ctx, fmt, arg...)	\
 		v4l2_err(&ctx->v4l2_dev, fmt, ##arg)
 
-#define CAL_NUM_INPUT 1
 #define CAL_NUM_CONTEXT 2
 
 #define reg_read(dev, offset) ioread32(dev->base + offset)
@@ -204,15 +199,10 @@ struct cal_buffer {
 	/* common v4l buffer stuff -- must be first */
 	struct vb2_v4l2_buffer	vb;
 	struct list_head	list;
-	const struct cal_fmt	*fmt;
 };
 
 struct cal_dmaqueue {
 	struct list_head	active;
-
-	/* Counters to control fps rate */
-	int			frame;
-	int			ini_jiffies;
 };
 
 /* CTRL_CORE_CAMERRX_CONTROL register field id */
@@ -362,7 +352,6 @@ struct cal_ctx {
 	struct v4l2_subdev	*sensor;
 	struct v4l2_fwnode_endpoint	endpoint;
 
-	struct v4l2_fh		fh;
 	struct cal_dev		*dev;
 	struct cc_data		*cc;
 
@@ -371,14 +360,8 @@ struct cal_ctx {
 	/* v4l2 buffers lock */
 	spinlock_t		slock;
 
-	/* Several counters */
-	unsigned long		jiffies;
-
 	struct cal_dmaqueue	vidq;
 
-	/* Input Number */
-	int			input;
-
 	/* video capture */
 	const struct cal_fmt	*fmt;
 	/* Used to store current pixel format */
@@ -390,11 +373,9 @@ struct cal_ctx {
 	const struct cal_fmt	*active_fmt[ARRAY_SIZE(cal_formats)];
 	unsigned int		num_active_fmt;
 
-	struct v4l2_fract	timeperframe;
 	unsigned int		sequence;
 	unsigned int		external_rate;
 	struct vb2_queue	vb_vidq;
-	unsigned int		seq_count;
 	unsigned int		csi2_port;
 	unsigned int		cport;
 	unsigned int		virtual_channel;
@@ -1538,7 +1519,7 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 static int cal_enum_input(struct file *file, void *priv,
 			  struct v4l2_input *inp)
 {
-	if (inp->index >= CAL_NUM_INPUT)
+	if (inp->index > 0)
 		return -EINVAL;
 
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
@@ -1548,21 +1529,13 @@ static int cal_enum_input(struct file *file, void *priv,
 
 static int cal_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct cal_ctx *ctx = video_drvdata(file);
-
-	*i = ctx->input;
+	*i = 0;
 	return 0;
 }
 
 static int cal_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct cal_ctx *ctx = video_drvdata(file);
-
-	if (i >= CAL_NUM_INPUT)
-		return -EINVAL;
-
-	ctx->input = i;
-	return 0;
+	return i > 0 ? -EINVAL : 0;
 }
 
 /* timeperframe is arbitrary and continuous */
@@ -1856,7 +1829,6 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	struct vb2_queue *q;
 	int ret;
 
-	ctx->timeperframe = tpf_default;
 	ctx->external_rate = 192000000;
 
 	/* initialize locks */
-- 
Regards,

Laurent Pinchart

