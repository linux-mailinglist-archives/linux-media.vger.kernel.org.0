Return-Path: <linux-media+bounces-35406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2865EAE0CB1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9F6E16E9E7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B762FEE13;
	Thu, 19 Jun 2025 18:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V989Fta8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D22FE39E;
	Thu, 19 Jun 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356392; cv=none; b=b6X4oB/S1W4VeuAol6SM0Th21CcQtFjAcrEbEKTEkA246UVTGkNT5Otv3IbRlxufhOFncsL3HTxENPKLZmAMDVPE216d9cS2XcMQ0jLzgF4Qhjd8JHm6zncnNpbXXv/pOmUMLLbCuLBA2iL6ldb1PeEyjpdkdX3a0XWWHMxz7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356392; c=relaxed/simple;
	bh=MpjeIvV7GA6XvzJJFXSKGuVT7DnGxF3R7IjTC5n2KqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmLeTYjozX0EEZtG79/wDDcZ/JELPG1Ayt811JDNKAv2OXKLwOASGkaYeeQ7i4rwT76hhuOds4iDcnDgd5/IhwujKzDsTGjMqHmaMVETzPb4Fwj86LMxFpirlo5N8/g2Dxxm3XiqDjbIAsLzfoILQPyr6KOVq9Koua6q/Dz6F1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V989Fta8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356391; x=1781892391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MpjeIvV7GA6XvzJJFXSKGuVT7DnGxF3R7IjTC5n2KqM=;
  b=V989Fta8xOfnENiCaiMF29Uu0sSRIbStZs8Gpx2ARHmKWaXx6lGpBHwo
   MKZMq4TZdXKzfzA5+rKA4bLR/LY1E/Yd2C+Axow+xZV4Sgpp+5x8k/89U
   thR/Etypz6E3tVb2BPl/TtvjpJvWebdEZJv4Nc77sVGSF7rYpJNGQlgkw
   kM4uKkPUiDqrnKYNuQjv4Za0A9ZBCm97k6x6/2WbSfbAtcCvzsM9xYmEY
   v2jOnxAaDqMDEAf4aRjAhIUgomtsUpuPrTgaG8UFzv7s2gvYjSB2gRze/
   qsCT4svgbSSypxIFzzoq+cWjnP7gcK3vmMEFoXaLZ6tv/cFdMrC4RiANm
   w==;
X-CSE-ConnectionGUID: j2UcSTXZRGS4knA7ZplvJA==
X-CSE-MsgGUID: r8Fog7pHSzWpg1+HgUNtxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048821"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048821"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:30 -0700
X-CSE-ConnectionGUID: 4H77CYiwSKqV7iJAyiSB8Q==
X-CSE-MsgGUID: YOxYRkiGRq6+T5AFP/qXdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919792"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:20 -0700
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
Subject: [PATCH v1 37/55] media: i2c: ov6650: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:30 +0200
Message-ID: <8bd026035e56b21521b7722d9b50e0e9e12d4c42.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 9c7627161142..251a9058fe18 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -898,7 +898,7 @@ static int ov6650_video_probe(struct v4l2_subdev *sd)
 	u8 pidh, pidl, midh, midl;
 	int i, ret = 0;
 
-	priv->clk = devm_clk_get(&client->dev, NULL);
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		ret = PTR_ERR(priv->clk);
 		dev_err(&client->dev, "clk request err: %d\n", ret);

