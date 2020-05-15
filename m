Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7C21D507F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 16:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgEOOaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 10:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726140AbgEOOaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 10:30:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA49BC05BD0A
        for <linux-media@vger.kernel.org>; Fri, 15 May 2020 07:30:03 -0700 (PDT)
Received: from localhost.localdomain (p200300cb871f5b0000f307f9e92f920a.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:f3:7f9:e92f:920a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3675B2A345F;
        Fri, 15 May 2020 15:30:02 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 3/4] media: staging: rkisp1: rsz: set output format to YUV422 if cap format is YUV444
Date:   Fri, 15 May 2020 16:29:51 +0200
Message-Id: <20200515142952.20163-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the capture format is YUV444M then the memory input format
should be YUV422, so the resizer should not change the default
hdiv, vdiv in that case.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 04a29af8cc92..5f9740ddd558 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -394,10 +394,11 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
 	 * streams should be set according to the pixel format in the capture.
 	 * The resizer always gets the input as YUV422. If the capture format
-	 * is RGB then the memory input (the resizer output) should be YUV422
-	 * so we use the hdiv, vdiv of the YUV422 info in this case.
+	 * is RGB or YUV444 then the memory input (the resizer output) should
+	 * be YUV422 so we use the hdiv, vdiv of the YUV422 info in this case.
 	 */
-	if (v4l2_is_format_yuv(cap->pix.info)) {
+	if (v4l2_is_format_yuv(cap->pix.info) &&
+	    cap->pix.info->format != V4L2_PIX_FMT_YUV444M) {
 		src_c.width = cap->pix.info->hdiv;
 		src_c.height = cap->pix.info->vdiv;
 	} else {
-- 
2.17.1

