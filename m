Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD399281095
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 12:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387545AbgJBK3I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 06:29:08 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:23139 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgJBK3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 06:29:08 -0400
X-IronPort-AV: E=Sophos;i="5.77,327,1596466800"; 
   d="scan'208";a="58760633"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Oct 2020 19:29:06 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B1440422F1FD;
        Fri,  2 Oct 2020 19:29:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        UlrichHechtuli+renesas@fpond.eu, linux-renesas-soc@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8 formats
Date:   Fri,  2 Oct 2020 11:26:52 +0100
Message-Id: <20201002102652.9154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pixelformat in vin priv structure holds V4L2_PIX_FMT_* and not
MEDIA_BUS_FMT_* so make sure we check against V4L2_PIX_FMT_* formats
while setting the VNIS_REG.

Fixes: 8c3e0f67df6c9 ("media: rcar-vin: Extend RAW8 support to all RGB layouts")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi Hans,

If it isn't too late for v5.10 could you please queue up this patch.

Cheers,
Prabhakar
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index e9a47b705acc..692dea300b0d 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -600,10 +600,10 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	 * format in 2 pixel unit hence configure VNIS_REG as stride / 2.
 	 */
 	switch (vin->format.pixelformat) {
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
 		stride /= 2;
 		break;
 	default:
-- 
2.17.1

