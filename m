Return-Path: <linux-media+bounces-35973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E22AE9EF6
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075971C44026
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077DC2E6D22;
	Thu, 26 Jun 2025 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhGfv260"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B512E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944997; cv=none; b=hlKCg3buYhfyYmVKzTTtMLIHMbbn1Lc+PV0Kfq+rTqUmmV/Dm5pKaDIWsMVayqCCRAA7WLjFfpaxRqKU1MOcYfYOoGnEhwmcu5ASqF+JZHTqB+RbrCPVWb4Xbpk1sOWulv/hLbhaNT1JS2OS8w46D+j4eXoyRY6+uR0l02zzYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944997; c=relaxed/simple;
	bh=GJQSuZ+aXcJNgbFG/LYrQD+ZisiWhbXYWXiN8NffnNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdlA5s1P6x5OSEobG6qWdm/wgTlLer/S14PaonWGSv1afJbAcqLQG4e+u4UMglK3/XeTCN8fgGzoa8q1eZS1U9w3AyCiYHPqbeCA65I7QPcoNPgILjhXqDufZQH/dSleiQPIKAlXe2ZtwKO42MkhiCNsqx7yQACQfxH8+6szTS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhGfv260; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944995; x=1782480995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GJQSuZ+aXcJNgbFG/LYrQD+ZisiWhbXYWXiN8NffnNU=;
  b=lhGfv260WrbCB5B2GxpV1OZMHMg7EkqEqEUzmm9cH/Sb0R1tpRGqRUGa
   UFsIk9dZx1nWTvIaJrSzXEVwdjUo/CpLRB7OQbMXROQgYOhdskXi4XBTX
   C/b/9YE1Ne5yxfh10S0KWZoCHUucRXKgmLj+LtGEUqxlh65aUU88ScPfq
   Cq1+JG35QijqiPBnl3JoWHxaweRzCm8qcG/7V0yw1iQ7hAswlldoy2rb5
   BYInJY5TaIlL1vuHiZW7Aik8r8IVKLodSoyOo0ihpKulMNdY4Tjd4mbjT
   EiKfpgl3oFORSUCJ0qZdgDlj0ABAcMxDUaLuKgihIZg5H0/ImwbVe5jpL
   Q==;
X-CSE-ConnectionGUID: E9Dhacq+RIOQGmLopHFoug==
X-CSE-MsgGUID: sAKSDQ7JRge8SRrPOCx+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921465"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:35 -0700
X-CSE-ConnectionGUID: kmyzLjSdTDGaN0Ts98E5Lg==
X-CSE-MsgGUID: F8qngc+tTXyBDBcdnSUiwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049444"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:27 -0700
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
Subject: [PATCH v2 15/48] media: i2c: imx335: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:06 +0200
Message-ID: <e5da88084e03e69e0a4af5ca73783b2beb104f2e.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx335.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 9b4db4cd4929..c043df2f15fb 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -1026,11 +1026,10 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
 	}
 
 	/* Get sensor input clock */
-	imx335->inclk = devm_clk_get(imx335->dev, NULL);
-	if (IS_ERR(imx335->inclk)) {
-		dev_err(imx335->dev, "could not get inclk\n");
-		return PTR_ERR(imx335->inclk);
-	}
+	imx335->inclk = devm_v4l2_sensor_clk_get(imx335->dev, NULL);
+	if (IS_ERR(imx335->inclk))
+		return dev_err_probe(imx335->dev, PTR_ERR(imx335->inclk),
+				     "could not get inclk\n");
 
 	rate = clk_get_rate(imx335->inclk);
 	if (rate != IMX335_INCLK_RATE) {
-- 
2.49.0


