Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52BE05263C9
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350603AbiEMOTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241355AbiEMOTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:19:01 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A99514AC82
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:19:00 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 400FE240016;
        Fri, 13 May 2022 14:18:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 24/28] media: ov5640: Add BGR888 format
Date:   Fri, 13 May 2022 16:14:12 +0200
Message-Id: <20220513141416.120552-25-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for BGR888 image format.

No existing media bus codes describe exactly the way data is transferred
on the CSI-2 bus. This is not a new issue, the CSI-2 YUV422 8-bit format
is described by MEDIA_BUS_FMT_UYVY8_1X16 which is an arbitrary
convention and not an exact match. Use the MEDIA_BUS_FMT_BGR888_1X24 to
follow the same convention, based on the order in which bits are
transmitted over the CSI-2 bus when producing images in RGB24 format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4a88794710ad..a1c00e7781d5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -225,6 +225,10 @@ static const struct ov5640_pixfmt {
 		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 24,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
@@ -2940,6 +2944,11 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		fmt = 0x61;
 		mux = OV5640_FMT_MUX_RGB;
 		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		/* BGR888: RGB */
+		fmt = 0x23;
+		mux = OV5640_FMT_MUX_RGB;
+		break;
 	case MEDIA_BUS_FMT_JPEG_1X8:
 		/* YUV422, YUYV */
 		fmt = 0x30;
-- 
2.35.1

