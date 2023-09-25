Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDA07ACD40
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 02:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjIYAmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 20:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjIYAma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 20:42:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273DB19A
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 17:42:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1CCF3354;
        Mon, 25 Sep 2023 02:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695602377;
        bh=HXadBDWRlBMZmOR752TvSjpgL7wm3+fD905ljEkokkY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CmvyY6JX/PuObspW+EeB0KIXYladvaJonO6t0/Vgjh+fZaGcw2kDvqc4zg3KefDDu
         l51/VfEmaPMZEqHQCPTAHOCsqYgNQA80qKnceqQ7YQSTAcmdfeiIpjqtiBrBJ0Vp/Z
         6xMgrF5wzSnyvWeDeGOPgJndWZ1m7hooHGflQgMY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 10/14] media: rkisp1: resizer: Constify argument and local variables
Date:   Mon, 25 Sep 2023 03:41:08 +0300
Message-ID: <20230925004112.22797-11-laurent.pinchart@ideasonboard.com>
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

Pointers to v4l2_mbus_framefmt and v4l2_rect instances don't need to be
modified when configuring the resizer. Make them const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-resizer.c  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index bca111711cee..26f9c16ccc3e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -206,10 +206,10 @@ static void rkisp1_rsz_disable(struct rkisp1_resizer *rsz,
 }
 
 static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
-				   struct v4l2_rect *sink_y,
-				   struct v4l2_rect *sink_c,
-				   struct v4l2_rect *src_y,
-				   struct v4l2_rect *src_c,
+				   const struct v4l2_rect *sink_y,
+				   const struct v4l2_rect *sink_c,
+				   const struct v4l2_rect *src_y,
+				   const struct v4l2_rect *src_c,
 				   enum rkisp1_shadow_regs_when when)
 {
 	u32 ratio, rsz_ctrl = 0;
@@ -270,9 +270,9 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 			      enum rkisp1_shadow_regs_when when)
 {
 	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
+	const struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	const struct v4l2_rect *sink_crop;
 	struct v4l2_rect sink_y, sink_c, src_y, src_c;
-	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
-	struct v4l2_rect *sink_crop;
 
 	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
 					      RKISP1_RSZ_PAD_SINK);
-- 
Regards,

Laurent Pinchart

