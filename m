Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA2E3A65D0
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhFNLmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbhFNLlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:06 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC5755EB5;
        Mon, 14 Jun 2021 13:24:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669854;
        bh=ARGlDF+Tfgvn1zKvq+a4mF+TRlW2nx8Aimq8KbTr89w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HsTPsOm5qIQn9tQU8WauYDfWCB5TRSv5gcTHCx3Zh3dZZKdEIQjfe/0/bW88QBlZr
         FU0E/mLgUr9OkdMZAoX8ekJDwCG9RVREJ47rs2B+cgD9lbTYbB1/StUl6404W/Y5NK
         3JBHKuqZF6PQEKXRIT1bgOAoOAQoOgPa8S2f1DIM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 27/35] media: ti-vpe: cal: remove cal_camerarx->fmtinfo
Date:   Mon, 14 Jun 2021 14:23:37 +0300
Message-Id: <20210614112345.2032435-28-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct cal_camerarx has fmtinfo field which is used to point to the
current active input format. The only place where the field is used is
cal_camerarx_get_ext_link_freq().

With multiple streams the whole concept of single input format is not
valid anymore, so lets remove the field by looking up the format in
cal_camerarx_get_ext_link_freq(), making it easier to handle the
multistream-case in the following patches.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 12 ++++++++----
 drivers/media/platform/ti-vpe/cal.h          |  1 -
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 7940e47964af..82392499e663 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -49,9 +49,16 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	u32 bpp = phy->fmtinfo->bpp;
+	const struct cal_format_info *fmtinfo;
+	u32 bpp;
 	s64 freq;
 
+	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	bpp = fmtinfo->bpp;
+
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
 		phy_err(phy, "failed to get link freq for subdev '%s'\n",
@@ -728,9 +735,6 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 					  format->which);
 	*fmt = format->format;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		phy->fmtinfo = fmtinfo;
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index ee42c9c48fa1..7d9a2d697fc4 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -163,7 +163,6 @@ struct cal_camerarx {
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[2];
 	struct v4l2_mbus_framefmt	formats[2];
-	const struct cal_format_info	*fmtinfo;
 };
 
 struct cal_dev {
-- 
2.25.1

