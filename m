Return-Path: <linux-media+bounces-35980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F6AE9F02
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAFFA563616
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499E52E62BC;
	Thu, 26 Jun 2025 13:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEnoMXIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4E17B505
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945045; cv=none; b=EC9lH/xDmNEqhSxanvV5GPp18NXFvklY//XcwF43zgx4BMWkOujD/WshfTEQiUqiapZFRxmuq8gw6AT3Szv1VsH07JwoFh1qFzdb1WsH1dTgYrHMx6ZSOEDOeBTohVkP7L+hlVjHLiYrpzLPWoWHZI5qFDMkt+V79u938kZsX3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945045; c=relaxed/simple;
	bh=UKr0/a3n8pWnNaRry7lDLTTO0lU5lyPJZVzMmGZXjOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B126TXNYTXiJooh1YzJ7lhF1xxPUm0NKeMWhkw5b1pKRLaSQm/ufA7hoOovk/LIt4xw998mRn0Nauo5v5CyX/LMZYfiSbnvLwoA8mapblcirYLa3mu1fGJErqFs5wBuFul8mLzf1SB8X6V7wnDjvATIhk/99fCCcg8MZWqVmp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEnoMXIj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945043; x=1782481043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UKr0/a3n8pWnNaRry7lDLTTO0lU5lyPJZVzMmGZXjOY=;
  b=BEnoMXIjjQcte3s4zv0XrTM+SSMsNd+gedCHvhJur+jyRC/jVFwWoCDt
   rEZSg75k/0x83rrDjMIITYtMMTWpjuOSlXO8iw7h32OGACNdphDXNyyx1
   CzpKvvmiKke391xQnjDDHvUIvuoRZCB9ZDdXC/NLOx+7fXWHynzI2L4cZ
   HGuMjQs06Dl+PjDOosDDycu4HrQ6xhIFod8sgl+A5Cx/e546xB8tfyn+l
   zWeFrqPH45rZ8GQS/g4bDA6kBy8sO39Y6k995YSZWSHFSSQ2qSmv5EuZD
   tmCzqSN2CvttL/IhMM8NE/JSbvloW7jt1TROEbw6bYzKJdD2mgxx8113Q
   A==;
X-CSE-ConnectionGUID: vFUJSIsMTcKTEnDZFD9kfw==
X-CSE-MsgGUID: oil3eCztQOGUbzaVMv0NcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921724"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:22 -0700
X-CSE-ConnectionGUID: W72oXzivR6m+kuMd2D0VmA==
X-CSE-MsgGUID: McORzBNsQlSMZ9tIA+yxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049556"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:16 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
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
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 22/48] media: i2c: mt9t112: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:13 +0200
Message-ID: <b68ec86d66d25f29fa0cb8511f37e6240c8e6a4f.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
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

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/mt9t112.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 878dff9b7577..2d2c840fc002 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1078,13 +1078,12 @@ static int mt9t112_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
 
-	priv->clk = devm_clk_get(&client->dev, "extclk");
-	if (PTR_ERR(priv->clk) == -ENOENT) {
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "extclk");
+	if (PTR_ERR(priv->clk) == -ENOENT)
 		priv->clk = NULL;
-	} else if (IS_ERR(priv->clk)) {
-		dev_err(&client->dev, "Unable to get clock \"extclk\"\n");
-		return PTR_ERR(priv->clk);
-	}
+	else if (IS_ERR(priv->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
+				     "Unable to get clock \"extclk\"\n");
 
 	priv->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
 						     GPIOD_OUT_HIGH);
-- 
2.49.0


