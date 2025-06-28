Return-Path: <linux-media+bounces-36151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E47AAEC793
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 16:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73B3716CD32
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 14:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856CE1DFE09;
	Sat, 28 Jun 2025 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoRQ6caA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D5A4A3C
	for <linux-media@vger.kernel.org>; Sat, 28 Jun 2025 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120288; cv=none; b=KRuk4dn0Ir24CjwxA0WPOZ9yXCZRzgCMePbpaV6Gvppt7uXUc4/ITjd1XwYEAsKjzgKfei74MJ8HWBkSCe6JxM6Onh6csBiGC1Hv5s6b68MQmfMpxM+ThxW3+BqHeP/aqbFX7Ik89c2r3u3UNMvAlGQaHZxwKrH0NxmyA/nKCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120288; c=relaxed/simple;
	bh=k8BvA7c9/OKdEA4cU2S8b5efXgKFF2pkcVOCYKysmxE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oGSz/4E/6mCwZLp3A1PPglNinyvj24wJXzu15T/shftokS+hGIMI3PzaW7dhnKIeKLl1k1s62qrQauv7VqRkyMM1+SE7IW53IGivhNGxcrt6ATFzeeGRkT5knesMqp8i/1ANP3nbCvwLpag2KPTUVG5Tl5zol6zcZ7LmWinHusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoRQ6caA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751120287; x=1782656287;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=k8BvA7c9/OKdEA4cU2S8b5efXgKFF2pkcVOCYKysmxE=;
  b=SoRQ6caAafl/OnN+5oiPtEub0vrjzIN2bjf+OtvpOLJJ9/oG9PPxOaNP
   6cv9tdND1jAtQkUMkHEliOzFdBxlccvD6kEzPhLQLdN5g++pqE+CLwWvq
   r3qbHnKqkHldRyupnLW0ldrmKcyAMigIBEt2KnbcI9xzsGtmKmrsAogDh
   ikmGtjCrTqx7px39NOlUiD5i7L8tWhI93LP2PhjKK4iZ47lSMg3T2lVJ9
   /zBD9yjphWkq+F6bcAA9SGdF0033gcnW1B98LFEn5K6mOTJi7A7pxtY3j
   9WT3slXBJSF9EyYBNpM0Se572+QBu5cLIEZr9ZUo/n7lrz6h1L8D5t0ks
   g==;
X-CSE-ConnectionGUID: g2zE3Oh+SUyVakYyFTFSpA==
X-CSE-MsgGUID: if7Qxqh9Q2GKvOvRUQi6uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="57090512"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="57090512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:18:07 -0700
X-CSE-ConnectionGUID: L3OqEAavTaaEukyVTXXxFw==
X-CSE-MsgGUID: Qwb9HIBLSOWsldb4aZ7VYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="157320203"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:18:05 -0700
Received: from svinhufvud.intel.com (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 915154437E;
	Sat, 28 Jun 2025 17:18:01 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: stanislaw.gruszka@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 1/1] media: staging: ipu7: Don't include linux/version.h
Date: Sat, 28 Jun 2025 17:18:01 +0300
Message-Id: <20250628141801.297498-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/version.h isn't needed by the driver, don't include it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 48e9f4aa3cc8..5decf497bb7d 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
-#include <linux/version.h>
 
 #include <media/ipu-bridge.h>
 
-- 
2.39.5


