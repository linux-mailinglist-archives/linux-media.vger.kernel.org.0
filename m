Return-Path: <linux-media+bounces-29022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA024A75FE5
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F7E188957B
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095071BE251;
	Mon, 31 Mar 2025 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0J4j8u8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624E339A1;
	Mon, 31 Mar 2025 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405704; cv=none; b=qpIM9JDsF8EYJ6IlPyeIoguzwVXhOE71nL3WLsEDpulL97oZNz4f4FMB0T1I4BTL8XRJtLArTOr/oR867xJrDcnWSbhWuq01955GXR5KEZcbOZG+YruFLEw/9Yop63iaDBODBHYGR03pGzdzmrpacP7rX6jeAvi9MLdYXWHR2gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405704; c=relaxed/simple;
	bh=5XkEjuyV2van/BQCwUUXEpOlzawQC5PT+p/CBGgu1kc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJPas/hyFMq7JudgBSSkSqHuz8h00OgGvA3NdoD1q9rLahuBoxwUX72JxNoYNn9oyjNCLY2nUz5W82v1P7O75Q1nsAiF8ePKugfeFAuICtFK/e+nJZJSm5vpCir8ifahBNdLmWX7uGHDduE/cDWNtwinZn3QxTnq+LmpucVUcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0J4j8u8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405703; x=1774941703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5XkEjuyV2van/BQCwUUXEpOlzawQC5PT+p/CBGgu1kc=;
  b=a0J4j8u8a7ll6dtdnATSGi+VeRJJAEiQd0Pl64nuR+H3LWoPAAVE/iyt
   0u6Jzm9RlWVCe6HBoGFkoBVuiwQjMXzykEU+ZJCu7WZUimCH4LfEJOtC4
   b9JMFimqfCWGbAil+gI/Lgnr7xG7Y8t/rVDwaKWt4ucZK6nQaJxyxkQ10
   Hu9FtKL3PtE4+0Vnjs6CSFDDho/1f0Mvbsc3eCaU0E3qgQUVcGZ0RJ/wq
   RTpfwAYYakzi0KAjK5w+Ii5SF5Dmm9WDAX8M74N8nqxzNUxULwKBYl1xA
   AmqTFPTFe21fhv0C7dzuUxTDAj6rtI9GQyGyKFH/G5uYs/oDvwcTSh2uG
   g==;
X-CSE-ConnectionGUID: LeAWOrZPQea+Cug3vM8+Rw==
X-CSE-MsgGUID: TLLW8E+WQ0eX71tM1OR2gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48466720"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48466720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:21:42 -0700
X-CSE-ConnectionGUID: Bnu6NutjTYW/R0x5YADX4w==
X-CSE-MsgGUID: FCUgQ0auR/SrITSB1Sovvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126247204"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2025 00:21:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79D331B4; Mon, 31 Mar 2025 10:21:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: raspberrypi: rp1-cfe: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:21:36 +0300
Message-ID: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Note, that fwnode API for drivers is provided in property.h
which is included here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 69a5f23e7954..fcadb2143c88 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.47.2


