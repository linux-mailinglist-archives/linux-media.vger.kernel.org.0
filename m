Return-Path: <linux-media+bounces-35421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE590AE0CC7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F18A1C2596C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45622DFF22;
	Thu, 19 Jun 2025 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2qx1M9y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABEA2D541C;
	Thu, 19 Jun 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356754; cv=none; b=TyyHlm686nVR2UeuKBEwEdbhVMPktV3pTdLgK6Xehe4FI5A0gK8t41+0NIjYefdBuJgOiK0kO01guRxpib9fGU3//yRpoZUczZWiJsYu2Sb0APY2fnJDu7oRfjkSBCFcTUMIOSjBcVJScncDZcv/B4isJXZPgJW3duIRWvznGMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356754; c=relaxed/simple;
	bh=Fr+uekS13Gv3UvXrP5pfY/9p2ujO/ed4B9WCXFrCIkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1B4ApMDiKRWoGWloVl2HbaG3OegVSFW7PJ2Q5ktOpIYHArlIvvFEowuU8mnWArbaKW1hx3Oe8/mL1asE2TlzdWr+HX3YsH0wQdkFJj5B9sBHqdFVS/pw6A5TblyZqY7xH83K/bKOn1WMxc1LGQIRg0f63oeuesFaX+et49hxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2qx1M9y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356753; x=1781892753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fr+uekS13Gv3UvXrP5pfY/9p2ujO/ed4B9WCXFrCIkM=;
  b=n2qx1M9yK9J2t4lSUWngnvA2tUN2QzEaZihuqp0R1cTviv3f9IPJcN3l
   3j19WP0YLrWDrq1dj4mivVwDi5JUApvm1GLfrT5CSLTL/0kQXteB8Bkrx
   S145lJIMRF1V9sCD0ytGvtufV0fY+qes46h5Ois/jjl51Bq4sVR+OMiqj
   r/bV2cW6ME53FYxviT2nOTRa0DgdgALIJPKq3wfvVVTTf+e5/YUkeWWf4
   tyAG3IrC2tyCgMwnGsYg4ALzOlOwKPpvNrwAs6ZTNEUFVIo8y2UxSFpg1
   N6rmLDJEgNLO91Wv4LatPMG9v8hbdfso2G8rL5lrcjIn/DFRQu334f/jD
   Q==;
X-CSE-ConnectionGUID: byjcI1YzRmOyww9G8JAgKg==
X-CSE-MsgGUID: dH7AMw5UQmKDxAaqEroVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054467"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:32 -0700
X-CSE-ConnectionGUID: cIhnqYKPTnqiWEkQ9vp5+Q==
X-CSE-MsgGUID: PfXhtw5BSgO8RMfY61DPEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143704"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:22 -0700
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
Subject: [PATCH v1 52/55] media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:21 +0200
Message-ID: <7ac494567473a27d0470dd65e37415b4e7c454a7.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 25e2fc88a036..693db225e04d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1863,7 +1863,7 @@ static int vd55g1_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
-	sensor->xclk = devm_clk_get(dev, NULL);
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk))
 		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
 				     "Failed to get xclk\n");

