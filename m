Return-Path: <linux-media+bounces-35394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA7AE0C6A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE891BC7BDF
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597622F2721;
	Thu, 19 Jun 2025 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4vPzb06"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ADF2F270B;
	Thu, 19 Jun 2025 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356267; cv=none; b=awHJM9CuZyYXQOCYmwY9CaFimEQhNH0pLMoL5EeW4TxoIc0WOccryUzxd+HKCuv9wNwvVuFcr+C8fZWATAOTImZsx+lFWYsHQJpysS6AK8tfUy0i+Vts0j/UoRI4Pi8vENpJCEuK8iIXjJ86iKoHGvlV1rl7z25b3p3rVkDbW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356267; c=relaxed/simple;
	bh=CPk3BsEv5ESdxGPd+6LQvQOSUTMvW7QSWGjh4LDSiyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDjOvS6TclypUI2lAw4BTWi7SHYWQIhiw0G86qFUM9QyqaFhC7sYWk01OJfQQ/I6X/X1ona+GsjTd0zg+g5Z1kEA41r8orAmeOq02LDJe//peNW4D5KHJEWe/+tltbmjkEAQgeKoTWDSBxHVTF6lMghCsIWL3MIwTikN+QT1Mw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4vPzb06; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356267; x=1781892267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CPk3BsEv5ESdxGPd+6LQvQOSUTMvW7QSWGjh4LDSiyw=;
  b=X4vPzb06LqOPN5nQ/EXQEyWc/aK+R9G+/0oU+rkNryGoPh5Yz/XWDhq8
   HlSEiteFCO3McYJ773voBvu8QhtqrKsmpbNvF2zmeZ5uzTCxj1m67ZapC
   GwfctskGcFSOK6nFEcLVdwRBY939oL2cJY2vY9xGk/8XdOpHBwMXsSpxX
   CU/bgIX7KOqG3Hg10nzZk9t0QWvlOPbaaJDEI8Iiz4g9b5YVOnvr7KJq1
   fX9oyibdZW2HqNra9cD9lxhy6owpBx+DEdomxm0nGX6DK4ezpRGe4WHZj
   NT1kFuokk5SwqkmeMHCoETRPqUZQOdD9KasqVy8qMwDf4TC1laNTwJ435
   g==;
X-CSE-ConnectionGUID: hGMWJT4vQ/aaclXNdn4AoQ==
X-CSE-MsgGUID: nDAFUf18SSWDJzk9nEkVFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048470"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:26 -0700
X-CSE-ConnectionGUID: qwJQQ8w5SlGgLHV2Ol4n1g==
X-CSE-MsgGUID: ZzPw0oY+Tm+2u4lSS5cwPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919605"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:16 -0700
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
Subject: [PATCH v1 25/55] media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:18 +0200
Message-ID: <e18a039820ac98c67b53ec1ef16a6722b243693e.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 878dff9b7577..685234577f30 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1078,7 +1078,7 @@ static int mt9t112_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
 
-	priv->clk = devm_clk_get(&client->dev, "extclk");
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "extclk");
 	if (PTR_ERR(priv->clk) == -ENOENT) {
 		priv->clk = NULL;
 	} else if (IS_ERR(priv->clk)) {

