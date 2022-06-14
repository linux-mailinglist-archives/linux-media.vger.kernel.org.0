Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83C2D54BA33
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352461AbiFNTM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357403AbiFNTMr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:12:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C99815708
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:12:40 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06A29825;
        Tue, 14 Jun 2022 21:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655233957;
        bh=rIl2U/uSQ4qjK1oJdx1HUIdq6XV0PrNBBMDId1R+hqI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oEbAtAeFuR6hQJPaF8PDn+1P0B8v3LHhIz1jraiTq0pDAvx0uxpm9EUWUMgFvwGaG
         qC7jw0Chyqit0UG3HvJp5Ei/V5mPlEPBr6rUyeV15QrGyTvRQhzfrDsADqsQ9eLzTX
         pHXfkHBBXiatQYYCYlkGfFZKi5QCv64AIOxBk84o=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 12/55] media: rkisp1: Reject sensors without pixel rate control at bound time
Date:   Wed, 15 Jun 2022 04:10:44 +0900
Message-Id: <20220614191127.3420492-13-paul.elder@ideasonboard.com>
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

The rkisp1 driver requires the sensor to implement the pixel rate
control. Trying to operate without it will cause an error when starting
streaming. Catch the issue earlier, at bound time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 6 ++++++
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 39ae35074062..7fc617d51f44 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -190,6 +190,12 @@ static int rkisp1_subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 
 	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
 						V4L2_CID_PIXEL_RATE);
+	if (!s_asd->pixel_rate_ctrl) {
+		dev_err(rkisp1->dev, "No pixel rate control in subdev %s\n",
+			sd->name);
+		return -EINVAL;
+	}
+
 	s_asd->sd = sd;
 	s_asd->dphy = devm_phy_get(rkisp1->dev, "dphy");
 	if (IS_ERR(s_asd->dphy)) {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 58cf6d21f1eb..81138c676ac0 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -823,11 +823,6 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
 	s64 pixel_clock;
 
-	if (!sensor->pixel_rate_ctrl) {
-		dev_warn(rkisp1->dev, "No pixel rate control in sensor subdev\n");
-		return -EPIPE;
-	}
-
 	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
 	if (!pixel_clock) {
 		dev_err(rkisp1->dev, "Invalid pixel rate value\n");
-- 
2.30.2

