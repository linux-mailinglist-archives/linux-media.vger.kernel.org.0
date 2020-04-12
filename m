Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909911A5E77
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 14:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgDLMFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 08:05:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37320 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDLMFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 08:05:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 24C352A0849
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com
Subject: [PATCH v2 4/4] media: staging: rkisp1: cap: enable RGB capture format with YUV media bus
Date:   Sun, 12 Apr 2020 14:05:04 +0200
Message-Id: <20200412120504.6536-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
References: <20200412120504.6536-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In selfpath, RGB capture formats are received in the sink pad as YUV
and are converted to RGB only when writing to memory. So the validation
function should accept YUV bus formats with RGB capture encoding.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index fbf62399fe3d..a94483170e9c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1208,6 +1208,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct rkisp1_capture *cap = video_get_drvdata(vdev);
 	struct rkisp1_isp *isp = &cap->rkisp1->isp;
+	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
+	u8 cap_pix_enc = cap->pix.info->pixel_enc;
 	struct v4l2_subdev_format sd_fmt;
 	int ret;
 
@@ -1218,7 +1220,9 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 		return -EPIPE;
 	}
 
-	if (cap->pix.info->pixel_enc != isp->src_fmt->pixel_enc) {
+	if (cap_pix_enc != isp_pix_enc &&
+	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
+	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
 		dev_err(cap->rkisp1->dev,
 			"format type mismatch in link '%s:%d->%s:%d'\n",
 			link->source->entity->name, link->source->index,
-- 
2.17.1

