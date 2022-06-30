Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8835626CA
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbiF3XJZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbiF3XJY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:09:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB62F37A9C
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:09:07 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9F642901;
        Fri,  1 Jul 2022 01:07:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630473;
        bh=9wIlRgMeYpLlyMUMEPfXzSsM3EZNx5mAPL7gMlnwP9w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QKeu78e781N3wV+ZgUfUQL9Pq6siwohlW+Z2nu0ZTvDGQ5bs/ymM1EavbqieCq8MO
         F6wzrFNszLaGW159L26SywofUUuL2xv68u1VKY2D5wqEDw49O5k5azt7sgNzS9ckr7
         1S39SkGVJv4H/EA/Afau7SVOEBcTm1kxiPhan/7Q=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 24/55] media: rkisp1: csi: Pass sensor pointer to rkisp1_csi_config()
Date:   Fri,  1 Jul 2022 02:06:42 +0300
Message-Id: <20220630230713.10580-25-laurent.pinchart@ideasonboard.com>
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

To prepare for the removal of the active_sensor field from the
rkisp1_device structure, pass the sensor pointer to the
rkisp1_csi_config() function instead of accessing it through
active_sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 749ad473b877..05b17b946e90 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -19,11 +19,12 @@
 #include "rkisp1-common.h"
 #include "rkisp1-csi.h"
 
-static int rkisp1_csi_config(struct rkisp1_csi *csi)
+static int rkisp1_csi_config(struct rkisp1_csi *csi,
+			     struct rkisp1_sensor_async *sensor)
 {
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	const struct rkisp1_mbus_info *sink_fmt = rkisp1->isp.sink_fmt;
-	unsigned int lanes = rkisp1->active_sensor->lanes;
+	unsigned int lanes = sensor->lanes;
 	u32 mipi_ctrl;
 
 	if (lanes < 1 || lanes > 4)
@@ -103,7 +104,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
 	s64 pixel_clock;
 	int ret;
 
-	ret = rkisp1_csi_config(csi);
+	ret = rkisp1_csi_config(csi, sensor);
 	if (ret)
 		return ret;
 
-- 
Regards,

Laurent Pinchart

