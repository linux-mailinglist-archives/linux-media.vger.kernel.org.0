Return-Path: <linux-media+bounces-35994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE873AE9F12
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D23093A8D41
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9E42E6D24;
	Thu, 26 Jun 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TF+4g9x0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BD12E62C8
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945138; cv=none; b=nccvWieNsB/LKXsYImOmjMdkGcUZ+qVhpUVx/wN2s16cxFB1BU98/eli7f/yV5Ko1EEs8Ff9Xu8s23vdmGpzAapQEMA1J5k5uJsQVtFSNZBx09qzWsZOALQZRK8bPSv5ZyeYSl6Gkhu/9M9+vHUiUN9Masy+YEP3ikb7KWCs8/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945138; c=relaxed/simple;
	bh=XIa53yYEG9XuEAX3yANHY50kjfv08jhwlvDMCafAdn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLOcDPcoA1i6fiKfKHmqi2qWNchSzxH/nLPrkEUucFs8WRT5q6vdr58nhE/NhKfLl58jg5RECVjsMb8MDG93fN+0pZuGwUNYEJ3snQOSEsEO1or56xVMu1IWnNpFxJ5TeB6alB/Cc5/7HvcTWcoeWHi7ynBRo0ZfrTcbSTFcbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TF+4g9x0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945137; x=1782481137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XIa53yYEG9XuEAX3yANHY50kjfv08jhwlvDMCafAdn0=;
  b=TF+4g9x0Lxsz69uOwP3AS68TQ2gFfBWx72x5c6AaXYtwccgFoq65/VuZ
   CnFTFuujSxWbNbNfPWDsdb4slwasGeJ8Ka0HlmIFLJA8vIQynJnkctmSb
   tIpD2vB4CF4lBBUWNAli+xf8H2YDMcFfzqb9qWJ3zvjZ7f9LXs1TIUeiN
   l+2+bJzqq2notwum+bhbL5IijF19MdM2Ig+h34zhqaiI0QauKHKYslpqq
   MIZ2wPn0MXr+Z8lTrZVtBcEc5ZzvFaEM/STTQot+mg2VvpGS9JaokfHSI
   E8tXq+AVuL1nUcmTVd60VxedBMwilvwMIFPj+esyY+Ss0itOSB9WJ4mN1
   Q==;
X-CSE-ConnectionGUID: kOicKPNvTd29oC5r8xi35A==
X-CSE-MsgGUID: HXaLiKtYQkKk7HXFOY4WUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922038"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:57 -0700
X-CSE-ConnectionGUID: 5b97mB4DTuGiqnQx1GX9PA==
X-CSE-MsgGUID: YqrVEnl/RMqxDtI+zcZIww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049806"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:50 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
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
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 36/48] media: i2c: ov8856: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:27 +0200
Message-ID: <23d67ecf9b167cbfcdec217cfde7c1fbd569fcbf.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
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

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov8856.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 4b6874d2a104..b85051f053ff 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2274,12 +2274,10 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 		return ret;
 
 	if (!is_acpi_node(fwnode)) {
-		ov8856->xvclk = devm_clk_get(dev, "xvclk");
-		if (IS_ERR(ov8856->xvclk)) {
-			dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
-				      "could not get xvclk clock\n");
-			return PTR_ERR(ov8856->xvclk);
-		}
+		ov8856->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+		if (IS_ERR(ov8856->xvclk))
+			return dev_err_probe(dev, PTR_ERR(ov8856->xvclk),
+					     "could not get xvclk clock\n");
 
 		clk_set_rate(ov8856->xvclk, xvclk_rate);
 		xvclk_rate = clk_get_rate(ov8856->xvclk);
-- 
2.49.0


