Return-Path: <linux-media+bounces-29025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9976A7600D
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC7C168324
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7BA1BE251;
	Mon, 31 Mar 2025 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iT6qfbdx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F50D1B0F1E;
	Mon, 31 Mar 2025 07:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406033; cv=none; b=bX441eCdAQbPA6eg6j2v7khxqhrlhnPFdaha/MkoFRQWQxuIRUrHHoRuU4SJHE8FAGfhaWnrle6PC8WgwsbQdRnVUlRhjwTzvn9agHZ20lEY+lBxl2UE/rPdY7/6CTtXdaTx1Ok95OTFfYE62yy7YBgVuo93SlbFIdng7QmBu9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406033; c=relaxed/simple;
	bh=QnyA2drDcaRjY2HSPxHWOm2mNvWNYANzuDvW0722WNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pwVNF8Wpa6GMhkXIpJxLeZbgg3wjSCAv7yzyaCj1djeOnOow5elauBHCyXvsW7sa6cSevENFrnieR9XDwtgsv1gatYckkDeSQ8bhMAO25OVpWTJSsMsvTXezuOfaItbEDOsJZikPIVtHYzgpiikybAKPHMdJeMk0MNw22Y9EiHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iT6qfbdx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743406032; x=1774942032;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QnyA2drDcaRjY2HSPxHWOm2mNvWNYANzuDvW0722WNQ=;
  b=iT6qfbdxFX8Q+dImCOVsr4D1bMgyChV66FGMQ+hlY5PcJ4wmZEBQI9bq
   PMO76E6zf0/7DKyQchf3drtAbdd+IdMq0oLNSdKqPMa49r/skG7mRQGsi
   QwE2hZeXtzeR/w9a8TxkqwqrNwccp+rJ4qSkPRsquZ/v1oFvIvzwHUyU2
   o1pv0lqvT3ksM4Xei0nf0qySKe8nGQmQD8Ksufduf9atTU1LOCmBdFFj7
   xJnytTaWoqYyKZQxeZSM9WE4w2oC5mWEiyFT7hTSAhIx/E94l86pwBz66
   JTtxerkPlNdwFihk0alX5sQeii59iUppMldJ6WpbYQKCLL4jmqujMyWzf
   Q==;
X-CSE-ConnectionGUID: 513c/ToKQ1SZa6fvX8hdMQ==
X-CSE-MsgGUID: lO5Gpy6aR0ijVEXTZr9vSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44859023"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44859023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:27:11 -0700
X-CSE-ConnectionGUID: d5F13biLS32CCIlvR2pPqQ==
X-CSE-MsgGUID: oWJ15AaZQoC46P2UOm+fLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="163256597"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2025 00:27:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AB2141B4; Mon, 31 Mar 2025 10:27:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: max9671x: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:27:07 +0300
Message-ID: <20250331072707.3988687-1-andriy.shevchenko@linux.intel.com>
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
 drivers/media/i2c/max96714.c | 2 +-
 drivers/media/i2c/max96717.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
index 159753b13777..3cc1b1ae47d1 100644
--- a/drivers/media/i2c/max96714.c
+++ b/drivers/media/i2c/max96714.c
@@ -7,11 +7,11 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 30c5ca0e817a..23fb7e67d1a4 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -9,10 +9,10 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c-mux.h>
 #include <linux/i2c.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <media/v4l2-cci.h>
-- 
2.47.2


