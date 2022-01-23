Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDF54972D3
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238437AbiAWQJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:09:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42248 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238441AbiAWQJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:09:22 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12F48D89;
        Sun, 23 Jan 2022 17:09:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642954159;
        bh=G0WXKOmQnbxYH+3hvwFIRiDUDkWU5itgSjmHvhEC+60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uAAbjcWcY6c0VpdLBBuVsCjECQK4qNcKGYxBml2rbVSdR92sr0jQddqskh3rMcniJ
         4345t9Qpt/IgIKcOuGDbiFzV5TSzjRfpUN0v4/e7yb54HTnDB07k6Wn1P21M45L4TM
         spJjqKIYgfPD3YmGOYoP6G1znphnfcKz8lFm6+i8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Maxime Ripard <mripard@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 2/6] media: cadence: cdns-csi2tx: Use mipi-csi2.h
Date:   Sun, 23 Jan 2022 18:08:53 +0200
Message-Id: <20220123160857.24161-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220123160857.24161-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the hardcoded MIPI CSI-2 data types with macros from
mipi-csi2.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 8f8c36056354..58e405b69f67 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -121,12 +122,12 @@ static const struct csi2tx_fmt csi2tx_formats[] = {
 	{
 		.mbus	= MEDIA_BUS_FMT_UYVY8_1X16,
 		.bpp	= 2,
-		.dt	= 0x1e,
+		.dt	= MIPI_CSI2_DT_YUV422_8B,
 	},
 	{
 		.mbus	= MEDIA_BUS_FMT_RGB888_1X24,
 		.bpp	= 3,
-		.dt	= 0x24,
+		.dt	= MIPI_CSI2_DT_RGB888,
 	},
 };
 
-- 
Regards,

Laurent Pinchart

