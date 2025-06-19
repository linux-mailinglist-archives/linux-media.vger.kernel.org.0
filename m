Return-Path: <linux-media+bounces-35407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB50EAE0CE0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F05B1188A4A7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA829302046;
	Thu, 19 Jun 2025 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfOzZxu5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FB62FEE3C;
	Thu, 19 Jun 2025 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356402; cv=none; b=QalKrd2U5t3JT7s9kAo54IMhj6vo2AFdIsbAniEEEmF9QLTdDfvBbbGsiiC44RQ4LUGRTrVawBVggm8naYS7PFWekn6eDvubLgZOFEJWUKNbqxbATu83nacSMnIWErVK0v0Nf8t2NzoQ/BQN18ZG+VIkYTIIqdhUg5m1EyX7ZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356402; c=relaxed/simple;
	bh=WF90vp5njmnk/zu/jHDhmCuxkRYuJAEsgNBhLD6qeXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cpq8An7ztZQ72IpiAv8PA3/vSfoUN1arfSCHK0+Wr1F8o3XYYRSNKMKt9PSMO98jgd4Ht3mfWqcnq4eubPdrLbHc28W4svIGKQgNcyjnBMKGmrox1V/jTkdI3tESVvPjC4by1/cf8DQtBwajAZp972Pi26UkdcHo1c9Ir1htSJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfOzZxu5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356402; x=1781892402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WF90vp5njmnk/zu/jHDhmCuxkRYuJAEsgNBhLD6qeXQ=;
  b=gfOzZxu5tVBdW7tZO8IyTQNk+8J7xNONGxm6SDp+mhlSAkrv1hHYbEZx
   R00IKVzCnUeAJzIBhNVGh/gZxY8RPS2Zd28fFbX6COYxe07H8O+fW9nQk
   KAXS/5y+QlplGCgzOh+wTTZOhN6PSgbK+RYhEYcc3JvKsMvOVX0yNgREN
   JYlBk8W5MdhfyjygIcvl5X65wsy2o0PhaKkQf4ReqjW6xCg5gJPhet8HA
   JuLf2S+rf7sogPAN2Bz7KHbtIwxhOp/SaACEvmqyALObwhtw8Y3caGFno
   eea+06lPCX3Ya30BO/roGGae8PGIBUG7RlcGULguzF8uuoDVZnjL3JiIa
   w==;
X-CSE-ConnectionGUID: 6Xb3j0tTS6iiAiXtGljJjw==
X-CSE-MsgGUID: n2m9cQ9cRMqTIw8ess67mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048850"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:41 -0700
X-CSE-ConnectionGUID: l+1MwEGISPiAc1uivoLDNQ==
X-CSE-MsgGUID: ERLokO4fQz2VEljMAARvNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919815"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:06:30 -0700
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
Subject: [PATCH v1 38/55] media: i2c: ov7740: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:31 +0200
Message-ID: <5795d43406050ab66da51dbe1ceb8c801f6237d1.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 1f1c0de8e510..280855667655 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1036,7 +1036,7 @@ static int ov7740_probe(struct i2c_client *client)
 	if (!ov7740)
 		return -ENOMEM;
 
-	ov7740->xvclk = devm_clk_get(&client->dev, "xvclk");
+	ov7740->xvclk = devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 	if (IS_ERR(ov7740->xvclk)) {
 		ret = PTR_ERR(ov7740->xvclk);
 		dev_err(&client->dev,

