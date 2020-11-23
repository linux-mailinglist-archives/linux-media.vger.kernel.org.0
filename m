Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C0E2C0DE5
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 15:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgKWOkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 09:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbgKWOkl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 09:40:41 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60B4C061A4D;
        Mon, 23 Nov 2020 06:40:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ACE981F449A8
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
Subject: [PATCH v4 06/13] media: uapi: h264: Add profile_idc macros
Date:   Mon, 23 Nov 2020 11:39:53 -0300
Message-Id: <20201123144000.81310-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201123144000.81310-1-ezequiel@collabora.com>
References: <20201123144000.81310-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some macros to document the profile_idc magic numbers.
This will be used to validate the controls, but could
also be used by drivers.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/h264-ctrls.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index f86345b8efd1..e14307f1a77c 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -98,6 +98,13 @@ enum v4l2_mpeg_video_h264_start_code {
 #define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
 #define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
 
+#define V4L2_H264_PROFILE_IDC_BASELINE                          66
+#define V4L2_H264_PROFILE_IDC_MAIN                              77
+#define V4L2_H264_PROFILE_IDC_EXTENDED                          88
+#define V4L2_H264_PROFILE_IDC_HIGH                              100
+#define V4L2_H264_PROFILE_IDC_HIGH_422                          122
+#define V4L2_H264_PROFILE_IDC_HIGH_444                          244
+
 /**
  * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
  *
-- 
2.27.0

