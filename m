Return-Path: <linux-media+bounces-29020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE1A75F28
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 452C43A8171
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E821AF0B4;
	Mon, 31 Mar 2025 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/ptl5dH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B71A7046;
	Mon, 31 Mar 2025 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404520; cv=none; b=f1oolY3Jpfck3QSKlbHUIoMZYVHfcaH8rR1wmhFT8n9LRYfEa6Yx8Q6jsxjSlAAPP9NE3j43LrVnYye73ppEAaT4eY8ZiG4poCOffD8scjyT08RcvKyavgTDtOvgireCrYuRoTSaL+SrmPY3TCUgWOVB6Css6mtYFOea5svzFlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404520; c=relaxed/simple;
	bh=pN6YgnxoDSNumWsRRtfqjbEBEDqRhtF3GbKrK2xuzOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gt1KJK084pe5NgrANVL3VWlYy5M3/ouRVErxhJ4Rh/pNZRgJLr597+4asDrogycFtNQT7GCCybm4FZ5Bi3PpRrfv+YBkg1aLwyAdby61pR+5wDAxmWq8Q4eF5i1UqmCARjf7DGmUrkjw9CAo8lDbz0W2KZNxAfNAxJ3utkow38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/ptl5dH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743404518; x=1774940518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pN6YgnxoDSNumWsRRtfqjbEBEDqRhtF3GbKrK2xuzOw=;
  b=D/ptl5dHD85brC3MQ6EY3lcF1W4XEsDBcbeZvNoPZisPCu0TKvlqBHcO
   vrG4/Qq0BtqHwTm/uJ42v4Rxb1trGg4k3d0/EFpgFsRy/VQyzX74aBT+N
   9aXUGFPLHlMaNT7nKh0flERTlG3xdgBzGdsMcRMX8n1ckdAeF2AJO0K3I
   cq5AK8PQgmfw8ECJ2nF5X8csONSWrWlWFBkeXOS4jAawa20CK+RYdiR6H
   zcX3Y6M8hRN2+RDIjq9/AkM03tL/VGbbjYjBueL1k/LRIcvLa4GKpF5ne
   FDfmLaeUAib4olzBEqZmknXlslkUnVzm3mQeHtH+e4RBo+btN20PjmcOc
   g==;
X-CSE-ConnectionGUID: sSgaFfsyRVWh9RGMqUzNdw==
X-CSE-MsgGUID: 6FSQLSxVQTu+kpcMkyhIiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="62214144"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="62214144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:01:57 -0700
X-CSE-ConnectionGUID: ETmskSCUQQSKG8nOcNqTXQ==
X-CSE-MsgGUID: BfhdohG2QjK61DNjMI6AFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="156936095"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2025 00:01:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3E7381B4; Mon, 31 Mar 2025 10:01:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: max96717: Drop unused field assignment
Date: Mon, 31 Mar 2025 10:01:52 +0300
Message-ID: <20250331070152.3985520-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is not using gpio_chip::of_xlate() callback and hence
the of_gpio_n_cells assignment is unused. Drop it.

With that done, remove unneeded OF dependency and extend compile
test coverage.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/Kconfig    | 2 +-
 drivers/media/i2c/max96717.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e45ba127069f..8889f154f22e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1641,7 +1641,7 @@ config VIDEO_MAX96714
 
 config VIDEO_MAX96717
 	tristate "Maxim MAX96717 GMSL2 Serializer support"
-	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
+	depends on I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_MUX
 	select MEDIA_CONTROLLER
 	select GPIOLIB
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 9259d58ba734..30c5ca0e817a 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -357,7 +357,6 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
 	gc->direction_output = max96717_gpio_direction_out;
 	gc->set = max96717_gpiochip_set;
 	gc->get = max96717_gpiochip_get;
-	gc->of_gpio_n_cells = 2;
 
 	/* Disable GPIO forwarding */
 	for (i = 0; i < gc->ngpio; i++)
-- 
2.47.2


