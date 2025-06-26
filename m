Return-Path: <linux-media+bounces-36000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC3AE9F19
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91BC167482
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDAF2E7162;
	Thu, 26 Jun 2025 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SO+wmXlp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE12E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945178; cv=none; b=IE0QeUEgMTxOfsAuOc8Jwr/NWZsWLMJf2/3IJkjnmjiSFgF7AM/9r7rKEBhBUUW6QrAEIyIap3QuXRIPqnP30tyraMvL1nQdY275Uwkz4hieNK+kbgd5H8pLkEMz4vKORvXQXUWRkeZ7GTHFEo9jgYctXG9K5wXkRcogcUCj1ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945178; c=relaxed/simple;
	bh=tY7f4pbDzvKHvQFgvo2qAJkC3CJ4pIFcFiiFHKqdrBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SX61PJNT5VM3FO2IOb54vnPIQu/rmJUi7gAJZbIQeJG8+DngDJB5OnRCbdVui2hSydueGRIU8xnEijzJYrXKXEE1F957YCfvUxI/2yl9H1TX1vOcScDULWbnZz15KziqyoWuFoKQoubYcVaZuzRi7dVoLRFihK4Iiv9+Rs+ifH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SO+wmXlp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945177; x=1782481177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tY7f4pbDzvKHvQFgvo2qAJkC3CJ4pIFcFiiFHKqdrBs=;
  b=SO+wmXlps3NTKjhYZsS7QL2vEmnitHCV2w5oSSP/tvePhU6C3RtmLfZR
   dh8NgRwJeOGNrF2R2Ec4R75EbpJxw3/oHWdJdXILElKIGi1F5zYRBnPaM
   okLtW4ojuIRIsv/dE/YRyRW91PG2PFQp3y30/IaA0oOVt0/8FT2p+H1wn
   UPOStOxmYg0JQcTEEcx2HvpHG2Yc9uGv/rIC0mpyMIjkR2HS6HrryTag1
   umEwlwAxsR6mVPW3x/ARTPeebmeYUKj2B9NGW+1Y7bkvKCQSKrTRZiQgN
   u5MgdPi76c9EKaFrsUKC1l7tCm97vF0ZUhwQDQdKdeonj3vuxneGD5yUP
   A==;
X-CSE-ConnectionGUID: 5iNX/bk6Q/e9TKAwY6NJeA==
X-CSE-MsgGUID: NrFEIZOvSVqZNoIKCrokwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922154"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:37 -0700
X-CSE-ConnectionGUID: q8B/jFSOR9u048YTv6D1Gw==
X-CSE-MsgGUID: BLQ7jnR7TCux/SVHfyhhCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049891"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:30 -0700
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
Subject: [PATCH v2 42/48] media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:33 +0200
Message-ID: <fa220d2c8c4e740969761962f4e48453fa7a0668.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/s5c73m3/s5c73m3-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 7716dfe2b8c9..088184da5dea 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1556,9 +1556,11 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 	if (!node)
 		return -EINVAL;
 
-	state->clock = devm_clk_get(dev, S5C73M3_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get(dev, S5C73M3_CLK_NAME);
 	if (IS_ERR(state->clock))
-		return PTR_ERR(state->clock);
+		return dev_err_probe(dev, PTR_ERR(state->clock),
+				     "Failed to get the clock %s\n",
+				     S5C73M3_CLK_NAME);
 
 	if (of_property_read_u32(node, "clock-frequency",
 				 &state->mclk_frequency)) {
-- 
2.49.0


