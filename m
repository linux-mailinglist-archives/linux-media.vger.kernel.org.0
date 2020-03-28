Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CA119653E
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 11:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgC1K4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 06:56:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42024 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgC1K4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 06:56:20 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E6B852972A2;
        Sat, 28 Mar 2020 10:56:18 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/3] media: staging: rkisp1: rsz: change (hv)div only if capture format is YUV
Date:   Sat, 28 Mar 2020 11:56:05 +0100
Message-Id: <20200328105606.13660-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGB formats in selfpath should receive input format as YUV422.
The resizer input format is always YUV422 and therefore
if the capture format is RGB, the resizer should not change
the YUV rations.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 8704267a066f..5721eee29ecb 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -389,8 +389,18 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 			&rsz->rkisp1->capture_devs[rsz->id];
 		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
 
-		hdiv = pixfmt_info->hdiv;
-		vdiv = pixfmt_info->vdiv;
+		/*
+		 * The resizer always get the input as YUV422
+		 * If the capture encoding is also YUV, then the resizer should
+		 * change the 4:2:2 sampling to the sampling of the capture
+		 * format (4:2:2 -> 4:2:0 for example).
+		 * If the capture format is RGB then the memory input should
+		 * be YUV422 so we don't change the default hdiv, vdiv
+		 */
+		if (v4l2_is_format_yuv(pixfmt_info)) {
+			hdiv = pixfmt_info->hdiv;
+			vdiv = pixfmt_info->vdiv;
+		}
 	}
 	src_c.width = src_y.width / hdiv;
 	src_c.height = src_y.height / vdiv;
-- 
2.17.1

