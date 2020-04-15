Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB961A9B40
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 12:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896570AbgDOKpW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 06:45:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:21175 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405485AbgDOKUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 06:20:08 -0400
X-IronPort-AV: E=Sophos;i="5.72,386,1580742000"; 
   d="scan'208";a="44789381"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Apr 2020 19:19:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 864E7400967D;
        Wed, 15 Apr 2020 19:19:22 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/3] media: rcar-vin: Invalidate pipeline if conversion is not possible on input formats
Date:   Wed, 15 Apr 2020 11:19:06 +0100
Message-Id: <1586945948-11026-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1586945948-11026-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Up until now the VIN was capable to convert any of its supported input mbus
formats to any of it's supported output pixel formats. With the addition of
RAW formats this is no longer true.
This patch invalidates the pipeline by adding a check if given vin input
format can be converted to supported output pixel format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 1a30cd036371..48bd9bfc3948 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1109,13 +1109,17 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 	case MEDIA_BUS_FMT_UYVY10_2X10:
+		break;
 	case MEDIA_BUS_FMT_RGB888_1X24:
-		vin->mbus_code = fmt.format.code;
+		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
+			return -EPIPE;
 		break;
 	default:
 		return -EPIPE;
 	}
 
+	vin->mbus_code = fmt.format.code;
+
 	switch (fmt.format.field) {
 	case V4L2_FIELD_TOP:
 	case V4L2_FIELD_BOTTOM:
-- 
2.20.1

