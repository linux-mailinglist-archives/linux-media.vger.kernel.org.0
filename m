Return-Path: <linux-media+bounces-35383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BEAE0C89
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 398B91C20998
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230112DBF48;
	Thu, 19 Jun 2025 18:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmEbhSkb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D482D541C;
	Thu, 19 Jun 2025 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356154; cv=none; b=L+b0RNpBqEC5JJVySxwrAcsZPu75bz/WOtYLSJpuadT9jSNMSFMOZ/HnEOTEdZrplCh6a3+UoEAeNpH81QRqIsA/J5h7IPTcg6/f372E4eBQT5R82kyq7cdQ409C594L3Vz46bdzOkfO5BDAk6qN6Xzlv330afHpFw2YEqNaIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356154; c=relaxed/simple;
	bh=LWwCH5KxP2Ap6b2HmZwqNFE6LZAv/JOWiL/Ejy4wetY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWTy5O8iiyBvbUAa7isTMplFqNICi2uYkcpD90lNN2D8Myq1D0ANFvAyM7odpa8uKkwcmgiNGjQgD50rEQwJb99u8UQdUtXG83IyIOQAvCqwAyOr7VOXcaW6gf9r163nY0O0/xtvtHSi8GHE5LTkckiYM9od/ebkR90Hk9Ci87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmEbhSkb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356154; x=1781892154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LWwCH5KxP2Ap6b2HmZwqNFE6LZAv/JOWiL/Ejy4wetY=;
  b=DmEbhSkbLebilwRZLgNrowmNGGs7VW6IVGOQknUgVQLKPGAgzs9JsUa2
   LduTLUcu9sLuQKBReevn4qZJgnVKHQ6k9pkLcp4TV58flMWSry9qAHrP/
   tovtQ7+1CfrVMs7lcI4qtIBphEScGrkB6NmCxMzl3nlVCqQeRAXS7dG21
   nZ4hWYcxTdmsgDUqGhZ+QP3Lk4G4bqso6NO1wN9eGx8IJ/GNmEBTyTH5+
   IDpa2OZiIJzXPs9bqZ7fJd1gdeaIq6WJaNaWwRfdHHxtAJUP08Ejt427R
   zNKPWlKJF7pq5z6gWMd9JDHV3y01pTfkxDS3PpOxMBzqsQJGi3SSXgxAN
   A==;
X-CSE-ConnectionGUID: uiWTHSQJTCCuv/gJeq2jZA==
X-CSE-MsgGUID: gIFGq5HSQaOAlfXh7yANog==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048144"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:33 -0700
X-CSE-ConnectionGUID: G9EgXEBNR86mpYMwp6p63g==
X-CSE-MsgGUID: X/sl4d83R/CX2kPc+obU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919428"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:23 -0700
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
Subject: [PATCH v1 14/55] media: i2c: imx290: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:07 +0200
Message-ID: <82eaf5de9eb7e66bf435f23fde5f12bb89274e57.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fbf7eba3d71d..759df6eb8545 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1600,7 +1600,7 @@ static int imx290_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire resources. */
-	imx290->xclk = devm_clk_get(dev, "xclk");
+	imx290->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
 				     "Could not get xclk\n");

