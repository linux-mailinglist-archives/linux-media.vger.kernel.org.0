Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DF32B841D
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgKRSry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgKRSrx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:47:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9498BC0613D4;
        Wed, 18 Nov 2020 10:47:53 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 811671F4499B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 09/13] media: uapi: Move parsed H264 pixel format out of staging
Date:   Wed, 18 Nov 2020 15:46:56 -0300
Message-Id: <20201118184700.331213-10-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we are ready to stabilize the H264 stateless API,
start by first moving the parsed H264 pixel format.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/h264-ctrls.h     | 3 ---
 include/uapi/linux/videodev2.h | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index e14307f1a77c..d00d52556b6f 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -21,9 +21,6 @@
 
 #define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
 
-/* Our pixel format isn't stable at the moment */
-#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
-
 /*
  * This is put insanely high to avoid conflicting with controls that
  * would be added during the phase where those controls are not
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 927075fa9099..306d569bec11 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -703,6 +703,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
+#define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
-- 
2.27.0

