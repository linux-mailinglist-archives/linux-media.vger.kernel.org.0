Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA95447469
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235951AbhKGRTO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49572 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235939AbhKGRTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MXF6tbV0Bo36Zm4e8SD6y0RRWBH+qoROmu/xiP3S664=;
        b=Aq457okuILFtdVCLpYs8aztiEHPLLGPf+FGaQffvHGkfCXhDv1NPzSFQlUH/41de1VpB/u
        VbWZjkIkVINaHUwJk2EqKs7C64zjO3mzLeAMOkHw6Jv/tgvQrzqdiz4teewNZLSpqqJhUr
        LE1vWgCvBfKhdNfBrkR91mEumI6GYLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Fyr0zfBUMTyXwVEp98zf5g-1; Sun, 07 Nov 2021 12:16:27 -0500
X-MC-Unique: Fyr0zfBUMTyXwVEp98zf5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70F251006AA0;
        Sun,  7 Nov 2021 17:16:25 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C36757CD3;
        Sun,  7 Nov 2021 17:16:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 11/11] media: atomisp-ov2680: Fix ov2680_set_fmt() messing up high exposure settings
Date:   Sun,  7 Nov 2021 18:15:49 +0100
Message-Id: <20211107171549.267583-12-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For exposure settings > (lines_per_frame - vts_margin) the VTS register
needs to be programmed to (exposure + vts_margin) rather then being
set to lines_per_frame.

The res->regs register array was clobbering this higher setting causing
high exposure settings to not work. Fix this by letting ov2680_set_fmt()
calculate the vts value, instead of hardcoding it.

This is the last in a series of fixes which fixes exposure and gain
settings not working, with this everything works, so drop the comment
that it does not work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 13 ++++++++--
 drivers/staging/media/atomisp/i2c/ov2680.h    | 24 -------------------
 2 files changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 1092d1c2993f..34d008236bd9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -387,7 +387,6 @@ static long ov2680_s_exposure(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	// EXPOSURE CONTROL DISABLED FOR INITIAL CHECKIN, TUNING DOESN'T WORK
 	return ov2680_set_exposure(sd, coarse_itg, analog_gain, digital_gain);
 }
 
@@ -825,7 +824,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct camera_mipi_info *ov2680_info = NULL;
 	struct ov2680_resolution *res;
-	int ret = 0;
+	int vts, ret = 0;
 
 	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
 		__func__,
@@ -870,6 +869,16 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 		dev_err(&client->dev,
 			"ov2680 write resolution register err: %d\n", ret);
 
+	/* If necessary increase the VTS to match exposure + MARGIN */
+	if (dev->exposure > vts - OV2680_INTEGRATION_TIME_MARGIN)
+		vts = dev->exposure + OV2680_INTEGRATION_TIME_MARGIN;
+	else
+		vts = dev->res->lines_per_frame;
+
+	ret = ov2680_write_reg(client, 2, OV2680_TIMING_VTS_H, vts);
+	if (ret)
+		dev_err(&client->dev, "ov2680 write vts err: %d\n", ret);
+
 	ret = ov2680_get_intg_factor(client, ov2680_info, res);
 	if (ret) {
 		dev_err(&client->dev, "failed to get integration factor\n");
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index d52b7fbe3c06..e53be612a1e4 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -302,8 +302,6 @@ static struct ov2680_reg const ov2680_QCIF_30fps[] = {
 	{0x380b, 0xa0},
 	{0x380c, 0x06},
 	{0x380d, 0xb0},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
@@ -345,8 +343,6 @@ static struct ov2680_reg const ov2680_CIF_30fps[] = {
 	{0x380b, 0x30},
 	{0x380c, 0x06},
 	{0x380d, 0xb0},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
@@ -386,8 +382,6 @@ static struct ov2680_reg const ov2680_QVGA_30fps[] = {
 	{0x380b, 0x00},
 	{0x380c, 0x06},
 	{0x380d, 0xb0},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
@@ -427,8 +421,6 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	{0x380b, 0xf0},
 	{0x380c, 0x06},
 	{0x380d, 0xb0},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
 	{0x3810, 0x00},
 	{0x3811, 0x04},
 	{0x3812, 0x00},
@@ -468,8 +460,6 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x380b, 0x50}, // Y_OUTPUT_SIZE;
 	{0x380c, 0x06},
 	{0x380d, 0xac}, // HTS;
-	{0x380e, 0x02},
-	{0x380f, 0x84}, // VTS;
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
@@ -511,8 +501,6 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x380b, 0x58},
 	{0x380c, 0x06},
 	{0x380d, 0xac},
-	{0x380e, 0x02},
-	{0x380f, 0x84},
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
@@ -552,8 +540,6 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x380b, 0xe0},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -593,8 +579,6 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x380b, 0xd0},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -634,8 +618,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	{0x380b, 0x48},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -677,8 +659,6 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 	{0x380b, 0x94},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
@@ -719,8 +699,6 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x380b, 0x3a},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
@@ -760,8 +738,6 @@ static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 	{0x380b, 0xc0},//c0},
 	{0x380c, 0x06},
 	{0x380d, 0xa8},
-	{0x380e, 0x05},
-	{0x380f, 0x0e},
 	{0x3810, 0x00},
 	{0x3811, 0x00},
 	{0x3812, 0x00},
-- 
2.31.1

