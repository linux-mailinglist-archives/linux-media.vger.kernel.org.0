Return-Path: <linux-media+bounces-24938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BEFA16A94
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26B957A41AC
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CA61B4237;
	Mon, 20 Jan 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNJ69LY2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B1A1AF0B7
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367892; cv=none; b=hCLJHfY4D92Y5A60RF3+w5ENiKSAvPB9Swv/e2Me26qCb/qvWoy4Z49HitxbEPHGP8OLCfOxWgjBQrSU7NQ+Nyuoas0T4uNVgmlGUUWEpw+vadnhZCe3PLaQvuTZCnER0OgslrM9sOMdoT5ru9fnCVtj7LWqeoIVN1oEEUBfDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367892; c=relaxed/simple;
	bh=e400HTqV+iT4SlHRbibUYHkFfH8/8Au7j4wclEjQSxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YOFOhHnnxU3V5aY0NTYEK9tU4sxVZjtugvZcmErKz/DWYplp2Tn86+OrY063QDnXywUO4p4LQG1jXcgR+b97faXPlTLVs2CEbr4Ms3aQBQEC2QfCKUVMRSTnscWjrce1m9fwT1bzKZSW0os9pu3e8Tc/tGsxFK3NubC5oNjd0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNJ69LY2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737367891; x=1768903891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e400HTqV+iT4SlHRbibUYHkFfH8/8Au7j4wclEjQSxA=;
  b=NNJ69LY2n7dD2UrKhKufv/SnEsuzsX5E9UCwTQaRW+yUZwBLine5bdpB
   0IhePc24p5+TVqNN8z1HY9xT3s2Ty84dZVe0/GipDRhhJjSX37Z98VxUY
   K/0zd9pWhIu4EjczBrvk3qLHt2KOJjBVDBA5fOBT1fGGMk20X+5rv2F0O
   JeR8f6c+5t/5B2tpamsxDNObht5MroeT0DGSKzavqU0mNk78ao5seap5x
   r/FQaIUs6lWQXhfhHy1fCbC53g2zh+uHa5Fba+Si7pDFfGi0tWZ/hFyL8
   YXFda06ZFidcmCNz3IFF+lKO0ec+NoT3tTGBV9E/60gJ4NjlNCIWt1h0U
   w==;
X-CSE-ConnectionGUID: 3Om0C83uQri8Ik/mH0Fw/g==
X-CSE-MsgGUID: 8kSDHt2OScW1CNLJ0WSkoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48740915"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48740915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:11:29 -0800
X-CSE-ConnectionGUID: 2iqz3a2cSm2aiH+P43RLoQ==
X-CSE-MsgGUID: VHy7miMPQ6iLCP5ihk4Now==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137360854"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:11:28 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4502D11FA93;
	Mon, 20 Jan 2025 12:11:25 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Daniel Scally <djrscally@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] media: i2c: ov7251: Introduce 1 ms delay between regulators and en GPIO
Date: Mon, 20 Jan 2025 12:11:23 +0200
Message-Id: <20250120101123.148482-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
References: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lift the xshutdown (enable) GPIO 1 ms after enabling the regulators, as
required by the sensor's power-up sequence.

Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov7251.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f3e2d26bb840..3226888d77e9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -922,6 +922,8 @@ static int ov7251_set_power_on(struct device *dev)
 		return ret;
 	}
 
+	usleep_range(1000, 1100);
+
 	gpiod_set_value_cansleep(ov7251->enable_gpio, 1);
 
 	/* wait at least 65536 external clock cycles */
-- 
2.39.5


