Return-Path: <linux-media+bounces-35974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BAAE9EFA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7FBA3B9C6E
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCA62E613C;
	Thu, 26 Jun 2025 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOd7zZCt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481382E610C
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945003; cv=none; b=ALGeiLCrX0T8cyzh34clYpBMs54++SQp1Bt9Dho+xfvs9S6vv/TVEau9HVGhSrNkig2PytOuPCBtbp/fC/H3VWSSnFlw+975Qm4ISctTPkkwxsQJiBPDtJyE2aDgMcPPgYBhGq5IrUzS4NpBle/qCoWS0AT63gPPZEwRuxdXiiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945003; c=relaxed/simple;
	bh=jsccGtPFi1QrZoSUi9eYDhN/HjKEwCxbWe4o6ubLcNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my6mRUsVe+9hQciC8VSvkKKR5D2nM+iI8r6romoGyWy1n/+AZHRCp0Ypwaki5t2Q5VvO1C+X396NBk7CCRqjpAfU3TxKmfGEzbX/GyvoFbJem6jtGer1ChUgcAwLLF2735PVExzG6QQKwt01lQ94D1nmXaqqZgJt3PtXTJCFp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOd7zZCt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945002; x=1782481002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jsccGtPFi1QrZoSUi9eYDhN/HjKEwCxbWe4o6ubLcNs=;
  b=jOd7zZCtCFEF0BvEvul7vrlEj85gJMw1LNRMJ8p/6nT66FojT3qS8Qdx
   4D8bh9FY13Q8NvpriQ59IljVl2RsRNAmrLiVtb2yKdOmHZhK1ne/g6T6D
   ZFlc5PDPcEHUWTNek5OxwQuAp/FCN7sZqgKvUSK40ptbhvFXmJUx4qEQZ
   AFnuApIbOFejej/GnGokoJsHrp7Vsog19b5ymJMh0wESFz3iTZk1qWoEv
   Rju8PY7uqyAr9H51+XjAE8FvFvoJtFNKPPX/9q7YywfOcugnPPA/W3Cfh
   NmDFHC3cplQjXSOqJytJdVTg6dwIjZc0mpL1FbQt9zpkUYJQcPlq60Uja
   A==;
X-CSE-ConnectionGUID: w+oYkRDOQSe4i5zGbc4oBg==
X-CSE-MsgGUID: MmZweXDoTGC8M0urlSSTQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921503"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921503"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:42 -0700
X-CSE-ConnectionGUID: KlanGsJnSRCZujTuOgIBmQ==
X-CSE-MsgGUID: p9IchtMLSQmwFLMZ95mBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049463"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:35 -0700
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
Subject: [PATCH v2 16/48] media: i2c: imx412: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:07 +0200
Message-ID: <6ce659568716c36385c63c57759e5bd896faa461.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx412.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index c74097a59c42..7bbd639a9ddf 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -933,11 +933,10 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	}
 
 	/* Get sensor input clock */
-	imx412->inclk = devm_clk_get(imx412->dev, NULL);
-	if (IS_ERR(imx412->inclk)) {
-		dev_err(imx412->dev, "could not get inclk\n");
-		return PTR_ERR(imx412->inclk);
-	}
+	imx412->inclk = devm_v4l2_sensor_clk_get(imx412->dev, NULL);
+	if (IS_ERR(imx412->inclk))
+		return dev_err_probe(imx412->dev, PTR_ERR(imx412->inclk),
+				     "could not get inclk\n");
 
 	rate = clk_get_rate(imx412->inclk);
 	if (rate != IMX412_INCLK_RATE) {
-- 
2.49.0


