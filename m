Return-Path: <linux-media+bounces-35981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABDAE9F03
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C771C4084E
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE1D2E718D;
	Thu, 26 Jun 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOvzKjkz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB34317B505
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945051; cv=none; b=aujU8xBF2orU2Ni/m0FaM5HLb8V/h4Bq+IJ0aVjIvzfoq93W+Osf1QYx2BHQuMNFdXVz/PJiwkDXBydWBd5zzeKg4s403R/HVtzr/4OTeN9Sq2wxfBPa3ANCp8iqPubLDoosw6a9nFIOUbSb9AHMecBuROtngp+J38ZnOWlmiOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945051; c=relaxed/simple;
	bh=QAM/HrBA3OrY5GEHEtbl8BYq3EnZsa7yWUMJtU+VIxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbNwqRH/X4fBN95ePQ4B4OhJZJf9s9IHflyRDyz3/I3zQx9TpWWqXNUa9o3iPuPQ7JUniAuuMp+rWVDpK0FtzX6VDctz3A4vNUFvyo0vw2rN+el0rHJ143W7Q71/vmZmTl14hD2OgSa8r5oR19CdKGAQsl50F4ZtvCz1dJ79/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOvzKjkz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945050; x=1782481050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QAM/HrBA3OrY5GEHEtbl8BYq3EnZsa7yWUMJtU+VIxY=;
  b=hOvzKjkz22u2z8eIX+1Zr3YIqakD9UEOfvj57Aic14cVZ5ugWo3COAGC
   rfmYlR7sesPef2gxbJ+wm7nmB9dT8zJb7hMYRfQtFo50lDj5+O2qIWbXt
   Vg41tPdPseiaNiMYRu34dURd2XyDEXtcfzUolyr4rC+sFLK2Gl781hNLl
   4AFz5tU49lwk2liK1BjsyXKkfBXbD54DmS+am4+YQHt378gZ7lcj56N66
   oXgb3yLNR7rTri0EmO17TePYo4IFzIXFv7S/oyGm+TQ2Qlrjp7HZSCcnw
   QxtWYXy+7264/Sr5aqG1/ZlM1QdnNIkvnXaUqFjpGrVWb+H89VvusAYGS
   w==;
X-CSE-ConnectionGUID: 5k9A1m+ETYSykJa0129FAA==
X-CSE-MsgGUID: +sZuYpz0T/6tKwIyoKsfAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921765"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921765"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:29 -0700
X-CSE-ConnectionGUID: vA/XVAQOTH+16gSwZnZWvA==
X-CSE-MsgGUID: C8a/zMfsT1uXr+1LKsXBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049565"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:22 -0700
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
Subject: [PATCH v2 23/48] media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:14 +0200
Message-ID: <458181ca848a713c5e82124f9c0c881b5a24027b.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/mt9v032.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 302120ff125e..9f4b4cb9853e 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1058,9 +1058,10 @@ static int mt9v032_probe(struct i2c_client *client)
 	if (IS_ERR(mt9v032->regmap))
 		return PTR_ERR(mt9v032->regmap);
 
-	mt9v032->clk = devm_clk_get(&client->dev, NULL);
+	mt9v032->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9v032->clk))
-		return PTR_ERR(mt9v032->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(mt9v032->clk),
+				     "failed to get the clock\n");
 
 	mt9v032->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
 						      GPIOD_OUT_HIGH);
-- 
2.49.0


