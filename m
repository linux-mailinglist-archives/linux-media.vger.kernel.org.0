Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05150241DD
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 22:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfETUMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 16:12:24 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:46510 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfETUMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 16:12:24 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 45796Y6kYTz1rXtr;
        Mon, 20 May 2019 22:12:21 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 45796Y64p7z1qqkK;
        Mon, 20 May 2019 22:12:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id mk2St3hC6xf3; Mon, 20 May 2019 22:12:20 +0200 (CEST)
X-Auth-Info: kmNXI0TxIlaaqExCaWRMDlb5icVi0TM7Pep8lDDUuSk=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz [86.49.110.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 20 May 2019 22:12:20 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <steve_longerbeam@mentor.com>
Subject: [PATCH] media: imx: Handle VIDIOC_ENUMINPUT
Date:   Mon, 20 May 2019 22:12:13 +0200
Message-Id: <20190520201213.7536-1-marex@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add basic handling for VIDIOC_ENUMINPUT, where the imx capture devices
report they are cameras to userspace. Code like e.g. Qt5 qcamera uses
this information when enumerating camera devices and this fixes it's
operation on iMX6, where it previously didn't detect any cameras.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Steve Longerbeam <steve_longerbeam@mentor.com>
To: linux-media@vger.kernel.org
---
 drivers/staging/media/imx/imx-media-capture.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 9430c835c434..1e3790479fd6 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -148,6 +148,18 @@ static int capture_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
+static int capture_enum_input(struct file *file, void *priv,
+			      struct v4l2_input *inp)
+{
+	if (inp->index > 0)
+		return -EINVAL;
+
+	inp->type = V4L2_INPUT_TYPE_CAMERA;
+	strlcpy(inp->name, "Camera", sizeof(inp->name));
+
+	return 0;
+}
+
 static int capture_enum_fmt_vid_cap(struct file *file, void *fh,
 				    struct v4l2_fmtdesc *f)
 {
@@ -414,6 +426,7 @@ static const struct v4l2_ioctl_ops capture_ioctl_ops = {
 
 	.vidioc_enum_framesizes = capture_enum_framesizes,
 	.vidioc_enum_frameintervals = capture_enum_frameintervals,
+	.vidioc_enum_input = capture_enum_input,
 
 	.vidioc_enum_fmt_vid_cap        = capture_enum_fmt_vid_cap,
 	.vidioc_g_fmt_vid_cap           = capture_g_fmt_vid_cap,
-- 
2.20.1

