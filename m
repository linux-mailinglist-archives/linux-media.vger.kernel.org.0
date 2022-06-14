Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5439754BA3E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbiFNTNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357483AbiFNTN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDD61260D
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:27 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2F08825;
        Tue, 14 Jun 2022 21:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234005;
        bh=iIHXQZ2sOYbmnNJklnn0bmABq2AvSYS02MD7fTAEsbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gMGQsHMOJKveopyLfGGAGqEdJxVmwa5Q10g7yBuzLQz+tV/m3iDZX5xsV8VZNbPm2
         upB/XuNlAscSDciGZq2/EiGYCHqq2g9+su2kynPWXeC1L5wv7SVkU/uY7WovT/beXt
         8EiHGkLrR43BQtbUzUtNRJFrGhZsLJSofaW1JC28=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 24/55] media: rkisp1: csi: Constify argument to rkisp1_csi_start()
Date:   Wed, 15 Jun 2022 04:10:56 +0900
Message-Id: <20220614191127.3420492-25-paul.elder@ideasonboard.com>
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

The sensor argument to rkisp1_csi_start() isn't meant to be modified by
the function. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 925274b9a3c4..425a3b014089 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -20,7 +20,7 @@
 #include "rkisp1-csi.h"
 
 static int rkisp1_csi_config(struct rkisp1_csi *csi,
-			     struct rkisp1_sensor_async *sensor)
+			     const struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
@@ -95,7 +95,7 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
 }
 
 int rkisp1_csi_start(struct rkisp1_csi *csi,
-		     struct rkisp1_sensor_async *sensor)
+		     const struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	union phy_configure_opts opts;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
index 7d3f01cfb49f..97ce7e7959ab 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h
@@ -18,7 +18,7 @@ int rkisp1_csi_init(struct rkisp1_device *rkisp1);
 void rkisp1_csi_cleanup(struct rkisp1_device *rkisp1);
 
 int rkisp1_csi_start(struct rkisp1_csi *csi,
-		     struct rkisp1_sensor_async *sensor);
+		     const struct rkisp1_sensor_async *sensor);
 void rkisp1_csi_stop(struct rkisp1_csi *csi);
 
 #endif /* _RKISP1_CSI_H */
-- 
2.30.2

