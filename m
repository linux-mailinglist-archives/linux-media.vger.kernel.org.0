Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D284E54BA3D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245301AbiFNTNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357407AbiFNTNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:13:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5533228705
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:13:23 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2DB79E5;
        Tue, 14 Jun 2022 21:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234002;
        bh=kU4BvR4gtyLqWIj3HHrrQsSfcQk7hfRJpaJgG5KXHIQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JjLOFLnu+q3ZwerYd7hdC5eqHgRPJGBwOY8rfiubCo2Se3Ctmx1vhDUq4RQdKB2qb
         ZMpesyGQWTv7ic19+IT/myL9wb64LdKH/j4bDk6hkdTFO0OthdKsaxhkQwB4eEem5S
         VDBO1Th7sUG0p1tbsctWXnaqaGy/7irWMOrducmU=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 23/55] media: rkisp1: csi: Pass sensor pointer to rkisp1_csi_config()
Date:   Wed, 15 Jun 2022 04:10:55 +0900
Message-Id: <20220614191127.3420492-24-paul.elder@ideasonboard.com>
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

To prepare for the removal of the active_sensor field from the
rkisp1_device structure, pass the sensor pointer to the
rkisp1_csi_config() function instead of accessing it through
active_sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index fcaffffd371b..925274b9a3c4 100644
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
@@ -102,7 +103,7 @@ int rkisp1_csi_start(struct rkisp1_csi *csi,
 	s64 pixel_clock;
 	int ret;
 
-	ret = rkisp1_csi_config(csi);
+	ret = rkisp1_csi_config(csi, sensor);
 	if (ret)
 		return ret;
 
-- 
2.30.2

