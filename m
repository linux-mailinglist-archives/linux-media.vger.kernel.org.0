Return-Path: <linux-media+bounces-36004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED9AE9F20
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754033BC1AA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F932E7173;
	Thu, 26 Jun 2025 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRSxrMJS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505BF2E7161
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945205; cv=none; b=unMR5FCxErugpA9mTvb8qo1rTXj6etBNl6nxszM8HV9lvLsjxsq+ywDuAOWtPVj/CcG0HQm9moQkEb5l0jXhZn3fMRmm2mtyo1cGrgMdPPCTYaaw6TJOmnzZvZ0LSpOJZlWBxZZqWt7hw47/mp+fKp611KEX60uF8q1zrgt716k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945205; c=relaxed/simple;
	bh=R+uXM9Jc6I1j0QC58GJpFWeW0snr7e2mf+jbpYy2h8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6cqCHQ9lsGpPDBAWExOokgKIqzZSyNSI7HUV8VV09lf1bVczG+3Ug/4OHKJCiZvPbql80Smb8/DZO/VHoVXFH0DY9NsbkXIZZ/jh/HiIpAHxLmYAc8PPECJLe87P4jKKz7fWmijPHaWu93d7gih6/mnlqphsxNir5Dj5U1h+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRSxrMJS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945204; x=1782481204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R+uXM9Jc6I1j0QC58GJpFWeW0snr7e2mf+jbpYy2h8Y=;
  b=FRSxrMJS5uiReKGzSRZQuOj6A065aOADzbwwaE1vJEOLlfmUhdx0BYpU
   HYtFY6joQzEBJHDkkZFj56YCV9r+LJbYt/yetpFMPfLw6+D4thu4LvfH3
   MNvpYxo1WC4Pa7//KkuLvpiPcw8yGNwEp2ZGrRRmEvELtpv4RcYwSOn+D
   CJTU9NfLrVWi50nsBL9fjpJOxH1HL/pC6gI9DDKQNH5g8S2WURtYtCNzd
   2tuGx/U3PNmpxKDar9H0H5Iavcd2WY9gnSkFc3XEu1q/Z48uPcq/REp6D
   mEKUKiQ4XgJw7OR16V3cvfkaAPMIXDodHCkfokeHr7x14wO01x2pJ/Eot
   Q==;
X-CSE-ConnectionGUID: t5G4XjI7TLWPwRkbZq4upg==
X-CSE-MsgGUID: TsrBqpSWS+G03R5Tk84KvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922233"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:40:04 -0700
X-CSE-ConnectionGUID: sVb0YTFcRTq0G+kX8sKdIg==
X-CSE-MsgGUID: 4YrPMqvpTrOLF70VDEDvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049992"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:57 -0700
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
Subject: [PATCH v2 46/48] media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:37 +0200
Message-ID: <1393a3e72f71a98b3fd658c4b451acad2f6a0770.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/vd56g3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index 5d951ad0b478..ac3e868dbb43 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -1474,7 +1474,7 @@ static int vd56g3_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
-	sensor->xclk = devm_clk_get(dev, NULL);
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk))
 		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
 				     "Failed to get xclk\n");
-- 
2.49.0


