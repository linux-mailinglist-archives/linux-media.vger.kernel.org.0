Return-Path: <linux-media+bounces-35399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D0AE0C6C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2167C1BC7D19
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525B82FC000;
	Thu, 19 Jun 2025 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMRgA63U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794112FBFF5;
	Thu, 19 Jun 2025 18:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356319; cv=none; b=thU/qteWXhGZh7nYVy3Mnto0pbPXQJeua/Sa+nV274JSf3yjBOWpFiyv4yU+Sya5S3sam1CcJSMNjg6tN+GwK5tkwWSnaiuhjVy03vOaeo2KwiujNvmHYn4iS/6d48vHv+qQLWbK74WsEYUp9sx2QJpze72byXBW8+/1yH33T+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356319; c=relaxed/simple;
	bh=OBfm0Z7KHo3zhWVfOu1Aklpp3l/ok0UsbyQhovNsACk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8c8acXW4fIVb9xElVOXrEBLcg9/vl+VlR/gLMb/HEPkivup1PlBrgtdAJDDaoHagb+AG4Gcr/f4wl+T5yX68tD/8Bwuc4o836vIF6xBCTnhFOcdcZYOVR56uSUkURN8Ml5/zvuenBZZXd45IcwcL7EOs2KRtpCTKQWupAXCuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMRgA63U; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356319; x=1781892319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OBfm0Z7KHo3zhWVfOu1Aklpp3l/ok0UsbyQhovNsACk=;
  b=VMRgA63U6rz8GqxNTj7oD88t/N0N9t6aNHdjSvO9hDC19OTgAL+kESA5
   nGsg9lAXQsUdcTWTMI40vo1OjZoXGmaXBXmJQTNEMf5pq19ScdgLthQIO
   spXUgLDQ8nsiBr+DNdLidwud7kQOx/N20RfP4aJIO4kzyvFJYNMSylODf
   utmVVDvVZ4miIPK1qbpWMts5YhBPH6wjc5seZZ3RAEUfEQcXGZUgHzLhL
   o9XwRCftoZ0nq4qse0Ho8TMJabdQEeuCmvgrmh7Wr0V3sVV+G3HYbQOMI
   1oQPmouAX3D2+IH3ABjkn2yBZLhktqc74pY+eZ1uxeyFJGcQnGppsqEXX
   w==;
X-CSE-ConnectionGUID: P9Jw8PsVTP+OpJFJ2Ff18Q==
X-CSE-MsgGUID: PjV9Lmi2R4SEiYc7fZb9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048608"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048608"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:18 -0700
X-CSE-ConnectionGUID: 1i/pjNBZTKelaKQStaKz+g==
X-CSE-MsgGUID: tupsFgB1Qt2Iy4MoD3CwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919657"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:05:08 -0700
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
Subject: [PATCH v1 30/55] media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:23 +0200
Message-ID: <c27fd5a5c5160c51daf4319f6ed63ad251a9a71c.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 9b8481b8dcd4..dcd16530078e 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -783,7 +783,7 @@ static int ov2685_probe(struct i2c_client *client)
 	ov2685->client = client;
 	ov2685->cur_mode = &supported_modes[0];
 
-	ov2685->xvclk = devm_clk_get(dev, "xvclk");
+	ov2685->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 	if (IS_ERR(ov2685->xvclk)) {
 		dev_err(dev, "Failed to get xvclk\n");
 		return -EINVAL;

