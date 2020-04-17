Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D91C1AE0C4
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 17:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgDQPMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 11:12:01 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:38828 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728365AbgDQPMB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 11:12:01 -0400
X-Halon-ID: b13033a5-80bd-11ea-89d0-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id b13033a5-80bd-11ea-89d0-0050569116f7;
        Fri, 17 Apr 2020 17:11:23 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] vimc: cap: Report a colorspace
Date:   Fri, 17 Apr 2020 17:09:29 +0200
Message-Id: <20200417150929.2872477-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The colorspace reported by a video nodes should not be
V4L2_COLORSPACE_DEFAULT. Instead a default colorspace should be picked
by the driver if V4L2_COLORSPACE_DEFAULT is given by userspace to
{G,S,TRY}_FMT.

The colorspace V4L2_COLORSPACE_SRGB is arbitrary chosen as the vimc
default format to report as it's used for most webcams.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
* Changes since v1
- Set default colorspace for all subdevices.
- Rebase to upstream vimc changes.
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 5 ++++-
 drivers/media/test-drivers/vimc/vimc-debayer.c | 2 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c  | 2 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c  | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 5315c201314c9cc4..20c2f5e281bc44ed 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -37,7 +37,7 @@ static const struct v4l2_pix_format fmt_default = {
 	.height = 480,
 	.pixelformat = V4L2_PIX_FMT_RGB24,
 	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.colorspace = V4L2_COLORSPACE_SRGB,
 };
 
 struct vimc_cap_buffer {
@@ -107,6 +107,9 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
 
 	vimc_colorimetry_clamp(format);
 
+	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
+		format->colorspace = fmt_default.colorspace;
+
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index d10aee9f84c4459f..c4765ebaeec28e3d 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -48,7 +48,7 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
 	.height = 480,
 	.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.colorspace = V4L2_COLORSPACE_SRGB,
 };
 
 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index 465b906b749771c8..2231e72b24e2e3c9 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -42,7 +42,7 @@ static const struct v4l2_mbus_framefmt sink_fmt_default = {
 	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
 	.code = MEDIA_BUS_FMT_RGB888_1X24,
 	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.colorspace = V4L2_COLORSPACE_SRGB,
 };
 
 static const struct v4l2_rect crop_rect_default = {
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 228120b3a6ddca01..56e8ec14be464ca8 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -30,7 +30,7 @@ static const struct v4l2_mbus_framefmt fmt_default = {
 	.height = 480,
 	.code = MEDIA_BUS_FMT_RGB888_1X24,
 	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_DEFAULT,
+	.colorspace = V4L2_COLORSPACE_SRGB,
 };
 
 static int vimc_sen_init_cfg(struct v4l2_subdev *sd,
-- 
2.26.0

