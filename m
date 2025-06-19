Return-Path: <linux-media+bounces-35375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58057AE0C4B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:02:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92BFC3A8A47
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190C328E575;
	Thu, 19 Jun 2025 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJ8RSSS9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26428DB62;
	Thu, 19 Jun 2025 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356072; cv=none; b=Jt8vX5x4I9a3RfBfMOf8M3RJ9NNwMsfddYkmOSO+jfQTm/O7Lgw5Bd9NhwlFKsSLNr90mK37IE5okhmzoW65X6RwsTIslaHdcJ5qZtjMjkQ4X7hL3IBQ8mulZYh/4azWXykpWk4LDTMOgjLDyPzyFnP3IrxeJ5PuLhoMQKo3Q8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356072; c=relaxed/simple;
	bh=m+ZUZ+xY0rPq5xshOdtz5io/qL4Yg1SP464CzNCTdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6gsoMhQhUzMtMHU1IEAd/U7dkxKiYm9uOoFsZGWH/JGR9X4rW/32sIhuQwPl0bbPpI2VkNkmW6ZcPpE3izg7R9kr5MiTy8y+9/9cZnFfsFgYeEorRoVNF7j9XW/rA/eg3s8tNyZsncG95Bq4kXe0D5h+Dco95l50dbj6n22PIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJ8RSSS9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356071; x=1781892071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+ZUZ+xY0rPq5xshOdtz5io/qL4Yg1SP464CzNCTdBA=;
  b=BJ8RSSS94K2xWJv7q1pfuVLgUAWYAFDIvq6f5e0JewP9biLCt0QiFOqu
   WJiY7I7JwFSxguOM+TZZH6QHIPOqZOYfs1y1saGf8L99hLv/7hPwRRUEt
   4IN6zgqJ/T3NvKJJB8U1MaQd4mlX4KGtQTIms5DIsMWTImVsbh2Yb2mdP
   QJw0hnL03g3lM2/4MWn2+BgARIxHj6Rj+Fw+irXbEELYIOcHost5G1NUk
   YFmJsuf6k3j6JWenLDnD0BXaDrJGzD/0A3KX35akJak5FWkNEDYx4uCXo
   xpAzo9+s06SBLMAEldphDkbYr+TDzUKoCtWIzUqNrtVIg6XshDqDFSw8s
   w==;
X-CSE-ConnectionGUID: 7JogRgr1TjmME/xL6ns02w==
X-CSE-MsgGUID: RVOFX+4qSY23DzLBJcnH2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047856"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:11 -0700
X-CSE-ConnectionGUID: T/TmCVa0QHuC9WkMjdDlAg==
X-CSE-MsgGUID: UDhJtp0wQjqkHVDO9YYP4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919329"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:00 -0700
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
Subject: [PATCH v1 06/55] media: i2c: et8ek8: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:58:59 +0200
Message-ID: <0da110e814e5d0fc194a1b1996e42cb7345be66e.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 7519863d77b1..3bc238e44f5b 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1433,7 +1433,7 @@ static int et8ek8_probe(struct i2c_client *client)
 		return PTR_ERR(sensor->vana);
 	}
 
-	sensor->ext_clk = devm_clk_get(dev, NULL);
+	sensor->ext_clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->ext_clk)) {
 		dev_err(&client->dev, "could not get clock\n");
 		return PTR_ERR(sensor->ext_clk);

