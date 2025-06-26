Return-Path: <linux-media+bounces-35978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E4AE9EFB
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7121786A1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6E52E62AD;
	Thu, 26 Jun 2025 13:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZSNpGbS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E62E54B9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945031; cv=none; b=ZtG4UvPxz5hb/UfxOEL9QyxYmNJlyljAMoF64eyITheqCiJPKvn/M+QeeBMd1GsFRN4qMbLCJ4YN19Hj4WFLivrXUfOoQqLTUhZ7VxYgw+OtS3KfLCY62l7vbqEo/WmfVzKDUUlgYslWY5Z4S7j9JKPiivGg9raSXctnptEYies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945031; c=relaxed/simple;
	bh=Ei8MMJmM7vR40vm8Azs0RJOFsrCHo6VAOmSPvHVUyR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DnyPHRH3bSLIgrxNXwCQ+7Ee7/0tl6r4gRLFy9bgYSKbbX2wOTAuxcqCtzu03knRXAkjPIecDMRjiUmUQlXSplviWZkfbFcJbv8GeYRmlzJhMf4SgKl+2xep6kvSEQ41d3U7YCNjDY+j5EMiQvtrYkXM4YloGZKrYz7LjhWrX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZSNpGbS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945029; x=1782481029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ei8MMJmM7vR40vm8Azs0RJOFsrCHo6VAOmSPvHVUyR4=;
  b=IZSNpGbS3Ho0zzCTIbHulJi+33ULQl74Jf2II+f0e/Vq5zslFePgcy6q
   moeS9vPbClvJktQxoKQtRQF5xeRWTZWR7wZPRK8n1dFX8qfo4gYq2/3P1
   eGMFr9F7Fq1/kUQBUE/Ix5O/LDH0Vo3s0qemg7BORmJFNg3zCkpxBmBko
   cOb9gw6v2Ae8QvAmYbc4rJr4F+wa9ozjNlEvqSfJAou38cedEvVokHmt6
   S70qiOu+nWfoQda8tniTONNGQ4vvKYuEscAfy5fqqm/zuS5nupMaZ6npm
   e3pyurTR/NREqRBaIJMPalNpM828Ert/SNVT7THsAatsY1Tv9EPuHAjn9
   w==;
X-CSE-ConnectionGUID: 9OTxE8jrR/GVobQw7BgtsA==
X-CSE-MsgGUID: YxQ2J7YNSxaUaupB4KckXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921630"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:09 -0700
X-CSE-ConnectionGUID: naywniIpReCL75t/Z6Jn5w==
X-CSE-MsgGUID: 7edohm1cR5qeU4tO3DUm2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049532"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:02 -0700
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
Subject: [PATCH v2 20/48] media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:11 +0200
Message-ID: <d8839d4855487f4c00363678171337b4e2d36223.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/mt9m114.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..f12d330c0a78 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2360,10 +2360,10 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire clocks, GPIOs and regulators. */
-	sensor->clk = devm_clk_get(dev, NULL);
+	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
-		ret = PTR_ERR(sensor->clk);
-		dev_err_probe(dev, ret, "Failed to get clock\n");
+		ret = dev_err_probe(dev, PTR_ERR(sensor->clk),
+				    "Failed to get clock\n");
 		goto error_ep_free;
 	}
 
-- 
2.49.0


