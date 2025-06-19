Return-Path: <linux-media+bounces-35384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F0AE0CA3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07B455A6562
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959A32E06EE;
	Thu, 19 Jun 2025 18:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3u7rjU0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABA2DFF2F;
	Thu, 19 Jun 2025 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356165; cv=none; b=enbYiRmHYOrM6hMjxGm77JpCkisdVrrvzpMHZU0WTq7kIFrEJ80rMgjYTlNUiPsKKxeOZ/Dqm3NWRl7c61yzA4nNW0JG3qjwdqE9c3EqrLZ8JvgVPu4esF+GOtS07+Uu5oOHWtprFdS1+LHf9SBbHr7I6pOqOMY2rK1r6sxf0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356165; c=relaxed/simple;
	bh=s//CA/VbyepwOorzKLzN6G5UE58q7aAXWib97wH/wVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoFVbgtY0ZE/M+PzBB28rVqp06HfRKQ3FAYtJ1q5e1LBC1umTpug78xhxiNjXIz010mPj6T8dijNXoWz3RrppgWFRJ83nOAibi/s0PQWFUh9BY1WhY9NtBKIE8AhqSyvUyBhkQQ62WwtaUvkxhoWK4aXiSNpPPLBGlr9qIFEmQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U3u7rjU0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356164; x=1781892164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s//CA/VbyepwOorzKLzN6G5UE58q7aAXWib97wH/wVE=;
  b=U3u7rjU0oayTrReZnHWywaZbh100hgO4og0iWYnWGc1Ykz2s1U+bD0PY
   wordy/CXEEVA5jS8W2cAyb6UB0wVzLUJJDIiHnBTW1ws9Bu345oAWcNqK
   Pi3+wy/M79UQz2IYA/nfVgH3CBrY0zt+d3Ee+nQ2OfXX09udqRSzA/sun
   2xgMFKvaYhlEeQri+QQO5rqJTsU/GwZy49zRz9f7Yztudxgl7SPANlXaN
   PbjkQuso1p1fCh46EawvvUFjUjCWdJZd8Go0RNzWWGFsiVnI2ljbmz0Jh
   V/4en6rbSGvT1CLpKopQIQk8dwR/vYHUmSB7L/KXS7jb3KiVDmwjwboCH
   Q==;
X-CSE-ConnectionGUID: v5iKMI0fRe+6M7qH2cno1w==
X-CSE-MsgGUID: ZSlfv7w+SmuiZNBbf8qYyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048175"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:43 -0700
X-CSE-ConnectionGUID: wgvKYCgcRN6z6lhCdy3zYw==
X-CSE-MsgGUID: EzQ80+3OSpOtr0OtxALNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919450"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:33 -0700
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
Subject: [PATCH v1 15/55] media: i2c: imx296: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:08 +0200
Message-ID: <5b2970dfe51bd7091eca86973b6ae2dcc4117e24.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index f3bec16b527c..3795b75a4397 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -1044,7 +1044,7 @@ static int imx296_probe(struct i2c_client *client)
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
 				     "failed to get reset GPIO\n");
 
-	sensor->clk = devm_clk_get(sensor->dev, "inck");
+	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, "inck");
 	if (IS_ERR(sensor->clk))
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
 				     "failed to get clock\n");

