Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E099DABB0D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 16:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405528AbfIFOfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 10:35:20 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:47258 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731943AbfIFOfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 10:35:19 -0400
X-Halon-ID: 859a30b3-d0b3-11e9-903a-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 859a30b3-d0b3-11e9-903a-005056917f90;
        Fri, 06 Sep 2019 16:35:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Do not enumerate unsupported pixel formats
Date:   Fri,  6 Sep 2019 16:35:00 +0200
Message-Id: <20190906143500.21882-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a pixel format is not supported by the hardware NULL is returned by
rvin_format_from_pixel() for that fourcc. Verify that the pixel format
is supported using this or skip it when enumerating.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index cbc1c07f0a9631a4..ba08f6c49956e899 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -302,10 +302,20 @@ static int rvin_g_fmt_vid_cap(struct file *file, void *priv,
 static int rvin_enum_fmt_vid_cap(struct file *file, void *priv,
 				 struct v4l2_fmtdesc *f)
 {
+	struct rvin_dev *vin = video_drvdata(file);
+	unsigned int i, skip = 0;
+
 	if (f->index >= ARRAY_SIZE(rvin_formats))
 		return -EINVAL;
 
-	f->pixelformat = rvin_formats[f->index].fourcc;
+	for (i = 0; i <= f->index; i++)
+		if (!rvin_format_from_pixel(vin, rvin_formats[i].fourcc))
+			skip++;
+
+	if (f->index + skip >= ARRAY_SIZE(rvin_formats))
+		return -EINVAL;
+
+	f->pixelformat = rvin_formats[f->index + skip].fourcc;
 
 	return 0;
 }
-- 
2.23.0

