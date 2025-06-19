Return-Path: <linux-media+bounces-35376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ADCAE0C96
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBEF7189DBC7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6683728DB62;
	Thu, 19 Jun 2025 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaPfwLsf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C928D8EB;
	Thu, 19 Jun 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356083; cv=none; b=KapkMnr6irj3+MxuIRB+yx6m9J0IVX/BjNM+zjLg1wrce77fOe+MXwSKImw6r4lmojYp9n+5N1LGLcXGjAfHFMbtn45K3x8+95BddZ3KGI9h3FeFO4ywDxKoYlHm2SSBbjuoqO1BiBnYRNAzc8rb4Yob9oJ6AYV67eeq6ovKDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356083; c=relaxed/simple;
	bh=iwy0qPXxu1wNsI/BhicSZq5S5fxF8PgJXwP2EBfuKjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su9A89EfxEuWGhRfh5bdYrmJYcslMlvPjikRTluSJlGQYb8wTSwHYU5LgvNNT/CsSwW3SaEiGFENuAnvpXuozF2+L5QGLLl8cL5ZQ+lpAjurj8io7Ij69a1GFUKxXzSIyHwlAiKr3IiHhiEJ+HJzQmcezm2+ZrfBuPWoM+rUsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaPfwLsf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356083; x=1781892083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iwy0qPXxu1wNsI/BhicSZq5S5fxF8PgJXwP2EBfuKjU=;
  b=MaPfwLsf/d1/g3Wqoox0VVtP0LR5Lfi+oPLo1RwNmyzsZla0zDWg9NlY
   h3qmafGc/KoT8E2Oayaj0pTQV1TLGQ5VoOBmiOmWYQp0H0JBi+fsjtJnl
   NPxjpAK2J/0SkHkQzkRMixdbWuMyzf0FBNJsygJSuqYJ3AiiMhSRXfmbX
   rZ1Rv4kTcoCLKo0qMKai6vap+j37y3p4wIlKZrz3Ek++wHas/lzuQSHpx
   CFz820bKOA/+5rgPrL/7jtXq+sO74rhYvrSG1fovW3xOr5aTfpoOh8fUf
   81inJNXUocMqmqnCyN83fbPyUEUcdw68R+CFGTUGawgpQfdcT+lytA4aK
   w==;
X-CSE-ConnectionGUID: 4w5iGom9RPW24zMFK/GU5A==
X-CSE-MsgGUID: Bu8/46TuSrGnqfxtvh7Arg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047890"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047890"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:21 -0700
X-CSE-ConnectionGUID: TllHjBlbRSGNLMIITRlvEA==
X-CSE-MsgGUID: ao4wnHStTk2+R/DY74X4lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919338"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:11 -0700
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
Subject: [PATCH v1 07/55] media: i2c: gc05a2: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:00 +0200
Message-ID: <e1d7e4a0fd10debdd3325af4ba3084ff886615c4.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/gc05a2.c b/drivers/media/i2c/gc05a2.c
index 3f7f3d5abeeb..4dadd25e6c90 100644
--- a/drivers/media/i2c/gc05a2.c
+++ b/drivers/media/i2c/gc05a2.c
@@ -1235,7 +1235,7 @@ static int gc05a2_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc05a2->regmap),
 				     "failed to init CCI\n");
 
-	gc05a2->xclk = devm_clk_get(dev, NULL);
+	gc05a2->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(gc05a2->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc05a2->xclk),
 				     "failed to get xclk\n");

