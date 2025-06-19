Return-Path: <linux-media+bounces-35423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA6AE0CCD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687221C26135
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A422E7182;
	Thu, 19 Jun 2025 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJioWVUC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2212DCBF4;
	Thu, 19 Jun 2025 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356774; cv=none; b=odHibtjJXyEWmba6F0b1ifbh/CgyTsat9dNT/vDuvbj8Gsh6VYGdnfY3VkCurj7LZhBpfeARh3ftbI1z/uQ5Sq6q9EVckE62+QLVEeIb5W5pzO1BzM8LSLF1JTuZTqR74ZDDOGrnQafqajMw9X2q/wVu7jIHWlNK7aWINk0hTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356774; c=relaxed/simple;
	bh=nO4IF4mR8vlPMMdgNFL8tIvgTckUJOfCMFNKPR3FzCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcxNSDMlX2X8BCtTV8YLNevT7RQTay2kMPKJr3rVucha3tQI8/yeQKrRUnXKkK6kfRQDJhuL6AWV4287sMQ/DqFvrswND3igBfqUcr8InSp2U5HPTnBR35QSCVdEW4CrlVsGgBrXn9H1irMLYuE5so1Kamc52TFyxeHSytW2lzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJioWVUC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356773; x=1781892773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nO4IF4mR8vlPMMdgNFL8tIvgTckUJOfCMFNKPR3FzCI=;
  b=NJioWVUC3NTmqtSkHhM0uqdlXkVzBw8JrTFm1kExYg1JuX6eLA2SOFkE
   Q2BGa8ibpoj2yQe9Bg21QVmq/jSO3udVLBHBzG6tcnzRhE5LSQBInTgro
   LEpYztPNA94Z4KdLLND6FSq90Hb3x8BMSbYMR0M6rBmdWCHlcoW2O27E5
   tNT4N5imPJOQFZ11M66s6Phf44kbYJzTOvpsuZxR7YKdNtjBKMARKmTVr
   3l0WVLzEIjBaQrqwWc9Ss7Z3sit7/e0/g17txdfcBp0M/ZASJNpDdan63
   AWEQj+A8CsK+bTD4+uoI/SyaFYLsHlv7Rdr+QYYbAahr7zx7fvkBDSf0o
   w==;
X-CSE-ConnectionGUID: DsLyKMvUQUOtqEK6mgvfkA==
X-CSE-MsgGUID: 9FQpvFliSn240uTIb6n0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70054532"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="70054532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:52 -0700
X-CSE-ConnectionGUID: ZDuf7pZ0Tl+OZqL67h+KXg==
X-CSE-MsgGUID: vscIPv4wSwSc9xdqtCyl8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150143735"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:12:42 -0700
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
Subject: [PATCH v1 54/55] media: i2c: vgxy61: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:11:23 +0200
Message-ID: <2c6da6bf52582377dc293a0be2de25d9df13d8b0.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
index 5b0479f3a3c0..d6529379d513 100644
--- a/drivers/media/i2c/vgxy61.c
+++ b/drivers/media/i2c/vgxy61.c
@@ -1761,7 +1761,7 @@ static int vgxy61_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	sensor->xclk = devm_clk_get(dev, NULL);
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk)) {
 		dev_err(dev, "failed to get xclk\n");
 		return PTR_ERR(sensor->xclk);

