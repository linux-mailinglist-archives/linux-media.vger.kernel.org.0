Return-Path: <linux-media+bounces-29026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2994A76026
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E101685EE
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6FC1C5D5E;
	Mon, 31 Mar 2025 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGAbz3EX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865EA1BE238;
	Mon, 31 Mar 2025 07:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406491; cv=none; b=KiuBno2FKZ3ovjR4Whof7JMyk3y39qWpBB5t9bfwTUB3k24z5GqgL5xp3TS5hlFh6OG/rqA+ixM2mwi12ogCo6FV8jY2ynsMcQyB++D7zOAiWMLn2kvx2iii5bXWg38nZZ2zuK8SbMfQUfSyNnS424f6Is3ZoPANfvGLalIhMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406491; c=relaxed/simple;
	bh=nSVE5hfepeDgS8o2bHxvN0Mtk+A0NXF3SD3CyYFB+yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OewrDHZ7FnopPzuaPWPxqBw96rvPQrC8FgsoHI1f4YrHMYT4aqKpveawAD8ulTeFktQcxFAnLZJ36mXj16k4YdrQw1DjOM3KyeCFeO+LwdqKvfkosFrgNUBbQrE24ah1Y56Sjd6V8Mp4MltuPxm1oWaqsAIu62/xILmU6RRWdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGAbz3EX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743406490; x=1774942490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nSVE5hfepeDgS8o2bHxvN0Mtk+A0NXF3SD3CyYFB+yk=;
  b=eGAbz3EXltsBDXYP390m2bsv9SZLZy1qVjXxqLQphc4hqs6n7DKu5GpV
   VqTKIUDK6QMJujN/3ZCRkDpul+d7UXlCt8FPZmnxVQ2r16fP0lvTIbkLm
   aMPvR0qX0D9w1s1Qnr0w56XbxFOv59Mt+dZNkN9EPiNEFvw/q4TD7f2EO
   b6MKg53xyuVihDEyl4gsUOgoUAY5y01yji/l6Cvw55gEHpkFw/UriorkB
   kCkbYct3+yYlIbkXI0vNlDqHnTxm81RYf8phsBGzENvwKimq7roYGqQLF
   55079eXMPwg6cI/nTEuxTAphqmF6wSuXvfbEMQ+uhuOI5KS2Hv+Y8CVqe
   g==;
X-CSE-ConnectionGUID: jPgEvlv8R0ChRUWtiauPVQ==
X-CSE-MsgGUID: P2kD/uIbRX2/EU+PlOud8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44688095"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44688095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:34:49 -0700
X-CSE-ConnectionGUID: Ccfl0me3S9OKRlX29nKBsQ==
X-CSE-MsgGUID: qjSxrmgaQB6qYdDa5pLs3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="131110877"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2025 00:34:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C1C357CC; Mon, 31 Mar 2025 10:34:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: acopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: rdacm2x: Make use of device properties
Date: Mon, 31 Mar 2025 10:34:35 +0300
Message-ID: <20250331073435.3992597-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/rdacm20.c | 5 ++---
 drivers/media/i2c/rdacm21.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index b8bd8354d100..dcab63d19baf 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -16,10 +16,10 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -575,8 +575,7 @@ static int rdacm20_probe(struct i2c_client *client)
 	dev->dev = &client->dev;
 	dev->serializer.client = client;
 
-	ret = of_property_read_u32_array(client->dev.of_node, "reg",
-					 dev->addrs, 2);
+	ret = device_property_read_u32_array(&client->dev, "reg", dev->addrs, 2);
 	if (ret < 0) {
 		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
 		return -EINVAL;
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 3e22df36354f..5ea6988de48b 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -11,10 +11,10 @@
  */
 
 #include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
@@ -551,8 +551,7 @@ static int rdacm21_probe(struct i2c_client *client)
 	dev->dev = &client->dev;
 	dev->serializer.client = client;
 
-	ret = of_property_read_u32_array(client->dev.of_node, "reg",
-					 dev->addrs, 2);
+	ret = device_property_read_u32_array(&client->dev, "reg", dev->addrs, 2);
 	if (ret < 0) {
 		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
 		return -EINVAL;
-- 
2.47.2


