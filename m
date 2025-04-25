Return-Path: <linux-media+bounces-31047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476CA9C4B3
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6B7792043A
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7957D23E32D;
	Fri, 25 Apr 2025 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvTyGxfO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D35923A9AD;
	Fri, 25 Apr 2025 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575679; cv=none; b=GH4OqlGODtV8Rnxz9TEbD3jT5oOwPz4OjeMLf7eupwqK91+qqb0yvqQfs6qBc4fSlG1sARVcOZngsjumaRxBFZmH/MAcxfq2mCT8oDjbcsEa2jeICXEJ5pkn/7nFCIJBxEbf8q43HFXmeBOViqw04tE/WDIymKMzBDvpdczlNXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575679; c=relaxed/simple;
	bh=E1N3uydZYxb6NmwdYyU4qdeY7atKa7K2XsdZZPOcJhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OXEpDx/VnEYXCdUKRd71EQhQgOJsj9IuFmh40C6MO5G1ijH0UIhcFJte4qS54kQD5HfClM4w5aabnSUUcv35x40P/mRZD74lW3GGRjCixitWTu34Esms8fYVszfkdeGvCccZ+zOPDUGwTuYcKZ+bVnsh1+1r5TkXz07j9GYNvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvTyGxfO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745575678; x=1777111678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1N3uydZYxb6NmwdYyU4qdeY7atKa7K2XsdZZPOcJhQ=;
  b=XvTyGxfOdimZvHm+0YEsCzrzxs0LfIvyz+3ZtI9bOQZsBrf6Hdofrw+V
   /XInd+i5kPkAArSnT+hPZVhP7OI02BJCXAiIM5UoCtCjzsJRyGUoRjM9o
   FEFsVBFZJPwqE0IdQmWiwHKWr2xCrJ7z37vFqmNSh7u/dhZtac57GFyny
   R798WxMDZRLEixgB+lR3oDbE1u40mzsabXrQsDc2w7B303+mJfb0SDeZj
   R86EbhHf2ek9D3+mszCNqWL1245bHOmZ7I6b4HA+pYm9/Ewxzt6+UJDMN
   khe8uoQQBh1c633HfPAaxg0b4w5xXk9zMaUDWfGoQ/xr57yJcR893/G+W
   w==;
X-CSE-ConnectionGUID: FQpcc3fyRCWmi91mIsY7pQ==
X-CSE-MsgGUID: H+LlXwyjRL2FAgn0a+khFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46353296"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46353296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:07:58 -0700
X-CSE-ConnectionGUID: UPSrGiqQQqq6bfvVG5wXBw==
X-CSE-MsgGUID: RTR4pQxzTRCm3O2wU84C2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133848678"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:07:54 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: stable@vger.kernel.org,
	dongcheng.yan@linux.intel.com,
	hao.yao@intel.com
Subject: [PATCH v2 2/2] media: i2c: change lt6911uxe irq_gpio name to "hpd"
Date: Fri, 25 Apr 2025 18:07:39 +0800
Message-Id: <20250425100739.3099535-2-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425100739.3099535-1-dongcheng.yan@intel.com>
References: <20250425100739.3099535-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lt6911uxe is used in IPU6 / x86 platform, worked with an out-of-tree
int3472 patch and upstream intel/ipu6 before. It is only used on ACPI
platforms till now and there are no devicetree bindings for this
driver.

The upstream int3472 driver uses "hpd" instead of "readystat" now.
this patch updates the irq_gpio name to "hpd" accordingly, so that
mere users can now use the upstream version directly without relying
on out-of-tree int3472 pin support.

The new name "hpd" (Hotplug Detect) aligns with common naming
conventions used in other drivers(like adv7604) and documentation.

Fixes: e49563c3be09d4 ("media: i2c: add lt6911uxe hdmi bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/media/i2c/lt6911uxe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index c5b40bb58a37..24857d683fcf 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -605,10 +605,10 @@ static int lt6911uxe_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
 				     "failed to get reset gpio\n");
 
-	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
+	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "hpd", GPIOD_IN);
 	if (IS_ERR(lt6911uxe->irq_gpio))
 		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
-				     "failed to get ready_stat gpio\n");
+				     "failed to get hpd gpio\n");
 
 	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
 	if (ret)
-- 
2.34.1


