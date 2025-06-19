Return-Path: <linux-media+bounces-35403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DC1AE0CAA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640E816ED5F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBAF2FD891;
	Thu, 19 Jun 2025 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="as0OpeKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2962FD885;
	Thu, 19 Jun 2025 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356361; cv=none; b=A/1jrt0VTIMSo/RCHS6bXbvDvU0GVtDIfZKCsh7PLU7riwzM/jETRir8TqRmf4tU2FTo5nJIEkQpOQuMfP6DKvvGfakWCIyK6O7ufuADCd17pECKDTVu/fepVsME29hFAGFfAdYilJRbD3delqb7snngjNmyJANd69E94vVlHLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356361; c=relaxed/simple;
	bh=5Q7X3X49NqLqL1i+//1tCXp1vHRyWl7vlFKITvuaRvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUKLeTODk4zUOMmwBTxaGd7vHWGTIXNTVwqBr0sgrhCEi/Lx5uR0eAFCevFKkpeHX3E7gxNx7ORTAQD4AP2Yagr5oCYuOyLo2iGQ1s1Qwtq3zfVlNfr5oFwy44RroWMX5Y3DMzEJvwck21/jyasHdXGgOJqHojo859o9tYAHjyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=as0OpeKa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356360; x=1781892360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Q7X3X49NqLqL1i+//1tCXp1vHRyWl7vlFKITvuaRvU=;
  b=as0OpeKaoHRlOZk5E9ZmT29HCdTRznz2NEKQV4vjrowNQ/FC0cabI+Bw
   7ixNAiEJBVGHTtbSwBqit8PMXwoACxx3+JMmCMYz9RDcUoV9e3cBXAwb2
   z/qIC39bjOcPE/v/Fvc9GHl0rOY62SFSCq85AFCPkeShmkLue/D3g2+Hr
   UCe46eyPCGHQHnnPsZRbVI1EKAkDnPEqinUxdq3+GIKFH/Fw0H9qMPolQ
   0dT3cRuYmV2UAn3uM5rD5shvIsgRrS8Gs7Yuu18asfmb/yjjfd/NEuXDi
   eiO6y1ZSHjb6ptOv5TAryL3gaot/XWiMrrPhgwnqMUuC0P7k/tVyBvSPA
   g==;
X-CSE-ConnectionGUID: DBE4pXlxRwuBDTRE2w360Q==
X-CSE-MsgGUID: 4t0PvNHsQMGbhBZ4uxgkTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048738"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048738"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:00 -0700
X-CSE-ConnectionGUID: wIRL9y97QJWKCjntkRmtWQ==
X-CSE-MsgGUID: 5nRftN5XTEuADwfgjwxIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919739"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:49 -0700
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
Subject: [PATCH v1 34/55] media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:27 +0200
Message-ID: <a01a0817d7961b24f3b22fbfe3d1185be03a685a.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 4b86d2631bd1..8478ca3c49c2 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2521,7 +2521,7 @@ static int ov5648_probe(struct i2c_client *client)
 
 	/* External Clock */
 
-	sensor->xvclk = devm_clk_get(dev, NULL);
+	sensor->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xvclk)) {
 		dev_err(dev, "failed to get external clock\n");
 		ret = PTR_ERR(sensor->xvclk);

