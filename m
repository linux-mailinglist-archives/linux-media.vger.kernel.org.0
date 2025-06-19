Return-Path: <linux-media+bounces-35414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5134AE0C58
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69ABB5A61C1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624AA30E82E;
	Thu, 19 Jun 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxFScAK4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98830E820;
	Thu, 19 Jun 2025 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356607; cv=none; b=X5ci5vM4JWLQmyPZ7z0gKzMP2fxhBjXiDUjmBh4LgUPebLsp3aVY8gM9qfX4xaJgNkdcvElu4Qal8bcj/+XvJUodW9KF+4FBiWQkfWmsBi6C8/zdeobpfIQHpLg5Nhqqdbpiz9k8zlP4+NJK5eSF3OLP6qNU0MWEUMRmBD+S8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356607; c=relaxed/simple;
	bh=gOOzEz2svWzVTyBGU45S9ePS96TyAZOIlCv3DRPqwkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZql0EV08fR4XzdDPRuI2Ln81sE3o1DrWQJuRELY/5tIZGSMpsMM+Vr5lSsPJEoegrFoO7epk3o7D6eR53V1Gvlrd+vAgZ3sf1S8GywIhdhT7FGfgVvhnZ2tAsW55zSYN9GO7dodJ0sgUY4+MOv3BefzQzDof4QIFmxN3DfEfVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxFScAK4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356607; x=1781892607;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gOOzEz2svWzVTyBGU45S9ePS96TyAZOIlCv3DRPqwkE=;
  b=AxFScAK44fBpICdtX4uO99rY+/8//ovULZuRYxi7yfpq7RSd7oOfthLV
   93xVi8exWQVG251emZi35rrt9Q1SdKtB9/F36YArTXEfJ0Iv/7ogyOXEg
   MtjmHpMzSZskxMEPHGEz+fOv6An4qJeNkPyRHyovHS9GAXwEg9g5LElc9
   X+q8bEHwxez2nYxcek9SFA72k2BX5WtbIUw1CYJPhaCURjFGhxyBxhQRd
   KmLCBGuTGkPKuLdgY9LHWkFIfIAs5V+qyxnXFBa/33QqQDE707gB2hRPU
   0Yddv16RH1w3rnltnO5De9ugxoHBiE+L4OTCDpOtTBYHJxgGDIIvWSnoP
   g==;
X-CSE-ConnectionGUID: vPReAg9hTO6V1Ib4qCvqbQ==
X-CSE-MsgGUID: W7w9DEeNR+io771XEytBxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52706739"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52706739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:10:06 -0700
X-CSE-ConnectionGUID: 64Z25vMkR7K/9vXKm3kyog==
X-CSE-MsgGUID: n4RhHVIDRDyHWFQYzXwVlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="156508915"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:09:55 -0700
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
Subject: [PATCH v1 45/55] media: i2c: s5c73m3: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 20:09:47 +0200
Message-ID: <d56903624ab7228e06926bd9db8262d2330cd3df.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 7716dfe2b8c9..ff0ced2d8e98 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -1556,7 +1556,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
 	if (!node)
 		return -EINVAL;
 
-	state->clock = devm_clk_get(dev, S5C73M3_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get(dev, S5C73M3_CLK_NAME);
 	if (IS_ERR(state->clock))
 		return PTR_ERR(state->clock);
 

