Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9801F2CCE7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 19:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE1RD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 13:03:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45868 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 13:03:26 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C8795281D92
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v6 02/16] media: v4l2-common: Add an helper to apply frmsize constraints
Date:   Tue, 28 May 2019 14:02:18 -0300
Message-Id: <20190528170232.2091-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528170232.2091-1-ezequiel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

The rockchip VPU driver is open-coding this logic which seems pretty
generic. Let's provide an helper to apply the min/max and alignment
constraints on width/height.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes from v5:
* None

Changes from v4:
* New patch

 drivers/media/v4l2-core/v4l2-common.c | 27 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           |  2 ++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 9417a883ebe3..b2d1e55d9561 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -331,6 +331,16 @@ static unsigned int clamp_align(unsigned int x, unsigned int min,
 	return x;
 }
 
+static unsigned int clamp_roundup(unsigned int x, unsigned int min,
+				   unsigned int max, unsigned int alignment)
+{
+	x = clamp(x, min, max);
+	if (alignment)
+		x = round_up(x, alignment);
+
+	return x;
+}
+
 void v4l_bound_align_image(u32 *w, unsigned int wmin, unsigned int wmax,
 			   unsigned int walign,
 			   u32 *h, unsigned int hmin, unsigned int hmax,
@@ -541,6 +551,23 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 	return info->block_h[plane];
 }
 
+void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
+				    const struct v4l2_frmsize_stepwise *frmsize)
+{
+	if (!frmsize)
+		return;
+
+	/*
+	 * Clamp width/height to meet min/max constraints and round it up to
+	 * macroblock alignment.
+	 */
+	*width = clamp_roundup(*width, frmsize->min_width, frmsize->max_width,
+			       frmsize->step_width);
+        *height = clamp_roundup(*height, frmsize->min_height, frmsize->max_height,
+				frmsize->step_height);
+}
+EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
+
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
 			u32 pixelformat, u32 width, u32 height)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 3226bc8107cc..e826b154bc35 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -420,6 +420,8 @@ struct v4l2_format_info {
 
 const struct v4l2_format_info *v4l2_format_info(u32 format);
 
+void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
+				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
 int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
-- 
2.20.1

