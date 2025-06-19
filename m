Return-Path: <linux-media+bounces-35418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE37DAE0CBA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40A406A1D68
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9E8298274;
	Thu, 19 Jun 2025 18:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJxRFuS3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3728EA62;
	Thu, 19 Jun 2025 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356725; cv=none; b=DWYebvku67e/g3q5yNL3x6O1ES/c7C9ohZ0mlBZHu2cM7zn4cHvNBI4A8B9P/h8dpu9Olc2dGzU4soMnQS7AnhOTxjX0RbfFFa2TPYPCALFrwx2+kyiv1ry2GFH1GOydQmPMmLJSfXLHBHYeNy7DJygqJGSD1yPbFW6DHjuu/04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356725; c=relaxed/simple;
	bh=mfqjgIJdMTFb3Dlkv/AjZzAUoTFmJ8OVUUvV86hoHdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJE4AYZIktXizIx7JOXIVOUCvfh6a2p6QsV44zvVJKmdr9Bb425Vmo87LnJtxZI4g3RjbL90dDQvAVQlXLNaWrOYkg5dV//ZGAdDyW2d5udL7c2cRmEyE3D9hDPJwe9lSOqn66ulZR0+SQmBnCInBDbg/nm4r2zjhdvzBX4rBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJxRFuS3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356724; x=1781892724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfqjgIJdMTFb3Dlkv/AjZzAUoTFmJ8OVUUvV86hoHdM=;
  b=iJxRFuS3oAiwRrAoG5celAW1uM9dMa2GXsXaA0jTBUqm3Sgp7kWYM/54
   AsbIcmwtMrw/SpWakgLLXt36loNkA9vaF/HMGjRvhk5+yTjMkYWrByNYO
   WJSFEw3AmbCtVnB23Eo+7Kwa01Dwei19hNnakWtZrSJxfqi3EDpxREru8
   hnFdJfMIE08P0+WDcp2hkBUfVYO0gEd54LUEZLwsxk49gQFhqMtWHQeec
   wFC9tSukVpjpg8jAdolldHIU+JBNcDLuB4UTfSaZ0EwY2jUFmbNOmutb3
   LyENVu7iShIEI66h9ZlLZuPQRlAaJiBCNWT3PyVhsHovnUcLLXwcpFm7a
   w==;
X-CSE-ConnectionGUID: 6n3UCfDvRtiDhmJR0HwNkQ==
X-CSE-MsgGUID: Tp9lNxGvTwOae3gTQ7Szhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054330"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:03 -0700
X-CSE-ConnectionGUID: FG9XLWD5SPqv6IZhFylTyw==
X-CSE-MsgGUID: WP5S8hRxTCGP6P4BtdElNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143613"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:11:52 -0700
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
Subject: [PATCH v1 48/55] media: i2c: st-mipid02: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:18 +0200
Message-ID: <d44d86629bef0543ece9eca05ea0ca2acd540190.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f4568e87f018..ea848b52f628 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -817,7 +817,7 @@ static int mipid02_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&bridge->sd, client, &mipid02_subdev_ops);
 
 	/* got and check clock */
-	bridge->xclk = devm_clk_get(dev, "xclk");
+	bridge->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
 	if (IS_ERR(bridge->xclk)) {
 		dev_err(dev, "failed to get xclk\n");
 		return PTR_ERR(bridge->xclk);

