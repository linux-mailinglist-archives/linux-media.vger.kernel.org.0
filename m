Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA93F1F6B23
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 17:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgFKPfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 11:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFKPfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 11:35:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F35C08C5C2;
        Thu, 11 Jun 2020 08:35:37 -0700 (PDT)
Received: from localhost.localdomain (p200300cb871f5b00895b3f12fcab1eee.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:895b:3f12:fcab:1eee])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD6262A508D;
        Thu, 11 Jun 2020 16:35:35 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, stable@vger.kernel.org
Subject: [PATCH v3 1/4] media: staging: rkisp1: remove macro RKISP1_DIR_SINK_SRC
Date:   Thu, 11 Jun 2020 17:35:24 +0200
Message-Id: <20200611153527.24506-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611153527.24506-1-dafna.hirschfeld@collabora.com>
References: <20200611153527.24506-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The macro RKISP1_DIR_SINK_SRC is a mask of two flags.
The macro hides the fact that it's a mask and the code
is actually more clear if we replace it the with bitwise-or explicitly.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h |  1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 24 ++++++++++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 39d8e46d8d8a..0ec8718037a4 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -24,7 +24,6 @@
 
 #define RKISP1_DIR_SRC BIT(0)
 #define RKISP1_DIR_SINK BIT(1)
-#define RKISP1_DIR_SINK_SRC (RKISP1_DIR_SINK | RKISP1_DIR_SRC)
 
 #define RKISP1_ISP_MAX_WIDTH		4032
 #define RKISP1_ISP_MAX_HEIGHT		3024
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index e66e87d6ea8b..157ac58c2efc 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -65,84 +65,84 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 10,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 10,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 10,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 10,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 12,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 12,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 12,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 12,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 8,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 8,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 8,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 8,
-		.direction	= RKISP1_DIR_SINK_SRC,
+		.direction	= RKISP1_DIR_SINK | RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-- 
2.17.1

