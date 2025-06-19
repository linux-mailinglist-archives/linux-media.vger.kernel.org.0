Return-Path: <linux-media+bounces-35380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E18F2AE0C71
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5891BC7E68
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA9128DF50;
	Thu, 19 Jun 2025 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgfb7naK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBF28DF08;
	Thu, 19 Jun 2025 18:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356123; cv=none; b=uh7nMtB6mKDMKpVLaYu1o8wrTiXs5JdC3xCdde0a99pl6CHOkyW3SiPYQPphMb8xiXcDvQjgOyh7a4aW67LRReFX0VIf2eBue10yYyUKrKZyQ9/8yMFTm0CKC/PA5Kq99jArcBfWRKA1W8bxKNiJraA0Cca15p5lzlXwwZpzE40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356123; c=relaxed/simple;
	bh=o1NwHoj9JPsS8E0cUUG2MAKjHahzwmMc/pvDpHhvywk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=elS+DtjbVGHE8amg4saa6FDv6SuwC9Z9VAX+0hDz6E0kh5Nag05qcpfh2TX28efhWEUISz8kJvK8Ys8OFbmreZ2Pi53w2l3rJ2Gw6LCvUFf3P8MUWtUNcs+ULeJcTBtUDFXzRacKr7etpb+WtBts+1/pxgiqkkFkk7G2amrYG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgfb7naK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356123; x=1781892123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o1NwHoj9JPsS8E0cUUG2MAKjHahzwmMc/pvDpHhvywk=;
  b=jgfb7naKriyyWhQ4WDso86dP26cWd6t01EanSpBpIgNPCTglOLRDLkdL
   7pqSSzFF1Y2VzfSZzUarMvpNvT2rE2bNnTPoaXSAnphOUtrDU1H6lMTon
   YxRiKkWId8KvRYCID38lMrFwMMzewL/6e05JoH3HKA5PAJZnPLMb+3RQ2
   di8iwxkLIrgs6ly2aGSESBp7g8JjkwGgJZxyGM4xGTGUL5un9IGs06pMF
   SUG7OjgrkUVnCzpT+raqregrjPAw0pQyNTEgI8hBkckBzMM+lv/577HGJ
   GfAQVkBwlpmpHkzsWpGyEdNfJx1KAc9XMxEqzyd+JtfZNliTs/3EMpdRb
   A==;
X-CSE-ConnectionGUID: ftkizoJNQEy+/6No+DOaqg==
X-CSE-MsgGUID: fBu8amG2TXWzLB6glRoBdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048057"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048057"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:02:02 -0700
X-CSE-ConnectionGUID: qHUFe0YmTs2ScI91qq9fLg==
X-CSE-MsgGUID: Sy+wHb3dQmuw9NbN+R6Mcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919373"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:52 -0700
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
Subject: [PATCH v1 11/55] media: i2c: imx214: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:04 +0200
Message-ID: <ed7ebaa3f176d155eabb37d1554d742385ebbc80.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index dd7bc45523d8..73e7bc2f85c0 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1271,7 +1271,7 @@ static int imx214_probe(struct i2c_client *client)
 
 	imx214->dev = dev;
 
-	imx214->xclk = devm_clk_get(dev, NULL);
+	imx214->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(imx214->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");

