Return-Path: <linux-media+bounces-36003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F602AE9F1F
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66EC172D5B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D02E765A;
	Thu, 26 Jun 2025 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NV+pwj0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59AA2E6D36
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945199; cv=none; b=A/gJHjSoUwVdy2ICYFi0hT8daZwbou8lhXCdnJ6cTT9dUl6ZTbokLym37vfPy+MagHfZrYorzs4NmOMeNUdHPO4AvDDamQIg9ILRN3sT5Ygq1DEPtDtA3DHKl60KV7b3LZfxjlxHxo++lHNgMV8sKZdb9UtJLWfUa4cQde4EbH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945199; c=relaxed/simple;
	bh=rW+oRU/Qx3uFFx8eaXPpMEOE0305N7ah1dSlsf4R9DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS18GaPtcLcf/IiUhm2MpHTTmNlG61B1w6gXdei/O/FivOlEpiVr3TOPuHTIiZWwnDBqU8DhhH/pIBJ62pX1adErHcWQuF/lPow5kYhMv6yE0n4HlYZDPRAE/X4dS/TFRPzrM+/ftzmOofoRuTkvyonBWzuYcwE42gY5PWiJBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NV+pwj0U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945197; x=1782481197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rW+oRU/Qx3uFFx8eaXPpMEOE0305N7ah1dSlsf4R9DA=;
  b=NV+pwj0UFrcpqCKW8iSY5YzwlFMDGO+VhMpH3pnstbUg2TVTW6RO40PJ
   MiYglicIM9xxO5fGO0pq2UYOGAgNrHndyKY0zW95c+WjSkQNup8XO+Lfo
   GR1YX/12qHR9kDF86hfLE7ue9S9tJDEi8nf6Uy1VCHFh9ArNze8tulkHA
   6KZGzAgIWVBIlU4GQFDUxCaH23vZOdxU8Q5qa5cxv9SzIlnkPVZexXIOR
   pNMxNwfHEoWlhQULGcwV+nJpi7k666X5BKjr3TRbYj4Vj7/5jOYOUOjjh
   UwUcSZtCJ8jJB/svMm8fkFLB8YFZBvnZObZaZTPvvingkHYT/TjBoOybq
   w==;
X-CSE-ConnectionGUID: yibIHOnBQ5S8k6K5EESW4A==
X-CSE-MsgGUID: HX1RWWPKTRuP6cRBZdafhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922203"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922203"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:57 -0700
X-CSE-ConnectionGUID: weZO9EtOQ4+WWLfI8YEgpA==
X-CSE-MsgGUID: XPPTy6HMTTG1qIE/sF+Zgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:50 -0700
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
Subject: [PATCH v2 45/48] media: i2c: vd55g1: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:36 +0200
Message-ID: <88ebdff6f45a0594e13cfa944513690ad89e07a2.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 25e2fc88a036..693db225e04d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1863,7 +1863,7 @@ static int vd55g1_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get regulators\n");
 
-	sensor->xclk = devm_clk_get(dev, NULL);
+	sensor->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk))
 		return dev_err_probe(dev, PTR_ERR(sensor->xclk),
 				     "Failed to get xclk\n");
-- 
2.49.0


