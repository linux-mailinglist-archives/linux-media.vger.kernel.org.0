Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E4D667D4F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 19:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjALSD3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 13:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240087AbjALSC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 13:02:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87D255646
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 09:25:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67A0D505;
        Thu, 12 Jan 2023 18:25:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673544313;
        bh=91eqVBQkYs3vxnwvnKCufb4K8rjnuHji0Eobz9yL7WE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Un49Of5N58l5PkUC9kalNEGjXync5xNHh6yOseEfhQOqPigc2VNlzgg0UiXNM/ir0
         3WF5mtqE8lxsHnZVP9XwM4FcoGA0jq8aXHuAQ/9cJz6Iqlr2OxmQ/745AQkI3YZbeP
         JV0gANrOjVMAzWmF/ZoX99dnIg0xf6AD4cbKoA2M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH v2 4/7] media: imx-pxp: Pass pixel format value to find_format()
Date:   Thu, 12 Jan 2023 19:25:04 +0200
Message-Id: <20230112172507.30579-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
References: <20230112172507.30579-1-laurent.pinchart@ideasonboard.com>
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

The find_format() function looks up format information for a given pixel
format. It takes a v4l2_format pointer, but only uses the contained
pixel format value. To prepare it for being used by callers that don't
have v4l2_format, modify it to take the pixel format value directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/nxp/imx-pxp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index c3d2df5d725d..2566a7821982 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -176,14 +176,14 @@ enum {
 	V4L2_M2M_DST = 1,
 };
 
-static struct pxp_fmt *find_format(struct v4l2_format *f)
+static struct pxp_fmt *find_format(unsigned int pixelformat)
 {
 	struct pxp_fmt *fmt;
 	unsigned int k;
 
 	for (k = 0; k < NUM_FORMATS; k++) {
 		fmt = &formats[k];
-		if (fmt->fourcc == f->fmt.pix.pixelformat)
+		if (fmt->fourcc == pixelformat)
 			break;
 	}
 
@@ -1266,10 +1266,10 @@ static int pxp_try_fmt_vid_cap(struct file *file, void *priv,
 	struct pxp_fmt *fmt;
 	struct pxp_ctx *ctx = file2ctx(file);
 
-	fmt = find_format(f);
+	fmt = find_format(f->fmt.pix.pixelformat);
 	if (!fmt) {
 		f->fmt.pix.pixelformat = formats[0].fourcc;
-		fmt = find_format(f);
+		fmt = find_format(f->fmt.pix.pixelformat);
 	}
 	if (!(fmt->types & MEM2MEM_CAPTURE)) {
 		v4l2_err(&ctx->dev->v4l2_dev,
@@ -1294,10 +1294,10 @@ static int pxp_try_fmt_vid_out(struct file *file, void *priv,
 	struct pxp_fmt *fmt;
 	struct pxp_ctx *ctx = file2ctx(file);
 
-	fmt = find_format(f);
+	fmt = find_format(f->fmt.pix.pixelformat);
 	if (!fmt) {
 		f->fmt.pix.pixelformat = formats[0].fourcc;
-		fmt = find_format(f);
+		fmt = find_format(f->fmt.pix.pixelformat);
 	}
 	if (!(fmt->types & MEM2MEM_OUTPUT)) {
 		v4l2_err(&ctx->dev->v4l2_dev,
@@ -1330,7 +1330,7 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
 		return -EBUSY;
 	}
 
-	q_data->fmt		= find_format(f);
+	q_data->fmt		= find_format(f->fmt.pix.pixelformat);
 	q_data->width		= f->fmt.pix.width;
 	q_data->height		= f->fmt.pix.height;
 	q_data->bytesperline	= f->fmt.pix.bytesperline;
-- 
Regards,

Laurent Pinchart

