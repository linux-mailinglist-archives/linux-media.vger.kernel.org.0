Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC3756267B
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiF3XIV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiF3XIT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:08:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77C5101C9
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 16:08:15 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 322071460;
        Fri,  1 Jul 2022 01:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630466;
        bh=4W5h8ZyhDD2s+cMAmd4iAng4SMJHn0OJPbEVgJX1vhQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxrbhFdyL8OjS7Nzpg/Qqn7zTZ7XXkaoQOVyiD7yU8fKSr1oeFA3nDfMfvf9TRbGp
         TA9o4+VOWe3LpnyFyMLQQxTjOqayxHD2OcbSzB0kgGPp9r8f7YZc+Y7RkFRkuC3NoO
         mly8XZUtMOXk+7QANSQ73ky6cSmhikr6MDQ0e6WQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v2 14/55] media: rkisp1: Reject sensors without pixel rate control at bound time
Date:   Fri,  1 Jul 2022 02:06:32 +0300
Message-Id: <20220630230713.10580-15-laurent.pinchart@ideasonboard.com>
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

The rkisp1 driver requires the sensor to implement the pixel rate
control. Trying to operate without it will cause an error when starting
streaming. Catch the issue earlier, at bound time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
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
index 689885ac2e84..56781b53dd83 100644
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
Regards,

Laurent Pinchart

