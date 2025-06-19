Return-Path: <linux-media+bounces-35426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F517AE0CD3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05CC6A3B07
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1465024338F;
	Thu, 19 Jun 2025 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ll94N3XT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D200019D8BE;
	Thu, 19 Jun 2025 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356969; cv=none; b=Jwj/iIv/ULOtyeMyy9DF9gp9veeMeXyKu3lWnd6tq5QhB6QuysApksmuur3y+WihnZyRGZq+KRqbQQ8dQYu5CovARXiFE5Cn0Ngho4XiUFmko4fDDznCrhJ917xTiqPkWie5d//d4ygsXXQ29XQcyMPj8VVFBskRHyyvp/gbqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356969; c=relaxed/simple;
	bh=mpFEf+w0QGLYo3xIzQedg1K/z/JheVCzGBaCbwHxiVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhkbVFlZETmLFH7mpen0RblZVoakOWrF6itURb5Gu7hEuYnF9YKkSjs6nzvWXu3BzTfOsHPJ0ayT0fsCKSvyj8Hh4t4qwTguU+CTWiBFtb1TVaCfrxt3TgYVhs8aLZwBC64x/g6CDaFVtpxKyzLV4LVCGGJs9Z2T2fRoQUySRwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ll94N3XT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356965; x=1781892965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mpFEf+w0QGLYo3xIzQedg1K/z/JheVCzGBaCbwHxiVg=;
  b=ll94N3XTVD05+qnXp3sVKF3GgbCc3rgPZKxkEhiCQCjQOcIoRLgx7cj1
   p+TNqtachkCl8AzX582A1MI8yRMWiH6Wf1MntQbqGZ4s+1Q8wT/TvFUfo
   PN3f1qvDfY4I+rWrdqqSBp1ESPuGYnj+KSN/vD7W6bLNCSYgVXNjxDlmn
   3S9GLbECLXrugb03tNcjxqXDBY6wPHJkuTURx0DWn08p1A9vYLIOcARwG
   PHOjB/Jvtp4XPiOwELq0/22Ww7qOxlHTom9VS180F8+IpSUmjZFaEZx/B
   1lKPGS08HbgrGZ8EZhy6uKqf+PIs4Ha2o5eURYzwla8HewfDLb/gKhVYz
   w==;
X-CSE-ConnectionGUID: 2uRCA2NlSR2ESrzT5RH+LA==
X-CSE-MsgGUID: z40fsIsTSKeveLJLNxy65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054863"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054863"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:16:04 -0700
X-CSE-ConnectionGUID: Z5VQpXgETg+pWLmC9AnLHg==
X-CSE-MsgGUID: kFNKHWbrTx2cr+nh8FALJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150144287"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:15:54 -0700
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
Subject: [PATCH v1 49/55] media: i2c: tc358743: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:15:36 +0200
Message-ID: <d3ea68f3df017392b03e32b55dfe16eab3653559.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3d6703b75bfa..24043461b60a 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1930,7 +1930,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	u32 bps_pr_lane;
 	int ret;
 
-	refclk = devm_clk_get(dev, "refclk");
+	refclk = devm_v4l2_sensor_clk_get(dev, "refclk");
 	if (IS_ERR(refclk))
 		return dev_err_probe(dev, PTR_ERR(refclk),
 				     "failed to get refclk\n");

