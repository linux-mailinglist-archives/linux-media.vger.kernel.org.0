Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48C9AD5DAA
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 10:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730488AbfJNIkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 04:40:25 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:43897 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730429AbfJNIkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 04:40:24 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JvttiFYwLop0AJvtvidA9t; Mon, 14 Oct 2019 10:40:23 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv6 2/3] v4l2-dev: simplify the SDR checks
Date:   Mon, 14 Oct 2019 10:40:20 +0200
Message-Id: <20191014084021.54191-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOnlyq0tdyyrSuYq9vwWwT4k7/AVO6IDySEVaLcV39siTm/bJYQm/bza7AUVwOFfFTASJbOkOjZgC9oIp1QA+szmM4FV9zkQ3e3GAUHHgC/WeHBTZaTy
 Th1pbYomE9XBps1WyF1xHxU/cLZalEn8BVWBoyXaSrwD2FeJSaZED7h8lQN0C222pZcz4p/Lc7QV0bjAUW3iHFXRNyTkBmPoVVUc0N2eSJBlMAZfdAI1NWXB
 /h/Vaw094sy9aOMFTUG63V85FZ7NkxH8/m3vVevgQNW/881uz0aUScgPqMbZI14jDAFIooNtzfzuqmHMJ07km4o8fjyc+GWtv0mISfihAPGgXmcq+rNMBa8c
 4ojFk7fffKo785Q1dSgOQGlVGOoV9XM2gDNG0oxQGq2PkKEpc/2+R0HnCPqns/6M/JEYPviI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In determine_valid_ioctls() we can use SET_VALID_IOCTL to enable
ioctls for SDR, simplifying the code.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-dev.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 1bf543932e4f..27fb96a6c2a8 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -677,24 +677,16 @@ static void determine_valid_ioctls(struct video_device *vdev)
 		SET_VALID_IOCTL(ops, VIDIOC_G_SLICED_VBI_CAP, vidioc_g_sliced_vbi_cap);
 	} else if (is_sdr && is_rx) {
 		/* SDR receiver specific ioctls */
-		if (ops->vidioc_enum_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
-		if (ops->vidioc_g_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
-		if (ops->vidioc_s_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
-		if (ops->vidioc_try_fmt_sdr_cap)
-			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_cap);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_cap);
 	} else if (is_sdr && is_tx) {
 		/* SDR transmitter specific ioctls */
-		if (ops->vidioc_enum_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_ENUM_FMT), valid_ioctls);
-		if (ops->vidioc_g_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_G_FMT), valid_ioctls);
-		if (ops->vidioc_s_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_S_FMT), valid_ioctls);
-		if (ops->vidioc_try_fmt_sdr_out)
-			set_bit(_IOC_NR(VIDIOC_TRY_FMT), valid_ioctls);
+		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_sdr_out);
+		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_sdr_out);
 	}
 
 	if (is_vid || is_vbi || is_sdr || is_tch || is_meta) {
-- 
2.23.0

