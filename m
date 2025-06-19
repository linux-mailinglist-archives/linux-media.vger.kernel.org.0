Return-Path: <linux-media+bounces-35392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE674AE0C65
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 728B03AFF1E
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ED12F0C5A;
	Thu, 19 Jun 2025 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMb7ygS7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D42F0054;
	Thu, 19 Jun 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356247; cv=none; b=lpjgCskunOQQWBagjY6iE2ezrLUPncga9DYYBewFYBTbKTYb4GiBRVtc+URaYZ68P7+TjdXRa/YFZD7tfo7SGlm1qsdOXelJi9DObV8NYSkH/nx8970y4Q9Ym1Y91VkubULGuV8b0B+D6VoFM+yeJ5eZaxXI2dHRDgcgOdfErpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356247; c=relaxed/simple;
	bh=3GoGpJHW1OACvWTm9gWRMES2uxAkjp/4fTMmflRM0Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjhImu4dBqxwgnW5hIHWXjrDSvocCEDXMOstqFm3HLfj3Q4LNVQrkxOki5UyXv86fJ5YWdAQZ0sPEpqgwXCIMG9zF3W0FW5JwXBdnm5HTPUprMxyDA8WCL07Q7RYkG+CqGhfOeauLTa4ufVQbcMAxG4/3uX5GxTZZAH6rBctb9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMb7ygS7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356246; x=1781892246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3GoGpJHW1OACvWTm9gWRMES2uxAkjp/4fTMmflRM0Ks=;
  b=SMb7ygS75GRJD3S3rz4W33mmKDoCAjAwSk8aOfi5qB3ir9kT/ITzq1eH
   SxVa0UQ8ldA7hqpv0vVukzXrgAukfrrvlz6/hIQufdeSGiHqafRvnmCi5
   /iwnCGvoykHyP6tHNoz5c56ShZIhXNBqYIwomxbLthpxsg63kmhpzVW+o
   9wx02PbuMRzExz3B//s0TZDgGQeP76YJq63949UUOgk6yb5OEe3eaPa9O
   kukEzwt6MM7/eRiP2UE4RzdQCqDCVRBj76aYg++tNwoG3VdkQH2avNCtQ
   R5N19WdJZkwBot2L5WiLPBvyg5jjrUcysjE/L0fh24+2Ku6NVo2b5Lc21
   g==;
X-CSE-ConnectionGUID: dM0DFTvzQ1Serm1IlbrPeA==
X-CSE-MsgGUID: 6K7lFziRRYmkN2RVu+WHhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048402"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048402"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:06 -0700
X-CSE-ConnectionGUID: mAjiEWdnQo6boPhO9mHS5A==
X-CSE-MsgGUID: 9/7nxYHhTbagncTynufkXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919569"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:56 -0700
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
Subject: [PATCH v1 23/55] media: i2c: mt9m114: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:16 +0200
Message-ID: <391c9f9f82fb4b4fb91290697feae147edf89853.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5f0b0ad8f885..bef2512e5d48 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2360,7 +2360,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire clocks, GPIOs and regulators. */
-	sensor->clk = devm_clk_get(dev, NULL);
+	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
 		ret = PTR_ERR(sensor->clk);
 		dev_err_probe(dev, ret, "Failed to get clock\n");

