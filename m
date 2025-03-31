Return-Path: <linux-media+bounces-29023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01490A75FF9
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 09:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34B591889F9C
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 07:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796DC1B87F3;
	Mon, 31 Mar 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f15M2dop"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE402033A;
	Mon, 31 Mar 2025 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405913; cv=none; b=Aw5DE8mNQePiHxtBG0icF2lBy83+wNPRqZ7tnajtnhyD72IWg/exFVzg9BjCUuLlNlC6+AN5PrPWs0Q+W4ChIUCl7SyCXiv9X3nGmhXqZBPwvOZ4wlDngSDgENblcJHsjM4eSxolqw1R8uOkkwMe4HWdCOnIRCiflSywLRLDnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405913; c=relaxed/simple;
	bh=muNuso4Wf35gpt0l+340WJIYLyMZwNhm/rCuB8/Uw9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXDwAtwNjV4CdHqHm+1nFzouOrU2KWGlLFF5wWucIHA8rdXS7ronnjRbwVnDP82iKlm6vnSAVWofNhPY3bBMlq09GvqWahNgj0EnqzndsB+rAZkJQKAclVYhq+Z82yQsHwJM6nsqCjBcabhpcGUYEHBFLH51MTGgrL9l29WGgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f15M2dop; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405913; x=1774941913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=muNuso4Wf35gpt0l+340WJIYLyMZwNhm/rCuB8/Uw9s=;
  b=f15M2dop+SpA7IFMUxowGdUy2klw7+vUale7ZXOFNgOLuPcQkxR+LyCk
   410AWL3xycUINZC8MiyuGfEtPkffiblcnjMhPjRWYdzCCMwkY1AH/AAzC
   zznpOvwQbWO/gzU9E0gPz2zURQFLBhPt6Loq19DIX9+ml59YLuSnoZkxr
   U9woWr/2RmqAqSR56bpWZ/WEgAzICPjtEb2awevNr8AkVf65+SFO46eMP
   vJ3N1fybQpE8QoLo2kK8arEkaye2Qwd9IMX7T9ccuobaG2aPF60+QUG37
   ZXT57Jfz4KhU1dsaNLog9xh4bdWY1cKs/cWrPi0O5t6K+2gNIA2VYg/hu
   A==;
X-CSE-ConnectionGUID: 2uNYjKCoT1OClUj3El/giw==
X-CSE-MsgGUID: //XDTZnsRDGVXw5dnK3AYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="44396183"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="44396183"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:25:12 -0700
X-CSE-ConnectionGUID: G7M4US/FSr+p2H2JK9nYhg==
X-CSE-MsgGUID: 9f3aR/C8QUmF4VCMkprN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125906275"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 31 Mar 2025 00:25:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4A3CC1B4; Mon, 31 Mar 2025 10:25:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: i2c: ds90ub9x3: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:25:07 +0300
Message-ID: <20250331072507.3988372-1-andriy.shevchenko@linux.intel.com>
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
 drivers/media/i2c/ds90ub913.c | 1 -
 drivers/media/i2c/ds90ub953.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 834df8d508e6..352b3d26f376 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 1cd5ac7157e4..dc50517fd228 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -11,7 +11,6 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c-atr.h>
 #include <linux/i2c.h>
-- 
2.47.2


