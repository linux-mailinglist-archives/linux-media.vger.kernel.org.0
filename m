Return-Path: <linux-media+bounces-35970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF40AE9EF0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E52404A25A5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D472E54B9;
	Thu, 26 Jun 2025 13:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp+HAhL2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3D12E54AF
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944975; cv=none; b=KgzgM3uKocPAhxF7iOOEHsXAqD4vqYQQgdV2+ybCkcp70UMYDFgnohib0RS5NeaWZGS+GnJDQvAFepbgOCDmFwBftT8LC0ANdLaJoaEAnRk+oCcTXlThTGRgzWudlHxaWYWLwaUvP5nNfByPjNduQi1dewTrw10aEKZhdYMnzvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944975; c=relaxed/simple;
	bh=PNkrl2b/HUXLgHM5By68Y7rd08rY1q8klIE+xnLdAOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJMjfG2f6kuv3Gc+RpRr2TdepuFtWdb6MO/q/XBVS2n6DCkloEINBQHBp2wc0PhYA9XBapc9O+upoiUCpm9tWSDE1jQhIZDiAIvK7+ENTZmdwKg/kowVN8ZsPkwwBn3C2lrPSlwnBIYOe1ACCtzKmr/lOhbUravbU0stGPy8t0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp+HAhL2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944974; x=1782480974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PNkrl2b/HUXLgHM5By68Y7rd08rY1q8klIE+xnLdAOE=;
  b=mp+HAhL2hhUsMEdMDF0LQq8sPm6Pn6qopCy5qVWdaefNHQQr178NaWsW
   qRSRULV9JxtqBUpSWxaqDc9UHxgbcOh/y0qPj/eh0Hyi7q1eGZyBkNIH5
   E8T4IHn+yi30pZr87tUTmihWxJSZ9LxgeYPK37EtW0IZNhDbtGd6T44QU
   +YHxrtsyjbnx3opsszhgH+APBXmF1SCKHoMKnXyxcBrKgYYlN0KJQGSnw
   jadfGTDjhPV5eHohXBDRLfd4yOr10KwqK1w5RGG5gqgmkG2I433J22pIa
   EI3fe/TWWsgyluYdTRsj7itnN/GJqx3mE7IY4sG2M+GtdwiV3B5sCraCm
   Q==;
X-CSE-ConnectionGUID: zu/wSQFBR7O+W1dMDUGWlw==
X-CSE-MsgGUID: YfeGQh9DSUS+l99hXEENKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921407"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921407"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:14 -0700
X-CSE-ConnectionGUID: f1g6nQ5bTPumHXFlLIt3Uw==
X-CSE-MsgGUID: 1AiHQw1MRpaelflkftE2pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049398"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:08 -0700
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
Subject: [PATCH v2 12/48] media: i2c: imx290: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:03 +0200
Message-ID: <dcf55b589d56a8800f16d2253b8199bc5be3359f.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fbf7eba3d71d..759df6eb8545 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1600,7 +1600,7 @@ static int imx290_probe(struct i2c_client *client)
 		return ret;
 
 	/* Acquire resources. */
-	imx290->xclk = devm_clk_get(dev, "xclk");
+	imx290->xclk = devm_v4l2_sensor_clk_get(dev, "xclk");
 	if (IS_ERR(imx290->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx290->xclk),
 				     "Could not get xclk\n");
-- 
2.49.0


