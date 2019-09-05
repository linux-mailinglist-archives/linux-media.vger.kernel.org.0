Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDC0A9F59
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732779AbfIEKPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:15:43 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58015 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732504AbfIEKPm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:15:42 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i5onl-0001qT-Ag; Thu, 05 Sep 2019 12:15:41 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel@pengutronix.de
Subject: [PATCH 1/2] media: uapi: h264: Add num_ref_idx_active_override_flag
Date:   Thu,  5 Sep 2019 12:15:32 +0200
Message-Id: <20190905101533.525-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This flag tells the kernel whether the slice header contained the
num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
num_ref_idx_l[01]_default_active_minus1 from PPS should be used
instead.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
 include/media/h264-ctrls.h                       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index bc5dd8e76567..451a5b0f2a35 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
       - 0x00000008
       -
+    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
+      - 0x00000010
+      - Corresponds to the num_ref_idx_active_override_flag syntax element.
 
 ``Prediction Weight Table``
 
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index e877bf1d537c..dab519aea9bf 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -133,6 +133,7 @@ struct v4l2_h264_pred_weight_table {
 #define V4L2_H264_SLICE_FLAG_BOTTOM_FIELD		0x02
 #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
 #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
+#define V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE	0x10
 
 struct v4l2_ctrl_h264_slice_params {
 	/* Size in bytes, including header */
-- 
2.20.1

