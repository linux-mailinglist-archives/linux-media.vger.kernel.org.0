Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1CD32FC8D
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 20:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhCFTIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 14:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhCFTIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 14:08:05 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04610C06174A
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 11:08:04 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1C9151F45BA1
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: uapi: vp8: Fix kernel-doc warnings
Date:   Sat,  6 Mar 2021 16:07:49 -0300
Message-Id: <20210306190749.36783-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210305160346.4ed7b5f3@coco.lan>
References: <20210305160346.4ed7b5f3@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix following warnings:

./scripts/kernel-doc --none include/uapi/linux/v4l2-controls.h

        include/uapi/linux/v4l2-controls.h:1727: warning: bad line:
        include/uapi/linux/v4l2-controls.h:1853: warning: expecting prototype for struct v4l2_vp8_frame. Prototype was for struct v4l2_ctrl_vp8_frame instead
        include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'segment' not described in 'v4l2_ctrl_vp8_frame'
        include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'entropy' not described in 'v4l2_ctrl_vp8_frame'
        include/uapi/linux/v4l2-controls.h:1853: warning: Function parameter or member 'coder_state' not described in 'v4l2_ctrl_vp8_frame'

Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/uapi/linux/v4l2-controls.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index baa4fb8b1e37..52227cd8adc8 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1724,7 +1724,7 @@ struct v4l2_vp8_loop_filter {
  * @uv_dc_delta: chroma DC delta value.
  * @uv_ac_delta: chroma AC delta value.
  * @padding: padding field. Should be zeroed by applications.
-
+ *
  * This structure contains the quantization indices present
  * in 'quant_indices()' part of the frame header syntax.
  * See section '9.6. Dequantization Indices' of the VP8 specification
@@ -1795,12 +1795,13 @@ struct v4l2_vp8_entropy_coder_state {
 
 #define V4L2_CID_STATELESS_VP8_FRAME (V4L2_CID_CODEC_STATELESS_BASE + 200)
 /**
- * struct v4l2_vp8_frame - VP8 frame parameters
+ * struct v4l2_ctrl_vp8_frame - VP8 frame parameters
  *
- * @seg: segmentation parameters. See &v4l2_vp8_segment for more details
+ * @segment: segmentation parameters. See &v4l2_vp8_segment for more details
  * @lf: loop filter parameters. See &v4l2_vp8_loop_filter for more details
  * @quant: quantization parameters. See &v4l2_vp8_quantization for more details
- * @probs: probabilities. See &v4l2_vp9_probabilities for more details
+ * @entropy: update probabilities. See &v4l2_vp8_entropy for more details
+ * @coder_state: boolean coder state. See &v4l2_vp8_entropy_coder_state for more details
  * @width: frame width.
  * @height: frame height.
  * @horizontal_scale: horizontal scaling factor.
-- 
2.30.0

