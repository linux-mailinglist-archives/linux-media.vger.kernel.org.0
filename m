Return-Path: <linux-media+bounces-36002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2AAE9F1D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823815A02DC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59E72E7632;
	Thu, 26 Jun 2025 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0LW9nAV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30812E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945192; cv=none; b=THv26XbmjiCahlu3q4Kq1QyIe4eB1juyiJ2tcyjq9WB3B4+TkyGjCHETcLFJWRY0e2Q4gZVKt636kBWrS/Qg4nNYvEy89xF2itjYtRFoYsK6cKoCqBkdqzAo4iKgYmvqdjDJysrcNaWeMoi5yvPedD8RBonsQuGhrp6FXIHVIWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945192; c=relaxed/simple;
	bh=seLHLrobhGU8crhWRmxripUHP1AL4siixQWM4rByL68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpuq+IF5g6fvVa0GPLyqVXB3RlD2o2x5znJCgl6bmOpZnfuXGx4LTGqDQwSKG3BVVprfmO7GHT5ZTeOzx3XtjbofZx6TaSzSn8qDSbRP5DGlGqLseLf0qGk3I9KoG7laPwA1WaRdpTILV3VdbL8IjQBtmVmdZJ5w4r7J7uMsw3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0LW9nAV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945191; x=1782481191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=seLHLrobhGU8crhWRmxripUHP1AL4siixQWM4rByL68=;
  b=U0LW9nAVCJgUZN/jNF3gmun1KoxGNCTto2BqNtr7ztLilx2GSvimg9qw
   FaHSHZ65LwfyQ+SLrx3/UA2zE0RzmN+yb7w1n762cDBH+wnl+Ilw7SLhX
   /PpmfMhe+Zeg66KzS5mKf24qxyNutI2v2a+bXvzvdobGUHwbDhLk1a8cF
   6cATqDh/Hxh7qp/fxzW42jvFbEPN6lrRmS/ekuacB5XPNIXImgoj8/wq5
   jFcofnDLomHmdTBmYzBlE4ahWTeJfAH4nf5xO6lqZUczWyon0HHE1lj7V
   WErx4Eko1YmaV2ifyIH3Xh9mNt7Y1QI/NVMVBbRwovZDDMH4GOkPnM7qo
   Q==;
X-CSE-ConnectionGUID: yEuNFC4OStSFUS6IkbEoFA==
X-CSE-MsgGUID: 1fuebWlfRkeKcyjx/qOvgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922194"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:50 -0700
X-CSE-ConnectionGUID: sUPxDKAGTj+781Lao/AnkQ==
X-CSE-MsgGUID: XVasejgsSzKxvQ+ga6KCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049907"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:43 -0700
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
Subject: [PATCH v2 44/48] media: i2c: s5k6a3: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:35 +0200
Message-ID: <dab3097c898bd36940682ee3484ed974239d156b.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/s5k6a3.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index 0c2674115b7b..4bf5f122b113 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -292,9 +292,10 @@ static int s5k6a3_probe(struct i2c_client *client)
 	mutex_init(&sensor->lock);
 	sensor->dev = dev;
 
-	sensor->clock = devm_clk_get(sensor->dev, S5K6A3_CLK_NAME);
+	sensor->clock = devm_v4l2_sensor_clk_get(sensor->dev, S5K6A3_CLK_NAME);
 	if (IS_ERR(sensor->clock))
-		return PTR_ERR(sensor->clock);
+		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clock),
+				     "failed to get extclk\n");
 
 	sensor->gpio_reset = devm_gpiod_get(dev, NULL, GPIOD_OUT_HIGH);
 	ret = PTR_ERR_OR_ZERO(sensor->gpio_reset);
-- 
2.49.0


