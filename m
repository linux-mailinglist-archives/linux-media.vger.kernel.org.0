Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753AF5626F1
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbiF3XJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbiF3XJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:09:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67DE37A9C
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:09:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D0BD29B2;
        Fri,  1 Jul 2022 01:07:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630473;
        bh=AKct/CiSG+KhcTaGJq2BwEoCCmWIGtiFQve1sO7uAbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n99LlyOQLcLBxtirrwjGmcuJEuvu4eI82CUsuY/IkUVYJLbLNI2XhQCsL+VLigJHU
         y8oPYqjiqtw7tNnncdrT2CdSfsYdRNzJlbZZu11aWEE4ZNBoU7UmpUuptiA7aLfgBj
         BBgDKN74qTmdtbDtFyOHYxU7b2Rxbi2yMj0b6LsU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 25/55] media: rkisp1: csi: Constify argument to rkisp1_csi_start()
Date:   Fri,  1 Jul 2022 02:06:43 +0300
Message-Id: <20220630230713.10580-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

The sensor argument to rkisp1_csi_start() isn't meant to be modified by
the function. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 4 ++--
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 05b17b946e90..81849c8e9c73 100644
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
@@ -96,7 +96,7 @@ static void rkisp1_csi_disable(struct rkisp1_csi *csi)
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
Regards,

Laurent Pinchart

