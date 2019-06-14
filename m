Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D035F4610A
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbfFNOj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:39:28 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58389 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728625AbfFNOj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:39:28 -0400
Received: from localhost.localdomain (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr [90.88.23.150])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 09488240010;
        Fri, 14 Jun 2019 14:39:22 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v6 2/5] media: v4l2-ctrls: Split off MPEG-2 controls initialization
Date:   Fri, 14 Jun 2019 16:38:34 +0200
Message-Id: <20190614143837.15605-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
References: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just like codec-specific controls validation, controls initialization
for codecs is quite specific so move it to a specific helper for
MPEG-2 for increased clarity.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 33 ++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 824126267c44..84916b6889e2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1494,11 +1494,29 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
+static void std_init_mpeg2(const struct v4l2_ctrl *ctrl, u32 idx,
+			   union v4l2_ctrl_ptr ptr)
+{
+	struct v4l2_ctrl_mpeg2_slice_params *slice_params =
+		ptr.p_mpeg2_slice_params;
+
+	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		/* 4:2:0 */
+		slice_params->sequence.chroma_format = 1;
+		/* 8 bits */
+		slice_params->picture.intra_dc_precision = 0;
+		/* interlaced top field */
+		slice_params->picture.picture_structure = 1;
+		slice_params->picture.picture_coding_type =
+			V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+		break;
+	}
+}
+
 static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 		     union v4l2_ctrl_ptr ptr)
 {
-	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
-
 	/*
 	 * The cast is needed to get rid of a gcc warning complaining that
 	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
@@ -1530,15 +1548,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 		ptr.p_u32[idx] = ctrl->default_value;
 		break;
 	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = ptr.p;
-		/* 4:2:0 */
-		p_mpeg2_slice_params->sequence.chroma_format = 1;
-		/* 8 bits */
-		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
-		/* interlaced top field */
-		p_mpeg2_slice_params->picture.picture_structure = 1;
-		p_mpeg2_slice_params->picture.picture_coding_type =
-					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
+		std_init_mpeg2(ctrl, idx, ptr);
 		break;
 	default:
 		idx *= ctrl->elem_size;
-- 
2.21.0

