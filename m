Return-Path: <linux-media+bounces-35986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031CDAE9F0B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B3D56430D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B302E62D9;
	Thu, 26 Jun 2025 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtZtTeXT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55922E62B2
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945085; cv=none; b=mrTsIT1cekl8W0H/8AMCPdha7oN7AIY8ncVGhw+RiVWcOKo8qmfWXz6h0bC3DLxlDmjI/zgfTYsfN+FzKg4jV65N0m/nNiUDM5GJT9g6v3Y44giS5DGuzH35QmyUnBTxsCdEGP66N3qIGi0u4so/Ylv1q06xd8l1yiaxQ6vI8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945085; c=relaxed/simple;
	bh=IuXsnJG9cleOtIolgQhy/sWVqEYxBr34oGMsNFZMlEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XijJG9valIp2IEMX9op41Pr5N+OpsvF5dhmSFHs9Y+u4DIoD6c4yLcVRdZrnsZnl4s9Rq2wscHC2pbI06ZjqHsuQRJy1vj6OquiY5xHJT4Kjdl7zdUKFPumkOZHSA8VjDT/+5CWlXTAZenGwTQLFeHwe5QidHFqF4/lIeBXMQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtZtTeXT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945083; x=1782481083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IuXsnJG9cleOtIolgQhy/sWVqEYxBr34oGMsNFZMlEQ=;
  b=BtZtTeXT+jzKazEqPGPh4M7JyJP300tXWL95ZTyrRNCzJv5rf+RabjaB
   LMeYhcgCaEJoDn0/yIbpblJksNu2gHbAthChlneY5SzjgfmIOvUc8oaLv
   OQZ0MMk8tToLKG30+eFWjR/0cobsJ3hsQe0sSA98QPzRDrsixrbCGkBQZ
   XoO27By/5nCJa26oxgisQT4dgbhqMsr+2zQHUMSd7+Cxnlzj4h6a3lHkO
   r4SSr+ns/NKtbe8w8vhs2qL6yLdlTzNOObyqQFXa8jJImL9N1cBZkUcL1
   3IXW5UATWDa3Xrodc9t+0Ufy5050MN1lbaxrZY3SfVRKYc3iOVRvnh9sV
   A==;
X-CSE-ConnectionGUID: r6n0EQLCSi6l0lsyfMTiIA==
X-CSE-MsgGUID: pJP7XaMOTl6higWBzXd0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921867"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:03 -0700
X-CSE-ConnectionGUID: 2QzrD6SFTq2xGveqscPwag==
X-CSE-MsgGUID: jF2x15ocRr2qVKRZX0jiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049646"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:37:56 -0700
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
Subject: [PATCH v2 28/48] media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:19 +0200
Message-ID: <5d326cf9968e243d18dfd16636cb37b82be8b3ab.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov5640.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 0dae0438aa80..08ca366a22d7 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3898,11 +3898,10 @@ static int ov5640_probe(struct i2c_client *client)
 					       ov5640_dvp_default_fmt;
 
 	/* get system clock (xclk) */
-	sensor->xclk = devm_clk_get(dev, "xclk");
-	if (IS_ERR(sensor->xclk)) {
-		dev_err(dev, "failed to get xclk\n");
-		return PTR_ERR(sensor->xclk);
-	}
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
+	if (IS_ERR(sensor->xclk))
+		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
+				     "failed to get xclk\n");
 
 	sensor->xclk_freq = clk_get_rate(sensor->xclk);
 	if (sensor->xclk_freq < OV5640_XCLK_MIN ||
-- 
2.49.0


