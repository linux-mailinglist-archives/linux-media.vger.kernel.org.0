Return-Path: <linux-media+bounces-35374-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF7DAE0C48
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4099F3A03F8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0D228D843;
	Thu, 19 Jun 2025 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRJ9TSEg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1D5152DE7;
	Thu, 19 Jun 2025 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356062; cv=none; b=NhJSBLi+lFnoDQic+HV+6qTEeyG0aOnwd871NWv76FrcUaLMymQHqpl1/A9BJhP6lCo/BBhU5ptVG/1XOivIhDgBo0YyngI7csQsDmsysiKwMIHj5E4je+mRQpN8qPrUzAlhW13QMKpEleTuDUAWtGSNzat8l3UY1oOamA3FH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356062; c=relaxed/simple;
	bh=BHwRAwG5ENsFFTwinJyd1syE9PfllbFfmJ+4YzbfX/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0LKiy+gr8XUWkY7kNk8hcwh2D55CBW67TwK+0qpW9BNKhLJqI0mr5gqr+xGLqGVbiWFfjUc29phl8/iWADMtMQW1UfzkHp7DdEeUQJBCjE6TdBznQ+KQ994UOS+qLdqrNt9e8OF1k3frJct6nmfVAzTfmIk06dKcgmF5GAtjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRJ9TSEg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356061; x=1781892061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHwRAwG5ENsFFTwinJyd1syE9PfllbFfmJ+4YzbfX/4=;
  b=jRJ9TSEgiZZ/d3dc3AsnzrSJuIpYSTzngvtMVO0RBP81/Kdb94vkJ8IK
   l/GwXYvyxy1NcqXXfFqbS5EqfyNwZxPXuQXcSyjxH6gpvDzRL/zRzWNr5
   YaoybczGAJ1T00OWwJ+zxUG1GdrT243hZd/FKXv5xFJNrNWIZjB3EdLSI
   VO5yy2MGaWu4kqMvtgLe5DtZwGgxGGh+tGoMlkpNfQjb64e9Za+QPERJ8
   P4rgD+J2p2I1kqQgVSKcHIVEYrGxNdrURWUYFr3DjFGPgFOWArN30OOLS
   x877xLDL7TM9DzhJs+u2WnooB3qh6zT7BByaV7wQsA9/f7ZIGPr15+cVd
   Q==;
X-CSE-ConnectionGUID: 6Mxzpd6wRFSrPybyKRX2gg==
X-CSE-MsgGUID: Y6b1LvmGQJOM2VComtWZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047816"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:01:00 -0700
X-CSE-ConnectionGUID: 75vFlJlvTOOqb67lRRKBSQ==
X-CSE-MsgGUID: +0im+s+WQpOI6NQkqKPslg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919318"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:50 -0700
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
Subject: [PATCH v1 05/55] media: i2c: ds90ub960: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:58:58 +0200
Message-ID: <75002bfe8c15a55d6cb4276666862c15dd4db328.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 082fc62b0f5b..9de643122e65 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -4964,7 +4964,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
 		return dev_err_probe(dev, PTR_ERR(priv->pd_gpio),
 				     "Cannot get powerdown GPIO\n");
 
-	priv->refclk = devm_clk_get(dev, "refclk");
+	priv->refclk = devm_v4l2_sensor_clk_get(dev, "refclk");
 	if (IS_ERR(priv->refclk))
 		return dev_err_probe(dev, PTR_ERR(priv->refclk),
 				     "Cannot get REFCLK\n");

