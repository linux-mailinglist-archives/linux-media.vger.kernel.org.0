Return-Path: <linux-media+bounces-35971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5ACAE9EF3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456FF3A68CC
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88032E610C;
	Thu, 26 Jun 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnA4uElI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452C2E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944983; cv=none; b=AlJlIlti8RK+O3PojnpFkZ1U5uhCeRUqittuNdIeMPybXZJru80kVj42qWC7MMheg+bPw4YgISEyvRl3r+gDu0IkkhRbTk46AY/d0RIKXzwo3ZQEaiUrVjn8vZogp5FPL3H6aGMUI5vem1i5+Qs9AyBqm/jCqxwYiuZbIgsiCoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944983; c=relaxed/simple;
	bh=fUvi49FQAlTMBd8IFTFMm/QU0gax+n8pDbjwY45SvOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO7EuIKSNc+y8vhvITShKsRXjI45myVNs2vZZfjyys0RDUXd7RDfXRSLtxF+B6Wc3EOuK6FeIi2G5Hs4xa068jyztwSDnIP7IEtY2cmGIOjSXWyA3BOZja7yIYj09bbKDEs3MjmrPz3qrpMIOkteC3sDGc0z1SQ7Ut0Qkp/1UYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnA4uElI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944982; x=1782480982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fUvi49FQAlTMBd8IFTFMm/QU0gax+n8pDbjwY45SvOI=;
  b=GnA4uElImL8xkwh9YaCPFj0Kyq2rafkweUySURlsilgETzmt6SVlqFtU
   qGEIdgceotD9cSX/2uAUCImbPcEzVO5ejSRVbuo5VmargEBVMWY32HdcH
   Igv1OFdym1q+OH8xveOa1I2KiJKGwa4sF8xObTLtzfoeQdoDY55aL94Jw
   sPEx0aK9Gkf/VYQzumqTmuTYGxxhVwOi1De0UI+ROZTKhM49AMzw0C8FX
   F8cPCzOoe6rGl5qVw7391d8ZCh8//JKZVB3XziMLQBLwdF2zkyptrwuAK
   TjdxHE2Kl4i5bdLxB0VKeD2q9rpPCBNCGwWC392DpepsSr1nk3PmGR4ru
   Q==;
X-CSE-ConnectionGUID: uoIIb4icTUi6eeXD9ebC+g==
X-CSE-MsgGUID: 0NvYp47/SgO31l2eGhT+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921431"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:21 -0700
X-CSE-ConnectionGUID: 6DqFpDsMSamHm5XWVdKXeQ==
X-CSE-MsgGUID: KMp7Ru4YRyGY7AtszXIebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049406"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:14 -0700
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
Subject: [PATCH v2 13/48] media: i2c: imx296: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:04 +0200
Message-ID: <1d3d97b602f59563eb917e16cb379fa4395a5403.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx296.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index f3bec16b527c..3795b75a4397 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -1044,7 +1044,7 @@ static int imx296_probe(struct i2c_client *client)
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
 				     "failed to get reset GPIO\n");
 
-	sensor->clk = devm_clk_get(sensor->dev, "inck");
+	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, "inck");
 	if (IS_ERR(sensor->clk))
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
 				     "failed to get clock\n");
-- 
2.49.0


