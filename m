Return-Path: <linux-media+bounces-35992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A2FAE9F0E
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4165D1C444F9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93C62E6D18;
	Thu, 26 Jun 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQy+wCxp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B702E62C8
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945125; cv=none; b=YYRRodpVZP8V3OrwLLFPhlxuVtEF2+5d++Zv5I94HnkK2BlvcWksZ4lqsX7AfYNzH2zQNtIvkJBzo7YBEizQcLTrp4qKW3v0aGvMLqLPw7uF55mq3r5VulvIKyuLPzkAQa0plxLVe0qtSBUQG0hiVDDAqDHjz9smZqxmllCqQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945125; c=relaxed/simple;
	bh=TlK052INB5CGd5KiLpg+u/OZmJvSP9rAxMus+KiIrV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPszH9+cxXeh90TzWBk6pAZ4Abt7eHH1icpCqvesBUOSS6NIockynjjz2nFzBSFMaR72bkcn9vNqQgmHlzT7ZdJYb6OYpS+MDm27FIQcFXWsueu1BDN0YIC3JJBqTBlsIUzpYVilECnDsuKrKinsY921pgOT2R2v/OSrB0ZKRo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQy+wCxp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945123; x=1782481123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TlK052INB5CGd5KiLpg+u/OZmJvSP9rAxMus+KiIrV4=;
  b=kQy+wCxp01jjX579hmWrfDoh0S3HEcl1Vpxvn+7sXcTfjbKvls4N0DoE
   4qVnZBEq+BCzPpkv4leH04RGiPH6Ta2H0VJtQCZRcMPmwRtFgTuYhULCR
   18NLJ0suHcz/6ojPzgi8AJyHgxUMNaMETqWX3LtZzJIZJ+Ir9hWAznh2y
   U5Nvipcs5Kc3JdunTWrueBTRQ76OAJB51L0zd90ywUMjyckKp/J6zhbHN
   TlaHbbWMjCuTEE7VLYGNsXV+3GoBw/+EZ8C9oL3wXCxgCkGa/bzjdlf6x
   7NFPwOMSqjw9cFb2H1SVZxEucf0MjKF9lko2G9OSg0BMBROTSfEjGQDpL
   Q==;
X-CSE-ConnectionGUID: tllJ8x1MS4OwDSJ0XR4PBQ==
X-CSE-MsgGUID: tFg4Tn4oSCevVLZJyYCupg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922006"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:43 -0700
X-CSE-ConnectionGUID: xKdHZcYrSrWEGuYOmUcO7A==
X-CSE-MsgGUID: 4EBOQZvNTYCTxLOF2KA8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049789"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:36 -0700
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
Subject: [PATCH v2 34/48] media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:25 +0200
Message-ID: <4af4923020451fcb7c47fcfc39fa3e1903af5e18.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov6650.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 9c7627161142..3e37a6436aeb 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -898,12 +898,10 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	u8 pidh, pidl, midh, midl;
 	int i, ret = 0;
 
-	priv->clk = devm_clk_get(&client->dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		ret = PTR_ERR(priv->clk);
-		dev_err(&client->dev, "clk request err: %d\n", ret);
-		return ret;
-	}
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
+				     "clk request err\n");
 
 	rate = clk_get_rate(priv->clk);
 	for (i = 0; rate && i < ARRAY_SIZE(ov6650_xclk); i++) {
-- 
2.49.0


