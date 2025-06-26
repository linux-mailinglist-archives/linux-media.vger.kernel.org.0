Return-Path: <linux-media+bounces-35964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF6AE9EE5
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA3F3BF37F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133A2E54B5;
	Thu, 26 Jun 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBbJImi6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A12F2E1C64
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944935; cv=none; b=Z+A0i26/pX7/aZLspcBf4r7yXHeqBo8cDabAvykDYEWTwnoyRKueAp1cNjpNJbNyDtrah+mzdBQwloTXe01XUxYJShje8TmE6aX6Q1g1cZHfYhiBo8Sz6cxCSKjjESWr/Qi5Ly2CeGgz17mlmJwM8AhuOyENqpKeZo8FEvK4AUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944935; c=relaxed/simple;
	bh=vWCyn33DppQHOeKx9vKXk0UvzYJIyC8P6/0nuWakOSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTohHJP/M+0R2ytJcHzQEvdhT2Y25D1HS+V+a+WQN2mULZqhMBWv+CWbY34RFUJYdEqCyjqzYsIGhvha4Z10UsW+gl6gqGl9rauoInfRAt6irdvGUYQDTHhOX7MAaDIHM9jbNRGpn64oitPZmGuAEAO+iIz8oJB7Fkr2CPGSTMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBbJImi6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944934; x=1782480934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vWCyn33DppQHOeKx9vKXk0UvzYJIyC8P6/0nuWakOSs=;
  b=DBbJImi6SeyxAsgq347Os88z5dAZ8FLMp3KTbokb3sATl7Iq1tv2Y6yg
   p70hmGAaYHTNwJ33wY/6UCAHk29dBeEmfU3z3QrRsCeGQN4oBHS+QC62J
   WfhXcYzB7Fzb2RpcS716G98byvtPxNjqjW2RVjSJX4oowGjCn531xuQ0n
   g1WpRH9Xt5OPJ51b9/tap3jPmydPqN2IJQw7BBZCffaIko7vCpGUweA50
   HNRT/RQvYT0o3Y4Q/vNcvu5qWKpkyPEVxAJQuvZ+eMRgUAnCYypNb6hGt
   uNzulMvwN1mg+CuCWZsQROMKzTYIUKqxgygoutciswOudFD7CbRFitpFr
   Q==;
X-CSE-ConnectionGUID: 0XP+VmaGRMGwVmOYX40F3A==
X-CSE-MsgGUID: v/pXR8x5TO2Zqmwu0wFVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921285"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:33 -0700
X-CSE-ConnectionGUID: T8PjrNqBThmHfgLg2VBacQ==
X-CSE-MsgGUID: /FBToovKRUuWbuuz/v+IaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049351"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:27 -0700
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
Subject: [PATCH v2 06/48] media: i2c: gc08a3: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:57 +0200
Message-ID: <4d32caf576fd05015e3ca1a4a9d379f7a5c89796.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/gc08a3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.49.0


