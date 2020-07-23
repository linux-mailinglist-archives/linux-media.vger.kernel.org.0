Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5497B22B05F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 15:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgGWNV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 09:21:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgGWNVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 09:21:24 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 29B3E298A36
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 09/10] media: rkisp1: cap: simplify the link validation by compering the media bus code
Date:   Thu, 23 Jul 2020 15:20:13 +0200
Message-Id: <20200723132014.4597-10-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The capture has a mapping of the mbus code needed for each pixelformat.
This can be used to simplify the link validation by comparing the mbus
code in the capture with the code in the resizer.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 4dabd07a3da9..a5e2521577dd 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1255,22 +1255,11 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 	struct v4l2_subdev *sd =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct rkisp1_capture *cap = video_get_drvdata(vdev);
-	struct rkisp1_isp *isp = &cap->rkisp1->isp;
-	u8 isp_pix_enc = isp->src_fmt->pixel_enc;
-	u8 cap_pix_enc = cap->pix.info->pixel_enc;
+	const struct rkisp1_capture_fmt_cfg *fmt =
+		rkisp1_find_fmt_cfg(cap, cap->pix.fmt.pixelformat);
 	struct v4l2_subdev_format sd_fmt;
 	int ret;
 
-	if (cap_pix_enc != isp_pix_enc &&
-	    !(isp_pix_enc == V4L2_PIXEL_ENC_YUV &&
-	      cap_pix_enc == V4L2_PIXEL_ENC_RGB)) {
-		dev_err(cap->rkisp1->dev,
-			"format type mismatch in link '%s:%d->%s:%d'\n",
-			link->source->entity->name, link->source->index,
-			link->sink->entity->name, link->sink->index);
-		return -EPIPE;
-	}
-
 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sd_fmt.pad = link->source->index;
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
@@ -1278,7 +1267,8 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 		return ret;
 
 	if (sd_fmt.format.height != cap->pix.fmt.height ||
-	    sd_fmt.format.width != cap->pix.fmt.width)
+	    sd_fmt.format.width != cap->pix.fmt.width ||
+	    sd_fmt.format.code != fmt->mbus)
 		return -EPIPE;
 
 	return 0;
-- 
2.17.1

