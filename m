Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9760F4AEAD
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 01:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFRXWs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 19:22:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36622 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfFRXWs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 19:22:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B7DF5263A29
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3] media: v4l2-ctrl: Move compound control initialization
Date:   Tue, 18 Jun 2019 20:17:31 -0300
Message-Id: <20190618231731.27646-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <d102e592-2f00-e28e-2956-6df6a47a125d@xs4all.nl>
References: <d102e592-2f00-e28e-2956-6df6a47a125d@xs4all.nl>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes from v2:
* Fix missing index usage

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
index 915187a8ca5c..b04e66d1500a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1502,10 +1502,13 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
-		     union v4l2_ctrl_ptr ptr)
+static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
+			      union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	memset(p, 0, ctrl->elem_size);
 
 	/*
 	 * The cast is needed to get rid of a gcc warning complaining that
@@ -1513,6 +1516,22 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	 * v4l2_ctrl_type enum.
 	 */
 	switch ((u32)ctrl->type) {
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		p_mpeg2_slice_params = p;
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
@@ -1541,20 +1560,8 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
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

