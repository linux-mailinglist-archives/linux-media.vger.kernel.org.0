Return-Path: <linux-media+bounces-35411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13601AE0C50
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23FE83BC0DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1AA307AE1;
	Thu, 19 Jun 2025 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2LKG00K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9C307AD6;
	Thu, 19 Jun 2025 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356443; cv=none; b=A/KFgCSgMrml+10touLUEyTJzzL7r6P0FkW/Yp/o2jKHNCpVLD41+KZPK2tsVPbuj7teoQCGhE1+u7UE4VHKi0efywBvo5fzC0f10HvVh+mAVmJtZF8x4woFyKua7ybIdvmjxG1DtlOwLXXrmkmFvg7Tyuz0091h/OzaV7RBcEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356443; c=relaxed/simple;
	bh=+5Y3rR1QMOjm4hVc8y6G1DcfhTAlsWfR4Ooufb0n59k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5xIGBN8TcWbQF6IA+loepmrHUK8ixhKKwkL7jpBLQwBMZueu8h4Qrs7iW0AEfejz7LioU+HdYzx6VyRUhUG4+k2h4F2w3IuQYBnH9irVD/Bhxxl569HF3jVWGDww9eRBhHl/mGkXB8ZYAPrOr7QEQSpIs5PiZwpibIRFlBkS7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2LKG00K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356443; x=1781892443;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+5Y3rR1QMOjm4hVc8y6G1DcfhTAlsWfR4Ooufb0n59k=;
  b=i2LKG00K1BJ6z6soRj9/g/s0mJ+tBYPL/wxoJ8WcqYcKSbDVNgcEofoz
   YP8JXOjaHmkVN5JRUtMYwJH5LztfxvEv7bPK67UcKedezfjDkrndUItzt
   LmafG2b/i1TfA8cxDJybj0kvagL7CdUlteke+jQhZbIPjDlPuwRlJfGyS
   aoStZwU/0kpQZbJ88Y6z9rhBhKZUj2Ch6rbFvrVreUbO+6tRlk3QauqjV
   q+tPTmR3x5NPRgMCDH3ePGIB6pyh93neeNPMpd97GVxLxPF1ujoEzwENs
   5JegwkIqaIXSvHn0P1xwrRKxtB1a+tu6Zkhtrytsu2qWJixeEz+n3JBoG
   g==;
X-CSE-ConnectionGUID: wRJRl/pOSb6SBKps5eEIoQ==
X-CSE-MsgGUID: R8W9itIrTFmkKZBOWk22og==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64048970"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64048970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:22 -0700
X-CSE-ConnectionGUID: CjA8Py10RPOZtnKSNxtSCw==
X-CSE-MsgGUID: 3EKMaUklQeWSSot8N1IQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919864"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:07:12 -0700
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
Subject: [PATCH v1 42/55] media: i2c: ov9282: Use the v4l2 helper for obtaining the clock
Date: Thu, 19 Jun 2025 19:59:35 +0200
Message-ID: <0c3e778b4f903ed9bb3a9241321ca1b23b3aca58.1750352394.git.mehdi.djait@linux.intel.com>
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

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18..27c7c007c165 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1135,7 +1135,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	}
 
 	/* Get sensor input clock */
-	ov9282->inclk = devm_clk_get(ov9282->dev, NULL);
+	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
 	if (IS_ERR(ov9282->inclk)) {
 		dev_err(ov9282->dev, "could not get inclk");
 		return PTR_ERR(ov9282->inclk);

