Return-Path: <linux-media+bounces-28138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3150A5F25E
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 12:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 014E817DA67
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95D62641F4;
	Thu, 13 Mar 2025 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yq7yI8KO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E1259C;
	Thu, 13 Mar 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865483; cv=none; b=ICs6jRM3fjdcgXZ1tw9PH2AHTM/SRHksehtrf0d5QOpposf3jeRsMnKiG/GWslzcFhlJyRidlELap9VVdAlLphsgS73ndGFhhf3moJVLDO07NIlgp4AySleQ0SkSvG03IrrB7O73MF+Orb92PFO60YxV+RtPGOodHUCJqPTU9i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865483; c=relaxed/simple;
	bh=R0ywN4y+vCuEHyh+Zpf+KmFkgvUzY+xymGv7fHAtZJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=htJ4itSl8GEa3fhm+Lk42tHwDwSlDvulCwUP7qu1pQymiIeiaLnVPOG4F9kCdFcfIP0k9iL99wmmnnWhExnmYDWm6P+LAytzj6B9ABL4sZzI603pxujkGnsIPcRaXw0jgVawBIdcm19oPjgwyJCYC34iKZEO3oDUUwMjrpPuu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yq7yI8KO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741865482; x=1773401482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R0ywN4y+vCuEHyh+Zpf+KmFkgvUzY+xymGv7fHAtZJc=;
  b=Yq7yI8KOxr+2WwDq0W7+OD9SrtoaVmQMAbFg0vd6osqa/eXdBVgUjbp+
   Iu2xtA8a0mtR3UumMEbmbT1jDvM2M0N5yThnsb6DhPaLjAL989FvNMkL3
   3TixakFoeDNdYJjmjWoqRgOOzQ7RjtEhJ86uTOOgiN6wrycP0KyvlkXQr
   paQ2pFBuRXXa6TcRJ9eyT2PImdwvNXx0mUxE8xylgnEXW38p6KMT1cDRF
   qWiA/cBab01FVK37GuyKuwkPwnbkI2f/XumjgbGkLhPi1ffWgJr2CT8Cc
   QTL/m2NcJz95qf8ZpYjsV913GcW7ruojLA+kHZTVlkuvOAxVh+x2FJq5f
   g==;
X-CSE-ConnectionGUID: ejtY3dFJSEOtIh9B1b7hPQ==
X-CSE-MsgGUID: WWunYxF/S2yqX+QLVatOZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46629182"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="46629182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:31:21 -0700
X-CSE-ConnectionGUID: E8WMDJRxTJ2+Tj0bXEwENA==
X-CSE-MsgGUID: ISfEeGz8ShiqV7BLHEDoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="121425180"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2025 04:31:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E6987214; Thu, 13 Mar 2025 13:31:18 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/1] media: v4l2-core: Replace the check for firmware registered I2C devices
Date: Thu, 13 Mar 2025 13:30:34 +0200
Message-ID: <20250313113115.359942-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace the check for firmware registered I²C devices as the firmware node
independently on type should be retrieved via dev_fwnode().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v3: Use ASCII in the Subject (Hans)
v2: fixed obvious typo (media CI)

 drivers/media/v4l2-core/v4l2-i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index 586c46544255..ffc64e10fcae 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -5,6 +5,7 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 
@@ -24,7 +25,7 @@ void v4l2_i2c_subdev_unregister(struct v4l2_subdev *sd)
 	 * registered by us, and would not be
 	 * re-created by just probing the V4L2 driver.
 	 */
-	if (client && !client->dev.of_node && !client->dev.fwnode)
+	if (client && !dev_fwnode(&client->dev))
 		i2c_unregister_device(client);
 }
 
-- 
2.47.2


