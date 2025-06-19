Return-Path: <linux-media+bounces-35378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840CAE0C81
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0F5F189E7B3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB4C2918DB;
	Thu, 19 Jun 2025 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NeeEAFhY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63524290B;
	Thu, 19 Jun 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356103; cv=none; b=q3kiCfy/xpzpw5Iihle2tbX/Y5KcoWzBTdZjjGr5HUd27jcNmbMQOoJy5tnHpc0J/zNPN/polxwF/GM3YZSxxqh/QPUw1wJaRIMOvlwhhZdg6GHDzBJ1nXjiruzuAIkTxyOhLoD18lVAH1D/PaT1fJVRq745cnbWtAXAP6y0Syw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356103; c=relaxed/simple;
	bh=i/Voqwf2C7DA8RP0nEiNittzYGjVN4O2kjayJh0irpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRfvoiz3oFFCmUTY120kMKnfrVEDl2hZz8/mqTzrSMDkCLXe6c4w2HN8lpZJ2TRqq0nFfvfCYcyLGDji8BNwA0/edow3hgmJNbNkRHHBwcQ/n/xePNK1RdY306WxTChgsfpLXSFWYPukjclCIDS7Ss1R/LrZlrZIdZDzQ+eGSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NeeEAFhY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356102; x=1781892102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/Voqwf2C7DA8RP0nEiNittzYGjVN4O2kjayJh0irpU=;
  b=NeeEAFhYhcOnuSHqJOJ878CcxRmQrPRW1IhHQ5LVMgrEiCEOwtqDkS2B
   XAfwSIzXpKDAkkuQtGMUhI18K+9/sw6J8W+BrQoEj9bpupYAuwaBrND/D
   3R3QwC2qhX4+J5u4UbeZyfXUYOWqoXUKNaHIPFKyEOg3aHtwY0NSaicUu
   TbO77ImG6zyOlwSW4KH81Bs11Jt57Qm2noD62tWU0bVdJhlNUNzUuJCGH
   mmLrLVxhcmZeBWBGzURWwN+cJGzgR4Acu2uEDxfH1Oq6nyva6TK7+d1Br
   4vq8RvFaq2YH8/16AaZOP6xI2/Xvs620mY33Ouy2IZ/C28IXsnkhGdfNA
   g==;
X-CSE-ConnectionGUID: OiJh6o3nQ0S1g6UVa0TiUg==
X-CSE-MsgGUID: AJ3tkMzbT/++7UC9eZuReA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047968"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047968"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:42 -0700
X-CSE-ConnectionGUID: FanaB42fRta/fkQ79Ab2mg==
X-CSE-MsgGUID: +nICZbLzSwG24ziAbYQZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919353"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:31 -0700
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
Subject: [PATCH v1 09/55] media: i2c: gc2145: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:02 +0200
Message-ID: <e0d0185d45bf2b5a2778e890e09eb30ef1e67bdf.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index ba02161d46e7..52d9387559c9 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -1334,7 +1334,7 @@ static int gc2145_probe(struct i2c_client *client)
 		return -EINVAL;
 
 	/* Get system clock (xclk) */
-	gc2145->xclk = devm_clk_get(dev, NULL);
+	gc2145->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(gc2145->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc2145->xclk),
 				     "failed to get xclk\n");

