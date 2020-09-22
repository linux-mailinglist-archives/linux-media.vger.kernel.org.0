Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB65274713
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 18:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIVQ6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 12:58:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58178 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgIVQ6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 12:58:23 -0400
X-Greylist: delayed 19452 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 12:58:22 EDT
Received: from guri.fritz.box (p200300c7cf13ec005877be1094b7a29d.dip0.t-ipconnect.de [IPv6:2003:c7:cf13:ec00:5877:be10:94b7:a29d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6CB8728D171;
        Tue, 22 Sep 2020 17:58:21 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH 2/2] media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED
Date:   Tue, 22 Sep 2020 18:58:13 +0200
Message-Id: <20200922165813.19378-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
References: <20200922165813.19378-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the code of the metadata pads of the isp entity to
MEDIA_BUS_FMT_METADATA_FIXED and set the width and
height of their formats to 0. This solves the TODO
item:
"Fix pad format size for statistics and parameters entities."

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/TODO         | 1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index f0c90d1c86a8..f4a94eca6d31 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,4 +1,3 @@
-* Fix pad format size for statistics and parameters entities.
 * Fix checkpatch errors.
 * Review and comment every lock
 * Handle quantization
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 02eafea92863..a6c0f1eb0c5a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -574,7 +574,7 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	} else {
 		if (code->index > 0)
 			return -EINVAL;
-		code->code = MEDIA_BUS_FMT_FIXED;
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
 		return 0;
 	}
 
@@ -630,10 +630,10 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 					      RKISP1_ISP_PAD_SINK_PARAMS);
 	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
 					     RKISP1_ISP_PAD_SOURCE_STATS);
-	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
-	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->width = 0;
+	sink_fmt->height = 0;
 	sink_fmt->field = V4L2_FIELD_NONE;
-	sink_fmt->code = MEDIA_BUS_FMT_FIXED;
+	sink_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
 	*src_fmt = *sink_fmt;
 
 	return 0;
-- 
2.17.1

