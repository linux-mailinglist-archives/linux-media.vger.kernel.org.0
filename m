Return-Path: <linux-media+bounces-35401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC7AE0C9E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A46B35A0137
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7E2FCFCD;
	Thu, 19 Jun 2025 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJkSvvGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C52FCFC0;
	Thu, 19 Jun 2025 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356340; cv=none; b=aaGVIDt2v49EsqMLFlr73AnY8qkaJSG0XFbdT2ghwL70b/zwdbczv5cxNrw07XJb0CZYEL+QlV2fnT6KYyowdOkFxLSPHc5sPOna1FNvpnBM2WHIa6zFIkvdZ7ThENl0NC5JDxWfr2tb82Rd4q6VCcUj/QVFmhPLy2nKI/S9yW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356340; c=relaxed/simple;
	bh=mEO6PfVC/6y5ltSlE4ejXk+RvXptTghBJSVuHnT03kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnqKOalcuhop38Q1X5B4DmWBuAEY9boY3kWze8jM5s42pgBi5rbK5HnabO381ikT9gchcIixg0VwmSnmNg3+cYU/ckY7caaUYTgZ0eUWucvzUL0eeQjv6p4+KXIJwWxxAh5GIkmgtbJeFOARMcsHfNyd0jncv48000Bsk4CnUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJkSvvGl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356339; x=1781892339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mEO6PfVC/6y5ltSlE4ejXk+RvXptTghBJSVuHnT03kI=;
  b=FJkSvvGlg9CBzTp+mMYNp/qXqA7+Mc9R4jJNOnBFZJ39pwF7FFR26lde
   OjlcO0cEUCjgdO5uM2RRzs6X+aW2VNnceaiKbWjPPPzKQ/JWmWPIXF+rQ
   YA3tTIeopaSnIRVq47O1aK9zSYhFKtd9wIyKDLq/Y78KaM0aoD3uZhHQH
   EcGBXlKuxEJowBO71xAYWy6pupB4lkSJzaRmB+Refxuc04yWgm32DMaKJ
   C1l08xg/ftG+8a02HgWFWwy6dXrHhBM1qzPS07fl3S1RZfvPIniYN2QpH
   tNScS+3IGBPUHqnQX5nvwcDSE02RRj63OdRb6Xkv+bfGL1Ss7N28X+KSj
   w==;
X-CSE-ConnectionGUID: 3zvw2rpjSmOg/jSbNPfLig==
X-CSE-MsgGUID: RioSKQ4AT92Ke8r5/GtaTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048665"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:39 -0700
X-CSE-ConnectionGUID: 1NNLQ+LATIyovWuTtMxW/g==
X-CSE-MsgGUID: MpC/OTtjSj69JAk+yaEl0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919709"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:28 -0700
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
Subject: [PATCH v1 32/55] media: i2c: ov5645: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:25 +0200
Message-ID: <2cffe2c318b1aa9b8a1af116efae9f85b8427604.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 004d0ee5c3f5..70b4cdb1b9af 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1044,7 +1044,7 @@ static int ov5645_probe(struct i2c_client *client)
 				     "invalid bus type, must be CSI2\n");
 
 	/* get system clock (xclk) */
-	ov5645->xclk = devm_clk_get(dev, NULL);
+	ov5645->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov5645->xclk))
 		return dev_err_probe(dev, PTR_ERR(ov5645->xclk),
 				     "could not get xclk");

