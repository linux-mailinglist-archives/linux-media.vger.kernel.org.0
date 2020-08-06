Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369D923DF0F
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbgHFRgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729232AbgHFRfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:35:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0D0C00869D;
        Thu,  6 Aug 2020 08:18:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 51EFE2972D4
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 05/14] media: uapi: h264: Increase size of 'first_mb_in_slice' field
Date:   Thu,  6 Aug 2020 12:13:01 -0300
Message-Id: <20200806151310.98624-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Slice header syntax element 'first_mb_in_slice' can point
to the last macroblock, currently the field can only reference
65536 macroblocks which is insufficient for 8K videos.

Although unlikely, a 8192x4320 video (where macroblocks are 16x16),
would contain 138240 macroblocks on a frame.

As per the H264 specification, 'first_mb_in_slice' can be up to
PicSizeInMbs - 1, so increase the size of the field to 32-bits.

Note that v4l2_ctrl_h264_slice_params struct will be modified
in a follow-up commit, and so we defer its 64-bit padding.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 2 +-
 include/media/h264-ctrls.h                                | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index e4dec3f9b71a..141c9249d528 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1774,7 +1774,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``header_bit_size``
       -
-    * - __u16
+    * - __u32
       - ``first_mb_in_slice``
       -
     * - __u8
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 54cd9bec0b23..66327ca55088 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -167,7 +167,8 @@ struct v4l2_ctrl_h264_slice_params {
 	/* Offset in bits to slice_data() from the beginning of this slice. */
 	__u32 header_bit_size;
 
-	__u16 first_mb_in_slice;
+	__u32 first_mb_in_slice;
+
 	__u8 slice_type;
 	__u8 pic_parameter_set_id;
 	__u8 colour_plane_id;
-- 
2.27.0

