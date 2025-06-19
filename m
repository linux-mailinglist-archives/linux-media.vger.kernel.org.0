Return-Path: <linux-media+bounces-35398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D248AE0C7F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD013B0308
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2332FA635;
	Thu, 19 Jun 2025 18:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBk7KlP2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70BA2F94B4;
	Thu, 19 Jun 2025 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356309; cv=none; b=J33p2B0l3RNOEbwDwdJwPucRcVbRnaQoMlCmF8MLcmvkbKuNgoUp6pMp0VTsMntzVgEuawajrmjbqXnbluC9BuHezZZ4I1XvsrwCDoSt57j5V8bxxtUGWcbQOMhmot1OWu5/b1xZPd3NKy9AuY0+hbBsuGvIy/Inkp/3/XZQ0Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356309; c=relaxed/simple;
	bh=AIZEY3flhziFIS2wGmnaMLhE40nCGNtLPhU5H0wVfSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0g241NfUNNEZVTuxYZufoZayljotC4wFE1sn+vYqKCBIyXFceJYMgEjOovfnCWV3cDvqjhOo1tRyIHvlO5occM7LZzANoGKlvm2PrXpFgmTrC8i+O+6LCFRI3Pvq/kwnln4OdXhNRx00feAvU8IdDXX+dC8qufky1sOKRMsbac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBk7KlP2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356309; x=1781892309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AIZEY3flhziFIS2wGmnaMLhE40nCGNtLPhU5H0wVfSo=;
  b=DBk7KlP2xiENN9iqF4ZxVSoWCFWI8XHdULQmYg1H5YrvqEFS5/VNsSTi
   KyB3zgg7Ukz4DqosoTvqG8XjJZBUk1OVl4wewwPG4cZULbs8AHRxR98J/
   g5vuiRsGYbbp5NMueKfpxGwpftMOgeje443auemLUp2R98tZAz1+eNQlU
   dfWRe9fGzQTfxu/kI5PmkFFcE0bA1Z2+vApo/jjn+EWHj+WwqImM4FIqz
   Z5My5Ts9mp6grHDHPGRPtbaTim8ihirkPnzOr8oKrAnUMJ1TJEgPnvD90
   uGpjRLqVYXRUIi6CnVEbgOIrPy8WuR3X4KP7MMscxrpsz3s7AKpvPRgwH
   A==;
X-CSE-ConnectionGUID: nPep9J/HQcy26AgqNG0j2w==
X-CSE-MsgGUID: MViZuvI+QCO6ohTTOzeN7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048581"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:07 -0700
X-CSE-ConnectionGUID: p9uPfOGzSUWfHT5I3HkFcw==
X-CSE-MsgGUID: 6Re5FhR/SKiTAhljTUv0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919643"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:57 -0700
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
Subject: [PATCH v1 29/55] media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:22 +0200
Message-ID: <dd7c24bc88a6fcf3824865426a080ec8a424bc20.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 06b7896c3eaf..92a13697ab83 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1437,7 +1437,7 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->pdata = pdata;
 	ov2659->client = client;
 
-	ov2659->clk = devm_clk_get(&client->dev, "xvclk");
+	ov2659->clk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov2659->clk))
 		return PTR_ERR(ov2659->clk);
 

