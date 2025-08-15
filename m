Return-Path: <linux-media+bounces-39976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17038B27D13
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26341B07A83
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 09:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196922620F5;
	Fri, 15 Aug 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBdYto+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B625EF9C
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755249644; cv=none; b=Cpplc5HfzHy7bHqQtktey5M7J5xt7vsiMxIQF9yTswteS8vtXnhd+BB+UawJdavUfQUOeOv6cxO3lnvhXevdT0bM6OxGj32aPSkBvjSLot2icdcDo0FvrcxC475h+yEUV6OHwj4AjhFiKw46vLw/RvSGBYtx5Yp4rHvBoFb8B+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755249644; c=relaxed/simple;
	bh=4OLBhJartnQh2gizBt/Wu4JZkHIlhVCC+MNAyHOn/AY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P/XiNV7VbPlzUh3ne7CzaQ5i20pV/tL3iTyOFTHoNZkP8JF4ltEOuxfE6bIfI+lX06tFlcAJQV+v/0khDPaOiKM1vcWx5WIsywmTPBc/MmFmmC1dsYw1Tfma/zP4/UBWYJEdO4c+FJ0YtnhdXz8X4bi4KMZGqvUkr2UVgavg4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBdYto+3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755249643; x=1786785643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4OLBhJartnQh2gizBt/Wu4JZkHIlhVCC+MNAyHOn/AY=;
  b=JBdYto+3cGn1kNu/BP2Nv/v/L1o6/2lMlPWYOdlXaby+48g1IkO8hNtu
   G+ph2a1ar+LHiCQ/MUdyQEUrVDVS4JUgx3x8SISiWx/jdVO3xxGenQtxk
   QF6RW4wvciiZSMADGP3t5El5SJnnrqP3LFMbx6Afffyfung+iz02vSYSS
   9dA4EGNukpXFObcyqSIezrzFN8ZEYa6kHdY7z1t0VktMo6jSWGtKCSImq
   UGjH2zicmPrGEGBx6czKG6ZdEIKZJ1C1le10+HnlFHOrLOMsDjRn9i8CZ
   YyZ8grwZoSa4eDaTFuGIfmjilIzEhJ+/mrw3ikIOdq1S1WAiO4sBM9d0R
   g==;
X-CSE-ConnectionGUID: hrZ64jVuTICwR1eFqzBgdQ==
X-CSE-MsgGUID: LD25SvZeSJy7Wnc1GEOkAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61378981"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61378981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 02:20:42 -0700
X-CSE-ConnectionGUID: w6gpKsjXTSe75Sfuly4Ceg==
X-CSE-MsgGUID: TsB759V8Qe2u5Um/lS2OoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="171222561"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 15 Aug 2025 02:20:41 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	hans@jjverkuil.nl,
	jacopo.mondi@ideasonboard.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 2/3] media: staging/ipu7: Don't set name for IPU7 PCI device
Date: Fri, 15 Aug 2025 17:20:36 +0800
Message-Id: <20250815092037.1825769-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815092037.1825769-1-bingbu.cao@intel.com>
References: <20250815092037.1825769-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Driver better not dev_set_name() to change the PCI device
name, so remove it.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/ipu7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index a8e8b0e23198..aef931d23510 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2428,7 +2428,6 @@ static int ipu7_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!isp)
 		return -ENOMEM;
 
-	dev_set_name(dev, "intel-ipu7");
 	isp->pdev = pdev;
 	INIT_LIST_HEAD(&isp->devices);
 
-- 
2.34.1


