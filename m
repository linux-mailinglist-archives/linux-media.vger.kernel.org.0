Return-Path: <linux-media+bounces-35390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B2AE0CA1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00B375A5728
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BC72EF2AF;
	Thu, 19 Jun 2025 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wdki1TcB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997B2EF288;
	Thu, 19 Jun 2025 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356226; cv=none; b=pVJTKYqf5iA3g/wnmlLaIehQnUlvRwcf1BW1zrRqdmfbbmfGZHtzcuwxUUrS5Vv5zM2olt7Zi7qBqBX7bVwHfhvpFi3HECWB5kfFNaRJQmKWxDrUpWwSn6wm49Q2lk903cbkPAzqKUGdbdSnvs/jBwAtxMnKgSQR/Xb7BLU3QXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356226; c=relaxed/simple;
	bh=vOEy371+AU6g99Pp9WvTcS60oQaQx4F9TzmC9QBsf2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKhJzQA6RYeoeLZiytzllOjjV3G7X1BP8GrF0K2vlm6yWq5QYX6hk4uZf0dn0Hy5rnYwDy1gEnGSlC3VvDXOHq9PzBBr+QQzKS++eJnfYpGhQPuRg8U25rHzbgBewgtYZBUII0iw06rDBIrWA8LPRg76Ij8+J1C5lK9SlBI/mLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wdki1TcB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356226; x=1781892226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vOEy371+AU6g99Pp9WvTcS60oQaQx4F9TzmC9QBsf2k=;
  b=Wdki1TcBDoTHlevIUXxXhayyTm7W/P7a29dumZcUSApzZWn5J8+gOFgA
   3R6uEi5edsLquLlDyXmtwuRuM7PKIDml4VAPAWlOeDhE0KRi51kApNeKu
   GI5oVrU7T19+3PWjEtbS69i5JK/n1engR/If1WKnnJdwtH3DKWTyE33bX
   n5IJrd9rLDmZ5Eeg94ltcV3lQfa6V9AECc8q8WfVwLWjIzDPBWOac/ivc
   vnC6K3zqD2Kd4HFXVFzz3N42up9wddWE6Lh1ZIpjPuGZJcoygmiM6ReVD
   +gMGixXSQvCPrWpasm3SGuPHuGfbxemzbrA0TXll0jeUfrLybXiXH1ob4
   A==;
X-CSE-ConnectionGUID: pKfJUZSNQMyYrhAYlmPzxw==
X-CSE-MsgGUID: SK7X5myPSZikOgvplRywdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048364"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048364"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:45 -0700
X-CSE-ConnectionGUID: iRyYhaEVQli9pDfqacwWNQ==
X-CSE-MsgGUID: r7wFbTj1QZ2/NCZpCCwZTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919517"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:35 -0700
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
Subject: [PATCH v1 21/55] media: i2c: mt9m001: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:14 +0200
Message-ID: <182e46db14360970be1761933a50e641dde62a4b.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 12d3e86bdc0f..184f0fb0963d 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -743,7 +743,7 @@ static int mt9m001_probe(struct i2c_client *client)
 	if (!mt9m001)
 		return -ENOMEM;
 
-	mt9m001->clk = devm_clk_get(&client->dev, NULL);
+	mt9m001->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9m001->clk))
 		return PTR_ERR(mt9m001->clk);
 

