Return-Path: <linux-media+bounces-35382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 913A9AE0C9C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059661C203E8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CA32C179B;
	Thu, 19 Jun 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kERAWvhb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECDA2BF3E2;
	Thu, 19 Jun 2025 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356144; cv=none; b=mm5OhgQQ8fat3lDCd+OcvO5bjGkLdWwGF3OVwbodd/vCY4bL/5j70QJs5gwqBAXyMYz9l7QpAzERiEKjnDrKz2u9+PEHB8SeCFnQ/P6f8cseC5cv6ajjxUD327PCfKayZhfvHtP2050QgcomjuZOe95XG7b4RXRIEFUgFFTD45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356144; c=relaxed/simple;
	bh=fJqzzvXwqVFvHg7tZmNtL1fJddi7wsl4qsm/xDfvmXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUDNq3r+H9L43xQIKlL8kVph3VTeEYnmRefoRGJieAFKFfZk0sQT1Mbp0EfVAr7AEMHlVzXk9B+2LuP697o69oSBMyjO5rXg+ZaS3pLyD2ZhOV779EhWkURr9jd0tTrV1LG1HF49AnP3ZlKjXWy5zEhTd537GTQd/Dfu5GBOKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kERAWvhb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356144; x=1781892144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fJqzzvXwqVFvHg7tZmNtL1fJddi7wsl4qsm/xDfvmXw=;
  b=kERAWvhbsEQzUr7aUx2ALxMfx86Me8v893PtVKMP6SjVOy7pYCD35FIn
   kxPHz4inrhkKNh/saiOaz9Nf9DCQpwVFjM/+rgOaO5m3ROwek00/kciI8
   gFESvJqxhqpd3ogng+5PcZD+uwBrCd5142UOLiuCgpBKHxAwYcGNDPsv9
   arL1no7aCaES/b/ZfBkjsSggNNwzvAclig/z0s6MFv3Iut4eJx7Gosjb6
   dhp1lTH2aHcn4UU1BGAysypifuowrEmQysqLJk9krzccy5BHr9msenOlu
   mydjs4hffpd/43fsLQi9wjlRBaHmwhyZayMvX87V1GP4wTz5bry55TuGL
   w==;
X-CSE-ConnectionGUID: 8fXuw6ltTgaQgXB4NDG6iw==
X-CSE-MsgGUID: uSSQERhNRN6AOHng8JzZmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048124"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048124"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:23 -0700
X-CSE-ConnectionGUID: R1/VvB9aTCmuUu607rlpFQ==
X-CSE-MsgGUID: jLmvdjq1TRmXEFaCVNhBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919413"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:12 -0700
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
Subject: [PATCH v1 13/55] media: i2c: imx283: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:06 +0200
Message-ID: <4ed793d95d4fa0b49dd6e06bcc03d0b758eed382.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index da618c8cbadc..582fb528074b 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1462,7 +1462,7 @@ static int imx283_probe(struct i2c_client *client)
 	}
 
 	/* Get system clock (xclk) */
-	imx283->xclk = devm_clk_get(imx283->dev, NULL);
+	imx283->xclk = devm_v4l2_sensor_clk_get(imx283->dev, NULL);
 	if (IS_ERR(imx283->xclk)) {
 		return dev_err_probe(imx283->dev, PTR_ERR(imx283->xclk),
 				     "failed to get xclk\n");

