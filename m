Return-Path: <linux-media+bounces-35873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB7AE8508
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEAA7189A16C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F74262FCC;
	Wed, 25 Jun 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lT6+g9kp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662D1917F0
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859085; cv=none; b=cc3WmwPs19CfARnQBb875R4IHibYTkj8c4uyAinLXzh0V/1bDacYiiu+sboAaeJMLb7YVsUGqtrv2XyEOczcJKCC7ZGpwJ35LM8btXFgp7tOTvRFBHTMniYfV8qqIRvnR4v2TL/81seDIVDksR2tPIN5rMFth1RFuEuqcowbZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859085; c=relaxed/simple;
	bh=ySDQjQS7dUV/rD8YpNEBRFSsgllzffsEwuTiadz6i/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TH0+gk/fVzjauEiE8ylq40Adg4z3zNwoPcHzm+Q+pZNY8DCHKajVaNA8WjkQjcOsAx+DjKJQYmgAm8CUIpaFk2ERSjzzpjjiIXXj/17wYSyAZgQ/A9L9nFaxslYITp+e2iTE0lRioR1PusiZwBZJ7CBBfoMZkyd4XT9ha5HHLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lT6+g9kp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750859083; x=1782395083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ySDQjQS7dUV/rD8YpNEBRFSsgllzffsEwuTiadz6i/M=;
  b=lT6+g9kp8ohTJo8LOdeypbEgpimP28NcaIDqihWnzFBGsmMIPfsWGEPQ
   hKIhh5RKjcRBuGiGqY5p5rdoXbCThNimyB9/O6ur4zOB4eZwkzUnQBfPZ
   Vz7oeVZafKJYcj8BCzfwTr7o68LAl0/mPs7+3qq+dFuR+QCqfWYYrfzja
   sXA2gaUMYXkiipoVTj5WyTTA7eRak2lhMje4LOIn0Z3MPlEYm6obyoul8
   lumWtMNPJ1cZORB8g4peVSqt1pG3p8W2Uy3I6SfTjj620vpmMmjPTm59B
   jm3eIWkHfNG9tPBZtOyGK7/lPKg+5JTCz47l9d026j92QZA2wP9Viwg2A
   Q==;
X-CSE-ConnectionGUID: QA9CljgZTJ6K5sHIlEP/gg==
X-CSE-MsgGUID: SigfPFOZQwinsT05Cg55+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56810078"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56810078"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:44:42 -0700
X-CSE-ConnectionGUID: mGxwsGPKSJmljxGLM4DZ+A==
X-CSE-MsgGUID: nXYIS0qITL2OkaBgY8+bUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156791239"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:44:42 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E9B6411F9DF;
	Wed, 25 Jun 2025 16:44:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uUQQY-00BS82-2l;
	Wed, 25 Jun 2025 16:44:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	stanislaw.gruszka@intel.com
Subject: [RESEND PATCH 1/1] media: staging: ipu7: Include missing linux/export.h
Date: Wed, 25 Jun 2025 16:44:38 +0300
Message-Id: <20250625134438.2729726-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include missing linux/export.h in IPU7 buttress, DMA, MMU and base PCI
drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Fixed Stanislaw's e-mail address.

 drivers/staging/media/ipu7/ipu7-buttress.c | 1 +
 drivers/staging/media/ipu7/ipu7-dma.c      | 1 +
 drivers/staging/media/ipu7/ipu7-mmu.c      | 1 +
 drivers/staging/media/ipu7/ipu7.c          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index e5707f5e300b..37f1d659ded4 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -9,6 +9,7 @@
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
diff --git a/drivers/staging/media/ipu7/ipu7-dma.c b/drivers/staging/media/ipu7/ipu7-dma.c
index a118b41b2f34..fdd4d7f5bc35 100644
--- a/drivers/staging/media/ipu7/ipu7-dma.c
+++ b/drivers/staging/media/ipu7/ipu7-dma.c
@@ -5,6 +5,7 @@
 
 #include <linux/cacheflush.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/iova.h>
 #include <linux/list.h>
 #include <linux/mm.h>
diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
index ded1986eb8ba..7c2695bb3723 100644
--- a/drivers/staging/media/ipu7/ipu7-mmu.c
+++ b/drivers/staging/media/ipu7/ipu7-mmu.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/iopoll.h>
 #include <linux/iova.h>
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 4a70d3527cb7..48e9f4aa3cc8 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/firmware.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
-- 
2.39.5


