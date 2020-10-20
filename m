Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F9A293FDD
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 17:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbgJTPrH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 11:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgJTPrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 11:47:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEDDC061755
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2020 08:47:06 -0700 (PDT)
Received: from guri.fritz.box (p200300c7cf435b0028a32f4e277d2227.dip0.t-ipconnect.de [IPv6:2003:c7:cf43:5b00:28a3:2f4e:277d:2227])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6E9C11F44EC2;
        Tue, 20 Oct 2020 16:47:05 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v2 2/2] media: staging: rkisp1: isp: set metadata pads to MEDIA_BUS_FMT_METADATA_FIXED
Date:   Tue, 20 Oct 2020 17:45:22 +0200
Message-Id: <20201020154522.654-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
References: <20201020154522.654-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the code of the metadata pads of the isp entity to
MEDIA_BUS_FMT_METADATA_FIXED and set the width and
height of their formats to 0. This solves the TODO
item:
"Fix pad format size for statistics and parameters entities."

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
no changes since v1

 drivers/staging/media/rkisp1/TODO         | 1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c | 8 ++++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index e7c8398fc2ce..c30c83681452 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,4 +1,3 @@
-* Fix pad format size for statistics and parameters entities.
 * Fix checkpatch errors.
 * Add uapi docs. Remember to add documentation of how quantization is handled.
 * streaming paths (mainpath and selfpath) check if the other path is streaming
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index fb23461d865c..889982d8ca41 100644
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
 
@@ -633,10 +633,10 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
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

