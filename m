Return-Path: <linux-media+bounces-50278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 69603D09886
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A072303074C
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 12:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26C8359FA0;
	Fri,  9 Jan 2026 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjZLuRO0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E12737EE
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961070; cv=none; b=Z2tWveJeKjd1dZ5vekBGM7GUrBUsTlYzexaSscUJIpk8+UQInYrLG8ptOAaxXB8Ylhp+Y3iOVlUYs0M3gN+kiuIF77Rdf7vvCBneKuifV8naf79f/IZ5fnmgUlD3VqtyCkXmHh1S588+JhF42//7acv7idVVNc2QhFwaYHbYiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961070; c=relaxed/simple;
	bh=J9muDf/EEX2ZiJQJYAFNcpHw0DuyxjlUOBBdj6/IgCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxmPUW1LnBUMF3HktGrcV2FZ5AtH1I3PO3rlgMeBWyLMWvO7Nq4MTolOF2nMZBao+gEo/enfYN4wRqukILNw3vav0S9R23fhwEEHbrJIHGsoG5rtFgCN7Wzqvba/WuR8+SanWCbmLaoV7+EAlNVUWjIjqC7Ri9aarUY+Tg4W4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjZLuRO0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767961069; x=1799497069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9muDf/EEX2ZiJQJYAFNcpHw0DuyxjlUOBBdj6/IgCo=;
  b=GjZLuRO0OdcymfehKNl2xXXWIEpP1WsH7nC1RACnDPHz/SOgFkC2z03g
   RrN70644z46KrJmThirS/UTLEnMZnyUgH6t4GRsD4zoUTIl2XtwWrdUPU
   ApYT1kpxIBqN/4CczOPkLAD82JGjFsBkELljE1xYLgkvoHtoFrB3c+Vgp
   mHxFFh0smhuzwBLPyqeWnHLsrug59w0hvrSRx/B9VIeNlMfgnJCD4R8ZM
   ttXwPx8S3LvaE4xun/8qMwvMnRkvFd7yn3/f8mZGmPieUMJ13K16n0ANJ
   SBon+UYm94Wcdh5WV8D1ghQWXDlXCcrQWOT6LR3b+pshJInfjS7MNemBh
   w==;
X-CSE-ConnectionGUID: lkpR053YQ8GwuZt4jMG62w==
X-CSE-MsgGUID: ZGMxxw7RQbeesG/znYdsqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69274819"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69274819"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:17:49 -0800
X-CSE-ConnectionGUID: Im7GXH2vRsSs4PRTi6bGNA==
X-CSE-MsgGUID: bgTwmep9R3KfCqVA/BDJ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203739544"
Received: from vverma7-desk1.amr.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.124.223.84])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:17:47 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B9509121D8F;
	Fri, 09 Jan 2026 14:17:59 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1veBRG-00000002Sp1-1nyY;
	Fri, 09 Jan 2026 14:17:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: David Heidelberg <david@ixit.cz>
Subject: [PATCH 2/2] media: ccs: Use devm_v4l2_sensor_clk_get()
Date: Fri,  9 Jan 2026 14:17:58 +0200
Message-ID: <20260109121758.587434-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109121758.587434-1-sakari.ailus@linux.intel.com>
References: <20260109121758.587434-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rely on devm_v4l2_sensor_clk_get() to obtain the sensor's external clock.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 59 ++++++++++++--------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4508a561428a..6f2020e2f861 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3296,47 +3296,30 @@ static int ccs_probe(struct i2c_client *client)
 		return rval;
 	}
 
-	sensor->ext_clk = devm_clk_get(&client->dev, NULL);
-	if (PTR_ERR(sensor->ext_clk) == -ENOENT) {
-		dev_info(&client->dev, "no clock defined, continuing...\n");
-		sensor->ext_clk = NULL;
-	} else if (IS_ERR(sensor->ext_clk)) {
-		dev_err(&client->dev, "could not get clock (%pe)\n",
-			sensor->ext_clk);
-		return -EPROBE_DEFER;
-	}
-
-	if (sensor->ext_clk) {
-		if (sensor->hwcfg.ext_clk) {
-			unsigned long rate;
-
-			rval = clk_set_rate(sensor->ext_clk,
-					    sensor->hwcfg.ext_clk);
-			if (rval < 0) {
-				dev_err(&client->dev,
-					"unable to set clock freq to %u\n",
-					sensor->hwcfg.ext_clk);
-				return rval;
-			}
+	sensor->ext_clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(sensor->ext_clk))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->ext_clk),
+				     "could not get clock\n");
 
-			rate = clk_get_rate(sensor->ext_clk);
-			if (rate != sensor->hwcfg.ext_clk) {
-				dev_err(&client->dev,
-					"can't set clock freq, asked for %u but got %lu\n",
-					sensor->hwcfg.ext_clk, rate);
-				return -EINVAL;
-			}
-		} else {
-			sensor->hwcfg.ext_clk = clk_get_rate(sensor->ext_clk);
-			dev_dbg(&client->dev, "obtained clock freq %u\n",
-				sensor->hwcfg.ext_clk);
+	if (sensor->hwcfg.ext_clk) {
+		unsigned long rate;
+
+		rval = clk_set_rate(sensor->ext_clk, sensor->hwcfg.ext_clk);
+		if (rval < 0)
+			return dev_err_probe(&client->dev, rval,
+					     "unable to set clock freq to %u\n",
+					     sensor->hwcfg.ext_clk);
+
+		rate = clk_get_rate(sensor->ext_clk);
+		if (rate != sensor->hwcfg.ext_clk) {
+			return dev_err_probe(&client->dev, -EINVAL,
+					     "can't set clock freq, asked for %u but got %lu\n",
+					     sensor->hwcfg.ext_clk, rate);
 		}
-	} else if (sensor->hwcfg.ext_clk) {
-		dev_dbg(&client->dev, "assuming clock freq %u\n",
-			sensor->hwcfg.ext_clk);
 	} else {
-		dev_err(&client->dev, "unable to obtain clock freq\n");
-		return -EINVAL;
+		sensor->hwcfg.ext_clk = clk_get_rate(sensor->ext_clk);
+		dev_dbg(&client->dev, "obtained clock freq %u\n",
+			sensor->hwcfg.ext_clk);
 	}
 
 	if (!sensor->hwcfg.ext_clk) {
-- 
2.47.3


