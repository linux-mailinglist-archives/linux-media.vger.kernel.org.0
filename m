Return-Path: <linux-media+bounces-35979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4435AE9EFF
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30A5562B67
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCCC2E62C8;
	Thu, 26 Jun 2025 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS736sVc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA62E613A
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945038; cv=none; b=ImmqSK9m3UrpvVaNXmg76qiL+D/xulGyYpkwHuTcACaUi7ougQen3Fo92LLxJztIvXmKR7hvrPS835XiL9/Ch8/vBM+Rp/jzGNg0M+RJHdM80TZNdOvI3i90S1gaKs+bw5XrxAc+gcr0keo/FGDUqEMtDOuhWQLTagMAXnqOu4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945038; c=relaxed/simple;
	bh=/ggT2zpn+JNjfS2uPZzJC1uDTGKa5jb6fuzHkgFE6Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DG4P8uQPKw7wvu12RcBFjBKGVXYbGbP6fidFvPR7cqDRt45aXxMajXvk9qtgJwQog498Ly8s3VQBPmOAQB9q5m2/WHevKsjgnyQkIvyLX2cZE//uHb6Dq+sLDTt92s2bNlONqFVmMosMHhb3nxfsSgJpAs3/0KF+BQ76CCGiTcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS736sVc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945036; x=1782481036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ggT2zpn+JNjfS2uPZzJC1uDTGKa5jb6fuzHkgFE6Ic=;
  b=GS736sVcDo6lB1TQ4nRUTYLOzUslzVQXjXYkHkkN+aps84u2drEqBVnG
   dPBRV4NP3qT/jryMnxniGPWFQjSUZJrpino05B3YPoU1RtnDQxvu6ZMd+
   BHNZYdNrMLtprazvjHUVapCrkqniB2copjlJPOKiHHRcFtQNg2kJHOoxy
   N6CFmHll+sQGS0/QROhbKtvcD6zgIRqqlsQeetCWWak0jjxtXt6ggdgXU
   4/wSS3FkhWrfIg/1jlXSft1kMqkNABQDBa4ExHh/jbnB7yzkE19GPrrsq
   Mm4xLJJZhSEviSWCz307M7N2D6fjtiutuWaY2UTUaAS3Jv+rCYntQsKad
   g==;
X-CSE-ConnectionGUID: 6qpOP8FxRYm3BNZfBiJQIg==
X-CSE-MsgGUID: 7fI0KXT2QDaD9RSbR0VHEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921672"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:16 -0700
X-CSE-ConnectionGUID: w06rcKxFSnOrD0EnfnYkLg==
X-CSE-MsgGUID: e4Rj7U3oQluaY48GYPYjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049543"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:09 -0700
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
Subject: [PATCH v2 21/48] media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:12 +0200
Message-ID: <7a06500997e4ac8dd7c5cd7d6c141efda5cdfbca.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/mt9p031.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 4ef5fb06131d..4df8f2be15f3 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -233,9 +233,10 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	unsigned long ext_freq;
 	int ret;
 
-	mt9p031->clk = devm_clk_get(&client->dev, NULL);
+	mt9p031->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9p031->clk))
-		return PTR_ERR(mt9p031->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(mt9p031->clk),
+				     "failed to get the clock\n");
 
 	ret = clk_set_rate(mt9p031->clk, mt9p031->ext_freq);
 	if (ret < 0)
-- 
2.49.0


