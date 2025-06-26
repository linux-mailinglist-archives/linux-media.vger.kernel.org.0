Return-Path: <linux-media+bounces-35995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E35AE9F13
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C393BA7C3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EBF2E6D2C;
	Thu, 26 Jun 2025 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j45CH1Th"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F32E62C8
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945145; cv=none; b=C3hbI/QounLbry5DWVw1/9z1CJgUmilJjykyYgLJhTgyYRKBYHS7xEpCMoRy0BvqKLNzs1taokrr4UppbIheGy9UznOKt0Cfv1BQ51ZZcA7zMpibR+nDlCm1IGdhEHyCPbT/1/nfPtd+kf+2Dzp5oZiV5/UgYmMo2gyaLttCY68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945145; c=relaxed/simple;
	bh=J5BiQ0TRc/RfnlXyvH0fiyZXODknmnv1orFpHj+VyfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjhGQq5sRCyQbxD9PDrwOaH92RwKw5snEr/eI9APwDbqRPPZD3iqxcYK3vkjqYue1jpTdMDBtZhBA9AodYfVNTvRzCwqftOcPQ3nO8APusTNc5RWuWRZpufv1BgfC5CCo/BnIKvt8KW52MGI4Z6IfcZqHCyvuy+JJ+4JN7Njyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j45CH1Th; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945144; x=1782481144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J5BiQ0TRc/RfnlXyvH0fiyZXODknmnv1orFpHj+VyfQ=;
  b=j45CH1ThB8AVIUH2v71QO9frm8mT/VPN5W52dvm3ZK1guFT8ndLqmsNs
   igLlUEdjG5YXz8XX3+tIzz3/uBBHRyITNVuyBLvpp08XgQUVAxu3AX0KA
   R00f1KGFSuG5TedGltSEHglHniu6zthXorJxX7HgoNHp+xXGmaQTIo8nt
   WKngXXnrCWp7pmvbKbuejOlpnz0MzxrBH7dPVMlr+A8pYAci7RiYIwuSW
   hwoY0A/W3Hpue8JKYP4XkkK8gr33XhKfQV3EH3KM2NTBNEyXXwSN5Ea/w
   g+YOWXLmJKJWh7eTcV819ef1CS/7Ms34BbawQZ6fDSaxFbQG5P5KrNIjX
   g==;
X-CSE-ConnectionGUID: Wj5wnJAvSSKTbPs6TtV3CA==
X-CSE-MsgGUID: b9wftxjZSIeuVzkC4QFr8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922058"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:03 -0700
X-CSE-ConnectionGUID: 5PRv8EJ0TOyeHTj77UNYKQ==
X-CSE-MsgGUID: hlV3sH1HQa629povNnwAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049815"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:56 -0700
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
Subject: [PATCH v2 37/48] media: i2c: ov8858: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:28 +0200
Message-ID: <170a02c81ab4d6a8b20ffe0c7f6cfde4c7eae478.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov8858.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 95f9ae794846..c1c6bea8a68b 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1877,7 +1877,7 @@ static int ov8858_probe(struct i2c_client *client)
 	if (!ov8858)
 		return -ENOMEM;
 
-	ov8858->xvclk = devm_clk_get(dev, "xvclk");
+	ov8858->xvclk = devm_v4l2_sensor_clk_get(dev, "xvclk");
 	if (IS_ERR(ov8858->xvclk))
 		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
 				     "Failed to get xvclk\n");
-- 
2.49.0


