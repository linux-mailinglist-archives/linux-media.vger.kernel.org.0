Return-Path: <linux-media+bounces-35983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D030AE9F07
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E551614C5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4375F2E6D2C;
	Thu, 26 Jun 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHM+WKoj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FBB2E6D0B
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945064; cv=none; b=S6WWq1akAGrrcdD66CdkTI60t5JjwpRd2X1Y/BXybfqnBw7wElCZ8AzuA9b3Izk8hjTG6yLq5bcQS9U19gvJQzpFEc4BxrvHBLcBGG/SaBl0T5hmsz78LoYKX6ucIg+0t0/enW4Bjd3QxwVIXx90ZNiZBgjKq0vxMh3dytOqkiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945064; c=relaxed/simple;
	bh=m+4TeE865sHPh3Ufqx1NOFw2rXrklXvxjLQREqKit0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SvexyA3/YEuJ5rjQAang9iS1GHOhpNNbnePkF1tBXb+ZCYP5hw+Jh3PZUusAdN85hK20dZtdawjzt2zS2bSqhBcYNlJY2QvRU0a9/MH6pyKUCfw8Tw+vXnrIkoN+/VcglzYyiDT+Nc3unt9S8/htNl/slrVwOBj90KYWFbx56dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHM+WKoj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945063; x=1782481063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+4TeE865sHPh3Ufqx1NOFw2rXrklXvxjLQREqKit0Q=;
  b=dHM+WKojjk8fmHYSjkdBIC6io5L8y6166qYsmCN/0eTd/ZyoIFZii8vA
   h3m/LrCC3ZQ10WtsILmlS5s5/VI7SOz46+yDyU6TMtRNfgBn/AkyFSs78
   rrrp38z4IUi5gRgH6R687FqktXSOP84VfkEjamDvZQw8vyNX9Y6LVDiR/
   n9EXL9G4DU+B2381WLl1vO2kr+7opfBNejD5P85UJYK0Jsfv7ZYavIe+V
   M9GeyDnpQPHBuExt8YCd5jopOm8bWXbNQHIj1wmbNbdlFVAuBKj9G2RwA
   ENUvbLYdoH7up9O7eZf19REujnzX+1abb89BmmF9+FziDmBS8yng9EkhV
   A==;
X-CSE-ConnectionGUID: qQUgaBh7T7yA+NWWphKz3A==
X-CSE-MsgGUID: OEtYpdahTf2kVZyEWQAbPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921810"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:43 -0700
X-CSE-ConnectionGUID: YzPoowUJTci5TuyIyRJWuQ==
X-CSE-MsgGUID: ttrmFW2wTm2Zp2lDd1ZwfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049587"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:36 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 25/48] media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:16 +0200
Message-ID: <311a9c5220c2f910c2c110c3985f7a3af987a224.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper
devm_v4l2_sensor_clk_get() that works on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 6c30e1a0d814..74fc0687c849 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -885,7 +885,7 @@ static int ov02a10_probe(struct i2c_client *client)
 		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	}
 
-	ov02a10->eclk = devm_clk_get(dev, "eclk");
+	ov02a10->eclk = devm_v4l2_sensor_clk_get(dev, "eclk");
 	if (IS_ERR(ov02a10->eclk))
 		return dev_err_probe(dev, PTR_ERR(ov02a10->eclk),
 				     "failed to get eclk\n");
-- 
2.49.0


