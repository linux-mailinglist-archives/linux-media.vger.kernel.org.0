Return-Path: <linux-media+bounces-35984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9DAE9F09
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81BE8162CCC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD262E716E;
	Thu, 26 Jun 2025 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAkZCUD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EFB17B505
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945071; cv=none; b=h4Oxo/iDy4kgxXVHk0kccLgkPLqhW9Rd4opywVMmptpUJ88yUNHZRiwwkhxXC4Z69mNybgaZWEz0zaOcE0Ex8QfhaFILhe8VIDGsIM0MG4RvMid/GwffCs6kaVeJemahZbAgbnZdsYUOseniVSt9f5WMB6itrjVeC6TrsSnCZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945071; c=relaxed/simple;
	bh=UoFFt7GgDOErj4HSczH0TrR47Hn+sRmLx2wEXLHv27w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMLZbqP5HNPSZbUYTvBovC44/sBe9vgvzgiWWgngjSYPjHrfzYtcsvbiz499yYB3NtHhkpAdez0l/g386S/E8TorgFv4fB2lchki9kQsYLPb923YprBIVG3LcDW6u6EHwdIcGYUyzR92oU4420W1evaY/cWE93z+5PupB+ertvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAkZCUD/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945070; x=1782481070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoFFt7GgDOErj4HSczH0TrR47Hn+sRmLx2wEXLHv27w=;
  b=IAkZCUD/G8vx6tPTelxJVpyZHVpChyQ4sVcuBUrq7SkCTpOHj/ShNXMa
   pAi9NALemknQrWl7KI/Do3gIAPg8JVKbz3aC2IYDv7uuloV4JgHVFvw9v
   9vMdpIZRg/6KtY05e0Q8KBUR/db3TH3jdkK/8Ql/aR/Uy7yacJ/7nB40f
   lzgRQaITl2Cd/CI6O+SRTUvNGgDnHSCBRK5Jp+/WbASQHVXpAydjMJGFZ
   yURrJNGMo79iuCm99su+jJDm8yroeFqCqgXZmsb8OnfzYHqTeP2s4KsQ1
   4/3ILKT8QIKqwjus2Ujgy4pOE6FN1Ksc7/aEr6K3rY7BORp6z4HY5dwev
   w==;
X-CSE-ConnectionGUID: l3UG+XDBSqykp27xqkHkkA==
X-CSE-MsgGUID: enjGgxkDQl6h6/PCJcUphQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921821"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921821"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:49 -0700
X-CSE-ConnectionGUID: WGS5SyxqTSOifmQC/dPGQA==
X-CSE-MsgGUID: BhjtEhC9TRmyku0YZ7UNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049598"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:43 -0700
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
Subject: [PATCH v2 26/48] media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:17 +0200
Message-ID: <4425009d65ef1bfd3aac6b44b9553f23eae698ca.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov2659.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 06b7896c3eaf..79d7f760f6dc 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1437,9 +1437,10 @@ static int ov2659_probe(struct i2c_client *client)
 	ov2659->pdata = pdata;
 	ov2659->client = client;
 
-	ov2659->clk = devm_clk_get(&client->dev, "xvclk");
+	ov2659->clk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov2659->clk))
-		return PTR_ERR(ov2659->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(ov2659->clk),
+				     "failed to get xvclk\n");
 
 	ov2659->xvclk_frequency = clk_get_rate(ov2659->clk);
 	if (ov2659->xvclk_frequency < 6000000 ||
-- 
2.49.0


