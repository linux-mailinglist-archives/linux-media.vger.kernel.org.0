Return-Path: <linux-media+bounces-35997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47177AE9F16
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 653A81898242
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5687D2E6D36;
	Thu, 26 Jun 2025 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CF9TjMZm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BA62E6D12
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945158; cv=none; b=qiddI5mCE1cdJYq4x5e4IelA2cFPdZdsAfPmbi6G4i9hqSQVZnYENm4PnAszQHLgLUn5tUFe7T5xCrnm/jRFVkx1qKN6H4P9NlIiu4JLdcfGSYJtP/LYoqw5NkVvaaECoElqcF0kOTzzu/g0G85phVXn/qptvOATJP2DiWKsXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945158; c=relaxed/simple;
	bh=SSWIvAnQgf1awE6nYleGyAoLrN8z4qv0kdSDP3pD8Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXveH5CTblUHId4PBFhhWljocyI72M2QCKfMqRhqZVhV/8bV9oPkehiR2Sf2A6hzsGmxBcaqH+TqlM7MdQXiy8nVCR+Hvdz14i0Im4gXmx2OhWtguKPC9QUGZ7/UBfGswP/u2tQpA+yy56OhF1ON9uYiD5e9ybQWc/peH+9iyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CF9TjMZm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750945157; x=1782481157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SSWIvAnQgf1awE6nYleGyAoLrN8z4qv0kdSDP3pD8Ec=;
  b=CF9TjMZm9j3ppDV8sMRAsWegyjd1osvKTs2Rnh/flNalNsnBhPh2nKYk
   us96xp65Wu5ElZA+/Pu16Gl7LqckHiWRQS5sYI66n480GQPVKcKgM2to3
   axwm706WrMxCxcB38+JmwGURuAYmqodQhJBcCRCGITD+XjPsTq6sAicRh
   vYyDCIMK1JSqqulqI3lMIItXgrMFrb/wSykY/xy/U5hAbbSyCcKlmGaGl
   iUochM9D2+hWFxVgOMeL0XuJexzcksrjvRCZZdoTAVm13Nfiaw/X7lufp
   nZcKXtmC0eeDf0tvZZ71mdgalu7yjjAPU2Xv8eWYaY4YxUFIHr2MwHkfM
   Q==;
X-CSE-ConnectionGUID: /+t1xb+/T8CPX0DDmXSm8g==
X-CSE-MsgGUID: ABvGfWrnSTCpuyywrlqGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56922095"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56922095"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:17 -0700
X-CSE-ConnectionGUID: WYxiVeNzSrGDBrGqYB+UEQ==
X-CSE-MsgGUID: oJx4x9g8RtyUuQfWhN23ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049836"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:39:10 -0700
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
Subject: [PATCH v2 39/48] media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
Date: Thu, 26 Jun 2025 15:34:30 +0200
Message-ID: <35856b933ad08088670e78d1bf1cf83585130307.1750942967.git.mehdi.djait@linux.intel.com>
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
 drivers/media/i2c/ov9282.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18..a9f6176e9729 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1135,11 +1135,10 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	}
 
 	/* Get sensor input clock */
-	ov9282->inclk = devm_clk_get(ov9282->dev, NULL);
-	if (IS_ERR(ov9282->inclk)) {
-		dev_err(ov9282->dev, "could not get inclk");
-		return PTR_ERR(ov9282->inclk);
-	}
+	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
+	if (IS_ERR(ov9282->inclk))
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->inclk),
+				     "could not get inclk\n");
 
 	ret = ov9282_configure_regulators(ov9282);
 	if (ret)
-- 
2.49.0


