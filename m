Return-Path: <linux-media+bounces-35377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13611AE0C9A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D9F1C21334
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137E92949E0;
	Thu, 19 Jun 2025 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+IuQpOe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0928D8EB;
	Thu, 19 Jun 2025 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356093; cv=none; b=P/HFOa+Wv4Ra46TLU0y7qLIyVxdBsAeESoEC3vxXemT7z2QdC5cPErvouoSeqQOhr7j15U9WfPdJdqXnZ4yfgWYu6FWy7FqMN1N0BUXC84jvvNIptasSKrUCXjtP35qaGcF7On26J6kADMziEDFJWvEbrBGt4t0OCbAEtNQZpFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356093; c=relaxed/simple;
	bh=/9YzR0OCK5tJ2A2ja+FkVc7nCHiOryitRzRmVxxNAIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNRoaoMuL31uwkDIolNrKK2I2UdQt+QwNS1vWkliyijGVXcSJhetZTX7HOa4IoyMR0tk6aOwW9JhwNcf9ylgZATfUEKMv+CLj0nZRDb6oeCmfc6kxHc7cKwxUQScUYrkPFdz386uCD5c6ur9/6KjIMyXvMC27RFXnhN4zbIrfAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+IuQpOe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356092; x=1781892092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/9YzR0OCK5tJ2A2ja+FkVc7nCHiOryitRzRmVxxNAIA=;
  b=D+IuQpOesdJsbphEN9Cg9JOaAztJpt+2R0M/gXIqd5sdMK913yPoLX2x
   TJagugb9tyzTn/T4BAGvgHNeiC0WE8f9YzXNMJM/1rLqFx4dc5l3VVLBO
   rAXBD3yLdKJjKaehtle6MSGKHZufodYI+AbjtcrZyYWvTfyeOpfjphbWn
   8Xsl7nailVN1HnrYFneA6LmXWaKsvzkZFCWx8COw8UyYy9VxOv8wCVh3B
   N9oF6bt2GJ0Cq8tqz5+8mAbzT9f7XrA+sX8YbAddCsBL61BMXMApYn+Cn
   +NuUz0wZKK0ktkNfru3aVJpDuv6zFlmuNu8MeyJl0UfIOolZdG42sXa9A
   g==;
X-CSE-ConnectionGUID: +R6JGyCuRkOqHe0AOsatQQ==
X-CSE-MsgGUID: t2t/9H+ySryriBrDh9K67Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047921"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:31 -0700
X-CSE-ConnectionGUID: CYVzxLtkQ92OGCjejr+3Sw==
X-CSE-MsgGUID: 7y7mIMA3RvuPASDsqnKfNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919346"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:21 -0700
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
Subject: [PATCH v1 08/55] media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:01 +0200
Message-ID: <8261a7118483073d5f8d952fd2a62bd8f2fa6bb5.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/gc08a3.c b/drivers/media/i2c/gc08a3.c
index 938709a677b6..5d38dfa9878e 100644
--- a/drivers/media/i2c/gc08a3.c
+++ b/drivers/media/i2c/gc08a3.c
@@ -1199,7 +1199,7 @@ static int gc08a3_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gc08a3->regmap),
 				     "failed to init CCI\n");
 
-	gc08a3->xclk = devm_clk_get(dev, NULL);
+	gc08a3->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(gc08a3->xclk))
 		return dev_err_probe(dev, PTR_ERR(gc08a3->xclk),
 				     "failed to get xclk\n");

