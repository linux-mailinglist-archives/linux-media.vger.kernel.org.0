Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFAC1AC06A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634484AbgDPL4R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:56:17 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37353 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634471AbgDPL4N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:56:13 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A53EA60015;
        Thu, 16 Apr 2020 11:55:15 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 4/4] media: rockchip: rga: Only set output CSC mode for RGB input
Date:   Thu, 16 Apr 2020 13:50:47 +0200
Message-Id: <20200416115047.233720-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
References: <20200416115047.233720-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the output CSC mode is required for a YUV output, but must not
be set when the input is also YUV. Doing this (as tested with a YUV420P
to YUV420P conversion) results in wrong colors.

Adapt the logic to only set the CSC mode when the output is YUV and the
input is RGB.

Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 4be6dcf292ff..cbffcf986ccf 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -216,13 +216,17 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	}
 
 	if (ctx->out.fmt->hw_format >= RGA_COLOR_FMT_YUV422SP) {
-		switch (ctx->out.colorspace) {
-		case V4L2_COLORSPACE_REC709:
-			dst_info.data.csc_mode = RGA_SRC_CSC_MODE_BT709_R0;
-			break;
-		default:
-			dst_info.data.csc_mode = RGA_DST_CSC_MODE_BT601_R0;
-			break;
+		if (ctx->in.fmt->hw_format < RGA_COLOR_FMT_YUV422SP) {
+			switch (ctx->out.colorspace) {
+			case V4L2_COLORSPACE_REC709:
+				dst_info.data.csc_mode =
+					RGA_SRC_CSC_MODE_BT709_R0;
+				break;
+			default:
+				dst_info.data.csc_mode =
+					RGA_DST_CSC_MODE_BT601_R0;
+				break;
+			}
 		}
 	}
 
-- 
2.26.0

