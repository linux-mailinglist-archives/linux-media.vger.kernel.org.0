Return-Path: <linux-media+bounces-35975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4925CAE9EF5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED0767B2AF8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDBD2E62BC;
	Thu, 26 Jun 2025 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PErMWNJC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5A2E54B9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945010; cv=none; b=upOvw+nMCF/wS6hXKj9W1qvixZpZB8d8UVXpLPr1UUEj3fb5375UfwrAfVorBoSh+qJFf7CJK5d58In+fitiwNIdnFBl996C2vghiafa5SUwDxvRwLFJQNz3roinJ6/t+rX3MrHoHhvhSA1Aln1LuOsMIfODdUcOP+zuO/iFHiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945010; c=relaxed/simple;
	bh=9DcNBys7YE7Gs5gDXSVQlxv0GBi+RjR38SXXqMTcyXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ9KJSlXc4xW59paVm+y3DoIb+vz3zwlMQ5Cbyt8y2DsQ9WIySIvKnEKjQtNSPNEPBxvWFMv2Cme4oO8xTrPU/gp1/EMeQlKvUSMuF4s+LPNrKdiWrfAAGcEhbxyDEoi1TPRnvCrKjtWqz+GrgW2NwP2h68j4A6JX47Zl4NuVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PErMWNJC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945009; x=1782481009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9DcNBys7YE7Gs5gDXSVQlxv0GBi+RjR38SXXqMTcyXA=;
  b=PErMWNJCLwDBLppW0fGq7HrnHqqTcLqNdqxjHnrTzQXk4ISGvxySf3L2
   hg52WvZ0ybpGkTSsk51B5ltj6grQ7+N5Z3HKGfE3X+dfoVgL7vflyuwW8
   be1VT1aiSzC3WNbt26sD7+CyOIF5tXytmcGQPeO2w/uU4IU93T0wnSNrx
   U96ZzgRrRy6EcrfXj4fpAymGSIgmqVRG+E2XsCs495OkbE2xHpeyZ9ZrZ
   Qd4ZE4373N7kzA/NDOMsUk+JsVPalNUfhjTK9ToD44x3rj5GAYWKf77e8
   xg59AdjdBWW87spc+cvw0sq20Ltz2HLgbLjM4787DeXCdo+sXT/IHXV1W
   w==;
X-CSE-ConnectionGUID: yNFrLm6/T+adW9i5oTCkog==
X-CSE-MsgGUID: e/Ls7/fcRba+sk4S7YJ2kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921529"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921529"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:49 -0700
X-CSE-ConnectionGUID: Q5tKFB6fSCi9nkLf8dAJuA==
X-CSE-MsgGUID: frEGtlblT1m0YKXMgZUz3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049477"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:41 -0700
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
Subject: [PATCH v2 17/48] media: i2c: imx415: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:08 +0200
Message-ID: <abbcc533c6e0aa9d8cd02a746e134dc356fd31b5.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx415.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 9f37779bd611..2e206a671ed3 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1251,7 +1251,7 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
 				     "failed to get reset GPIO\n");
 
-	sensor->clk = devm_clk_get(sensor->dev, "inck");
+	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
 	if (IS_ERR(sensor->clk))
 		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
 				     "failed to get clock\n");
-- 
2.49.0


