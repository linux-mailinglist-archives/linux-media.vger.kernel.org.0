Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BB436C5CE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237632AbhD0MIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237609AbhD0MIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:08:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7493C061756
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:07:40 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUm-0006DK-0F; Tue, 27 Apr 2021 14:07:16 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUl-0005ux-Ci; Tue, 27 Apr 2021 14:07:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 5/6] gpu: ipu-v3: add custom SGRGB_IGIG_GBGR_IGIG format support
Date:   Tue, 27 Apr 2021 14:07:00 +0200
Message-Id: <20210427120701.21809-6-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210427120701.21809-1-m.felsch@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add custom OnSemi RGB-IR pixel formats to the ipu library functions. This
format is used by the OnSemi AR0237IR camera sensor [1].

[1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/ipu-v3/ipu-cpmem.c | 2 ++
 drivers/gpu/ipu-v3/ipu-csi.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/ipu-v3/ipu-cpmem.c b/drivers/gpu/ipu-v3/ipu-cpmem.c
index a1c85d1521f5..c579aafb60ba 100644
--- a/drivers/gpu/ipu-v3/ipu-cpmem.c
+++ b/drivers/gpu/ipu-v3/ipu-cpmem.c
@@ -861,6 +861,7 @@ int ipu_cpmem_set_image(struct ipuv3_channel *ch, struct ipu_image *image)
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SGRBG8:
 	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG8:
 	case V4L2_PIX_FMT_GREY:
 		offset = image->rect.left + image->rect.top * pix->bytesperline;
 		break;
@@ -868,6 +869,7 @@ int ipu_cpmem_set_image(struct ipuv3_channel *ch, struct ipu_image *image)
 	case V4L2_PIX_FMT_SGBRG16:
 	case V4L2_PIX_FMT_SGRBG16:
 	case V4L2_PIX_FMT_SRGGB16:
+	case V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG16:
 	case V4L2_PIX_FMT_Y16:
 		offset = image->rect.left * 2 +
 			 image->rect.top * pix->bytesperline;
diff --git a/drivers/gpu/ipu-v3/ipu-csi.c b/drivers/gpu/ipu-v3/ipu-csi.c
index 8ae301eef643..cf7763f50fdf 100644
--- a/drivers/gpu/ipu-v3/ipu-csi.c
+++ b/drivers/gpu/ipu-v3/ipu-csi.c
@@ -268,6 +268,7 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_config *cfg, u32 mbus_code,
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG8_1X8:
 	case MEDIA_BUS_FMT_Y8_1X8:
 		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
 		cfg->mipi_dt = MIPI_DT_RAW8;
@@ -298,6 +299,7 @@ static int mbus_code_to_bus_cfg(struct ipu_csi_bus_config *cfg, u32 mbus_code,
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG12_1X12:
 	case MEDIA_BUS_FMT_Y12_1X12:
 		cfg->data_fmt = CSI_SENS_CONF_DATA_FMT_BAYER;
 		cfg->mipi_dt = MIPI_DT_RAW12;
-- 
2.29.2

