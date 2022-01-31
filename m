Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203DD4A4997
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbiAaOot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:44:49 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39895 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241181AbiAaOoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:44:44 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 8A49DFF813;
        Mon, 31 Jan 2022 14:44:40 +0000 (UTC)
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
Subject: [PATCH 19/21] media: ov5640: Add RGB888/BGR888 formats
Date:   Mon, 31 Jan 2022 15:45:29 +0100
Message-Id: <20220131144529.129096-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131144529.129096-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144529.129096-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for RGB888/BGR888 image formats.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index db77cdb8a958..5891eaab05ee 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -198,6 +198,8 @@ static const struct ov5640_pixfmt {
 	{ MEDIA_BUS_FMT_RGB565_2X8_LE, V4L2_COLORSPACE_SRGB, 16},
 	{ MEDIA_BUS_FMT_RGB565_2X8_BE, V4L2_COLORSPACE_SRGB, 16},
 	{ MEDIA_BUS_FMT_RGB565_1X16, V4L2_COLORSPACE_SRGB, 16},
+	{ MEDIA_BUS_FMT_RGB888_1X24, V4L2_COLORSPACE_SRGB, 24},
+	{ MEDIA_BUS_FMT_BGR888_1X24, V4L2_COLORSPACE_SRGB, 24},
 	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_COLORSPACE_SRGB, 8},
 	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_COLORSPACE_SRGB, 8},
 	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_COLORSPACE_SRGB, 8},
@@ -2757,6 +2759,16 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 		fmt = 0x61;
 		mux = OV5640_FMT_MUX_RGB;
 		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		/* RGB888: BGR */
+		fmt = 0x22;
+		mux = OV5640_FMT_MUX_RGB;
+		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		/* BGR888: RGB */
+		fmt = 0x23;
+		mux = OV5640_FMT_MUX_RGB;
+		break;
 	case MEDIA_BUS_FMT_JPEG_1X8:
 		/* YUV422, YUYV */
 		fmt = 0x30;
-- 
2.35.0

