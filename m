Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144CD35C55D
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240619AbhDLLgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240608AbhDLLgA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:36:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBCFC061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:42 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0C64DBC;
        Mon, 12 Apr 2021 13:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227340;
        bh=79GOIvgQnSwZaV2JDp+vcUvrF+c+fdfcC3CPWAAm+SI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kp8+qcDjCFxrEr/4+SwceUzTdswz9/Np8WLDhgTr/RR/+CQykhG/Ff+W0hW83CT24
         7IGP1qZjDZFgz1DJSm9sVtLMpDK79aOejOVBVbVVxFfaHUpiuR63iQBke1ZiIA8D0U
         be+buS9DzlDRHlmSFDTwBlSB0OLRkFB3sTaQai5Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 27/28] media: ti-vpe: cal: remove cal_camerarx->fmtinfo
Date:   Mon, 12 Apr 2021 14:34:56 +0300
Message-Id: <20210412113457.328012-28-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 12 ++++++++----
 drivers/media/platform/ti-vpe/cal.h          |  1 -
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 25f4692d210e..efe6513d69e8 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -49,8 +49,15 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
-	u32 bpp = phy->fmtinfo->bpp;
+	u32 bpp;
 	s64 freq;
+	const struct cal_format_info *fmtinfo;
+
+	fmtinfo = cal_format_by_code(phy->formats[CAL_CAMERARX_PAD_SINK].code);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	bpp = fmtinfo->bpp;
 
 	freq = v4l2_get_link_freq(phy->source->ctrl_handler, bpp, 2 * num_lanes);
 	if (freq < 0) {
@@ -723,9 +730,6 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 					  format->which);
 	*fmt = format->format;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		phy->fmtinfo = fmtinfo;
-
 	return 0;
 }
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index c941d2aec79f..7f35ad5ceac2 100644
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

