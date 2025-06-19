Return-Path: <linux-media+bounces-35395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12607AE0CAD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22B61893CCD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DF32F2C7D;
	Thu, 19 Jun 2025 18:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BN70I62N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ED72F2C5A;
	Thu, 19 Jun 2025 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356278; cv=none; b=RYNJ9Hp6ko+D8q2GwfKeUj38Fr2ny77esRYr+0kNdzAaaGWmDmpRaitTk7b6q2up0e3Xwa+rziQT2xuMGbPRsDQ/TniIpHATRXkyXcOAJ0kWWPHZLvrF/d9fOSzf3+NVI1kPZOOC7UYLNkvaxZ6UysZt5unEll/bIVXgbx9DNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356278; c=relaxed/simple;
	bh=+aHtNY71VY7tCznfNNGDoDhIrfoGRZZOEiy4adyhO6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrdizFzInzeVAVSOcga/CDH8Pejk9nbtbrD71ls4X62uZqgZVCqZ9MbYzmui2iMsPWMQg5fOLZ3TjwWHxseC+qLoWQU9fI9AIJiJNInHQQBV/Hynr45sF8HXPkLaJcE8BtQvrEh4xbZHgNZtBD7I3iKn8nE6hT7PSFHDCdUsyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BN70I62N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356277; x=1781892277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+aHtNY71VY7tCznfNNGDoDhIrfoGRZZOEiy4adyhO6U=;
  b=BN70I62NcIAlOe+kejxi2wU8QtzemA3+6KutRt3WzuxfY2DbzkMEmMYg
   NNhb0ziks3sgZJ6EtS/wiXGYZk/To+9k0hWWhX6SROVUduJELerdkhn7R
   pFOhUOIBnybfk8tkiMjUZTKnW+cPjlbbkbI04EiHhHx4Po5ORWtdEA48C
   scRMRfnobKX0WqPmpdUu9aBbsKQWNFfKLa/lVJw3+PvlZffyeNNwx7RtY
   zTk0OP4dhWUQ12lZvA+//gCXhkpsCmhdKG1kjXd/7smaXTaNwtqHnhi/t
   MVB6T8FaBwKUo4A0+b/8IBpwcI89e7bJ0eWA5Fl5A+DN5LC3ZajZyuosb
   g==;
X-CSE-ConnectionGUID: KtscQDoTRqqIT1f6WCQaxA==
X-CSE-MsgGUID: rhMho8wwSVOBhTqkHVfGsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048494"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:37 -0700
X-CSE-ConnectionGUID: YU1fMfwWQcmT+tIN8jdJeA==
X-CSE-MsgGUID: mszErYU3QK+eQ340PLIKYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919610"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:26 -0700
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
Subject: [PATCH v1 26/55] media: i2c: mt9v032: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:19 +0200
Message-ID: <677a1d4cd8e13b27df977f59025719deae06ed04.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 302120ff125e..467a83c1da57 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -1058,7 +1058,7 @@ static int mt9v032_probe(struct i2c_client *client)
 	if (IS_ERR(mt9v032->regmap))
 		return PTR_ERR(mt9v032->regmap);
 
-	mt9v032->clk = devm_clk_get(&client->dev, NULL);
+	mt9v032->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9v032->clk))
 		return PTR_ERR(mt9v032->clk);
 

