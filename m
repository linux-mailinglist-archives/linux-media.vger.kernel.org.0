Return-Path: <linux-media+bounces-35988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB5AE9F0C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE8E3A60A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EE82E6D0B;
	Thu, 26 Jun 2025 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0sV7t/2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD392E62BC
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945098; cv=none; b=JYHj9Gam00lPw3p+yXh0gD/GLJ4v5wyyJVg7tR9MXGKW+gjAdwy3QmWA6LySkb3PJyq+o3I7H7iDY6EvpQ9QVxwLwhrufqizle3SmKPI89w/G2+7nKCVbfhCT8mjbMJtTLhYi3zSeA7o+WwwF+L2tFuCgLfFVRSgB8DvCwyjMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945098; c=relaxed/simple;
	bh=dE8OS9vKKqJczsfswdSuvC74kz0q2jVreKj9krpzZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amNAdzhvoYVHeY3tTyIoZdjnCH9qbjmeJ/2lbB81itGUUnjIZZdhnmjFNQx0K6QwMoQNsiivfag8a8H46p9NygEWpKzO3DN+z2z2NgCAFRVSgjl4No7BBdgwEpR7khkLJqo7cEljEwqA2/fkBlX5bfpmgKXGeni64bKZ8JFgD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0sV7t/2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945097; x=1782481097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dE8OS9vKKqJczsfswdSuvC74kz0q2jVreKj9krpzZS4=;
  b=Q0sV7t/26QM9WPagdbdX4ZhANOa4VHm5MdE7EqofpfcfG889h/+HsKei
   dRecnJ6Fu2m+hSn4GTEUT4dBiY0fdTB3UoHpIb/Rag1oQx3f1rxmnzfpY
   Duo2R3FXM0UbmITLPhXtoXdY/ZuCPDf6UU8cuqifzhErGWs86Ek0k5D0k
   V5hUB9A+GO51aNZlk1Og0MMqojo9kGkfv9Tsq0zoNM/dnzlkz1KfeBF8I
   JnaV55OpVgSWujirjV3BRLSjH+l6EKYe13EnIr+y6zAPP2Y26FeuCS5aB
   sDB0Ygld6wG/dQY4Me+yC19AJczB2/GJcDjT+/lfH7tWt5oqwZEZm4Fkb
   w==;
X-CSE-ConnectionGUID: hgkAOcbETsWkkk75lcQ90w==
X-CSE-MsgGUID: YwdMwBLnTSanWgsVWYP7fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921930"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:16 -0700
X-CSE-ConnectionGUID: +qHfcqbSQfi9577nKMHe7w==
X-CSE-MsgGUID: p1WTnz8zT9Sx7aaZJJkg5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049728"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:10 -0700
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
Subject: [PATCH v2 30/48] media: i2c: ov5647: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:21 +0200
Message-ID: <aa6e43daee445a4e8ec8162d497f583fa6f82bcb.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov5647.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index a727beb9d57e..e193fef4fced 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1398,11 +1398,10 @@ static int ov5647_probe(struct i2c_client *client)
 		}
 	}
 
-	sensor->xclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(sensor->xclk)) {
-		dev_err(dev, "could not get xclk");
-		return PTR_ERR(sensor->xclk);
-	}
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(sensor->xclk))
+		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
+				     "could not get xclk\n");
 
 	xclk_freq = clk_get_rate(sensor->xclk);
 	if (xclk_freq != 25000000) {
-- 
2.49.0


