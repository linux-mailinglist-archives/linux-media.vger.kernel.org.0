Return-Path: <linux-media+bounces-35412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B236AE0C51
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7201BC7613
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA54D30E834;
	Thu, 19 Jun 2025 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtBJa25D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FD330E822;
	Thu, 19 Jun 2025 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356454; cv=none; b=DaeDIYh9+Bqx9f7OCc1CWB9RQhq+Qv66wRD/zHH7qW2Yxe8b2ZlTlULt8xs/2/ESXjZVmpKui/0TqE4qN/b2A5hjeYlHSqnQPGWUmtWdXc/U86WklbIlEuTH9yvK4Br2OBsqHdVVuq+dP2++NRvHwg0rzClUD+Zst+7Qwm1snzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356454; c=relaxed/simple;
	bh=GEJKwvRKpsGRwItuDF/XoskMvaj7D897Ua16ackYBSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+aDBY4JQia+Ney1JR3q2PL4XPmgfvkD9CVzw5ClHxvozOCW/geQMRzPFXg4ukVtW23cVwiBuoKWGueOEp2z6raZXNAp3+N23KOmCdreWUq0v+VdKe1os0kLAlLj05r1jg3O9LDQ/Wp/lzppRRn1+Nx1pAwHGeJACY+KKL/s+GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtBJa25D; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356453; x=1781892453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GEJKwvRKpsGRwItuDF/XoskMvaj7D897Ua16ackYBSg=;
  b=ZtBJa25DAyp/3YZDude6FpHI/c8zTLUF0VuKY107zlcWwj54w6fV0Yt0
   gzFRnPGxsek8ykp0rt2osnnjb2pJ2+URiVv0iApliP2wWFnDTAngAvtYA
   Uo9L79bXwnr1JZ2wrNu+mvvUU1GjiXNzkZDa8WxTpd19vi3pWLn58DtwX
   T+h2rLDTuz2iRApezauM6VOq1VdP/im6u+zm+OXF5YC931dKDPNaBf06Y
   57eqBCgGuRfYQ5I3pquReerQ4LqWRPiu3KeS1WZlNM/YuicwKzOMwXx+n
   oPfJyJ3Pagnunfn1im2DM940j3kpNtn8x2JPMxMib1G1cNE/FhR5CXNRx
   g==;
X-CSE-ConnectionGUID: 3xAEffMORKa+yC+8d5aIAQ==
X-CSE-MsgGUID: GZ5MYcLZQm+0vXjVD7Sw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64049004"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64049004"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:32 -0700
X-CSE-ConnectionGUID: 5QzMaKxrSAeJf6kGLvdW5w==
X-CSE-MsgGUID: cvmNQKzJTy2gVKr4wPqH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919867"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:22 -0700
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
Subject: [PATCH v1 43/55] media: i2c: ov9640: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:36 +0200
Message-ID: <acbab3ac0a71b970be553958ffaf3d3e2d192a9a.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index 01dbc0ba89c8..686d69c1a8eb 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -718,7 +718,7 @@ static int ov9640_probe(struct i2c_client *client)
 
 	priv->subdev.ctrl_handler = &priv->hdl;
 
-	priv->clk = devm_clk_get(&client->dev, "mclk");
+	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "mclk");
 	if (IS_ERR(priv->clk)) {
 		ret = PTR_ERR(priv->clk);
 		goto ectrlinit;

