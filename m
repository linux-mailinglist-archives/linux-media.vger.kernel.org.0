Return-Path: <linux-media+bounces-35408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0336AE0CD7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 524CA173246
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A60230207B;
	Thu, 19 Jun 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+CCFn+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C09302071;
	Thu, 19 Jun 2025 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356412; cv=none; b=bKY5ZfCj6q7wQMZUaHX2CbNYKY1lHgaQZlbA5WR2mgu0fzkrE3xYj5C9QQ23kCB0kNsa/eDtSRLKu0lhzRxwzA0wzuxEGMJzB26nhciVmVtZ5OEIxyxGEZtFBMH2wXM5FYa15DsQvSBCr7NBjvgoCU3qshFbgAq2M0iyB/5X+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356412; c=relaxed/simple;
	bh=LKiMJNxuCRVjRAH8HkJB6XK5y0kPFNoaayptRtb6bM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7RcDVfCV9ccQ3HXOBuZUF8XqJBt9eA9QwwhoiaZQOS3hEQtuLsQHs6Qf0xdTygv9XKESEkAMKYpHRVBxP01eqpmEm0xLGZdDNhWvfuPkQIuSzV5NGndUwd1BH0c69fh2CQO0QbSsX6P6SMsAa8OYDfMKBNg7DlyaFHCwGqHF8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+CCFn+E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356412; x=1781892412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LKiMJNxuCRVjRAH8HkJB6XK5y0kPFNoaayptRtb6bM0=;
  b=K+CCFn+EiLprqXb7JSEw07O4TwKer6xGasc48d7RPmTkBcwanbp0M9nD
   LOz/M+lQ52fz8SZ41FGzSNdvgNkthuQqrtVmOj4v0tDXRsYQQDJCj70KM
   IogjTeYNFr30iZA1HMEeG1W94MDLusO5tk46QS4Gp11wxfnODxF1YoZQG
   md3PVYCp2lBuTEInLk6U0evOhl+oxMEu1gyK9pNp7TnZgonpxBFTKAvyx
   cAS3/VaO5KKPlJWjQO+HUdZkGhM5HIsftNu2NcMANCXWB/Jj71GxGs29Y
   PX+AmUXVdgWi/2ziHOQO2PtW1IBJOkg/sMJTOXOePNbVPodLDurw0sqGZ
   w==;
X-CSE-ConnectionGUID: mNA2ijaMQOeI+v+cAxbF4A==
X-CSE-MsgGUID: hVALWpu3Qz67LiTWBY9o6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048880"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:51 -0700
X-CSE-ConnectionGUID: 15ENivSCQA6sjUBAAfw/OA==
X-CSE-MsgGUID: efNrXp5HQ662OKL8lcAVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919836"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:41 -0700
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
Subject: [PATCH v1 39/55] media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:32 +0200
Message-ID: <ed6ec63d24e8d116bb6f3f9aa7e21b95d684f9b7.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 4b6874d2a104..8cc973fff767 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2274,7 +2274,7 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 		return ret;
 
 	if (!is_acpi_node(fwnode)) {
-		ov8856->xvclk = devm_clk_get(dev, "xvclk");
+		ov8856->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 		if (IS_ERR(ov8856->xvclk)) {
 			dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
 				      "could not get xvclk clock\n");

