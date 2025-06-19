Return-Path: <linux-media+bounces-35385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE39AE0C80
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42EA4A6441
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56332E8E16;
	Thu, 19 Jun 2025 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+VA1ZMy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0841E2E719A;
	Thu, 19 Jun 2025 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356175; cv=none; b=JBcvNWTIMmsMH01OllcWUBBEvRSlX8q4nvmxcOxZAzQdnkCdtDUIb054DUtC5QqQRdexb1UDnjJ8jMGTK+yE9b27wB0YnAT0FqtTf4pUlId7TEY2J/3fLDxef/n5qD/mheyP/cIUCEqhs/i44cFqgAeS85n96OxwkirZRv6ozFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356175; c=relaxed/simple;
	bh=v0j1Sia99c7UJ2fUO0kyuHgqsIFrW7tYe3W1QJdDZmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAPK7zuawLZYCJOE96yz4Cp3y9coC2/T/sJLhKCOcM3mSMhMmeuOmoMwDN57lEmJPjnHj53pW8UWl5a6xRBDdQOVeEWt4J3EURTaDFQKjmA79LkGztjzbJbJdDdpAvdH6ByqYDQp1UbI7jdieUpMw7yeafbrUsa5LsNsPsWoMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+VA1ZMy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356174; x=1781892174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v0j1Sia99c7UJ2fUO0kyuHgqsIFrW7tYe3W1QJdDZmQ=;
  b=i+VA1ZMymq1H/+XVtKkIiCuVpQxzjl/XOhZdRoFDcZQ8MO/hHZEzja7n
   uHPjRp36+sopB6S+TJQFTL38xa97gaTy6JateeQcSd4xdoMX2rbOnn/Xr
   78xUCc4bTaZgO2Kbk0ei1ExumBHQjpkANbR57MApRGVkVHPfBooaCepAU
   wKo1ilz3iKPGd+Rb96nnsX1hF3O3cO5azhjCs0AEx3EXSZ67P5eVHkGlc
   NSkW7hzxSyv6zOPgEZTz+3Hx9211jAb3OQxQpa6WRyflGPL0CqwXmGOjG
   YQohBG/TGxRJYZX4pN3mmISlR06NbF3lUJNGCfFi5sUioRx4FicQHioky
   Q==;
X-CSE-ConnectionGUID: jZgzzpi/QwGzkaRY+1crcg==
X-CSE-MsgGUID: KDyIpMVXQjuy+bgQhSD17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048210"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:54 -0700
X-CSE-ConnectionGUID: kJ9JMtQaQluuuYo3y82oXQ==
X-CSE-MsgGUID: zue/5h+FRt+E2+x2LG92Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919465"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:43 -0700
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
Subject: [PATCH v1 16/55] media: i2c: imx334: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:09 +0200
Message-ID: <ffacb8ffc9caf802ec51f01f5ae1dbe9d44d1cf1.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 846b9928d4e8..7a9b14d102c9 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -997,7 +997,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 				     "failed to get reset gpio\n");
 
 	/* Get sensor input clock */
-	imx334->inclk = devm_clk_get(imx334->dev, NULL);
+	imx334->inclk = devm_v4l2_sensor_clk_get(imx334->dev, NULL);
 	if (IS_ERR(imx334->inclk))
 		return dev_err_probe(imx334->dev, PTR_ERR(imx334->inclk),
 					 "could not get inclk\n");

