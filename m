Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB1454C109C
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:46:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239675AbiBWKrV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbiBWKrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:47:18 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66BC48E7F
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:46:50 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 301F5200010;
        Wed, 23 Feb 2022 10:46:46 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 22/27] media: ov5640: Add RGB565_1X16 format
Date:   Wed, 23 Feb 2022 11:40:29 +0100
Message-Id: <20220223104034.91550-23-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220223104034.91550-1-jacopo@jmondi.org>
References: <20220223104034.91550-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/ov5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c03976b22cbf..b9a488f63687 100644
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
@@ -2898,6 +2902,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		mux = OV5640_FMT_MUX_YUV422;
 		break;
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_1X16:
 		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
 		fmt = 0x6F;
 		mux = OV5640_FMT_MUX_RGB;
-- 
2.35.0

