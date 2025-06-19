Return-Path: <linux-media+bounces-35422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D7AE0CB7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 617657A8E00
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C133029993D;
	Thu, 19 Jun 2025 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CiK0omLT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32D28DF25;
	Thu, 19 Jun 2025 18:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356764; cv=none; b=WzT2yVmcP44dQo37ObJ9PuuuSPut71uynh8w0ChwhHfG1xqtivGtFfu804bYFLlY4zztaX83PGiOoC9q0RhKUudvayx7qEcjPMgGn2bSLVh2oqLH7lXrEyi942MkPeNQ5SP8HoxF0FNBBTLbdIr0msFDlOYYqLnAeMizgv+tfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356764; c=relaxed/simple;
	bh=oT8FbQZ3WZ8aiT2xzMJJKrg0Q9nmErWwFkCSYAZuXlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mb/HI8pChC60CWxdc+DKNM4/ezljtg0cWfwAk7SKunHCrWixWMqUJ7R+53wfg7ajW+TS5F6UQv71A+2p+CfTk+7BfMQUSwH83Kc+O29XnqevA7EV9oJi2It4M/JXNEeuWuEsnYAvpTs/aF7U/oyDxBdpmwTsgBJpJV1KhIbdtP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CiK0omLT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356762; x=1781892762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oT8FbQZ3WZ8aiT2xzMJJKrg0Q9nmErWwFkCSYAZuXlc=;
  b=CiK0omLTQ6lQ/UHY05KMWlB/ljzH6YTCTrfRD8/vPvuHq+j4mrDXcDfJ
   GkvkN/6ke7yj9+h41759fbcTaVNCiJzGiPbmra3+YHX3fUXykEu88QXGB
   btyjLH0WYHPhtuJzFwCqwPi8OY+AMcO6VQcAJK6iIj4ZkToCLI3c0UrV3
   xAQnoWfRIuOX0PSfn8XK2nQ3gfvhoR/VM+LaxqjN3eMqnO+/86+Zt834P
   zPoxuc9O3pzhrShrHVnJpDv+ZvYfs63V18CH1qeUbW9r3hzfQTWlSip6K
   oXv9r/QFQe+E4yv4h1R46JkdVzbaURscybIC72NndNlv3+cN9NvciFp0Z
   g==;
X-CSE-ConnectionGUID: Xc08+7bNT5+BKjBPxDiuqg==
X-CSE-MsgGUID: HnKH9DXtRmqT9O5cIwlYfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054499"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054499"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:42 -0700
X-CSE-ConnectionGUID: GXA3uZcpSu+idVhju7F/Kg==
X-CSE-MsgGUID: lEDrlKcURZej0OPpBgX0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143720"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:32 -0700
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
Subject: [PATCH v1 53/55] media: i2c: vd56g3: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:22 +0200
Message-ID: <7eabbe177e33cc7974913aa3c35d56456dec0456.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index 5d951ad0b478..ac3e868dbb43 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -1474,7 +1474,7 @@ static int vd56g3_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
-	sensor->xclk = devm_clk_get(dev, NULL);
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk))
 		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
 				     "Failed to get xclk\n");

