Return-Path: <linux-media+bounces-36001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3278AE9F1C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941CD188538B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BD82E7181;
	Thu, 26 Jun 2025 13:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAEmFNYs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E4D2E6D36
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945187; cv=none; b=jwDNUMJJQd5VHvOIQW19zlZ2d59UerUAi/XB5p/5gyOL45eFj9WtQc8ps+HrCvMc3lAcM2YnLEluzKACIF2Z8V2bAuIzWw4b6QOV4x2u/bS45B7FwwcqUTGT3EfEAuWXQ3sDpq+so1unKpYeMhvWkPMY2uyw7+lbgq0SkDM+lUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945187; c=relaxed/simple;
	bh=43qwQ3PyQVAKWjR3970iPu0SwsSq55Rodl/szymZwHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f28O0Iy+PhKwCgpTmUSkG2QSPz7JBJuLX8Ht3UX8Sas7DouXRKO86c4+F14IBkRDCyMytS150IKMRf8Ih16MOeLg2U+qGYb/dGYR1PBGc0U4yhjj+ZHk+NSDoxhRnuyK2yD8u/BoKQT8mMLzcPJ4mPHRfEYWtB5dWmwTqgIEFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAEmFNYs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945185; x=1782481185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=43qwQ3PyQVAKWjR3970iPu0SwsSq55Rodl/szymZwHI=;
  b=NAEmFNYsx7fX2+QW+CXJPLo6aq+g3hYluVDPEVHqy5/BaAljLE+tuRog
   uHfNsaZo390/DlwWEOvCodLRyo91I6npSJx4+PpwXKT/VDP9UzzoZDDbB
   wjWdwrYW1mKbWkNTqm4Lh974MnZMr1HtbMVMHQiDC6vcut1U6zphZMBZC
   d5NIXKcFYC5/K8X3R61KJtKtf1G8FhNjw4PbApVPjrt5R8N3AgJIv+Bbo
   I60bR9UKLueDhcLHw6gk4hDwJjqBB9wsh/pSOPVmDD9FKl8tINNCqtUHz
   AOaDcZqsRSEqXWrWTEkTxaifSWQTLjdCV8pazl42T2SuqTh5wwthOc0jm
   g==;
X-CSE-ConnectionGUID: rllouFSIRWS0kKPhtfUnfw==
X-CSE-MsgGUID: BAi1m0lbTqKVsB6SqSgnfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922176"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:44 -0700
X-CSE-ConnectionGUID: d04vCwrFQJizYDxzSxd2vQ==
X-CSE-MsgGUID: Vu6TQG9aTFmEq0aBU+LwYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049896"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:37 -0700
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
Subject: [PATCH v2 43/48] media: i2c: s5k5baf: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:34 +0200
Message-ID: <273330910e1efd2e1cd6b0ba45983a0893b5e3ab.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/s5k5baf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 24f399cd2124..01d37f49e5ad 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1967,7 +1967,7 @@ static int s5k5baf_probe(struct i2c_client *c)
 	if (ret < 0)
 		goto err_me;
 
-	state->clock = devm_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
+	state->clock = devm_v4l2_sensor_clk_get(state->sd.dev, S5K5BAF_CLK_NAME);
 	if (IS_ERR(state->clock)) {
 		ret = -EPROBE_DEFER;
 		goto err_me;
-- 
2.49.0


