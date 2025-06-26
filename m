Return-Path: <linux-media+bounces-35985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F2AE9F08
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20331C44473
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FD02E62D9;
	Thu, 26 Jun 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQaI4h10"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E7E2E62AD
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945078; cv=none; b=DfR8+TkrShBHRTFET15ehpu2h3VNkxY7g7JlLVT3ZkB1I5bChgwRK1WiOP6tIzC+UaKRRQVkGwkvyia8ijhoskXllCGn+abJLQ8IJgSTkJEih5SLixQUmUKP7SkaSIzGf9VKAsE5eNsXb8L4665HYU7juKW4LAXyUd8wtNnrzTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945078; c=relaxed/simple;
	bh=vwt0z9YReV9jvTgvfjfAHdt3WYFBg5FRdut+CRH92EM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mu6FZSKemmaIVAeJqGccdDX4Wf3Rk15cp5wT6QGgc4iiQYz6cZxqczteZRaAqT0bu/xrUsPeA0/HOw1BpeVI7xeppsZ4k/M1nM+YXVb0qpbcrCzuwQ/vum+hJccZAXs6SRDJXocgwPuRvtqk1jZzz55q9PPX4svnYaR8s0Hnwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQaI4h10; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945076; x=1782481076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vwt0z9YReV9jvTgvfjfAHdt3WYFBg5FRdut+CRH92EM=;
  b=WQaI4h10sTuF9x2HZFpPuTZxjTM4xd5y2JFxrZ3UBSM6Z1A474jnzlRh
   DqIOhHufCWbnDTQvwX6D4UO9DHKx8+kwf7IhjS32tT4YTQfPpMjTZWCIL
   rzn8s5Zq2F/JQwbrNe+2G19tkSJzdukWUjUZLbhXnqx3zyRRS9aHGTgl2
   oYzjUbOdIlOjbKp3vq+kTUui9CjMLy15uCpghXl4dz8aq3rOfUmIvbRYK
   kWJG+OE8ntoVkvcb3xipf5PpEFTbMA8/3FVdmaN9mX73EElGcDS3K8yxn
   SmIWRIlZGwq0Km17ZfUEYLVF9jObA6yJKndl8Nwra9eusU2VoQAN5N1iJ
   A==;
X-CSE-ConnectionGUID: s4ZzOUw0Sn6ZJqXSFPDTjw==
X-CSE-MsgGUID: BuGi3lGfRZSUc+9gypm2pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921849"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:56 -0700
X-CSE-ConnectionGUID: TUV/VIEYQqeIYIJn7b4qkw==
X-CSE-MsgGUID: q18v8zcjRTa+++cnDOUOcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049618"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:49 -0700
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
Subject: [PATCH v2 27/48] media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:18 +0200
Message-ID: <153d025b1a0731beeb51b44de6d9e71a7bb83ae2.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov2685.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 9b8481b8dcd4..c435799514b9 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -783,11 +783,11 @@ static int ov2685_probe(struct i2c_client *client)
 	ov2685->client = client;
 	ov2685->cur_mode = &supported_modes[0];
 
-	ov2685->xvclk = devm_clk_get(dev, "xvclk");
-	if (IS_ERR(ov2685->xvclk)) {
-		dev_err(dev, "Failed to get xvclk\n");
-		return -EINVAL;
-	}
+	ov2685->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
+	if (IS_ERR(ov2685->xvclk))
+		return dev_err_probe(dev, PTR_ERR(ov2685->xvclk),
+				     "Failed to get xvclk\n");
+
 	ret = clk_set_rate(ov2685->xvclk, OV2685_XVCLK_FREQ);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set xvclk rate (24MHz)\n");
-- 
2.49.0


