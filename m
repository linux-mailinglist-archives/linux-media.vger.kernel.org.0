Return-Path: <linux-media+bounces-35976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00125AE9EF9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1042C1C445F2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1892E6D0B;
	Thu, 26 Jun 2025 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNFZoD8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CD2E54B9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945017; cv=none; b=TC1f5OZTKIDxMh+le6g8UoT5ZkMmBdDjv5oiXvrwsEEP+e2SRTmBba4zIJb39wCkEXzDGV4gv7yswhz09kMKni7K1A8bVAwj2esv3Wi0xxvpQHsyf8Am2Ypy8vrNb+7oX73uCIwDD+CqAy2QW7q2Cw+W0alD5oaz6kGFHk0wBnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945017; c=relaxed/simple;
	bh=gg8W0GwYfRP/heRBo9hRkaAZ61mdep5mjDTkHL4gl+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkNLyM2BG5sPcZrmdJmm1y+1ErNxBSMFk6NhNtZDc8lP6NmsKTZ35gfKZE/K9XTWp4tytOnE0nWaDtScS/P46CmrtSKXAfWdD6P6HbrmOPf1OYsy0ZbXV1SVs4nx+7197ByoZBPtRHkVrhCYu24Q3TfLcKHMqa7FvteirUdkE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNFZoD8K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945016; x=1782481016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gg8W0GwYfRP/heRBo9hRkaAZ61mdep5mjDTkHL4gl+g=;
  b=lNFZoD8KxWV30YdI//HZu+49BJb47YaNWZKRvn5iVcxKQsJSvC2C0bD9
   9I1bMCVm1+mwkC+UeyRqnSuIMOf6DpB6KTARWn1cnVu5E6CyqPBsmPXQ3
   BscS8U83ItJ6m5dpdVO8S90WFcXhjbAC5StJjt5Q7SK1eNPuxI61ICWfB
   bIFnSnsHbs7T/GZAUDXTnF5EtEV6T+XiWVj3UAZBAy+6mAKrgwozIhnm9
   nwX9gsQRFa9388bpJKejiEr4l3yfHijV2q+eqVhUEbux913FvTCZBFqsN
   ygmIGeblhdJFPEtv+bQoWMaZgBGFpG6HMnYkx4HkGj6QG/RcmYP5Fna0O
   g==;
X-CSE-ConnectionGUID: zY4gpYfOS7miUvfaiWQ2cA==
X-CSE-MsgGUID: 7hpNSMXhTOm68Ry41vPoWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921570"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:55 -0700
X-CSE-ConnectionGUID: X8XLTVivSPuNxBxJXv/MPg==
X-CSE-MsgGUID: mNtyAehcT1GHpQmSJqKlrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049494"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:49 -0700
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
Subject: [PATCH v2 18/48] media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:09 +0200
Message-ID: <02481b8e41cb348a21e491a814d08846c2330bfe.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 12d3e86bdc0f..7a6114d18dfc 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -743,9 +743,10 @@ static int mt9m001_probe(struct i2c_client *client)
 	if (!mt9m001)
 		return -ENOMEM;
 
-	mt9m001->clk = devm_clk_get(&client->dev, NULL);
+	mt9m001->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9m001->clk))
-		return PTR_ERR(mt9m001->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(mt9m001->clk),
+				     "failed to get the clock\n");
 
 	mt9m001->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
 							GPIOD_OUT_LOW);
-- 
2.49.0


