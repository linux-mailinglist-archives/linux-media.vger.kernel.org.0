Return-Path: <linux-media+bounces-35999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED2AE9F17
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 971D8165302
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696582E7162;
	Thu, 26 Jun 2025 13:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfacuRbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079A2E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945172; cv=none; b=D3EsZKR7+L7vc85vebETn5+G7iRmxjnVg7fydbbJvEFvB8GC0O0cqDEmCOP/2miQaA+SYiAoBtYGnG2V0u/em/ge1APyitWylGp4ki6xvrkr6hETbdsH+f3cOtgorH06EdBPdMU22IS27mKXjn2OUIL/g8hy3jvI2TfIQWwj8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945172; c=relaxed/simple;
	bh=lo7Bih2gnuufghOiFPhTKBYs5lIDIeOpJXNvJKjbuOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1wHoKY00F6FxHRImTJ2G5zikT/nLYgVU5tbUr7oHKzXnncq7dJ18tYIPZsMN7LZKLzqIuvQ6g8ULpH2M8zP64U8bbC4CpHC3mnu52A+mNHdTjsj7QBRSB5CIPN4nf4p4mYmizYtl4Yqe9oqCfV9P/258rbHz48cpTRj9S8KI8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfacuRbW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945170; x=1782481170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lo7Bih2gnuufghOiFPhTKBYs5lIDIeOpJXNvJKjbuOc=;
  b=YfacuRbW1jgVNnVV7vNC/vXsviW9J6efIJ/MzPx2xn4XxrJ9VpToIjue
   gQHgxPNIDZ6YTbz+BJd1A4JsnMCkQSE9UbpyYN4W7Ja0sEPddae7f216B
   jY4tgfyrl7BOrt1e1KSt9Qn84vmQuOHIuzLbPGJOsO97hR5hc5FqQpnSO
   KaQe/Q08NEOP80gZ0TR6rbViza4CMki5Q9/4LVIDYAYRoAS8IcwAQ8ff4
   gw9AnzEwg3yIOWJBOxcdGzl6S3Y+LcUXIrE8i4x0ssTuOPsMrwrOcqyKZ
   kXsai4sQJ9wYcCsiumJqsTHAjzi8QFCAnDrCWt8z7iT1E88jkvC1L78mh
   Q==;
X-CSE-ConnectionGUID: ioZoe5VKTPmNJUhNRvuSAQ==
X-CSE-MsgGUID: x0MFVXFhSFqBtFzcJ7Nh3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922139"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922139"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:30 -0700
X-CSE-ConnectionGUID: N6g+cJuAReOEWRe6vbAx3w==
X-CSE-MsgGUID: TMm2ihY6TfuolEH1b+LLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049880"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:23 -0700
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
Subject: [PATCH v2 41/48] media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:32 +0200
Message-ID: <c52b4a1726aa984fa20be6b6c72101a368526aed.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov9650.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 026ea34d6291..c94e8fe29f22 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1494,9 +1494,10 @@ static int ov965x_probe(struct i2c_client *client)
 	}
 
 	if (dev_fwnode(&client->dev)) {
-		ov965x->clk = devm_clk_get(&client->dev, NULL);
+		ov965x->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 		if (IS_ERR(ov965x->clk))
-			return PTR_ERR(ov965x->clk);
+			return dev_err_probe(&client->dev, PTR_ERR(ov965x->clk),
+					     "failed to get the clock\n");
 		ov965x->mclk_frequency = clk_get_rate(ov965x->clk);
 
 		ret = ov965x_configure_gpios(ov965x);
-- 
2.49.0


