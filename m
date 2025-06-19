Return-Path: <linux-media+bounces-35389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42389AE0C8D
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9936D4A6726
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046462EE276;
	Thu, 19 Jun 2025 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4bDxwkO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BBD2ED848;
	Thu, 19 Jun 2025 18:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356216; cv=none; b=cicXdwB52ayZMUD2pyca6Wik6o9FWxYyzWQ4iMFJvxPWTHM0zXZOkhM7vcO5CstueVgD/odib4/NNJNZ5BRVv8mLJdMnCPMrOwPfT4EbjFjUK3AxfpJ+NsNa2SJknyTW9ZnCUrl6cVZAEpHIm1Jb/u7n4+DPurZ0Mcpjwxjo0Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356216; c=relaxed/simple;
	bh=TkmcLKf9kQVLg12uh3HsWKpr1QFdI/FOTRee/sqKz44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOP9SxxK+oUWCl1ngzopxZmvZvhW8If0gryyYyYE7/kaYHkyBb9CV1fY7Fmbsia31pTI0JtmUt2t7FIcyF/DDtG4pSzeZs11PUS1LRyx9WMSOB2PYZHOKrTxAPdJULGCMslT6pPFpSoWynKNpawQ5HFTk3wur1L7nPDd5R8gbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4bDxwkO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356216; x=1781892216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TkmcLKf9kQVLg12uh3HsWKpr1QFdI/FOTRee/sqKz44=;
  b=l4bDxwkOx/3hkbf7jZbLpC86+i7EZ9SzZhaJZzChGdBTwjT4cxN/UHpB
   U6lvz3OAGzyWMeOKzoOta+XEg0XpM0XwLG0g1Z1hcofS+6e4DyGZg9wd2
   vFtxyI2fqtuaU8hhVbCAKEE5I/V2AKnPDIyU7v6igIFBykohMDzhoBGlW
   aHvIk0ZWzNvllPLQDdSuEfvGLJ6wsSHvCM7YCiPuLICWZ5NPn2xG7A28h
   mng0NBe8C0OeOyb2bFKIaMWXnkq6f8fgjb5KkkDCZ2UzRLX6OvOhi2LUw
   xNgOClJpLScLLeqLq7CGEFWsg8JW8scWz2tSiqmjsq4li3gGxqTw05s0s
   g==;
X-CSE-ConnectionGUID: QfJDuj2qQR2yxf5flhTHEw==
X-CSE-MsgGUID: m1+kzudJS6u4y9GZpNlCDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048325"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048325"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:35 -0700
X-CSE-ConnectionGUID: c/YOn5flQ8uDrUSAYjSizg==
X-CSE-MsgGUID: 6CnltQyKTG6TjMDeegtaaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919506"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:25 -0700
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
Subject: [PATCH v1 20/55] media: i2c: max2175: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:13 +0200
Message-ID: <5d6be0edde5b0810b5560baebd3f41bf78da9521.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index bf02ca23a284..07b6e42567ae 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1305,7 +1305,7 @@ static int max2175_probe(struct i2c_client *client)
 		}
 	}
 
-	clk = devm_clk_get(&client->dev, NULL);
+	clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
 		dev_err(&client->dev, "cannot get clock %d\n", ret);

