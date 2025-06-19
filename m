Return-Path: <linux-media+bounces-35400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4312AE0C6F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 355DD17FA3F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D49B2FCE17;
	Thu, 19 Jun 2025 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCY3/RDY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7474E2FCE0B;
	Thu, 19 Jun 2025 18:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356329; cv=none; b=t8S06UVSl8zs+mAArgxa2pL8y1L++qO7PU1H6i3Qm64GTx7MP0KYZnz2/saWvow11ilEE0759JZVSOyNhAZntH6ZF8QYUr9gvkmrLSb4zvuoYAqGLW3LHLF/8agsvIk68rlf5EMqeTwmrWOjruxR9ZQ5aQG+dCyUTYA7XzwWwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356329; c=relaxed/simple;
	bh=9oiBugjaQcKhzXaJcODQV7B0gO3fJPGuuRUmpghJfic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtfijW78SwdeTw+/nEqBxF2hFr9ANCXWuLriHpYQl4NytucPSe5pXzYNBee8bmsmwoGjDI/7k/1+16jDgOU/nokM6PapbRW6uzeUoQBoB/P5WW39Mpc1Y0FYFKifciHwMhGT2cs6zA+0Jtmt8OgPw3C4Vf0xRnHuJkjj/8+tfyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCY3/RDY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356329; x=1781892329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9oiBugjaQcKhzXaJcODQV7B0gO3fJPGuuRUmpghJfic=;
  b=ZCY3/RDYMxeT0syR2OJoNEc+mbmcfhvyLRkCF9qm0kcZpdfFQRfxFf8g
   9H2TMkGTAy7O9ipR0OpGaLg72YzH1skJZpXorEo2PCCA4pfyyeeBhuQc1
   tbzuy/I1b/TXZz/Ms4g0ZgcJpQQxsYgZfh04bwOyStfba/EQqkG+r/gGR
   e8pwvr+exVPmjv3XtotY1Lp/aB/9H67cyEbHnPfBTNTqkUg5viGKRLMPG
   drhGuBAggSDGOt1n95cx1kfENAMV5zfI97Jt3C2LAJ1eCdTJFsZUbeVwp
   wdjrrKdAevx/mkxwrq0EiolaNlJs4IUN+bwmcdPq48MalIgfU+LNz4AbO
   Q==;
X-CSE-ConnectionGUID: nY3rL6YRTY+HAXg8TaPZlQ==
X-CSE-MsgGUID: EMSmF+V1S4CBZUM0CTV73A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048634"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:28 -0700
X-CSE-ConnectionGUID: uw+RvbTcSXiC51eR2Iu2PQ==
X-CSE-MsgGUID: XiW3T7WuTNastFkuBoUjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919685"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:18 -0700
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
Subject: [PATCH v1 31/55] media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:24 +0200
Message-ID: <f3d97c26d7ebeb5baa146522fd30c25a530806f8.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 0dae0438aa80..861ebaaa20e3 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3898,7 +3898,7 @@ static int ov5640_probe(struct i2c_client *client)
 					       ov5640_dvp_default_fmt;
 
 	/* get system clock (xclk) */
-	sensor->xclk = devm_clk_get(dev, "xclk");
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
 	if (IS_ERR(sensor->xclk)) {
 		dev_err(dev, "failed to get xclk\n");
 		return PTR_ERR(sensor->xclk);

