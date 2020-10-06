Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCA0285348
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 22:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbgJFUii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 16:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23837 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727281AbgJFUii (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 16:38:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602016716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=CY270tE78aHdEFg/7AHMwZ0G16nZKyLFE05PWyXGF2g=;
        b=WxNxSn+6lJT5tv/YcmDjO6dFSBlg54kL7VzJCfuFtYCUH8WYOKnOBS0mLvIybnaAtG1aah
        tvwPYfWPlv5wOM0AlxzJYoo0yT9/koNstyqjYxUjhyv/BTt7LfMETuRwJ48GAqhBRMHuyR
        68zthzef1RORR+LgGF5nR80Vg2JuWnY=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-Bjux_F0fONWN7GuF8HrIYg-1; Tue, 06 Oct 2020 16:38:34 -0400
X-MC-Unique: Bjux_F0fONWN7GuF8HrIYg-1
Received: by mail-oo1-f71.google.com with SMTP id q189so32426ooa.18
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2020 13:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CY270tE78aHdEFg/7AHMwZ0G16nZKyLFE05PWyXGF2g=;
        b=EEhP4jOT+lbPO2RAZfN+0y6GyWhq8R/uLcXSV40CL/8RGGj44YvRTr5zMpH4PpoMh5
         6joiln0ZP3dR/0AIAQjCCVy1tVXCEUO31KCEWrr5djoteV0rrWlwksDaDc5moHz0I3TG
         m9raKG4q8RJld5GrG83RalwU5IfWi4ujwcXUquUIds+2VMxPr3aGULc4VmYpHkoCsXnb
         ji+a2VX1ni8SPgLVS5CgoIsvAth2Cm3LNu3xsEkKQ6mrFGavHHbWnptNFf/+ziMbInKR
         NT9v++QLFP3QWSnrBM4Ej6LVCJmxBHnGZ7b1LR00LkgoIesH2J8twgV4FG39z1rPNj88
         IqEQ==
X-Gm-Message-State: AOAM530QCMrcod+YR6YbF4AzqJDG2oJgxKQQRC8DsCqdm8lKw1vF8P3z
        WJuy5PJ2AO7Adnv2AKEBL4+VihzIp12wDARhhvjJreldi8hwNB+4BX7HPfI/DFchZmfSmo4TwtB
        tTsYtZq2RuBITWto46TMB0kM=
X-Received: by 2002:a05:6808:3bb:: with SMTP id n27mr50823oie.130.1602016713474;
        Tue, 06 Oct 2020 13:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUWuzCs2Ch8AH0f1TjICwuy4PYh6JGFTou71mlG7LYS+r2BhiCyDdDlV7L1zOpSmLX7k8m5g==
X-Received: by 2002:a05:6808:3bb:: with SMTP id n27mr50815oie.130.1602016713164;
        Tue, 06 Oct 2020 13:38:33 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id r131sm1790082oig.50.2020.10.06.13.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 13:38:32 -0700 (PDT)
From:   trix@redhat.com
To:     corbet@lwn.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: ov7670: do not aggregate returns
Date:   Tue,  6 Oct 2020 13:38:17 -0700
Message-Id: <20201006203817.8173-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Adding muliple status together loses individual failures.
Check each status separately.

Clean up some other returns for consistency.

Fixed several coding style problems by running
the file through checkpatch.pl --fix-inplace

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/ov7670.c | 96 ++++++++++++++++++++++----------------
 1 file changed, 56 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index b42b289faaef..d2df811b1a40 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -561,6 +561,7 @@ static int ov7670_read(struct v4l2_subdev *sd, unsigned char reg,
 		unsigned char *value)
 {
 	struct ov7670_info *info = to_state(sd);
+
 	if (info->use_smbus)
 		return ov7670_read_smbus(sd, reg, value);
 	else
@@ -571,6 +572,7 @@ static int ov7670_write(struct v4l2_subdev *sd, unsigned char reg,
 		unsigned char value)
 {
 	struct ov7670_info *info = to_state(sd);
+
 	if (info->use_smbus)
 		return ov7670_write_smbus(sd, reg, value);
 	else
@@ -597,6 +599,7 @@ static int ov7670_write_array(struct v4l2_subdev *sd, struct regval_list *vals)
 {
 	while (vals->reg_num != 0xff || vals->value != 0xff) {
 		int ret = ov7670_write(sd, vals->reg_num, vals->value);
+
 		if (ret < 0)
 			return ret;
 		vals++;
@@ -921,27 +924,38 @@ static int ov7670_set_hw(struct v4l2_subdev *sd, int hstart, int hstop,
 {
 	int ret;
 	unsigned char v;
-/*
- * Horizontal: 11 bits, top 8 live in hstart and hstop.  Bottom 3 of
- * hstart are in href[2:0], bottom 3 of hstop in href[5:3].  There is
- * a mystery "edge offset" value in the top two bits of href.
- */
-	ret =  ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
-	ret += ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
-	ret += ov7670_read(sd, REG_HREF, &v);
+	/*
+	 * Horizontal: 11 bits, top 8 live in hstart and hstop.  Bottom 3 of
+	 * hstart are in href[2:0], bottom 3 of hstop in href[5:3].  There is
+	 * a mystery "edge offset" value in the top two bits of href.
+	 */
+	ret = ov7670_write(sd, REG_HSTART, (hstart >> 3) & 0xff);
+	if (ret)
+		return ret;
+	ret = ov7670_write(sd, REG_HSTOP, (hstop >> 3) & 0xff);
+	if (ret)
+		return ret;
+	ret = ov7670_read(sd, REG_HREF, &v);
+	if (ret)
+		return ret;
 	v = (v & 0xc0) | ((hstop & 0x7) << 3) | (hstart & 0x7);
 	msleep(10);
-	ret += ov7670_write(sd, REG_HREF, v);
-/*
- * Vertical: similar arrangement, but only 10 bits.
- */
-	ret += ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
-	ret += ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
-	ret += ov7670_read(sd, REG_VREF, &v);
+	ret = ov7670_write(sd, REG_HREF, v);
+	if (ret)
+		return ret;
+	/* Vertical: similar arrangement, but only 10 bits. */
+	ret = ov7670_write(sd, REG_VSTART, (vstart >> 2) & 0xff);
+	if (ret)
+		return ret;
+	ret = ov7670_write(sd, REG_VSTOP, (vstop >> 2) & 0xff);
+	if (ret)
+		return ret;
+	ret = ov7670_read(sd, REG_VREF, &v);
+	if (ret)
+		return ret;
 	v = (v & 0xf0) | ((vstop & 0x3) << 2) | (vstart & 0x3);
 	msleep(10);
-	ret += ov7670_write(sd, REG_VREF, v);
-	return ret;
+	return ov7670_write(sd, REG_VREF, v);
 }
 
 
@@ -1245,6 +1259,7 @@ static int ov7670_enum_frame_size(struct v4l2_subdev *sd,
 	 */
 	for (i = 0; i < n_win_sizes; i++) {
 		struct ov7670_win_size *win = &info->devtype->win_sizes[i];
+
 		if (info->min_width && win->width < info->min_width)
 			continue;
 		if (info->min_height && win->height < info->min_height)
@@ -1285,17 +1300,17 @@ static int ov7670_store_cmatrix(struct v4l2_subdev *sd,
 				raw = 0xff;
 			else
 				raw = (-1 * matrix[i]) & 0xff;
-		}
-		else {
+		} else {
 			if (matrix[i] > 255)
 				raw = 0xff;
 			else
 				raw = matrix[i] & 0xff;
 		}
-		ret += ov7670_write(sd, REG_CMATRIX_BASE + i, raw);
+		ret = ov7670_write(sd, REG_CMATRIX_BASE + i, raw);
+		if (ret)
+			return ret;
 	}
-	ret += ov7670_write(sd, REG_CMATRIX_SIGN, signbits);
-	return ret;
+	return ov7670_write(sd, REG_CMATRIX_SIGN, signbits);
 }
 
 
@@ -1381,11 +1396,9 @@ static int ov7670_s_sat_hue(struct v4l2_subdev *sd, int sat, int hue)
 {
 	struct ov7670_info *info = to_state(sd);
 	int matrix[CMATRIX_LEN];
-	int ret;
 
 	ov7670_calc_cmatrix(info, matrix, sat, hue);
-	ret = ov7670_store_cmatrix(sd, matrix);
-	return ret;
+	return ov7670_store_cmatrix(sd, matrix);
 }
 
 
@@ -1403,14 +1416,12 @@ static unsigned char ov7670_abs_to_sm(unsigned char v)
 static int ov7670_s_brightness(struct v4l2_subdev *sd, int value)
 {
 	unsigned char com8 = 0, v;
-	int ret;
 
 	ov7670_read(sd, REG_COM8, &com8);
 	com8 &= ~COM8_AEC;
 	ov7670_write(sd, REG_COM8, com8);
 	v = ov7670_abs_to_sm(value);
-	ret = ov7670_write(sd, REG_BRIGHT, v);
-	return ret;
+	return ov7670_write(sd, REG_BRIGHT, v);
 }
 
 static int ov7670_s_contrast(struct v4l2_subdev *sd, int value)
@@ -1424,13 +1435,14 @@ static int ov7670_s_hflip(struct v4l2_subdev *sd, int value)
 	int ret;
 
 	ret = ov7670_read(sd, REG_MVFP, &v);
+	if (ret)
+		return ret;
 	if (value)
 		v |= MVFP_MIRROR;
 	else
 		v &= ~MVFP_MIRROR;
 	msleep(10);  /* FIXME */
-	ret += ov7670_write(sd, REG_MVFP, v);
-	return ret;
+	return ov7670_write(sd, REG_MVFP, v);
 }
 
 static int ov7670_s_vflip(struct v4l2_subdev *sd, int value)
@@ -1439,13 +1451,14 @@ static int ov7670_s_vflip(struct v4l2_subdev *sd, int value)
 	int ret;
 
 	ret = ov7670_read(sd, REG_MVFP, &v);
+	if (ret)
+		return ret;
 	if (value)
 		v |= MVFP_FLIP;
 	else
 		v &= ~MVFP_FLIP;
 	msleep(10);  /* FIXME */
-	ret += ov7670_write(sd, REG_MVFP, v);
-	return ret;
+	return ov7670_write(sd, REG_MVFP, v);
 }
 
 /*
@@ -1460,8 +1473,10 @@ static int ov7670_g_gain(struct v4l2_subdev *sd, __s32 *value)
 	unsigned char gain;
 
 	ret = ov7670_read(sd, REG_GAIN, &gain);
+	if (ret)
+		return ret;
 	*value = gain;
-	return ret;
+	return 0;
 }
 
 static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
@@ -1470,12 +1485,13 @@ static int ov7670_s_gain(struct v4l2_subdev *sd, int value)
 	unsigned char com8;
 
 	ret = ov7670_write(sd, REG_GAIN, value & 0xff);
+	if (ret)
+		return ret;
 	/* Have to turn off AGC as well */
-	if (ret == 0) {
-		ret = ov7670_read(sd, REG_COM8, &com8);
-		ret = ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
-	}
-	return ret;
+	ret = ov7670_read(sd, REG_COM8, &com8);
+	if (ret)
+		return ret;
+	return ov7670_write(sd, REG_COM8, com8 & ~COM8_AGC);
 }
 
 /*
@@ -1680,13 +1696,13 @@ static int ov7670_s_power(struct v4l2_subdev *sd, int on)
 		return 0;
 
 	if (on) {
-		ov7670_power_on (sd);
+		ov7670_power_on(sd);
 		ov7670_init(sd, 0);
 		ov7670_apply_fmt(sd);
 		ov7675_apply_framerate(sd);
 		v4l2_ctrl_handler_setup(&info->hdl);
 	} else {
-		ov7670_power_off (sd);
+		ov7670_power_off(sd);
 	}
 
 	return 0;
-- 
2.18.1

