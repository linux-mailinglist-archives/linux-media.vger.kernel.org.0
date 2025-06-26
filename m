Return-Path: <linux-media+bounces-35961-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DCAE9EE2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AD2D3BDE73
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4000F2E5437;
	Thu, 26 Jun 2025 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMc+ghXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1B2E1C65
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944915; cv=none; b=OqV55edR8wPrYq3lDAS45WU3CEwqWqp4ivjkSY6vP/KtmraaoBXqGUbvlCK3ZAltNlCm+9LUt/XwCTobM1/o9ivBFtA9YuwYAaTAB36/sUgUXP77izg033aFBoawJ8bn3salmeF8dxJPQIGlJ5mMB5sCHdfQsmU6qBkBCpDnc8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944915; c=relaxed/simple;
	bh=1h1BHN4rd2rOfv/qZjoIyCr0clmk8yMLOzg4ygy7TSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lQnui4el/KSnXnzsCqxhBMXOvPrRlFStFfBcHrw2bStKC3w9Egkbcfj5laaPw+BB99u71Y7FUh87vzhokt+90xuxkHmRLqLyxqaaVxJ35orfC/vyn+KKMrry6ssx9zcPqQj2vriU4NTUfnw6ufDPOUAop5ggikW94whDsxmv5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMc+ghXT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944914; x=1782480914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1h1BHN4rd2rOfv/qZjoIyCr0clmk8yMLOzg4ygy7TSQ=;
  b=HMc+ghXTYxsxueadQk5HN0bdEG+qyRUdMlOhpnuVDSeVkUzac0anAeMP
   It9KjzloiSayXpvF9To1P72FR3W6djnBWBhuwdJl4FIRiewpfilOA2ODM
   rOB8Z6SbNp3xtXgq5ciNMg1Ybz3Qa7St+O6fCWLhhuxjubnTENbfuhDPr
   fc65WOR3LF72f4TRrwe6FCqGIPAZfvdqW9LFNbX0o9RHACatcX+CDZVPZ
   qKTSHr0F0SsDX+2IeQVuuZr6S7bdNFbENHyt7dLaw1fORQxEOp43TymSf
   1eHsoSHA4Al0iWN7p22USExcVN2L4Ei+JIzMVmGShR6KQwt7g5zSlEd9v
   g==;
X-CSE-ConnectionGUID: qMpup8BATgWDdBIrmTfZjQ==
X-CSE-MsgGUID: JBfCX2NBRmuDHM/6ztjYQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921210"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921210"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:13 -0700
X-CSE-ConnectionGUID: J6iVVMF1S66MEj1fPx2Ibw==
X-CSE-MsgGUID: KVmx6ImPSOuZomrFPdegYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049316"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:07 -0700
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
Subject: [PATCH v2 03/48] media: i2c: ar0521: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:54 +0200
Message-ID: <abee0a45d9fe56c9ef0e6eac6db19d8d45cfff6f.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

devm_clk_get() fails on ACPI-based platforms, where firmware does not
provide a direct reference to the clock producer.

Replace devm_clk_get() with the new v4l2 helper devm_v4l2_sensor_clk_get()
that works on both DT- and ACPI-based platforms to retrieve a reference to
the clock producer from firmware.

Acked-By: Krzysztof Hałasa <khalasa@piap.pl>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ar0521.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 24873149096c..939bf590d4b2 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -1077,11 +1077,10 @@ static int ar0521_probe(struct i2c_client *client)
 	}
 
 	/* Get master clock (extclk) */
-	sensor->extclk = devm_clk_get(dev, "extclk");
-	if (IS_ERR(sensor->extclk)) {
-		dev_err(dev, "failed to get extclk\n");
-		return PTR_ERR(sensor->extclk);
-	}
+	sensor->extclk = devm_v4l2_sensor_clk_get(dev, "extclk");
+	if (IS_ERR(sensor->extclk))
+		return dev_err_probe(dev, PTR_ERR(sensor->extclk),
+				     "failed to get extclk\n");
 
 	sensor->extclk_freq = clk_get_rate(sensor->extclk);
 
-- 
2.49.0


