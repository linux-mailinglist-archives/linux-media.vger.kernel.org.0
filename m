Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3DE6C66E0
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 12:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjCWLlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 07:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjCWLle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 07:41:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE501B327
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 04:41:33 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1pfJJz-0007OB-Bx; Thu, 23 Mar 2023 12:41:31 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu, 23 Mar 2023 12:41:11 +0100
Subject: [PATCH 3/8] usb: gadget: uvc: implement s/g_output ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
In-Reply-To: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.11.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 OUTPUT devices should implement ENUM_OUTPUT, G_OUTPUT, and
S_OUTPUT. The UVC gadget provides only a single output. Therefore, allow
only a single output 0.

According to the documentation, "_TYPE_ANALOG" is historical and should
be read as "_TYPE_VIDEO".

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_v4l2.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index 13c7ba06f994..4b8bf94e06fc 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -377,6 +377,31 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
+static int
+uvc_v4l2_enum_output(struct file *file, void *priv_fh, struct v4l2_output *out)
+{
+	if (out->index != 0)
+		return -EINVAL;
+
+	out->type = V4L2_OUTPUT_TYPE_ANALOG;
+	snprintf(out->name, sizeof(out->name), "UVC");
+
+	return 0;
+}
+
+static int
+uvc_v4l2_g_output(struct file *file, void *priv_fh, unsigned int *i)
+{
+	*i = 0;
+	return 0;
+}
+
+static int
+uvc_v4l2_s_output(struct file *file, void *priv_fh, unsigned int i)
+{
+	return i ? -EINVAL : 0;
+}
+
 static int
 uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
 {
@@ -547,6 +572,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
 	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
 	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
 	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
+	.vidioc_enum_output = uvc_v4l2_enum_output,
+	.vidioc_g_output = uvc_v4l2_g_output,
+	.vidioc_s_output = uvc_v4l2_s_output,
 	.vidioc_reqbufs = uvc_v4l2_reqbufs,
 	.vidioc_querybuf = uvc_v4l2_querybuf,
 	.vidioc_qbuf = uvc_v4l2_qbuf,

-- 
2.30.2
