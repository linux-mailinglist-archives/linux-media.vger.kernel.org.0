Return-Path: <linux-media+bounces-35379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860ABAE0CA5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECFA1177B2F
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3C928D839;
	Thu, 19 Jun 2025 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2mx/wp0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53828DF36;
	Thu, 19 Jun 2025 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356113; cv=none; b=oS3wtU9dcXjYVBDK0BmjHOFo1ZB4uFZGxlN8iHSXEOmR40NLSjZfd6JUDBXJKa6M83o9E8qOOyCs7exaEluHSobBBt+kjmqZeK9Nx7V9sFWk+h54uVSqwVfZ1hz4wbAHD3HPR18b12VCTL2Kpjn1wDcDbU2bm49IXRi1b8l4uhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356113; c=relaxed/simple;
	bh=e0sQLA7VcTCjZU6FaySd9ry+vsQ0ZYGJpaq2yiSSimc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNhs/WPcJoYTwsoMpKfZUzO2mrUv+8xvkK8oeRnw9QO+iSK2xQgdaspLCo8baKAyDOYwqH28oIeKpM8ssUqbzq1hB1isgIT6HNu4DPkj0wOdAvi5XPzkiQNWrlyNZfNgBXP488fPhD6Q3FWfjJ4E2EpqXyvXQnSnI8OJQih2M+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2mx/wp0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356113; x=1781892113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e0sQLA7VcTCjZU6FaySd9ry+vsQ0ZYGJpaq2yiSSimc=;
  b=E2mx/wp0Y6DOZLRit/qWxO/Q7JRfEju2Jns9ksOOctvirztygSs8B/7p
   RPSTSGC/5Ogux5Mup/hG3+KzeijWqVLhvRitSZZZKJvf7hERxTdCU7hVX
   GEwWN70bmGsgeS32nsF9WO0p3BzwcN2CD+aGsbli17GMynNywtrljRg2X
   qBPFRRL+DHoPx6637u5rPFjiLCJj5fEXGXaoPvtL+26TNkSQKr0zcrOuE
   RKgxehfTKqkT6hPHth8OQ8hetstgSffEU548pygMcgOGtHu5LvOnWIaYo
   b7goXrwRy30FhiZY22n19AZrTcxbmrOiCM1F+AqoA2pE4Mfd0VIzUoLi3
   Q==;
X-CSE-ConnectionGUID: 2c4r5SmJRWuC6vwgdOC10Q==
X-CSE-MsgGUID: X7wwR8J8RR6ZAqb/VpD1tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048020"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:52 -0700
X-CSE-ConnectionGUID: IFSYzDiiQky5n5lh3cxALg==
X-CSE-MsgGUID: t3A8PR9iSDaR11YEQ71uVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919361"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:42 -0700
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
Subject: [PATCH v1 10/55] media: i2c: hi846: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:03 +0200
Message-ID: <5f7cfbdd2cd16ebbd43a92b0b5c12871492313c8.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 172772decd3d..1ae5006cb9be 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2052,7 +2052,7 @@ static int hi846_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	hi846->clock = devm_clk_get(&client->dev, NULL);
+	hi846->clock = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(hi846->clock)) {
 		dev_err(&client->dev, "failed to get clock: %pe\n",
 			hi846->clock);

