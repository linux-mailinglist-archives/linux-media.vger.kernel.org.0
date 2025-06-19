Return-Path: <linux-media+bounces-35393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C3AE0C94
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17881BC834F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B922F2348;
	Thu, 19 Jun 2025 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2Gg6FGH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C32F19B2;
	Thu, 19 Jun 2025 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356257; cv=none; b=HRcuOoGIq6W1a4t1xiExvdgKuiQohTcFu1cKgz+069be7MYIsfzTS/gA5K7v0cZjcut07yOmdqDfL3hpvm31H0Qv3rclbvrkJ5j6Ix2dLk4hP6Qs6NKNhP5+QdvOZEG5GPU39o9duvBcr75rJbDhIFTJqlijxmeokhSa3z2Wvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356257; c=relaxed/simple;
	bh=yTWEq0Sd7gUr62Nt43VucV+iOO3A9V8QhKiHwWfElYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqxlIyd9prFLS7pk7JuqpigUqMlrbmq2bgnFIOPoywu/NmZWJ5AB0EsdGopwpvhX9H7fLUzvzcOARdnKwJKqZWNXQ6ThLHdPQDoAKy4Rykb/l6kHbxah+jZk/mkZRFqkBNssORWItYpOunu5U5I5gwjAWvYEJ21uu68QBxeCQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2Gg6FGH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356257; x=1781892257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yTWEq0Sd7gUr62Nt43VucV+iOO3A9V8QhKiHwWfElYU=;
  b=E2Gg6FGHQMZcpG3jHpC561llX255PUTthBuAFvkbVyHdY5oJTJwlanQj
   wZVMJniNqSunRQEbRpF58PHaNJewF99A+lfKX/Va5d5bCpHv6q+L6+aD8
   2xuzn/hoYfyzmjvyZKzuC6VhRdhe8aD9Icm1kHequ5Sjb8IG6aD32oj93
   wOnsn1IzEUqIHMZVfUnIePjmsxcq3/h76vCC/WbegBD6StYZJBYlZuAJo
   +wqG3JxncMDl64SFpkA7gPyJ85JG3jz7DR1BdX2fPSKP3RHrm3ghuRGsJ
   vjHW+8Qoj7jsLdpLtucLfl9FuYikQr5A8hsyVMqyDKQanGy44hR5+zk9j
   Q==;
X-CSE-ConnectionGUID: 5OoeUomOTVuDzoUlF18PuA==
X-CSE-MsgGUID: sF8e/fT9SDWzoqW4YbXhrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048435"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:16 -0700
X-CSE-ConnectionGUID: NE5lEcQaRV2JsuFWDoNriw==
X-CSE-MsgGUID: Lw+LnM5tRtOkgidNDzlmrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919579"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:06 -0700
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
Subject: [PATCH v1 24/55] media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:17 +0200
Message-ID: <6d73dc0c23038ba8ee5187f666099a8373dd2d89.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 4ef5fb06131d..b48866831a7a 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -233,7 +233,7 @@ static int mt9p031_clk_setup(struct mt9p031 *mt9p031)
 	unsigned long ext_freq;
 	int ret;
 
-	mt9p031->clk = devm_clk_get(&client->dev, NULL);
+	mt9p031->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9p031->clk))
 		return PTR_ERR(mt9p031->clk);
 

