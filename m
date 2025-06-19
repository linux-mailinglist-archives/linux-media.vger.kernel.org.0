Return-Path: <linux-media+bounces-35391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11239AE0C7B
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A3F95A0D59
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20E82EFD8A;
	Thu, 19 Jun 2025 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMhaG96a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1C2EF9CB;
	Thu, 19 Jun 2025 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356237; cv=none; b=P+CCDERjtDYnXqQ02/f6V1TD0JbmIPUTuuJc5QSY0hCEyUB1LU6qdeivjzYTWa0byoW3L5hHQy2MdhCyYAAV3W9r67mWeo97ze9AE8OK9mZaYKfEy3kXgfR2KILR7qkn0NjYcVVXrOLtDtwm824eqsuSSRCOHbfy/B61Yttc5l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356237; c=relaxed/simple;
	bh=Aq+cOsyREo2ELRLxvTpr3QezU4OjKJPCuGQzMllr1lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2BH2awKVtUN3uj62wMTO5Af01L5U4vBVfVP+x09X9afL2WudxMhNiIN1CO77csSFDGtqfbTTFpg7wi1TQvyZeGbrPDx4PsArAWokEaNFyIY2fFAiWsIFEhiM0DY/VH/2yaTCErZ2BBS+Tl4skZuqWN90ZaHY9hf05/BLfEckjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMhaG96a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356236; x=1781892236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aq+cOsyREo2ELRLxvTpr3QezU4OjKJPCuGQzMllr1lQ=;
  b=jMhaG96ayNjg+aW6PBY+crD78yAiYvh7x8rxyNqUANMtNl/Q3vicMc+m
   Ik++OJboIvOLoEiNftI+EV/YR+9zxBWsTPjcVtUT/AOrIAxSAKK3mtLwV
   d4WhK9QzQmg8bB38dyEn7HLUnvM6H5RErCo3STVaFLWylSW2FwqnI4lFS
   fI5hZ5IcV9Xjcps8zaYxiuHhoYFHeqyEQXao5XfSWOiJ6GgV/CyNm68Ce
   /AiOXF2wc2vYv7v2EQ1hgQCIdI+EIfT5yA7RkCgbfXiaI5sLJ56bDQKlf
   HCbZI7VX28scjg+I5nPTbUHZ+z1dCmXTPRmOvH8tISx9SwtWlE21hbewE
   Q==;
X-CSE-ConnectionGUID: I8hoM/1YSu6M+PVFa0THcg==
X-CSE-MsgGUID: uwya9ilGRAmtUpBeEPWT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048381"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:56 -0700
X-CSE-ConnectionGUID: KbGpNULCT+WBwCRN+pBGIg==
X-CSE-MsgGUID: evB0gVIHR9iTLnAziS2S0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919548"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:45 -0700
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
Subject: [PATCH v1 22/55] media: i2c: mt9m111: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:15 +0200
Message-ID: <acb92670f031cf5858acdad4a7fc000482b7f632.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 9aa5dcda3805..8011d16d4874 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1279,7 +1279,7 @@ static int mt9m111_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	mt9m111->clk = devm_clk_get(&client->dev, "mclk");
+	mt9m111->clk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
 	if (IS_ERR(mt9m111->clk))
 		return PTR_ERR(mt9m111->clk);
 

