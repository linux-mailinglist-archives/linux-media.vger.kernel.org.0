Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8158A46117
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 16:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfFNOj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 10:39:27 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:39765 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728623AbfFNOj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 10:39:27 -0400
Received: from localhost.localdomain (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr [90.88.23.150])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id A9E72240014;
        Fri, 14 Jun 2019 14:39:19 +0000 (UTC)
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
Subject: [PATCH v6 1/5] media: v4l2-ctrls: Split off MPEG-2 controls validation
Date:   Fri, 14 Jun 2019 16:38:33 +0200
Message-Id: <20190614143837.15605-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
References: <20190614143837.15605-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since codec controls validation comes with its own logic, split off
std_validate for MPEG-2 for better clarity.

Use a shorter name for the validated structure and use the
type-specific pointer to grab it while at it.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 95 +++++++++++++++-------------
 1 file changed, 52 insertions(+), 43 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f2b9bdedbf8c..824126267c44 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1617,11 +1617,61 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	0;							\
 })
 
+static int std_validate_mpeg2(const struct v4l2_ctrl *ctrl, u32 idx,
+			      union v4l2_ctrl_ptr ptr)
+{
+	struct v4l2_ctrl_mpeg2_slice_params *slice_params =
+		ptr.p_mpeg2_slice_params;
+
+	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		switch (slice_params->sequence.chroma_format) {
+		case 1: /* 4:2:0 */
+		case 2: /* 4:2:2 */
+		case 3: /* 4:4:4 */
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		switch (slice_params->picture.intra_dc_precision) {
+		case 0: /* 8 bits */
+		case 1: /* 9 bits */
+		case 2: /* 10 bits */
+		case 3: /* 11 bits */
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		switch (slice_params->picture.picture_structure) {
+		case 1: /* interlaced top field */
+		case 2: /* interlaced bottom field */
+		case 3: /* progressive */
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		switch (slice_params->picture.picture_coding_type) {
+		case V4L2_MPEG2_PICTURE_CODING_TYPE_I:
+		case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+		case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		return 0;
+	default:
+		return 0;
+	}
+}
+
 /* Validate a new control */
 static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 			union v4l2_ctrl_ptr ptr)
 {
-	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	size_t len;
 	u64 offset;
 	s64 val;
@@ -1685,49 +1735,8 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 		return 0;
 
 	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = ptr.p;
-
-		switch (p_mpeg2_slice_params->sequence.chroma_format) {
-		case 1: /* 4:2:0 */
-		case 2: /* 4:2:2 */
-		case 3: /* 4:4:4 */
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		switch (p_mpeg2_slice_params->picture.intra_dc_precision) {
-		case 0: /* 8 bits */
-		case 1: /* 9 bits */
-		case 2: /* 10 bits */
-		case 3: /* 11 bits */
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		switch (p_mpeg2_slice_params->picture.picture_structure) {
-		case 1: /* interlaced top field */
-		case 2: /* interlaced bottom field */
-		case 3: /* progressive */
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		switch (p_mpeg2_slice_params->picture.picture_coding_type) {
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_I:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		return 0;
-
 	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
-		return 0;
+		return std_validate_mpeg2(ctrl, idx, ptr);
 
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		return 0;
-- 
2.21.0

