Return-Path: <linux-media+bounces-35386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1FAE0C86
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAF5E4A62B7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCC32EA178;
	Thu, 19 Jun 2025 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goBgtnBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9EF2EA147;
	Thu, 19 Jun 2025 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356185; cv=none; b=OcPoUqzsC3Q/4DgcdG7eSJp3HxiS/YacAKyVgzjGhaDwDGJWXgrnDGpCEYxV4v5+yqHShxPTOZAaXNudYX/1wtuJw+24o1m0cq958B41CriDAfC9VMfxpeyusE3/TRLB390v24qIkrt4QMPk7z7pgu6rgzJWdIqMoj7JO2Ygka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356185; c=relaxed/simple;
	bh=NSnfMG65i8HXSjOSHVfKrXj6MqCPtrvyaOnkyhUpiEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3NQZQ6lHNpE7PO7EWT9VlPNHMOyK2b4Z56jJ+QkbG0cJK8o/TnfXqAsM21qp8n4J6fKV6AYODkAbN2/2w7lzToTsPqwCWfpjQrTpnVzDCFze5Ib87cHrt0upiY/xUWp9N58POgzZkg1lb1ERYUAHxt/AfQleRS2tRtHfHRsQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goBgtnBd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356185; x=1781892185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NSnfMG65i8HXSjOSHVfKrXj6MqCPtrvyaOnkyhUpiEs=;
  b=goBgtnBdsUxdiSISKXu/RPcJpySZTOJBYnPcwaKtarwI/jd63VGrnJ0u
   fqY59VZMD0a4hs+BDKYsuNPyMu4U8BVHySz01ygQSbvDw2yVqJvOQaJnu
   BmeD9UDtCCiCnJnSGznHwCJWta69FlkiTaIcdcWTTo3cpFqL63rkfUoE6
   v0TAIhqtovlAqn4vBFtXA2ocWv/5jn6UO+b+RGdrBegSVWEMbBCLZZnTt
   AUrCG/1kwArKxdaazxwBaktcC8+MKnReiocEsg4aNDR6hz13saQvBaSMy
   mSVVLvPFg3CVPosO5s8k+58xL9QPDzmb/K95Ct0TfESWTC/eaCVRqQuyl
   g==;
X-CSE-ConnectionGUID: w7i4A++5RnChFw4FSWpQmQ==
X-CSE-MsgGUID: zQ6X+O9pQmqXwx0BcuLz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048241"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:04 -0700
X-CSE-ConnectionGUID: k91rygOhT723GMtFxvq20g==
X-CSE-MsgGUID: xBw2p86STBqC16wUgNY5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919482"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:54 -0700
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
Subject: [PATCH v1 17/55] media: i2c: imx335: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:10 +0200
Message-ID: <baa2a9ec1f109a8c6bf83f31f25b669848f94d0e.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 9b4db4cd4929..16173aeb3af0 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1026,7 +1026,7 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	}
 
 	/* Get sensor input clock */
-	imx335->inclk = devm_clk_get(imx335->dev, NULL);
+	imx335->inclk = devm_v4l2_sensor_clk_get(imx335->dev, NULL);
 	if (IS_ERR(imx335->inclk)) {
 		dev_err(imx335->dev, "could not get inclk\n");
 		return PTR_ERR(imx335->inclk);

