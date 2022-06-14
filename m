Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A80554BA3C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243622AbiFNTNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbiFNTNT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4088111C0F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:19 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A311B825;
        Tue, 14 Jun 2022 21:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233998;
        bh=ej2B32tUERRKgixONq9ekw2odpbfaviOoKuWtBeOUfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hHnEHCFEDVGpBuPuxhDZwIjWIkCJzJyviV/rmkj8Jm4mgRDpwuyjunJxPJF5SvdMp
         LxVq3ac5JWXR5UMw1ioWxip28itSeMXVP3fKBWblumlq7A+49qv5c9OzFExpOOtry7
         YpHYUaevxOIb0x4ReeoxvTWkg/atVgjfs3hiu3dI=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 22/55] media: rkisp1: csi: Move start delay to rkisp1_csi_start()
Date:   Wed, 15 Jun 2022 04:10:54 +0900
Message-Id: <20220614191127.3420492-23-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The delay in rkisp1_isp_start() is related to to the CSI-2 receiver and
the camera sensor. Move it where it belongs, to rkisp1_csi_start().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 7 +++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index c1bb8c05543d..fcaffffd371b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -9,6 +9,7 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
@@ -120,6 +121,12 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
 
 	rkisp1_csi_enable(csi);
 
+	/*
+	 * CIF spec says to wait for sufficient time after enabling
+	 * the MIPI interface and before starting the sensor output.
+	 */
+	usleep_range(1000, 1200);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index ecb8ca0ad670..3ea0deb6b792 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -365,12 +365,6 @@ static void rkisp1_isp_start(struct rkisp1_device *rkisp1)
 	       RKISP1_CIF_ISP_CTRL_ISP_ENABLE |
 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
-
-	/*
-	 * CIF spec says to wait for sufficient time after enabling
-	 * the MIPI interface and before starting the sensor output.
-	 */
-	usleep_range(1000, 1200);
 }
 
 /* ----------------------------------------------------------------------------
-- 
2.30.2

