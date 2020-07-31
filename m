Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BE623433F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732154AbgGaJ3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:29:16 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:38611 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732942AbgGaJ3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:29:16 -0400
X-IronPort-AV: E=Sophos;i="5.75,417,1589209200"; 
   d="scan'208";a="53330403"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jul 2020 18:29:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3E990421A8A1;
        Fri, 31 Jul 2020 18:29:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: rcar-vin: Update crop and compose settings for every s_fmt call
Date:   Fri, 31 Jul 2020 10:29:05 +0100
Message-Id: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f421e25..a9b13d9 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 	fmt_rect.width = vin->format.width;
 	fmt_rect.height = vin->format.height;
 
+	vin->crop.top = 0;
+	vin->crop.left = 0;
+	vin->crop.width = vin->format.width;
+	vin->crop.height = vin->format.height;
+	vin->compose = vin->crop;
+
 	v4l2_rect_map_inside(&vin->crop, &src_rect);
 	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
 	vin->src_rect = src_rect;
-- 
2.7.4

