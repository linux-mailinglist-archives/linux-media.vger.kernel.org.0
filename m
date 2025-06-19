Return-Path: <linux-media+bounces-35373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D5AE0C47
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52BEB5A4E36
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A6129186F;
	Thu, 19 Jun 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sckrl+zM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A428EA62;
	Thu, 19 Jun 2025 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356052; cv=none; b=b3kwoDE3wRKiqOz7odYK8DJKqu9MbDOzX0Q2QNNJTWilxtErBu4QiJuFeE4vF0VVWhrotFvXjKeDaUc+bjPc3iUZin2y8I3qGD7aH+YopTgtudQWTwe668+39lnTC/Y4TfoixzkuS+C6pFgKn9fli6Xx3JaOTrG/NAYD1WgmYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356052; c=relaxed/simple;
	bh=ACDDIEOG1RXBBeSXNnhCehhb5lqhYtMwhWBzZljlL7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbZS+B2TQY+32X4q+Gvk5IGsBIipT+A/rsRhsX4DMkEGW6/JLuUgNdkMFOEuAZFaDw9VcF5AyJRHhBvhAnTD1dXTQPtGVxfJwQnG9nWlPW8qR67/6LuV7ma+8Hk4X3kwghJeFTa57MphVlSSo0Uw6X0cuS8idDLgvZHXdPp6p2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sckrl+zM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356051; x=1781892051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ACDDIEOG1RXBBeSXNnhCehhb5lqhYtMwhWBzZljlL7w=;
  b=Sckrl+zM9DG8iXWriTpCT+uP2yT6KzdipteFOAJC4EstEFuHpRhpslDo
   YfHlT/nvOyRpc5vO8wayQui3r2eh/nXFRPYVJHe0GZ1lDGb//458/hu64
   9HM5ZPZyGsU+LEXUmUKOKN3ZACmm8lavCtM4dAmVPg3FgdSOV3IDIKUrS
   O0oJSU5qaa9H2qM2VJP5NNBxOVLYO3nHq5IcZmo3wezSpYCAtxPERTMOJ
   BpDnpagyqKO5q4N9MC4FaUoRFboLg/km4aJ2Wh/0zfLaPLu2Jy9IAIOq5
   NxWV2pCbZx0LCFz0UMmlBLyLultmmGM3r98elM1tqGNs+W6nlqwIzMCaQ
   A==;
X-CSE-ConnectionGUID: IoMvTS1hSJmx5+0Sd9edtA==
X-CSE-MsgGUID: C6CixtdsQVOgQVfwB15fzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047779"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:50 -0700
X-CSE-ConnectionGUID: Xm+FMAHHTuOBajWA+cpM6Q==
X-CSE-MsgGUID: lGzT11PoSBKVWq+Pojy7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919311"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:40 -0700
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
Subject: [PATCH v1 04/55] media: i2c: ds90ub913: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:58:57 +0200
Message-ID: <aff272469773c105972c32880a4890e38e55462f.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6d3f8617ef13..e3be10d248eb 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -880,7 +880,7 @@ static int ub913_probe(struct i2c_client *client)
 	 * ub913 can also work without ext clock, but that is not supported by
 	 * the driver yet.
 	 */
-	priv->clkin = devm_clk_get(dev, "clkin");
+	priv->clkin = devm_v4l2_sensor_clk_get(dev, "clkin");
 	if (IS_ERR(priv->clkin))
 		return dev_err_probe(dev, PTR_ERR(priv->clkin),
 				     "Cannot get CLKIN\n");

