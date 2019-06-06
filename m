Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE44537940
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 18:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbfFFQNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 12:13:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59234 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbfFFQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 12:13:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2F4C32854F5
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 2/2] media: v4l2-ctrl: Move compound control initialization
Date:   Thu,  6 Jun 2019 13:12:54 -0300
Message-Id: <20190606161254.17311-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606161254.17311-1-ezequiel@collabora.com>
References: <20190606161254.17311-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework std_init adding an explicit initialization for
compound controls.

While here, make sure the control is initialized to zero,
before providing default values for all its fields.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v2:
* Align parameters to parenthesis
* Drop unneeded zero initialization

Changes from v1:
* Drop the s/break/return replacements
* Drop unneeded default cases
* Fix memset to take account of the index
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 37 +++++++++++++++++-----------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 92a5521f6813..18c8d0c102d2 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1506,17 +1506,36 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
-		     union v4l2_ctrl_ptr ptr)
+static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+			      union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 
+	idx *= ctrl->elem_size;
+	memset(ptr.p + idx, 0, ctrl->elem_size);
+
 	/*
 	 * The cast is needed to get rid of a gcc warning complaining that
 	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
 	 * v4l2_ctrl_type enum.
 	 */
 	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		p_mpeg2_slice_params = ptr.p;
+		/* 4:2:0 */
+		p_mpeg2_slice_params->sequence.chroma_format = 1;
+		/* interlaced top field */
+		p_mpeg2_slice_params->picture.picture_structure = 1;
+		p_mpeg2_slice_params->picture.picture_coding_type =
+					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+		break;
+	}
+}
+
+static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
+		     union v4l2_ctrl_ptr ptr)
+{
+	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
 		idx *= ctrl->elem_size;
 		memset(ptr.p_char + idx, ' ', ctrl->minimum);
@@ -1545,20 +1564,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_U32:
 		ptr.p_u32[idx] = ctrl->default_value;
 		break;
-	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = ptr.p;
-		/* 4:2:0 */
-		p_mpeg2_slice_params->sequence.chroma_format = 1;
-		/* 8 bits */
-		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
-		/* interlaced top field */
-		p_mpeg2_slice_params->picture.picture_structure = 1;
-		p_mpeg2_slice_params->picture.picture_coding_type =
-					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
-		break;
 	default:
-		idx *= ctrl->elem_size;
-		memset(ptr.p + idx, 0, ctrl->elem_size);
+		std_init_compound(ctrl, idx, ptr);
 		break;
 	}
 }
-- 
2.20.1

