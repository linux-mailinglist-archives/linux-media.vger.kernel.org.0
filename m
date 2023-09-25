Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358707ACD41
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjIYAmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjIYAmj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C895310F6
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:42:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B3993358;
        Mon, 25 Sep 2023 02:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602378;
        bh=GMG0fHmv3KmpKFs8+vm/LTPQOMfBr81TMHT49rF7ZQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QFBf4nhn0MPUMMPvrJMjXxmFfgnf3/dVPlFHw0AiyTtK5Dh5uMaYYg1kkUp/hYJp9
         t34GmOhLpgs+ShZFNNBqU6JaWtL5OyOvdMD9AlYq7YdNIkq+yv73CG/voCEVojjPMV
         Y3VT9zM0yhEVxI61yeovNu/GTEWc+OvoiNttHltY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 11/14] media: rkisp1: resizer: Use v4l2_area instead of v4l2_rect to store size
Date:   Mon, 25 Sep 2023 03:41:09 +0300
Message-ID: <20230925004112.22797-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
References: <20230925004112.22797-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rkisp1_rsz_config() and rkisp1_rsz_config_regs() functions use a
v4l2_rect to pass frame sizes, leaving the top and left members unused
and uninitialized. Use v4l2_area instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 26f9c16ccc3e..8700be7d19aa 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -208,8 +208,8 @@ static void rkisp1_rsz_disable(struct rkisp1_resizer *rsz,
 static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 				   const struct v4l2_rect *sink_y,
 				   const struct v4l2_rect *sink_c,
-				   const struct v4l2_rect *src_y,
-				   const struct v4l2_rect *src_c,
+				   const struct v4l2_area *src_y,
+				   const struct v4l2_area *src_c,
 				   enum rkisp1_shadow_regs_when when)
 {
 	u32 ratio, rsz_ctrl = 0;
@@ -272,7 +272,8 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
 	const struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 	const struct v4l2_rect *sink_crop;
-	struct v4l2_rect sink_y, sink_c, src_y, src_c;
+	struct v4l2_rect sink_y, sink_c;
+	struct v4l2_area src_y, src_c;
 
 	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
 					      RKISP1_RSZ_PAD_SINK);
-- 
Regards,

Laurent Pinchart

