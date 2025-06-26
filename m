Return-Path: <linux-media+bounces-35993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324BAE9F11
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AAC93A9C21
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D022E6D24;
	Thu, 26 Jun 2025 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/+sr5KH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3662E62D9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945132; cv=none; b=FZR5ewNjUM630HBSX322zjVmMDXRaSqmccRmXSfPEASBbxoGzvOrMS1EMetN+T5QgoDIvrz6Jh6f02lKUYADSf/Fc/IV4DqZYUpfSCvsU0ZcJImRZwF5Dlu8lJpl9jbRgC/Oq0ew+QmspPR5hc9u7TSufvHCzK9FZsV9bRWO2MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945132; c=relaxed/simple;
	bh=dYcQs1tyXS36zE6gK/P7KesWANpZ0tkF2D565uDxhQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=daos1nz6zKlPuhuiXOemlO8p10EyoSvcweG7F/k3nqEzp+V3ilzYKsGoLTPyQFT6uhOOYXT/mVj3Il9Hm8JS2xMvYaTb5hOr7nW1ukCjSNngOPCOBG7J9tRwCA+Y3TVyCNrndv7Qs7zMgj3DoTnmXCFB1ZuGik+gJ7z0owlq/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/+sr5KH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945131; x=1782481131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dYcQs1tyXS36zE6gK/P7KesWANpZ0tkF2D565uDxhQE=;
  b=I/+sr5KHgQUt+lh8Zh4E0iaYFKthgH0py4xQUyuDm0Sybs237LHN5tZ2
   zeVMagBddm5JZfOqDkFzecxgVwZNsVy/+mcXCs42BnGfgm3y8M3AHA2PR
   vekWWhuh2H8G1lVPbKdz6361DKKfbjpm8KBr50SkFu/DfeOr+ESvfiZQG
   c5OfEvoO4HTeNdbVXdmjosaKrp4O3Vr8OCVmgOgVgl8zHDhr7LEBCp2ZM
   nFqYGjAG5m6TMS8M5v9j0Q3YxQmdS1x8Q+Hu8u5NuRyiAm/rHwYzfXMzI
   vY/pIOm811LhGIi5I4oruyrEamykKLSMW1KPFyF6/6lW39OuGYLwpgZsh
   w==;
X-CSE-ConnectionGUID: 4L3NdZd0R+S8ZpqLvFRGzA==
X-CSE-MsgGUID: bHxUXmKiRgaogVVGf8fwBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922026"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:50 -0700
X-CSE-ConnectionGUID: q9w89SeVQlmkx+3oh+QBKw==
X-CSE-MsgGUID: J5lmML8xTx6eUwYPdWLqEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049797"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:43 -0700
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
Subject: [PATCH v2 35/48] media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:26 +0200
Message-ID: <f95a30d8ef56be5239f15b20b8301d54d1e0ef30.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov7740.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 1f1c0de8e510..632fb80469be 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1036,13 +1036,10 @@ static int ov7740_probe(struct i2c_client *client)
 	if (!ov7740)
 		return -ENOMEM;
 
-	ov7740->xvclk = devm_clk_get(&client->dev, "xvclk");
-	if (IS_ERR(ov7740->xvclk)) {
-		ret = PTR_ERR(ov7740->xvclk);
-		dev_err(&client->dev,
-			"OV7740: fail to get xvclk: %d\n", ret);
-		return ret;
-	}
+	ov7740->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
+	if (IS_ERR(ov7740->xvclk))
+		return dev_err_probe(&client->dev, PTR_ERR(ov7740->xvclk),
+				     "OV7740: fail to get xvclk\n");
 
 	ret = ov7740_probe_dt(client, ov7740);
 	if (ret)
-- 
2.49.0


