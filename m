Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72BF14A4996
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbiAaOom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:44:42 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34695 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240960AbiAaOol (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:44:41 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2FE16FF80D;
        Mon, 31 Jan 2022 14:44:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 18/21] media: ov5640: Add RGB565_1X16 format
Date:   Mon, 31 Jan 2022 15:45:28 +0100
Message-Id: <20220131144529.129096-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131144529.129096-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144529.129096-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/media/i2c/ov5640.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 9d6eb3288b07..db77cdb8a958 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -197,6 +197,7 @@ static const struct ov5640_pixfmt {
 	{ MEDIA_BUS_FMT_YUYV8_1X16, V4L2_COLORSPACE_SRGB, 16,},
 	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, 16},
 	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, 16},
+	{ MEDIA_BUS_FMT_RGB565_1X16, V4L2_COLORSPACE_SRGB, 16},
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, 8},
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, 8},
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, 8},
@@ -2746,6 +2747,7 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		mux = OV5640_FMT_MUX_YUV422;
 		break;
 	case MEDIA_BUS_FMT_RGB565_2X8_LE:
+	case MEDIA_BUS_FMT_RGB565_1X16:
 		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
 		fmt = 0x6F;
 		mux = OV5640_FMT_MUX_RGB;
-- 
2.35.0

