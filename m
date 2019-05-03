Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A121212C92
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 13:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfECLm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 07:42:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46114 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfECLm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 07:42:26 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AE33D2840C0;
        Fri,  3 May 2019 12:42:24 +0100 (BST)
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] media: v4l2: Initialize mpeg slice controls
Date:   Fri,  3 May 2019 13:42:21 +0200
Message-Id: <20190503114221.28469-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make sure the default value at least passes the std_validate() tests.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b1ae2e555c68..19d40cc6e565 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1461,7 +1461,14 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 		     union v4l2_ctrl_ptr ptr)
 {
-	switch (ctrl->type) {
+	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+
+	/*
+	 * The cast is needed to get rid of a gcc warning complaining that
+	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
+	 * v4l2_ctrl_type enum.
+	 */
+	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
 		idx *= ctrl->elem_size;
 		memset(ptr.p_char + idx, ' ', ctrl->minimum);
@@ -1486,6 +1493,17 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_U32:
 		ptr.p_u32[idx] = ctrl->default_value;
 		break;
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		p_mpeg2_slice_params = ptr.p;
+		/* 4:2:0 */
+		p_mpeg2_slice_params->sequence.chroma_format = 1;
+		/* 8 bits */
+		p_mpeg2_slice_params->picture.intra_dc_precision = 0;
+		/* interlaced top field */
+		p_mpeg2_slice_params->picture.picture_structure = 1;
+		p_mpeg2_slice_params->picture.picture_coding_type =
+					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+		break;
 	default:
 		idx *= ctrl->elem_size;
 		memset(ptr.p + idx, 0, ctrl->elem_size);
-- 
2.20.1

