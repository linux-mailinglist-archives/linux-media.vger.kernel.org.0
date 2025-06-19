Return-Path: <linux-media+bounces-35397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2902EAE0CA8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 888FE7A4750
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792952F5319;
	Thu, 19 Jun 2025 18:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuXNtzyg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BD2F4A0D;
	Thu, 19 Jun 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356298; cv=none; b=tS11fudlu6fzggymvojWS+vxMmXzgjThrWzpr3EXSDbGG64wsaA2AuD41NyBGx/jbLU8lP/FxsGTm0hlSfUHx1GRjSrCHWC37hyxFvCPoJC/FzNNi9muSSQEk8NNm7yPnJMIEeDovV91fZK42bR8i9A/CUUp+8EL5TkA0f1rZS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356298; c=relaxed/simple;
	bh=eBk3NG8cUR1tmHKZcn+MEDupJ242pPGtugRTMKoAEaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fw4GwtoOnzf2aeCkTX0a4kB1DKQDANBE51xM89fJGu0uXr6M5e546++2TyuNcDVjXEew8QuZxAJZbCggkoymO939+KZivrfYlR8xaZk3+XTDEXulwwe92lKuy0a0E36tgikd5RJ2abl0uH9LmAW0OaqFXr43+5xPxl+CKUVAoXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuXNtzyg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356298; x=1781892298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eBk3NG8cUR1tmHKZcn+MEDupJ242pPGtugRTMKoAEaE=;
  b=AuXNtzygHmNxGSbRALSqAGCcQA2hTv4eiRzrNfLgB8WoKqXKwSVmX+US
   TcQw3PRIN362Me+WEOgb+sik65M+nJT7kJ+wmFjCRltmUUlgTyjaBUwsA
   s0eV0qqXconYuidFQRO4bps5sXsDTUoOxH+8MWNtJwJFuKidF6EYlN6A/
   MjwRD9l6X2qTvDLVP+nVan9VqC0mkJMsmUfUhTquY8rRjBaJhLe5GcAH4
   yVeCtVkyMDANT2oul9rweYNV3Kcm/cDihRQISoHfsXoduu1rXa7PuUaM/
   aBbt6v/SE1USNTAqcq4a8HcdecTR2hnDybtRK/ZCT0/Vnktnw0wOgs2qn
   w==;
X-CSE-ConnectionGUID: wlP/7QOKTbewAogItkr/Og==
X-CSE-MsgGUID: 1GGyR36zR5Om7oNc2DsRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048559"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:57 -0700
X-CSE-ConnectionGUID: cNbzQ/nFTlG1ajvJY9L1Tw==
X-CSE-MsgGUID: o7P+Qgy6RR69/3uV6HnL8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919621"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:04:47 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
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
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 28/55] media: i2c: ov02a10: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:21 +0200
Message-ID: <5af47a9bfdf36e467c8ab910a1f2e00bcee21587.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
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

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 6c30e1a0d814..74fc0687c849 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -885,7 +885,7 @@ static int ov02a10_probe(struct i2c_client *client)
 		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	}
 
-	ov02a10->eclk = devm_clk_get(dev, "eclk");
+	ov02a10->eclk = devm_v4l2_sensor_clk_get(dev, "eclk");
 	if (IS_ERR(ov02a10->eclk))
 		return dev_err_probe(dev, PTR_ERR(ov02a10->eclk),
 				     "failed to get eclk\n");

