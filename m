Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AA01A5E78
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 14:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgDLMFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 08:05:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37310 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgDLMFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 08:05:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 9ECBA2A07A7
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com
Subject: [PATCH v2 3/4] media: staging: rkisp1: rsz: change (hv)div only if capture format is YUV
Date:   Sun, 12 Apr 2020 14:05:03 +0200
Message-Id: <20200412120504.6536-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
References: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
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
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index c28919b9af44..d049374413dc 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -394,9 +394,14 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	 * but also to change the scale for YUV formats,
 	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
 	 * streams should be set according to the pixel format in the capture.
+	 * The resizer always gets the input as YUV422. If the capture format
+	 * is RGB then the memory input should be YUV422 so we don't change the
+	 * default hdiv, vdiv in that case.
 	 */
-	hdiv = cap->pix.info->hdiv;
-	vdiv = cap->pix.info->vdiv;
+	if (v4l2_is_format_yuv(cap->pix.info)) {
+		hdiv = cap->pix.info->hdiv;
+		vdiv = cap->pix.info->vdiv;
+	}
 
 	src_c.width = src_y.width / hdiv;
 	src_c.height = src_y.height / vdiv;
-- 
2.17.1

