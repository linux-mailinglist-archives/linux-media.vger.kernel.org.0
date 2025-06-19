Return-Path: <linux-media+bounces-35405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFCAAE0C9F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351691C21959
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173D12FE375;
	Thu, 19 Jun 2025 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLjfrs1S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F62FE367;
	Thu, 19 Jun 2025 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356381; cv=none; b=fPOHZpT+xwDJLLfvnT1izxZH5eTjthl59mu60CRkOwYhKoXIWbq/0TZ0bQjB8HVO+Wchra50vf+J04FAM2KUaCzz50MZ+whHOtT5OpR0B9yG16RAPo5P/035xniDf3JHZN9kkvVfy/K7jPvu9yaeAwrWOSezGjRHkrM+kcmTp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356381; c=relaxed/simple;
	bh=F0FP5YXxIaHslJZiUPsTJx+SFT71XHUusYAEVJiAsOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVnUNg00YANx4/dJW/U1XWqT4WSfiCXdAjtrXxKBCpDXah4onqNfo4rggF8CFyK3hXDW09lyVTxWs6oJaDkUiOkBgyKk1dN2gdul7vPgY/0Hn10Bys8VPoTIC1EMrCJDQum7EeeocJgAD1puHEoMeWuKYY445R9qgAsuVJtJhF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLjfrs1S; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356381; x=1781892381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F0FP5YXxIaHslJZiUPsTJx+SFT71XHUusYAEVJiAsOY=;
  b=aLjfrs1SjzLaLm0xX6Fio9TtBaGTO4dSRnCpUTEQJ0lReEVe2yTVjc+Y
   DNx2Dfo5V8jDugelWityhN3tAb7YcIVcHXfIEgkqKU8RFG8NbzjCrNvBP
   OGvg1DA61UE9kCoufvhWZ79lmIumSjg/kMntt3nLMFtjVdNVZAHm+oUKn
   KLTMyRn7y7hZB3lkcFenMzYiPNFeZ3cdCY9m3mxlaEpy1wI5cA8TNP7kX
   wk0RxYKYuRbm6attzgWQCe6uNsUazEiUXfaXB25g5sZyDepYcHiNf8bCj
   pEWw+C0JP5/lbLjHuMHcbU3059l6us1PebpjNuNvsOe+gHYV72X71/JtX
   w==;
X-CSE-ConnectionGUID: VNpcKD78S1WP5STmULwLnA==
X-CSE-MsgGUID: 9ozhLttVQt2ayTvGNWdYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048793"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048793"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:20 -0700
X-CSE-ConnectionGUID: 8rhaOdZwTOCFz+2VcsBBSA==
X-CSE-MsgGUID: vPhM4iTVSsOWV9DL4gvb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919759"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:10 -0700
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
Subject: [PATCH v1 36/55] media: i2c: ov64a40: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:29 +0200
Message-ID: <1c96d553078894e4e6b6d24990b5c26c07d0f8fd.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov64a40.c b/drivers/media/i2c/ov64a40.c
index a5da4fe47e0b..d7a13e855a41 100644
--- a/drivers/media/i2c/ov64a40.c
+++ b/drivers/media/i2c/ov64a40.c
@@ -3550,7 +3550,7 @@ static int ov64a40_probe(struct i2c_client *client)
 		return PTR_ERR(ov64a40->cci);
 	}
 
-	ov64a40->xclk = devm_clk_get(&client->dev, NULL);
+	ov64a40->xclk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(ov64a40->xclk))
 		return dev_err_probe(&client->dev, PTR_ERR(ov64a40->xclk),
 				     "Failed to get clock\n");

