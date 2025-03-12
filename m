Return-Path: <linux-media+bounces-28092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE7A5E2E4
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 18:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37BD3B8C4F
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 17:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ED5226861;
	Wed, 12 Mar 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A424hJil"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651584D13;
	Wed, 12 Mar 2025 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741801283; cv=none; b=HTpRm6az/TPQj7ITjqBpaB+uYcdaolhF4McpfqbGpolD2+s1oLegeI642pJkNOZMN1SCy2MwcIOzFjiPMDvfWDfUc4RVABi62DmAU+jGEJXY5wTJK+IJaCx4NsPPbJEH7DlcZ5fX2+Lcvi0vm6h6RU2zvUZOaohvHYtJgZr+qgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741801283; c=relaxed/simple;
	bh=/QC75ESJMMg81ec0pLpxP5EBfXMavCojHAWP6JBnLG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jdrt7pCboPoIbPHcGbBWrCnT8Xxr+r5h3tbB5qe9lVr+LiwffQ9ri+pBGsIMVH2G+YX0ECoWmZQHgFKOLffLFE/yr9uM4Ss8rBO2qEfblGY0Aln62BFWJFgVZQBVvCWRWbhxkVbAKg9KdpxkmAAmMx2RhkcFb5YUFhZjWYk4ElE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A424hJil; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741801281; x=1773337281;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/QC75ESJMMg81ec0pLpxP5EBfXMavCojHAWP6JBnLG4=;
  b=A424hJil0/GsEkbRJC6takU8tTeN4Gnt1iTKr8NPRKeGwsxKKcNKtqgX
   D2r92tgV4HCutducIAW4vVIxSZ4abNteNShKem3obocTR8m8vJ2LBO/VM
   icJWQDg1537ykM9Xk+h2JjfI6Z9w4QIWUrgzshvnJL8A0sLjcUPRJ4RHw
   X+MnCKQRvprDy7cfdN4/1ll6epOI1rvCs37EPrAvIKEXMPlXBKMIag6iA
   xF8iAXfUbXAXWP2lczn89ZFJ3xHphwQ5L3+ebe8lMPqOB1aUAe+maTQNV
   WMX8muWc7fdmYgI3fKHuHGfjW/N9jGIwARxjTU5xtAB4qOIocxxgqaKmn
   w==;
X-CSE-ConnectionGUID: YATPqN64RNiYZA0yDNvT9Q==
X-CSE-MsgGUID: 8xjTqrqBR16iqOKDHdJmlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53544642"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="53544642"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:41:21 -0700
X-CSE-ConnectionGUID: faG427GTStW8lvl2uOYqvQ==
X-CSE-MsgGUID: lLpfWNGHStStUTJgAADquw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="121206117"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 12 Mar 2025 10:41:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 878E51F2; Wed, 12 Mar 2025 19:41:18 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] =?UTF-8?q?media:=20v4l2-core:=20Replace=20the=20ch?= =?UTF-8?q?eck=20for=20firmware=20registered=20I=C2=B2C=20devices?=
Date: Wed, 12 Mar 2025 19:41:16 +0200
Message-ID: <20250312174116.4111623-1-andriy.shevchenko@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-i2c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index 586c46544255..3b83223182a8 100644
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
+	if (client && !dev_fwnode(&client->dev)
 		i2c_unregister_device(client);
 }
 
-- 
2.47.2


