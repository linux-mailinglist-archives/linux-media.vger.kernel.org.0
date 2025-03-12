Return-Path: <linux-media+bounces-28101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B83A5E454
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 20:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 778E217B742
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ACE2586CC;
	Wed, 12 Mar 2025 19:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOnu/wBr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094F1CF96;
	Wed, 12 Mar 2025 19:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807544; cv=none; b=qqio9kyyBIV3vZQn5j2CTMfOXUHpp6a8BEnuRoLaN0y3Ft7LCv07FacK1rYwGGGV1o41fN0HTHmogT6Rbj2M+i/D31P3acGv38Qux6jJcT3W7aankT8PjSAYwoYok5rnUhfDx+xdcGk/gNnpCUGhj47D3hktoEwwXyQ0kAAEkqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807544; c=relaxed/simple;
	bh=fy3R2fOQj+oEKlbaGBCNURzWpqtJgy8zdkZEUZFK1Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g8gvmpwN7GVO5hDmFHTcCm9Va5wayv8xN0kKU+B6xsQBX6p07sGrAEkKnWvg8v5tTWA80x7s1B7B631JEvoODh7w4FRXwNT8yQqV5bTbJjFIjRsFg8CtDeXZnWenXM1EmcZiT7QNsEfHvtXfrKWwHKhwxDliC19wcSQZxdydhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOnu/wBr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741807543; x=1773343543;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fy3R2fOQj+oEKlbaGBCNURzWpqtJgy8zdkZEUZFK1Jk=;
  b=IOnu/wBrvqceHInQKZM+Vy48c8CgqUVKxChDNzNamXIM7fUHLclpTB9l
   Owd5osxQu1KTEu6W5iHaOnuYgpz0z6Bb6dujHcHUXEzxfbTxT1UFgNj5v
   ndECm72bG/QbLwNelKtjwWdyXmFkBY0US9+hEIexBhHkbwJAjpnIwu8/e
   fXVz0EP+wLPaTuiPlpi4lxEWwFOuG1ER3Eb84bHEyDo9DJ+1rq0V2NxNi
   w1G6xp8g44fTGCQK2DA+G4GxcWmubl3DoI9XlxI/S0Lidq/bkugc5VEe/
   rFMaGapUF27rgGrl5K/BlKOgZNsygBnfnrGJpXd0blSiQNob4SwZAefgp
   Q==;
X-CSE-ConnectionGUID: dlq64jMsQyK3XNqLpfEn8w==
X-CSE-MsgGUID: Di028o8JRiqG3AmIodrrKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42781136"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="42781136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 12:25:41 -0700
X-CSE-ConnectionGUID: sDuS5t/lTM2aTM083jMVcw==
X-CSE-MsgGUID: IpVfOIAfRzqYGnciYCfUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="121227082"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2025 12:25:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3EC641F2; Wed, 12 Mar 2025 21:25:37 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] =?UTF-8?q?media:=20v4l2-core:=20Replace=20the=20ch?= =?UTF-8?q?eck=20for=20firmware=20registered=20I=C2=B2C=20devices?=
Date: Wed, 12 Mar 2025 21:24:43 +0200
Message-ID: <20250312192528.95838-1-andriy.shevchenko@linux.intel.com>
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


