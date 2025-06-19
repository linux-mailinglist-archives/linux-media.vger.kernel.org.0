Return-Path: <linux-media+bounces-35396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585AAE0C75
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3193A3AA3CD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECDF2F3C2A;
	Thu, 19 Jun 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blx+TM3/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75D52F3C1C;
	Thu, 19 Jun 2025 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356288; cv=none; b=CSW/z3EfqfZKCNOO4DQmPSrsbhSovJDW7rlFfF4kC2Te4W8Mz19+9QDKJFhPqt+Mcm2ovElMP1M2NaSN07wcqkHfqSv6LKo9KxDr+x+8UteYz4vXaUDORCMp1UQgWHc9tORUyzvPGjtsRKFwEmG98VYWZ13zNqlt+L6aSbM3RCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356288; c=relaxed/simple;
	bh=68/cwgDC2LnKzPeB+SVYMjOAWRK0l+eNjtm1DAuaUU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qova++nMaLsAOylEQyRWzkpff/HaZ7I0wrr/V5X2SL24JQ8aHOGrfPv+NigdcbD0mGeSVhXxV4OxneJm+H3QQmhzNk3tRqtCl85rMoTN073rTzN24iOQcMvdIC0SG9pWNS5ygE1lQhFa9Kive1aC0xwYoCZ/+nVQ7Qca++aO0hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blx+TM3/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356287; x=1781892287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=68/cwgDC2LnKzPeB+SVYMjOAWRK0l+eNjtm1DAuaUU8=;
  b=blx+TM3/yAe+PfOFixqJVIepzwXsXEZcLitrHJ0I5IC2EFXqG6sAfkDQ
   iwdCG65yLSa0H5b8A0ljR5HMVnZPm50fdJG7A8XNKmXqgx8opgksq+xcW
   uQXF1vl6pfHNqUEYYBnVkbGfbHU95A+2Nw6ltQHtQhj4k74n+2WiJpF0P
   pMR1+yFmkCGPtX8wVI9STiRfgSdsj9c3RTHKy2aGNX8oSvAEskrEhrmfc
   ofvD4QESZnSRtIKALjCUDj19oVNJpIaUNH0QzHUpwmpuE6MeAgzGaA4CV
   WPMdPUDJ+fyYC/638T6MxwTMu8NqL5DOqWgYd+rRIK8xjaRyBmP4uZtug
   Q==;
X-CSE-ConnectionGUID: i66pSKMlQHCIjj8eIGqW1A==
X-CSE-MsgGUID: H+0WU/F6RJqVR09BVD+M7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048524"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:47 -0700
X-CSE-ConnectionGUID: YIFkbbUYSgOIREL/9bpmWA==
X-CSE-MsgGUID: cQ1xtTo7Q6uBMgMpRFak0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919616"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:37 -0700
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
Subject: [PATCH v1 27/55] media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:20 +0200
Message-ID: <1068bd1bdd57f683c676490c561fd21db6fe71d7.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 723fe138e7bc..f92648b1777e 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1129,7 +1129,7 @@ static int mt9v111_probe(struct i2c_client *client)
 	mt9v111->dev = &client->dev;
 	mt9v111->client = client;
 
-	mt9v111->clk = devm_clk_get(&client->dev, NULL);
+	mt9v111->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9v111->clk))
 		return PTR_ERR(mt9v111->clk);
 

