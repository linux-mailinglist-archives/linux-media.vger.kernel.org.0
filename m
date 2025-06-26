Return-Path: <linux-media+bounces-35982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A5AE9F04
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF4FA4E1F48
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A05B2E7174;
	Thu, 26 Jun 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLxJESUz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8022E54B9
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945058; cv=none; b=E5n5mMBEViF/F0w8+1Lr91Li+WsnLC6H8PHkz4LKFMB0XzH5zoT8IeU+TKySMaa0F2PqQasnHkF4Pv4+5pqVtIqGnqg6q1X7+3E922l0VoTPbOr2EySmy2Mh+jYTtUJLdZ6DpNmn1BctBcj+XiRSlifsV5eIVpwMtoEQBDDRlLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945058; c=relaxed/simple;
	bh=po+6/vg7X70rjV8tGuQG9caBPcUNvgrGKxvp8UNTJqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neLrOQok3/xB+c3eAERvOwQftaNvIeLh7nOC/28ArnjbSz2YkRoEHeJh6f0tMZMGwHlLfOZwVnxfPRlvtUedVl+HHj2aatkiYP00BS66WkAOHikrkBORZDZVhZMSNvt0ogTufzuYbrdYEube2WfwQNQFstyp7YU+6d7m+VnALmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLxJESUz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945056; x=1782481056;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=po+6/vg7X70rjV8tGuQG9caBPcUNvgrGKxvp8UNTJqE=;
  b=aLxJESUzI6uNtVBiZtxLJMQ31mA0aMXFGnDe2JCHzVJZiRAY1rIq9Xxo
   TBTIqqMTTtUGhnHfrTEBoxP9JA5GVUNsrLyO2vl/+YCuKxsp8PIylbXZM
   atkmXKweXkEts4IIjVf3ghZmKoXL9tJfgg/pXn5o5Zp68FpS7OLFiUzKF
   df5J+ZbLyu10MlYv/pNHiSgfTl9eDp6mpl/vVKQjtPFjFJT+7S6fCGFwS
   ibjF/3Pz3Bv0Hy5gsIcgH1hvKHo/0epuf9u6kPXnG71E6DtFSgL54QqN+
   2a0fkCdIHvst94FIGUHT4cT6MdQX80zR+hZpKGFk7CqXooifzkVCxsFXa
   w==;
X-CSE-ConnectionGUID: zReoVMwTSU+6s5TqstPgmQ==
X-CSE-MsgGUID: PvMQN4ZrStWH7GexvWPlOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921781"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921781"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:36 -0700
X-CSE-ConnectionGUID: pmO/vC6ESGCDJbXQiRH5+g==
X-CSE-MsgGUID: snemPFIEQZGfuPFNjKOlWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049575"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:29 -0700
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
Subject: [PATCH v2 24/48] media: i2c: mt9v111: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:15 +0200
Message-ID: <c53cd5e1a2b24a639399ff65999a42b3602e45e8.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/mt9v111.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 723fe138e7bc..6aa80b504168 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -1129,9 +1129,10 @@ static int mt9v111_probe(struct i2c_client *client)
 	mt9v111->dev = &client->dev;
 	mt9v111->client = client;
 
-	mt9v111->clk = devm_clk_get(&client->dev, NULL);
+	mt9v111->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
 	if (IS_ERR(mt9v111->clk))
-		return PTR_ERR(mt9v111->clk);
+		return dev_err_probe(&client->dev, PTR_ERR(mt9v111->clk),
+				     "failed to get the clock\n");
 
 	mt9v111->sysclk = clk_get_rate(mt9v111->clk);
 	if (mt9v111->sysclk > MT9V111_MAX_CLKIN)
-- 
2.49.0


