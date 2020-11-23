Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CD22C0E5B
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgKWPAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:00:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35182 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731132AbgKWPA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:00:27 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8D1CE1F44ADB
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: controls: Add VP8 stateless type initialization
Date:   Mon, 23 Nov 2020 12:00:19 -0300
Message-Id: <20201123150019.83470-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VP8_FRAME_HEADER control type is validated, so it
needs a corresponding initialization to produce default
legal values.

For now, only add the minimum required initialization
to satisfy current validation.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 208f5ee643f8..ded16596392c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1626,6 +1626,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			      union v4l2_ctrl_ptr ptr)
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
 	if (ctrl->p_def.p_const)
@@ -1648,6 +1649,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_mpeg2_slice_params->picture.picture_coding_type =
 					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
 		break;
+	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
+		p_vp8_frame_header = p;
+		p_vp8_frame_header->num_dct_parts = 1;
+		break;
 	}
 }
 
-- 
2.27.0

