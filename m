Return-Path: <linux-media+bounces-35387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB314AE0CAB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50DF118915FB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9058A2EBBB7;
	Thu, 19 Jun 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0ymlh83"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0AC2EA147;
	Thu, 19 Jun 2025 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356196; cv=none; b=taVpXqQtbYYV67MKe3D+Lm2Df5NUulkim2snTo7bwERUZ21P+B84hx6JYNPx8W76Sz+6sEsZNH7q15IKtHCdGJnQ0qQwt/e6ugsG94+hTwpwQlaafx2yrWyr/smOIunrkY2KGX/czXMq79HZqCiHk7vDudWiyUZwCkaUXC8EOo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356196; c=relaxed/simple;
	bh=vTSgV68UOIYAU2aC7cw5c9gGDd0x+0hJZTZudwtupDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwxRqTRWNfiZk0DOW/6biugUYkpwXJ++AwAcmPNp0Tdg3sQc6b9AxMm8xlo6MX6v9hMLh/9U8eTXlo/WdYTX7C5oJNKaMF2W/MSumUkJT+nKSEfXOGKW+4eMdeEO3f0uV+b9vvsZvVD0oLe2c2NARtgBvxXLRSYJ5rU3tdvWXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0ymlh83; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356195; x=1781892195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vTSgV68UOIYAU2aC7cw5c9gGDd0x+0hJZTZudwtupDw=;
  b=N0ymlh83PEFEVO5PUmFLDooJCbj9TSt9pyzyZSJ0r7UObq/DMxme2Gp8
   0nRGUIutr20rkYNp9DqZ+3gQjNFjDph6vkkCamnW+yMkPPPiMthPjgw/a
   79E1/uhcl2MGOK9acjmb2+HDXV5XGXioxTRuKIS+Ce+MXgjD2kpH7ORSJ
   dPYnglNRpJt/2lgZPZiOPT3n0GjMBpZGbXsiQ4L7/JjusPbvGAObiJU3w
   UM/vRchRo0dDoVeA5TCS+rgMncy5J+SpmaPn8EfoCff+vfSlMhkJkYCld
   0KYZpVjZ7EUCNdpe0MGcR+NKFsIAL9vGhTHgRbBZ4Z4M2gkxCiQjic169
   A==;
X-CSE-ConnectionGUID: jJAQK7bOQjyQ4PyVzijqcw==
X-CSE-MsgGUID: sB/hOIiZSF20iBSN+xqEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048269"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048269"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:14 -0700
X-CSE-ConnectionGUID: hJ6Ii08LTg6itNLmxdD5Ig==
X-CSE-MsgGUID: Di/KpJ8DSzCpoKnj6fi97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919493"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:03:04 -0700
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
Subject: [PATCH v1 18/55] media: i2c: imx412: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:11 +0200
Message-ID: <c05ef2154c872d827dc85f68550fb2eb649d05dc.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index c74097a59c42..f35d63ea6c08 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -933,7 +933,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	}
 
 	/* Get sensor input clock */
-	imx412->inclk = devm_clk_get(imx412->dev, NULL);
+	imx412->inclk = devm_v4l2_sensor_clk_get(imx412->dev, NULL);
 	if (IS_ERR(imx412->inclk)) {
 		dev_err(imx412->dev, "could not get inclk\n");
 		return PTR_ERR(imx412->inclk);

