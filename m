Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F1E1662DB
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 17:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbgBTQae (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 11:30:34 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47960 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbgBTQae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 11:30:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9F3142951E3
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v6 1/6] media: uapi: h264: Add DPB entry field reference flags
Date:   Thu, 20 Feb 2020 13:30:11 -0300
Message-Id: <20200220163016.21708-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220163016.21708-1-ezequiel@collabora.com>
References: <20200220163016.21708-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonas Karlman <jonas@kwiboo.se>

Using the field information attached to v4l2 buffers is not enough to
determine the type of field referenced by a DPB entry: the decoded
frame might contain the full picture (both top and bottom fields)
but the reference only point to one of them.
Let's add new V4L2_H264_DPB_ENTRY_FLAG_ flags to express that.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[Keep only 2 flags and add some details about they mean]
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 16 ++++++++++++++++
 include/media/h264-ctrls.h                       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index 28313c0f4e7c..d4fc5f25aa14 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -2028,6 +2028,22 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
       - 0x00000004
       - The DPB entry is a long term reference frame
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
+      - 0x00000008
+      - The DPB entry is a field reference, which means only one of the field
+        will be used when decoding the new frame/field. When not set the DPB
+        entry is a frame reference (both fields will be used). Note that this
+        flag does not say anything about the number of fields contained in the
+        reference frame, it just describes the one used to decode the new
+        field/frame
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD``
+      - 0x00000010
+      - The DPB entry is a bottom field reference (only the bottom field of the
+        reference frame is needed to decode the new frame/field). Only valid if
+        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set. When
+        V4L2_H264_DPB_ENTRY_FLAG_FIELD is set but
+        V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD is not, that means the
+        DPB entry is a top field reference
 
 ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
     Specifies the decoding mode to use. Currently exposes slice-based and
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index e877bf1d537c..1c6ff7d63bca 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -185,6 +185,8 @@ struct v4l2_ctrl_h264_slice_params {
 #define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
 #define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
 #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
+#define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
+#define V4L2_H264_DPB_ENTRY_FLAG_BOTTOM_FIELD	0x10
 
 struct v4l2_h264_dpb_entry {
 	__u64 reference_ts;
-- 
2.25.0

