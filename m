Return-Path: <linux-media+bounces-39682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FBB23B27
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D52D758893E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACA52E1C7B;
	Tue, 12 Aug 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nGJaEuGw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C90B2D7396
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035279; cv=none; b=hNbF4tn0ZCmRJj3w7ZDeRY8DimhDRD3SrZs7hMYJ19G8eZxBq+ssJjNsH2hqZiDxU8cAhVCWTtxNS0qWcJhSNQ5cpp5cwdFvWc6gEAojByTAZXAiY9wftooirnACo0zaFgA1sRH0SA5p7AOCbGNQmeXJGvk6kmG1a6EvYqqcH5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035279; c=relaxed/simple;
	bh=CozJx2LeajHWoEyQAL2+EGAqn04JpgE2gsAvNlM4kZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M256hueKWOTrW140Pj/4YlDr1nCWpFT6ATfBJz6k/7vHQx/2rxuQHvFkWFLU3HgAnIZuIt/6QG8olk6WwMbGD7AlGl6iPkOQvzzN0LiRhXMvABi4Sue5T5vAu55ycZQLK+9iPx+GnapfFJh1Rh6GMgq0Y7iveRrGs0LsKouRkEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nGJaEuGw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4C7A310D4;
	Tue, 12 Aug 2025 23:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035223;
	bh=CozJx2LeajHWoEyQAL2+EGAqn04JpgE2gsAvNlM4kZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGJaEuGwD5gHDUY2R04vypQ2WMo7lVrBFl8jTwrBd3K+BDwiLD5C5AvQga18HKQyZ
	 nyb+5B1kUEIuVEQHikghKrohA7FqQatrzyDFIWUDAPxHlBgbH814vhwtjmywn22An9
	 cchvKLSjuMjqK3Uj+bSZ3oEC0om7zF70VQf/6CxU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 46/72] media: i2c: et8ek8: Drop support for per-mode external clock frequency
Date: Wed, 13 Aug 2025 00:45:54 +0300
Message-ID: <20250812214620.30425-47-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The et8ek8 driver supports programming different external clock
frequencies for different modes, but in practice all modes use a 9.6MHz
external clock. Drop support for this feature and use a hardcoded
frequency, in preparation for further refactoring of external clock
handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 10 +---------
 drivers/media/i2c/et8ek8/et8ek8_mode.c   |  9 ---------
 drivers/media/i2c/et8ek8/et8ek8_reg.h    |  1 -
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 4787b2c430f8..d46fe7a0eec2 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -816,7 +816,7 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 {
 	struct v4l2_subdev *subdev = &sensor->subdev;
 	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	unsigned int xclk_freq;
+	unsigned int xclk_freq = 9600000;
 	int val, rval;
 
 	rval = regulator_enable(sensor->vana);
@@ -825,11 +825,6 @@ static int et8ek8_power_on(struct et8ek8_sensor *sensor)
 		return rval;
 	}
 
-	if (sensor->current_reglist)
-		xclk_freq = sensor->current_reglist->mode.ext_clock;
-	else
-		xclk_freq = sensor->xclk_freq;
-
 	rval = clk_set_rate(sensor->ext_clk, xclk_freq);
 	if (rval < 0) {
 		dev_err(&client->dev, "unable to set extclk clock freq to %u\n",
@@ -1085,9 +1080,6 @@ static int et8ek8_set_frame_interval(struct v4l2_subdev *subdev,
 	if (!reglist)
 		return -EINVAL;
 
-	if (sensor->current_reglist->mode.ext_clock != reglist->mode.ext_clock)
-		return -EINVAL;
-
 	sensor->current_reglist = reglist;
 	et8ek8_update_controls(sensor);
 
diff --git a/drivers/media/i2c/et8ek8/et8ek8_mode.c b/drivers/media/i2c/et8ek8/et8ek8_mode.c
index c9088eb0a812..914be1007099 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_mode.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_mode.c
@@ -44,7 +44,6 @@ static struct et8ek8_reglist mode1_poweron_mode2_16vga_2592x1968_12_07fps = {
 		.window_width = 2592,
 		.window_height = 1968,
 		.pixel_clock = 80000000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 1207
@@ -145,7 +144,6 @@ static struct et8ek8_reglist mode1_16vga_2592x1968_13_12fps_dpcm10_8 = {
 		.window_width = 2592,
 		.window_height = 1968,
 		.pixel_clock = 80000000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 1292
@@ -201,7 +199,6 @@ static struct et8ek8_reglist mode3_4vga_1296x984_29_99fps_dpcm10_8 = {
 		.window_width = 1296,
 		.window_height = 984,
 		.pixel_clock = 96533333,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 3000
@@ -257,7 +254,6 @@ static struct et8ek8_reglist mode4_svga_864x656_29_88fps = {
 		.window_width = 864,
 		.window_height = 656,
 		.pixel_clock = 80000000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 2988
@@ -313,7 +309,6 @@ static struct et8ek8_reglist mode5_vga_648x492_29_93fps = {
 		.window_width = 648,
 		.window_height = 492,
 		.pixel_clock = 80000000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 2993
@@ -369,7 +364,6 @@ static struct et8ek8_reglist mode2_16vga_2592x1968_3_99fps = {
 		.window_width = 2592,
 		.window_height = 1968,
 		.pixel_clock = 80000000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 399
@@ -424,7 +418,6 @@ static struct et8ek8_reglist mode_648x492_5fps = {
 		.window_width = 648,
 		.window_height = 492,
 		.pixel_clock = 13333333,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 499
@@ -480,7 +473,6 @@ static struct et8ek8_reglist mode3_4vga_1296x984_5fps = {
 		.window_width = 1296,
 		.window_height = 984,
 		.pixel_clock = 49400000,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 501
@@ -536,7 +528,6 @@ static struct et8ek8_reglist mode_4vga_1296x984_25fps_dpcm10_8 = {
 		.window_width = 1296,
 		.window_height = 984,
 		.pixel_clock = 84266667,
-		.ext_clock = 9600000,
 		.timeperframe = {
 			.numerator = 100,
 			.denominator = 2500
diff --git a/drivers/media/i2c/et8ek8/et8ek8_reg.h b/drivers/media/i2c/et8ek8/et8ek8_reg.h
index c90e74935f12..3305986c7c9c 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_reg.h
+++ b/drivers/media/i2c/et8ek8/et8ek8_reg.h
@@ -37,7 +37,6 @@ struct et8ek8_mode {
 	u16 window_height;
 
 	u32 pixel_clock;		/* in Hz */
-	u32 ext_clock;			/* in Hz */
 	struct v4l2_fract timeperframe;
 	u32 max_exp;			/* Maximum exposure value */
 	u32 bus_format;			/* MEDIA_BUS_FMT_ */
-- 
Regards,

Laurent Pinchart


