Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF7534616C
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbhCWOYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 10:24:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34545 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbhCWOY0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:24:26 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lOhxF-0000jQ-Pj; Tue, 23 Mar 2021 14:24:21 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: imx-jpeg: Pass the v4l2_jpeg_header header argument by reference
Date:   Tue, 23 Mar 2021 14:24:21 +0000
Message-Id: <20210323142421.348695-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the header argument is being passed by value, so a copy of 256
byte structure on the stack is potentially occurring. Fix this by passing
by reference to avoid any large stack copies.

Addresses-Coverity: ("Big parameter passed by value")
Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index adb1715c75d7..f13a8efc35ad 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -1114,21 +1114,21 @@ static int mxc_jpeg_valid_comp_id(struct device *dev,
 }
 
 static u32 mxc_jpeg_get_image_format(struct device *dev,
-				     const struct v4l2_jpeg_header header)
+				     const struct v4l2_jpeg_header *header)
 {
 	int i;
 	u32 fourcc = 0;
 
 	for (i = 0; i < MXC_JPEG_NUM_FORMATS; i++)
-		if (mxc_formats[i].subsampling == header.frame.subsampling &&
-		    mxc_formats[i].nc == header.frame.num_components) {
+		if (mxc_formats[i].subsampling == header->frame.subsampling &&
+		    mxc_formats[i].nc == header->frame.num_components) {
 			fourcc = mxc_formats[i].fourcc;
 			break;
 		}
 	if (fourcc == 0) {
 		dev_err(dev, "Could not identify image format nc=%d, subsampling=%d\n",
-			header.frame.num_components,
-			header.frame.subsampling);
+			header->frame.num_components,
+			header->frame.subsampling);
 		return fourcc;
 	}
 	/*
@@ -1137,7 +1137,7 @@ static u32 mxc_jpeg_get_image_format(struct device *dev,
 	 * ITU-T T.872 chapter 6.5.3 APP14 marker segment for colour encoding
 	 */
 	if (fourcc == V4L2_PIX_FMT_YUV24 || fourcc == V4L2_PIX_FMT_RGB24) {
-		if (header.app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB)
+		if (header->app14_tf == V4L2_JPEG_APP14_TF_CMYK_RGB)
 			fourcc = V4L2_PIX_FMT_RGB24;
 		else
 			fourcc = V4L2_PIX_FMT_YUV24;
@@ -1258,7 +1258,7 @@ static int mxc_jpeg_parse(struct mxc_jpeg_ctx *ctx,
 	if (!mxc_jpeg_valid_comp_id(dev, psof, psos))
 		dev_warn(dev, "JPEG component ids should be 0-3 or 1-4");
 
-	fourcc = mxc_jpeg_get_image_format(dev, header);
+	fourcc = mxc_jpeg_get_image_format(dev, &header);
 	if (fourcc == 0)
 		return -EINVAL;
 
-- 
2.30.2

