Return-Path: <linux-media+bounces-35409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F069AE0CDA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2F384A18CA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD85302CC7;
	Thu, 19 Jun 2025 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPzznblT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5E302CBD;
	Thu, 19 Jun 2025 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356422; cv=none; b=icGWZ0hcILTCAblY9RD8IkKwzX1YzgD/rypYW5/FRpYrWsjMv9iCDVXHBu/8Ggq1WDFGCKP9Q9EZH9fpM+GBbCBSH/uo2YqeutUmP7uYRCP6HHFo69tpNwfcbhpZbD3MAcr3aNDfN3FgUxnjwd19IzyiWfKGsBLQyjkryFKiXao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356422; c=relaxed/simple;
	bh=f3sDdwtUZhDEcf79XqomQs4SepX/r2Sw6ij7LtfOWOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poKaliUnzEnGl/KduAvqCAmkOhctD3DN/v+gtpg8u1sNaGei0NaJaVvIm4+MXGBTuw6qRsdr62b/mwPsgA0mhIskAnXukNta3RMbPt4EQLUrHzJDGj7DMm4GKXBWnHks85P5Fd5rhNAo6DM0N2fcUDG3xdYIpuiwshaq1ITQ/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPzznblT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356422; x=1781892422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f3sDdwtUZhDEcf79XqomQs4SepX/r2Sw6ij7LtfOWOA=;
  b=MPzznblThDcZ2ddYBy90EoAyZb/Y+aA+wQQrOuJEOFB/eXdxo32f0cTM
   fPO3m+Idi+Ry8BfrVJ1SrG5XN2SNGBHT9B9bx7sftUzSIuIApz9/pzEyX
   vfnwHg5N3eJjLbk0krdjK4FXDiKvDWzNdq3AjjTdjtY1maIAG8KMv5u9D
   S8M7vqNQ1kM6u5UkCi8cVTJrTLZRGKNauN+qFFBLHR3xw86osV0OnFuke
   XNs+BKtQtajbw9BS7vdNo0kIL3iiJFCNjOZXdHlvS1mG4wVmkRIh/Wlvh
   cO39WGwbg2pnVCBjJeu4hmXgUFEPvrgQ9AtIsIigjMKsKQQJhes80YZgQ
   g==;
X-CSE-ConnectionGUID: 7Wv3/ucES6aYKS7ignt7xw==
X-CSE-MsgGUID: y8aYt2pDSOKc3liWgwpuRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048906"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:01 -0700
X-CSE-ConnectionGUID: 9fQ8HL/JS7KGa6H4wbnxXw==
X-CSE-MsgGUID: BNhm6afZSNKzbN67cGH6Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919849"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:51 -0700
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
Subject: [PATCH v1 40/55] media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:33 +0200
Message-ID: <d804ead8b28d50baaebfcd0ffcfe9c8cc266438d.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 95f9ae794846..c1c6bea8a68b 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1877,7 +1877,7 @@ static int ov8858_probe(struct i2c_client *client)
 	if (!ov8858)
 		return -ENOMEM;
 
-	ov8858->xvclk = devm_clk_get(dev, "xvclk");
+	ov8858->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 	if (IS_ERR(ov8858->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
 				     "Failed to get xvclk\n");

