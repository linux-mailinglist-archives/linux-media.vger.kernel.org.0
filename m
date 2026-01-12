Return-Path: <linux-media+bounces-50416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3158AD11A9F
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DA67300D43B
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2F6280035;
	Mon, 12 Jan 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c35bMh9B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA1A28003A
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212010; cv=none; b=YB9ESlUEqFOv9Tys9T8wPN2rtycIdSgF06CeTfuUIlJ73g8eJL8kn7A2iXlkcys57q+RzesuDSG/uAKt6nMa5+IrBBe7SXpvp3n2UaLzmouuxbA48534AJm4U+NYhKGb+tfqux1DZNyRAwJS8K/0VFY0CWva5i8b+CkoDXKHZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212010; c=relaxed/simple;
	bh=Ep9Mt2rIIlH1GUt+rPbxFrpenm9NNFcZkAmMeLxOIWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cSlVuy1Vhk0d/Nh8bE7iBlGQ/Q7wPLobMlX5BBd9QJ7X6xgPNhWRVbtOpQbOqZYFjMSgU1h2FTL5/Icbty5HwXdlBf+KPGvPiLjgreLUfvDDwfCwqxH99zuX6VKH4nqvzVj6XNzqDpedm7mREWWeksWc1F5vVG8F5jJ7aRMuHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c35bMh9B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212005; x=1799748005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ep9Mt2rIIlH1GUt+rPbxFrpenm9NNFcZkAmMeLxOIWU=;
  b=c35bMh9BdiMJzIYo4yNOsR1rLAGmGWwUXvJblA+PWmIf2tx6RDgEqhLy
   FKCxtweQBJAv3PrUVEUzWxuAbwjhUMm1GvcSH/lY5VtQOJfPXVdsNfi/R
   q3Qp/iJnj+2lfl44qxrJ1sBKaCQAIhzKnG8qwYRVrK8xQVJdbyavs638L
   0KZso0CeYD7Pdjizp+/xi52DiwTybJWanaczbi4K1MX4k1tDvg4bVLvrK
   CdXLLao7uZ7v4pS4NkZxENGkmtEj5+bTKQbSl7UQq5FEYRfe6fXDur+Du
   KfM9gV9FGOJxcMDiHrOZpMQIjk59uoNo6Qtxv6L/MyVQLWuNsgZfG7Zs+
   w==;
X-CSE-ConnectionGUID: bDSuPyjIQwuIOMmM23L4BQ==
X-CSE-MsgGUID: HhT+MUPHRECB6WlFytYJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218791"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: TjUqFvZoRi2FinFcOp2y7w==
X-CSE-MsgGUID: kOFQRgXUSOyAloxcXWNGbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743132"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 39407121F85;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011h-0Nw3;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 09/23] media: i2c: ov01a10: Remove overly verbose probe() error reporting
Date: Mon, 12 Jan 2026 11:59:35 +0200
Message-ID: <20260112095949.3851-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Many of the functions called from ov01a10_probe() are expected to never
fail and they should all already log some message if they fail. Remove
the unnecessarily verbose dev_err[_probe]() calls from the error-exit
paths in probe().

Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 34b7ab6eb286..f7aea9740a53 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -781,16 +781,13 @@ static int ov01a10_probe(struct i2c_client *client)
 
 	ret = ov01a10_identify_module(ov01a10);
 	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to find sensor\n");
+		return ret;
 
 	ov01a10->cur_mode = &supported_modes[0];
 
 	ret = ov01a10_init_controls(ov01a10);
-	if (ret) {
-		dev_err(dev, "failed to init controls: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ov01a10->sd.state_lock = ov01a10->ctrl_handler.lock;
 	ov01a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
@@ -799,16 +796,12 @@ static int ov01a10_probe(struct i2c_client *client)
 	ov01a10->pad.flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ov01a10->sd.entity, 1, &ov01a10->pad);
-	if (ret) {
-		dev_err(dev, "Failed to init entity pads: %d\n", ret);
+	if (ret)
 		goto err_handler_free;
-	}
 
 	ret = v4l2_subdev_init_finalize(&ov01a10->sd);
-	if (ret) {
-		dev_err(dev, "Failed to allocate subdev state: %d\n", ret);
+	if (ret)
 		goto err_media_entity_cleanup;
-	}
 
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
@@ -819,10 +812,8 @@ static int ov01a10_probe(struct i2c_client *client)
 	pm_runtime_idle(dev);
 
 	ret = v4l2_async_register_subdev_sensor(&ov01a10->sd);
-	if (ret < 0) {
-		dev_err(dev, "Failed to register subdev: %d\n", ret);
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	return 0;
 
-- 
2.47.3


