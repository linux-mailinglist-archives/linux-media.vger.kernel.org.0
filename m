Return-Path: <linux-media+bounces-35381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C8AE0C61
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 048BC3A8224
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4F7299AA0;
	Thu, 19 Jun 2025 18:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qu1nktZW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD462980DB;
	Thu, 19 Jun 2025 18:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356134; cv=none; b=eI1xYwC702OOka2wNXsTsLfioCM3MqN4/XgXBFYVc+vUuMVB1Kqn3OgEAEPUGQokct+D+seiknD1MPhrU50Ilf9m+3EYJgTrVekLJO1TBWq3QTYQKvAigNC7q1NXHP/E/5e+pWYDJkZ1yT8/2FlKmcRXMa+jmqfIp4ZmgxdbHFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356134; c=relaxed/simple;
	bh=C1vMfDnqWac0SNTLgP5bLPIMcw+naLfxvXI5keuItAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rVKuXTMsa9d9oTyAFrRx/ScSdOeK4rxnf2HWz2tqH/A5cN+luH3oONYW30aDQ2mBNOusfIYjk6Y6OyctfN8vS9gyWPJRpBRTzwsczUsdYEFygt1Hx8m0ka7Je9qMGAc6BIBOD6woIvvlOVVx+DwxBAAEBGJ6Dofc6+F+Ho9dYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qu1nktZW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356133; x=1781892133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C1vMfDnqWac0SNTLgP5bLPIMcw+naLfxvXI5keuItAM=;
  b=Qu1nktZWrav79sZ85kmegPLPbRQp5kqSwTOL1uCkf3z96MAQvWzJeQ5B
   PofW7M+u3vZek/sMm10z4O1XVd8IcuM1iC0Q62/qotlE9kX1v7fathsaz
   50WSd3XO6eiljRY8/DfValMy1o6fU4nC4I64nlK45STiPTFM2WADUnYiA
   KwH65Np4/X4fB+27Bez7Tj7wHvXrHdc29gvk3LUAzpSXgHdKLqnVxq/df
   P9luudz0bf1mJmg6Qb4hmZ8aWvp1y5aumusOpq82/8mqgMrkjQO0ZZpUN
   awyFeYKH6dZwS5xOmNi5JXmig97BoJFkLY+H2ppPHwbj7Dm7lqwiBIP3m
   A==;
X-CSE-ConnectionGUID: RKvsB+atQP6LilHLmTc4DA==
X-CSE-MsgGUID: m970kBa0SNC768i1wKTBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048093"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:12 -0700
X-CSE-ConnectionGUID: ed6JtqWhQgm3iT9RcZwDbg==
X-CSE-MsgGUID: TkYXesncRkiizvMcGNQrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919399"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:02 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
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
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 12/55] media: i2c: imx219: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:05 +0200
Message-ID: <0efc2e23bd82294c0b6901188d672d58879c0804.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
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

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3b4f68543342..bb7808515178 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1188,7 +1188,7 @@ static int imx219_probe(struct i2c_client *client)
 				     "failed to initialize CCI\n");
 
 	/* Get system clock (xclk) */
-	imx219->xclk = devm_clk_get(dev, NULL);
+	imx219->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(imx219->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
 				     "failed to get xclk\n");

