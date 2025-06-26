Return-Path: <linux-media+bounces-35966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E93DAAE9EEA
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194931C43F33
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CE62E6126;
	Thu, 26 Jun 2025 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfesZpfz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77BD2E610C
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944949; cv=none; b=WrcBju/lRJW0JPWgS7qxiqdJm+Lqo7qwcbIO+hP/db2Mn+o77DQ2QCm8WyY5dYJQON4ffson9SehIjnfUwM7znpMn+/baxQTzIkes7zEfUfGieMAdEcir8NW8d+g+tFtSuNFtlgyaKJxPkMwqFDKmu/8WC53s39cMmKR0UPA/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944949; c=relaxed/simple;
	bh=SbQEPUbYFUk//owCOjJOTGYSv55ZH/6+d7ngScFjYOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXlL+9owDZxLuKND4EOu/IpgQcgutv70c5aPYYYEUfLmuVNogkgtkBpv5QHX+0lL3BGvefc8OPVyeWopObnm5mvsVweAAcIpxd5UlJQAZhH8CFO+/aJXzL9EEadz9lx+qmleU0BGY3cGps+OKVzOkPQJIKldALTzQiMXRzV17XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfesZpfz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944947; x=1782480947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SbQEPUbYFUk//owCOjJOTGYSv55ZH/6+d7ngScFjYOI=;
  b=FfesZpfzS+4PMICQlLp0UayOdm5DVJ1+afAxcoEad6oDvGcCpHLmM2lD
   +fCsnl7TW3OyknPyKuvyo3avcf0ncTNucfNDi8GAQ0Z7Lpj/C16W+K9+8
   WvLm/Nn2El3+/y2LbcWYvHxXTwNYVjj0/ZLmW2xUZneojDtq5es/LRbNB
   twdmhjGj7Bjsx+uho60hGRqhSsS/CcCarTuWPaQPP7NZp+d2rR8++2VHq
   EF34BwGdoesFpc4BwsoNmZMDC5S7nKyfVu+HMEreWEmZW31a6WgUO5rPn
   Ho6VVQwpVddgfzxSt1w7SgxnK1OJj0MRwTKsKcMPuDOajSU9y1dGlY73P
   g==;
X-CSE-ConnectionGUID: ucUcQi2RQp6CQcYB7HjwXw==
X-CSE-MsgGUID: LlQWOq+HSNm0EqTA1zfKZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921326"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:47 -0700
X-CSE-ConnectionGUID: fQ57NLtaR7SSXmj1Bx3oBQ==
X-CSE-MsgGUID: onAdedgcQPOyX/nx2AuEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049362"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:41 -0700
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
Subject: [PATCH v2 08/48] media: i2c: hi846: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:33:59 +0200
Message-ID: <791a3be3c41682f5302eab7d3ff266407e2d8339.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/hi846.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 172772decd3d..a3f77b8434ca 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -2052,12 +2052,11 @@ static int hi846_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	hi846->clock = devm_clk_get(&client->dev, NULL);
-	if (IS_ERR(hi846->clock)) {
-		dev_err(&client->dev, "failed to get clock: %pe\n",
-			hi846->clock);
-		return PTR_ERR(hi846->clock);
-	}
+	hi846->clock = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(hi846->clock))
+		return dev_err_probe(&client->dev, PTR_ERR(hi846->clock),
+				     "failed to get clock: %pe\n",
+				     hi846->clock);
 
 	mclk_freq = clk_get_rate(hi846->clock);
 	if (mclk_freq != 25000000)
-- 
2.49.0


