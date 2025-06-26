Return-Path: <linux-media+bounces-35989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE89AE9F0D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F25F5172F7D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F802E6D12;
	Thu, 26 Jun 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8M2wN+E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D462E62AD
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945105; cv=none; b=hp89OqlXQFalYB3grvpWiS4+mk0N1jJHKNClSdE6Ap4jlE/bjyN7ZS3WHTjfKncTZKSM8yb9pAK/ZS188OcWS9iV1VCPiWucqcWkkrhh/9g5gDQsSrKtrKC+OopbHq34dtRb8KkxPCkHO+H6b2uhWxviou15azvI/9wLKZoLw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945105; c=relaxed/simple;
	bh=SOdfjqB0pOsmzYKxCzI5WTXjbHx/b5eI2Yrnpc089Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cehHuhVz+gARI2DzmWidRvem7EOAK4S4ozdMAV8uU67KEknzfqfDojfekdOlxgIbCo4P+r6XJfZ0vqR0GIyfx+IXVbGgSfpH6waTatSgZG3NatRpsZCWpIOgg5iS7D+5shdkm6DgXXRmGOoNDDlARDkfgjUds8yL80mphomki94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8M2wN+E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945104; x=1782481104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOdfjqB0pOsmzYKxCzI5WTXjbHx/b5eI2Yrnpc089Ac=;
  b=f8M2wN+EOd0telIcYG7McahWZbi2I6MU435Pdj3/sB6DxlS/ewDJFJAI
   oexGGIvDVvvZdWOQW8UfVG+FfCEuga/nQ/H5P/YC7D4VT/GEgB+hXSkIo
   nUul1wLsENNVi40WYNiHD9zkE4FWsDd0PxVYNmolxncb+8E9oJe3XkDUe
   vZtP5fxP7US2V2YXzBlTQ8oNlAtbmWbbjFRZ798a4cB/mXxHeKlYCMxMw
   rAkAD9oAQY5SvWKMaCkyYdolFWchmcjdi0Egam0XnKYjibZXdWwc1Dezm
   JXQfwDCudt5pDrLSa2rIAanfP3Gy74fypKuagV186xr/L8v+nj1BzEoxb
   Q==;
X-CSE-ConnectionGUID: 0yQvzhqbSe6jz6hubX0n9Q==
X-CSE-MsgGUID: gTmAdER8TymT1yHKhZpdHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921948"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921948"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:23 -0700
X-CSE-ConnectionGUID: WuEL7E8RSkOO7TDyM2uGGQ==
X-CSE-MsgGUID: tFiIUEEUR1yXKSnOkK149w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049746"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:38:16 -0700
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
Subject: [PATCH v2 31/48] media: i2c: ov5648: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:22 +0200
Message-ID: <01972b1cdec4444d34c7372247844fab11bbabb8.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov5648.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 4b86d2631bd1..8a3190bf73da 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2521,10 +2521,10 @@ static int ov5648_probe(struct i2c_client *client)
 
 	/* External Clock */
 
-	sensor->xvclk = devm_clk_get(dev, NULL);
+	sensor->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xvclk)) {
-		dev_err(dev, "failed to get external clock\n");
-		ret = PTR_ERR(sensor->xvclk);
+		ret = dev_err_probe(dev, PTR_ERR(sensor->xvclk),
+				    "failed to get external clock\n");
 		goto error_endpoint;
 	}
 
-- 
2.49.0


