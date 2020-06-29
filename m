Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B1C20E241
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390224AbgF2VDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730917AbgF2TMq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:12:46 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD20C08ED83
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2020 23:58:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id AE6CE2A1B15
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH 3/4] media: staging: rkisp1: set pads array of the resizer to size 2
Date:   Mon, 29 Jun 2020 08:57:53 +0200
Message-Id: <20200629065754.26621-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
References: <20200629065754.26621-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the 'pads' and 'pad_cfg' arries of the rkisp1_resizer
are of size 'RKISP1_ISP_PAD_MAX' which is 4. But the resizer
has only two pads. This patch change the size of the arries to 2
by adding and using 'RKISP1_RSZ_PAD_MAX' similar to the way it is
done in the isp entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h  | 5 +++--
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index b7dc523dd8f0..4185487c520c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -49,6 +49,7 @@
 enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_SINK,
 	RKISP1_RSZ_PAD_SRC,
+	RKISP1_RSZ_PAD_MAX
 };
 
 enum rkisp1_stream_id {
@@ -216,8 +217,8 @@ struct rkisp1_resizer {
 	struct v4l2_subdev sd;
 	enum rkisp1_stream_id id;
 	struct rkisp1_device *rkisp1;
-	struct media_pad pads[RKISP1_ISP_PAD_MAX];
-	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
+	struct media_pad pads[RKISP1_RSZ_PAD_MAX];
+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_RSZ_PAD_MAX];
 	const struct rkisp1_rsz_config *config;
 	enum v4l2_pixel_encoding pixel_enc;
 	struct mutex ops_lock;
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 26fb41053f56..d8ebe4422e77 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -735,7 +735,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 	rsz->pixel_enc = RKISP1_DEF_PIXEL_ENC;
 
 	mutex_init(&rsz->ops_lock);
-	ret = media_entity_pads_init(&sd->entity, 2, pads);
+	ret = media_entity_pads_init(&sd->entity, RKISP1_RSZ_PAD_MAX, pads);
 	if (ret)
 		return ret;
 
-- 
2.17.1

