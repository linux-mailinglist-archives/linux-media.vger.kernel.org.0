Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C6D2680BA
	for <lists+linux-media@lfdr.de>; Sun, 13 Sep 2020 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgIMSVu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Sep 2020 14:21:50 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:11279 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725936AbgIMSVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Sep 2020 14:21:48 -0400
X-IronPort-AV: E=Sophos;i="5.76,422,1592838000"; 
   d="scan'208";a="56924822"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Sep 2020 03:21:46 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2247940B696E;
        Mon, 14 Sep 2020 03:21:43 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v2] media: rcar-vin: Update crop and compose settings for every s_fmt call
Date:   Sun, 13 Sep 2020 19:21:40 +0100
Message-Id: <20200913182140.32466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The crop and compose settings for VIN in non mc mode werent updated
in s_fmt call this resulted in captured images being clipped.

With the below sequence on the third capture where size is set to
640x480 resulted in clipped image of size 320x240.

high(640x480) -> low (320x240) -> high (640x480)

This patch makes sure the VIN crop and compose settings are updated.

Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes for v2:
* Dropped redundant code mapping crop and compose rects

v1 - https://lkml.org/lkml/2020/7/31/364
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0e066bba747e..1bd59a8453b4 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -305,7 +305,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_rect fmt_rect, src_rect;
+	struct v4l2_rect src_rect;
 	int ret;
 
 	if (vb2_is_busy(&vin->queue))
@@ -317,14 +317,11 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 		return ret;
 
 	vin->format = f->fmt.pix;
-
-	fmt_rect.top = 0;
-	fmt_rect.left = 0;
-	fmt_rect.width = vin->format.width;
-	fmt_rect.height = vin->format.height;
-
-	v4l2_rect_map_inside(&vin->crop, &src_rect);
-	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
+	vin->crop.top = 0;
+	vin->crop.left = 0;
+	vin->crop.width = vin->format.width;
+	vin->crop.height = vin->format.height;
+	vin->compose = vin->crop;
 	vin->src_rect = src_rect;
 
 	return 0;
-- 
2.17.1

