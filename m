Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442F72D468E
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 17:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731690AbgLIQQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 11:16:13 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57536 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730016AbgLIQQF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 11:16:05 -0500
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:7c95:7988:d313:9804])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 482A01F4539E;
        Wed,  9 Dec 2020 16:15:19 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH] media: rkisp1: rsz: crash fix when setting src format
Date:   Wed,  9 Dec 2020 17:15:10 +0100
Message-Id: <20201209161510.31399-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When setting the source media bus code in the resizer,
we first check that the current media bus code in the
source is yuv encoded format. This is done by
retrieving the data from the formats list of the isp
entity. This cause a crash when the media bus code on the
source is YUYV8_1_5X8 which is not supported by the isp
entity. Instead we should test the sink format of the resizer
which is guaranteed to be supported by the isp entity.

Fixes: 251b6eebb6c49 ("media: staging: rkisp1: rsz: Add support to more YUV encoded mbus codes on src pad")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 813670ed9577..79deed8adcea 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -520,14 +520,15 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 				   struct v4l2_mbus_framefmt *format,
 				   unsigned int which)
 {
-	const struct rkisp1_isp_mbus_info *mbus_info;
-	struct v4l2_mbus_framefmt *src_fmt;
+	const struct rkisp1_isp_mbus_info *sink_mbus_info;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
-	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
+	sink_mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 
 	/* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
-	if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
+	if (sink_mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
 	    rkisp1_rsz_get_yuv_mbus_info(format->code))
 		src_fmt->code = format->code;
 
-- 
2.17.1

