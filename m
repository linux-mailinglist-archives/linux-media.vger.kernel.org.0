Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2EF18756A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 23:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbgCPWQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 18:16:18 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:22305 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732652AbgCPWQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 18:16:18 -0400
X-Halon-ID: abaa7401-67d3-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id abaa7401-67d3-11ea-9f40-0050569116f7;
        Mon, 16 Mar 2020 23:15:44 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] vimc: Report a colorspace
Date:   Mon, 16 Mar 2020 23:16:06 +0100
Message-Id: <20200316221606.2648820-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
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
---
 drivers/media/platform/vimc/vimc-capture.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
Hi,

This was found while adding V4L2_CAP_IO_MC support to vimc and adding 
tests to v4l2-compliance. The issue will hence only show up in 
v4l2-compliance if V4L2_CAP_IO_MC series is enabled for vimc.

Best regards,
Niklas Söderlund

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 23e740c1c5c00802..747ea9cc1bd7cb12 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
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
 
-- 
2.25.1

