Return-Path: <linux-media+bounces-50409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085DD11B35
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A633E308C38C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87808280035;
	Mon, 12 Jan 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUe5ENxb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398D27A123
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212000; cv=none; b=hgTCyAF+ldYGVtoKKsT+BpwxKYn+LOpWqtCAN31+t9t5NbVGgtsBn5f3WVbEs9tAMs8vF/XlSUVA1Gn7IoMtWWDCMJeNZJ2M7BBRN6iHeA1L/auxvu2os4VmVGGuklqKiH15TWzIzGzppP4OkrKkojBCys2x4yf0j7/CDax6lqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212000; c=relaxed/simple;
	bh=4352HNxWk50qwuy0nVnPE7CIXKNLOhnZ6BHf7lU4pnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7VSAR/ldW4o7QxAmTtpPOjTnC4EJVzE1bO/7aQcA8NApSEy4vNRdGR1lrcVhlZsftj8RS/Y0WaYLyQJgnTyQHIh0Q2oKiPNUgbJPFxdTKsxO3Dvaa5lOBOshsW/ELAgjdftbp+DAYvlbjYYblRpl3D5o7FO4QDbqWGZYGEVyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUe5ENxb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211999; x=1799747999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4352HNxWk50qwuy0nVnPE7CIXKNLOhnZ6BHf7lU4pnQ=;
  b=NUe5ENxbF16VUgsFEeb9Gz6dtApbQOrWnDR8s774lNetaJRkpGi7iDq6
   dEXbxKvV4nLtntcmSMiySXR8Lxnzk0ah7ioJPigdwPSVacNk13kJyysDi
   +svB3scwvI8LnDcyb++IWNJQ1NvxPdFbc9v+6mL+YweHBE5XN2tS8WDB0
   N52CJauVCOYtAzQqykdKBbYUaQ3hPoyFtVmsZ13iP6/2eSm5ALh5kIMcp
   0Lhw65Ahk+d+Y3xysUcn4BFihJMLtcLKCxAJGQrPnMO+NmOL1IjktrTmu
   MlEta97ow0WZ0eU6XfvaXdy99QlL+s7gomdHrPCTYhQpuHlQKHdkHdD6/
   w==;
X-CSE-ConnectionGUID: u8ZGTC9eQ/G5snCjCVb9XQ==
X-CSE-MsgGUID: 6U0FaWcFTL2p689GgMdzKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218783"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218783"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:55 -0800
X-CSE-ConnectionGUID: 7nz7o31eR7C3TdSou07vMQ==
X-CSE-MsgGUID: V7wvDFLCTCaZq0xAM6Q5ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743097"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:53 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 23B51121E83;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiD-00000000116-41dK;
	Mon, 12 Jan 2026 11:59:49 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 01/23] media: i2c: ov01a10: Fix the horizontal flip control
Date: Mon, 12 Jan 2026 11:59:27 +0200
Message-ID: <20260112095949.3851-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

During sensor calibration I noticed that with the hflip control set
to false/disabled the image was mirrored.

So it seems that the horizontal flip control is inverted and needs to
be set to 1 to not flip (just like the similar problem recently fixed
on the ov08x40 sensor).

Invert the hflip control to fix the sensor mirroring by default.

As the comment above the newly added OV01A10_MEDIA_BUS_FMT define explains
the control being inverted also means that the native Bayer-order of
the sensor actually is GBRG not BGGR, but so as to not break userspace
the Bayer-order is kept at BGGR.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 141cb6f75b55..e5df01f97978 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -75,6 +75,15 @@
 #define OV01A10_REG_X_WIN		0x3811
 #define OV01A10_REG_Y_WIN		0x3813
 
+/*
+ * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
+ * hflip/mirroring by default resulting in BGGR. Because of this bug Intel's
+ * proprietary IPU6 userspace stack expects BGGR. So we report BGGR to not break
+ * userspace and fix things up by shifting the crop window-x coordinate by 1
+ * when hflip is *disabled*.
+ */
+#define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
+
 struct ov01a10_reg {
 	u16 address;
 	u8 val;
@@ -185,14 +194,14 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
 	{0x380e, 0x03},
 	{0x380f, 0x80},
 	{0x3810, 0x00},
-	{0x3811, 0x08},
+	{0x3811, 0x09},
 	{0x3812, 0x00},
 	{0x3813, 0x08},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
 	{0x3817, 0x01},
-	{0x3820, 0xa0},
+	{0x3820, 0xa8},
 	{0x3822, 0x13},
 	{0x3832, 0x28},
 	{0x3833, 0x10},
@@ -411,7 +420,7 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 	int ret;
 	u32 val, offset;
 
-	offset = hflip ? 0x9 : 0x8;
+	offset = hflip ? 0x8 : 0x9;
 	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_X_WIN, 1, offset);
 	if (ret)
 		return ret;
@@ -420,8 +429,8 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 	if (ret)
 		return ret;
 
-	val = hflip ? val | FIELD_PREP(OV01A10_HFLIP_MASK, 0x1) :
-		val & ~OV01A10_HFLIP_MASK;
+	val = hflip ? val & ~OV01A10_HFLIP_MASK :
+		      val | FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
 
 	return ov01a10_write_reg(ov01a10, OV01A10_REG_FORMAT1, 1, val);
 }
@@ -610,7 +619,7 @@ static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->code = OV01A10_MEDIA_BUS_FMT;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
 }
@@ -751,7 +760,7 @@ static int ov01a10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = OV01A10_MEDIA_BUS_FMT;
 
 	return 0;
 }
@@ -761,7 +770,7 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes) ||
-	    fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
+	    fse->code != OV01A10_MEDIA_BUS_FMT)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.47.3


