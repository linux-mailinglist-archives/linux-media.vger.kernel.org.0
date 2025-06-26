Return-Path: <linux-media+bounces-35968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DFDAE9EEE
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67CEC5628D9
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB162E6133;
	Thu, 26 Jun 2025 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnYZbRBs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84DE2E54DE
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944962; cv=none; b=Ey85rsuaVNXylAgSMMTxflQPjr90jckJNDOoyuQls/IeVvW57wavjwQYCCEFxSfU/yart2VsrUtiwA+IPoxjTRj0M46QvX98JxITb6oodb++JX+90ymOhxRo6n9GDtCEsJqXT+sjQ7P4JIXivvQ1VR/p2FhC61/GuiVgc5zMZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944962; c=relaxed/simple;
	bh=l0qwvU+sAOynqnxam8sx1B806f+rV1bC+++SU3wSIGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYoGYmIpLzvWD2mGPODy+xe+9iaYLnOi4wxjmw6g9vYGc6YOlarNa4I43QM59d7BUYatkq1ePZQN7prQ58J3iQIQNacLR0yP1rvhIshP2o7q87Eys6ynU4g0ETJVF0StKG1j+TC2+kRy9xM/RvYu/ebVHNMphKcdTBNpOqMXHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnYZbRBs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944960; x=1782480960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l0qwvU+sAOynqnxam8sx1B806f+rV1bC+++SU3wSIGY=;
  b=SnYZbRBsPawm/4qX+6gi6Gwkfz9Ovzb6/zGasGB+xgmmwQjWhHESc4gO
   jSXUanDg4rInFoaG1ORRQzBFhA006yJCN152l/pyDWjjCg1OQdY+KSL7Z
   bTtzPEAN5O8fEry1wz3ArvteBPLWTNLoYd12sWYGSQvmzt85wE3EGtFnN
   a9IP/kz+VPbOTNVOtMafFMzj/4Zli81QJPFbD7Nufsq7w4ln8hB4SJLrj
   i8/UBWGaA9gatNFVCbF8vpFaJkMLYGr3xqJNCVnrQ/F1u2nZURNpCYSnw
   mamRApqZY/Hyl0H3kw4g9ovVkHv9pxbYiRvPomyff3vqSKIySy6GqMuW3
   A==;
X-CSE-ConnectionGUID: Ij0QuArbRHyV8txAyzgWJw==
X-CSE-MsgGUID: b5JCsuNOQN6S6heM9UeZRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921355"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:36:00 -0700
X-CSE-ConnectionGUID: SVmJZX6/TaW7YjbIfa1uBw==
X-CSE-MsgGUID: DXfl4gsvRIW2AKNkgyOszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049378"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:54 -0700
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
Subject: [PATCH v2 10/48] media: i2c: imx219: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:01 +0200
Message-ID: <abd99314d82a1c718407b51724d57473022dea7b.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 3b4f68543342..bb7808515178 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1188,7 +1188,7 @@ static int imx219_probe(struct i2c_client *client)
 				     "failed to initialize CCI\n");
 
 	/* Get system clock (xclk) */
-	imx219->xclk = devm_clk_get(dev, NULL);
+	imx219->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(imx219->xclk))
 		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
 				     "failed to get xclk\n");
-- 
2.49.0


