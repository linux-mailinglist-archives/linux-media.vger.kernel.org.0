Return-Path: <linux-media+bounces-50427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50856D11AC6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 388C63024F57
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C4928726E;
	Mon, 12 Jan 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAl2Sy5U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC728D8E8
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212018; cv=none; b=h4j3W7KtYUfv+tldj9KkGKiMe3gh76zBgfRJT+Glpu23iI1pJkfX9TsqBwEzmE81RnTDTtxMJJqk66DrpoQOZ1h5zJLzIlrJcZUc/6T6fIGdB1Af/pbrSqIG4JUxCT1QIA0F9bzosh0q1/nrmFTefYbO3jMfXWMG4JePhYtywYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212018; c=relaxed/simple;
	bh=NgogXpNbn9UxBgbHJ4rk+MmEwtyA0Sha2Jx3V9VZE04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbDzf/pRVTrMeUbdGMY7N4dXmYMHFw+cgGUGXX9V1BzUD3vtnnhFn3mKYgHH/0CEHYbGrjOdawOX4CYHXLaJLZ4O8gnQU5jXFfx1yuTZhW3OvpROxMJGPzptg7u2aixOumGZGyLqrC/qdaOg5sdM4oTd43UxawD2D0Y/uv1ubW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAl2Sy5U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212017; x=1799748017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NgogXpNbn9UxBgbHJ4rk+MmEwtyA0Sha2Jx3V9VZE04=;
  b=TAl2Sy5U/DkaZmLareHhhTZwRX9DmqCeumv/vJiMUmxeVAeBEl7Bnr9D
   0caTo3gsMV1QSTcFCYraevLkFr0gKwZ6so3834wKaTK33dqVgEbNdwbEj
   gd0wplbwRYu38R4KFwtNtvWJbEvlLDGJ1UKBR4hewGy9RCWR2QsjYN9h7
   x6+Wf44w4pGfXK5WIcUJVt0//3eXgd6EnHKVVE3/EzIco+CZ6cxdyqGdu
   FHuNpQvbXtuwyjsA2rvEruGJPySvHfR9+bJ5HBo/XbHVI+7wR+Dny9rhy
   NkjEemm71z22OY8USeZBG1tsAbnpirYPqC01EwtlANvhFOBfJTuk/O1H+
   g==;
X-CSE-ConnectionGUID: mcvylkfESB+w5a/E3zKGug==
X-CSE-MsgGUID: 4D0kEMpgRtK2N2THTbuVRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218821"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:00:01 -0800
X-CSE-ConnectionGUID: Aglqs3nvSeeoXRnBchcImQ==
X-CSE-MsgGUID: zIRfQJGjSgWiTUE++PjbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743177"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 61BAF122024;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000012q-174d;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 23/23] media: i2c: ov01a10: Add ov01a1b support
Date: Mon, 12 Jan 2026 11:59:49 +0200
Message-ID: <20260112095949.3851-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Add support for the ov01a1b model which is the exact same sensor as
the ov01a10 without a color-filter.

Note since there is no color-filter there is also no need to shift
the crop-window when flipping, so the crop window set by userspace may
cover the full sensor (border_size=0).

Signed-off-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 6d245b638b2d..10227ae6fe42 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -1102,8 +1102,17 @@ static const struct ov01a10_sensor_cfg ov01a10_cfg = {
 	.invert_vflip_shift = false,
 };
 
+static const struct ov01a10_sensor_cfg ov01a1b_cfg = {
+	.model = "ov01a1b",
+	.bus_fmt = MEDIA_BUS_FMT_Y10_1X10,
+	.pattern_size = 2, /* Keep coordinates aligned to a multiple of 2 */
+	.border_size = 0,
+	.format1_base_val = 0xa0,
+};
+
 static const struct acpi_device_id ov01a10_acpi_ids[] = {
 	{ "OVTI01A0", (uintptr_t)&ov01a10_cfg },
+	{ "OVTI01AB", (uintptr_t)&ov01a1b_cfg },
 	{ }
 };
 
-- 
2.47.3


