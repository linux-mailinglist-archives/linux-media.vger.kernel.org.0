Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6B75263CE
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354896AbiEMOTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350603AbiEMOS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:18:59 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ABE1498DD
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:18:58 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id D5A6B24000F;
        Fri, 13 May 2022 14:18:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 23/28] media: ov5640: Add RGB565_1X16 format
Date:   Fri, 13 May 2022 16:14:11 +0200
Message-Id: <20220513141416.120552-24-jacopo@jmondi.org>
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

The driver already supports the 2X8_[LE|BE] variants of RGB565
formats.

As for CSI-2 the 2X8 variants do not apply, add RGB565_1X16 variant
with little-endian ordering of components as required by the CSI-2
specifications.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 14e42bb95161..4a88794710ad 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -221,6 +221,10 @@ static const struct ov5640_pixfmt {
 		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
 		.colorspace = V4L2_COLORSPACE_SRGB,
 		.bpp = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.bpp = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.colorspace = V4L2_COLORSPACE_SRGB,
@@ -2926,6 +2930,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		mux = OV5640_FMT_MUX_YUV422;
 		break;
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_1X16:
 		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
 		fmt = 0x6F;
 		mux = OV5640_FMT_MUX_RGB;
-- 
2.35.1

