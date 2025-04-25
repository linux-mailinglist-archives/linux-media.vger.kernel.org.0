Return-Path: <linux-media+bounces-31052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B9A9C60E
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 12:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50B973B78A2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D0D25A2C2;
	Fri, 25 Apr 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+B9j7ZK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BE1259C91;
	Fri, 25 Apr 2025 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577833; cv=none; b=l2kXcix5+ulV++hdz/prv8cZ8nvP+uC2ssNh8DTv5ihVGYuk07R4/PXrP0dnw5gaOYCpEbctd1qspY5OB/Eys9/9lwJANOZvuu+XpPsuUf0R9UK+W4w4StJyd987JrjojS25uzzd3oUmGemc65wBsEYnDqVaJ5SYkS/9heWA+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577833; c=relaxed/simple;
	bh=E1N3uydZYxb6NmwdYyU4qdeY7atKa7K2XsdZZPOcJhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i6OCENf8ffIjd7fUCuancU//SSlmOniiDtpp1sSqB+CDzOB/19QIae/ws04CwEOc1VOZLlODqQkaMHzHJAHA0HA8tjRG9oTyQKFViqc6V+E8WCcSJtZOJtJKRRrnFFh44k42jyjMhF5guYnr/eVSh7UPKNUeq1lGe7cRWGz+pDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+B9j7ZK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745577828; x=1777113828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1N3uydZYxb6NmwdYyU4qdeY7atKa7K2XsdZZPOcJhQ=;
  b=B+B9j7ZKBEdDdr4ZZeaTFknhT6o+1mSeb6wZBod0wESvGmhOFIhJ+o6Y
   fuqjb4NVdo/xLO5/5ckkmfzOQGayW+hOG22Q7eL3ojPpxlyPlJx6bciB/
   muZKAS4/UWXFltCLIg2ebbTX+5NczRMueS1Lk8lJDaqVJlrZPXA9kw7ZI
   QaT3oKgcxOX3/fFc/xlRuWC4kY4B02kg2Dd89JAw7gfuNqP3/bkmDikBV
   icARnO2XpufWDgSCpQzQHdO4DMVgHde/lznWGyiFKtwzyYQ1fCfgeDraB
   Y5py0Sk/rwviDwPvyeH7f1ZaKCQNrzZxjdOYz5E0CjRVpVW0dRlrmPbbb
   A==;
X-CSE-ConnectionGUID: 5hTdum4GRtm0f7PFF/JUkA==
X-CSE-MsgGUID: eaYUKteFS3CZ/HMPFUBS8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47147124"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47147124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:43:47 -0700
X-CSE-ConnectionGUID: eSFWTV22QW2n5CkDVYI6OA==
X-CSE-MsgGUID: HbIiFnCrTsedU3vg8BTd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132617996"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:43:44 -0700
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
Subject: [PATCH v3 2/2] media: i2c: change lt6911uxe irq_gpio name to "hpd"
Date: Fri, 25 Apr 2025 18:43:31 +0800
Message-Id: <20250425104331.3165876-2-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104331.3165876-1-dongcheng.yan@intel.com>
References: <20250425104331.3165876-1-dongcheng.yan@intel.com>
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


