Return-Path: <linux-media+bounces-35413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8FBAE0C53
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CDD51BC7780
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB52330E84A;
	Thu, 19 Jun 2025 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mmse9E6V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D852830E821;
	Thu, 19 Jun 2025 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356464; cv=none; b=jzCZgomR9mHvvjkTyWvxdKAeEFjXbiew3wbkG0yQ8RYse4yi7R6pV2tGUH4hvlXOd2hgsNwMHBe8xHE3346a1ZUSP+EBzb6dXJFsW+R0cujlXDYiLF9yfk/7YFW4SR7L+53Qkxaz0Vn3S1s34i293Ml1t9E8TVlKM0smaS9Gkj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356464; c=relaxed/simple;
	bh=CmT9rjN8h+llFAh5a8g6bWh/WApISWsX0k1BnGTQgnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGZVKlYhkLt3YQ9PmDqvJbm2P2Og2rmTBdAxyuj+v+ErU3ZdC6slkouNBrEQcoQYml4omJ9VxL6NHlTVhX9qQ9GdJzuTXz8r83tTrGpwAVdytonQZi8V3OSFlwuEQ5gowZJy3LzDKz2Xg+L1sPD9mfz+MDifCLWLo8qd4yUKfXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mmse9E6V; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356463; x=1781892463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CmT9rjN8h+llFAh5a8g6bWh/WApISWsX0k1BnGTQgnw=;
  b=Mmse9E6V/Ma2VnPVdQyoCWFse+hcVuWYBKyEYQGofX8DbyllXK4pU+Pi
   70Jkykjx2XlsA+StBJUHdPycgraWwW0QbAb4T/jGikbd4KG1/euZ70NyE
   d55QVgZiAwsNUSesRx92i5qGN4mAB87iiLlKKOcbx3BCJ1GsG5cYDkGml
   xoRfLjLQ3d4VncOqfKVr+mteviHZ1wIii7wv1fUBphcC0AOJkImuM1eCm
   licqVgEJPtZPy0KTp86aHXZrcE2ZPJK3K8ajU/gQMc4BCJhnLMBENyB3o
   M/wLLqaar8qgXlj2hwjEwTi54hW2H4XFgWJ3ZbiMzgCejjRn/mDaCmqCV
   A==;
X-CSE-ConnectionGUID: ipTSyXeCSva7x/AmWFVoUQ==
X-CSE-MsgGUID: Dvga30dvSte6EIRXn9AY0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64049040"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64049040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:43 -0700
X-CSE-ConnectionGUID: h4GYJssvTB6XwOe7Xc4rjw==
X-CSE-MsgGUID: +UFWHv1HSQCnIfHLCYIhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919870"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:32 -0700
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
Subject: [PATCH v1 44/55] media: i2c: ov9650: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:37 +0200
Message-ID: <015b80b572b564e8af10ac08bc594443c23f16e9.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 026ea34d6291..18c60c91aa40 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1494,7 +1494,7 @@ static int ov965x_probe(struct i2c_client *client)
 	}
 
 	if (dev_fwnode(&client->dev)) {
-		ov965x->clk = devm_clk_get(&client->dev, NULL);
+		ov965x->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 		if (IS_ERR(ov965x->clk))
 			return PTR_ERR(ov965x->clk);
 		ov965x->mclk_frequency = clk_get_rate(ov965x->clk);

