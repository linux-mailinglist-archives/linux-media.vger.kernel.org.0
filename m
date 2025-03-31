Return-Path: <linux-media+bounces-29041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 962A0A7627B
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D09FC1889AA1
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4DF1DB122;
	Mon, 31 Mar 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liwDrSg7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D115624D;
	Mon, 31 Mar 2025 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410118; cv=none; b=D7TGnx2ZtYTRj9aKZa4ETUJZ18knO2XMIJv7RVrGCLlFgkLRe3K+w2UDp0p8Db8rz9FGjeKhkc37Cd+sABHnkHoBqHMfvmGiBW74/vDOd43MgIwvTxqMlanZNQuK9CTSGxSx4KUtVrnyO3/bt7g/FdCv+SRFvypf8bUKS4KzGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410118; c=relaxed/simple;
	bh=aGnYakvsH7xDDJtDY+W1CWo7Y/gpIZ5cGUAItgG1C1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qztRQjrhC6Jl9dfeTvAmWtu9xZfXgV1LfUkRDsQq+8yswqdrJpjpokttz/QYRuEdru7LMH9bdFxhmTWYsiGt+GWYenxup+5LxlE51Vo3fiKwLAy87RlL5rT4Sjel/eNE2GrTo2g28XFGqhJmQTQy4VteTsCEiHsvDzY2upcA104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liwDrSg7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743410117; x=1774946117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aGnYakvsH7xDDJtDY+W1CWo7Y/gpIZ5cGUAItgG1C1E=;
  b=liwDrSg70SlItNo/RzFIeCTGnS+AjpiLVNnel8sALJc6GbbQnCQ85Ttj
   byJGoAoHGBGtuZmY2Ku3CSX9XUdg7EQaUvdmQ5aq1HvRl04o7bH2RmQg8
   Sj6a/lI1tLNO7JuPebtQJuk/yHsHvOMdt8Z6atkGIG39bZB02PBpibgq6
   E5nFGfQOCFi0Edyyst3E2k2LK+KP+JZHehCekZhmQdNnRAtlk+RYn31iS
   z2GzFSvL+pMEVg5QOoTAK5K1bMEZlU6G5JlxuAKmSlkSomH5olutEaUqp
   UKCfXzNBQDMAo4G0iyBV382m6viP1xLHhtDG9LzQ3IruJhB/gdMDW0rEP
   A==;
X-CSE-ConnectionGUID: SYM5F76mSuqjKHngujLHGw==
X-CSE-MsgGUID: e6PfTsiKTimzbIAkUmKlyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44846878"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44846878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 01:35:16 -0700
X-CSE-ConnectionGUID: rW1TUERJSAG6nR3NMTm4sw==
X-CSE-MsgGUID: iru2veDNR3WQuH0GqtAvJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130737944"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 01:35:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 782E81B2; Mon, 31 Mar 2025 11:35:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: acopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] media: i2c: rdacm2x: Make use of device properties
Date: Mon, 31 Mar 2025 11:35:04 +0300
Message-ID: <20250331083511.4005934-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed error message wording (Kieran)

 drivers/media/i2c/rdacm20.c | 7 +++----
 drivers/media/i2c/rdacm21.c | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index b8bd8354d100..52e8e2620b4d 100644
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
 
@@ -575,10 +575,9 @@ static int rdacm20_probe(struct i2c_client *client)
 	dev->dev = &client->dev;
 	dev->serializer.client = client;
 
-	ret = of_property_read_u32_array(client->dev.of_node, "reg",
-					 dev->addrs, 2);
+	ret = device_property_read_u32_array(dev->dev, "reg", dev->addrs, 2);
 	if (ret < 0) {
-		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
+		dev_err(dev->dev, "Invalid FW reg property: %d\n", ret);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 3e22df36354f..bcab462708c7 100644
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
 
@@ -551,10 +551,9 @@ static int rdacm21_probe(struct i2c_client *client)
 	dev->dev = &client->dev;
 	dev->serializer.client = client;
 
-	ret = of_property_read_u32_array(client->dev.of_node, "reg",
-					 dev->addrs, 2);
+	ret = device_property_read_u32_array(dev->dev, "reg", dev->addrs, 2);
 	if (ret < 0) {
-		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
+		dev_err(dev->dev, "Invalid FW reg property: %d\n", ret);
 		return -EINVAL;
 	}
 
-- 
2.47.2


