Return-Path: <linux-media+bounces-26497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55610A3DF59
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4335719C47CB
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA73F20E6F7;
	Thu, 20 Feb 2025 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fNyCEyxg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC320CCD7
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066562; cv=none; b=qt/KJK9KrirQGGA+CkHDdMWYt/n+O27qq/iHojUMHfIK7MzPd/uPWLujkG9zGtHQBcxxzjGa/fg3x5py2WvTD36hoC3jwO7OKoFodBPTc+GBl1IKxx315HBf20gZurp9fVzFf+Ct32HKlqWB2NfX+noL8N6BThOmwqeMsMC+vhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066562; c=relaxed/simple;
	bh=eOhMdln0x/JRIn7eIbxi0KcqRWyYC3R9SAl9QwIu/xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhMwUmjXWgX7Qp2joFuHtXeaOTJTnxOWISNaR956sGgOKpgFq+svGWAAYbwrtJsKxWkasd3fXTfSVkCQCMRXGor6/b69bLoAt9MMVtozgZjBQ4WKDAaAOWKwG5ft38XR2Gb1EUX5KA9rXgQcWNfUg4fSp0YHR0pU8IoVLKgDEY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fNyCEyxg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066560; x=1771602560;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eOhMdln0x/JRIn7eIbxi0KcqRWyYC3R9SAl9QwIu/xo=;
  b=fNyCEyxgR/S0kcHjO7GOZRlJTcEyx4Be7DJPXaZlEERM9gogCLTTA8MT
   zNrRoJSVnrepEgYlQYdMIqae3CyhO+OcRxTY7EAvT2eXkU5ws+yZvyYUr
   ktC5BHvKTZAqFzWQmBRh9JCM1/t+3m6QJLvIBhKmutvLHmElNZJyf5dC4
   ns2iseSZge/Dh+2ZGpUVwtp75MlU+eXLAaNVRig3vhWV7QuZ+LU54x6+s
   b7Gz5AK2s/fVloijN11l1SRaj63oLJT5Wy0hO6l0pP72o42VJnBjpHTMW
   cP0LW6Ig132YyAMK13WBSyE7bTj8JgzjfbB0RfoqB8Zk6oEROhtSA6Prz
   w==;
X-CSE-ConnectionGUID: JYH5Oe+sR/yMw7pxCLV32w==
X-CSE-MsgGUID: aEnkTb49SX64xXgC65A5Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28449080"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="28449080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:49:19 -0800
X-CSE-ConnectionGUID: wAXO4MyHRwOL50uTxzUusw==
X-CSE-MsgGUID: ZXjQEJstTA+OKhmCqYHu+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115975757"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.176])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:49:17 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH] media: i2c: imx219: Add support for 'clock-frequency' parsing
Date: Thu, 20 Feb 2025 16:49:09 +0100
Message-ID: <20250220154909.152538-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the clock producer reference lookup optional

Add support for ACPI-based platforms by parsing the 'clock-frequency'
property when no clock producer is available

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2d54cea113e1..a876a6d80a47 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1103,12 +1103,22 @@ static int imx219_probe(struct i2c_client *client)
 				     "failed to initialize CCI\n");
 
 	/* Get system clock (xclk) */
-	imx219->xclk = devm_clk_get(dev, NULL);
+	imx219->xclk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(imx219->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
 				     "failed to get xclk\n");
 
-	imx219->xclk_freq = clk_get_rate(imx219->xclk);
+	if (imx219->xclk) {
+		imx219->xclk_freq = clk_get_rate(imx219->xclk);
+	} else {
+		ret = fwnode_property_read_u32(dev_fwnode(dev),
+					       "clock-frequency",
+					       &imx219->xclk_freq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to get clock frequency");
+	}
+
 	if (imx219->xclk_freq != IMX219_XCLK_FREQ)
 		return dev_err_probe(dev, -EINVAL,
 				     "xclk frequency not supported: %d Hz\n",
-- 
2.48.1


