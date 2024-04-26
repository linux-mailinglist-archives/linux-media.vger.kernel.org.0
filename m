Return-Path: <linux-media+bounces-10210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF78B34BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 065FEB223BB
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AB314389A;
	Fri, 26 Apr 2024 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIZE+QgM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C82140E5B
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125547; cv=none; b=JfHzRTue7LCEgIfllWToNqpyPtJcTuyRrjVNiHcaoX3po2AR+Wg9/zfE/vWRMi23ZEDH+zn4e5PM587mydqFFMmKlRUZxqqt6bEu3nI4kUBkXfexXomTrqLBdpzyM3b8zxzcae5qQVGsLCt10R4iP5YQmEkHqV7w59q4CrcMEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125547; c=relaxed/simple;
	bh=rWqx8tQmXNVdVbo8tcm9Y0PfAXA942PAdZjrrfKvoYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2hIllnAmsIL3wvXGkPqTNCpy+m9zkGq4xxR91MVhtLDz2jIrJYLJLJ9bUpOD+81z+/bomSZ3/E9LBRyZvtTsfNd/mZIK0HzAKlEFyQRNxHQ9DPLbNZD1ONWchGasKtT1rnSLswtosxZa1U+6n1ARC3BQC0rHB5KBukWRdWk29Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIZE+QgM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125546; x=1745661546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rWqx8tQmXNVdVbo8tcm9Y0PfAXA942PAdZjrrfKvoYs=;
  b=VIZE+QgMOAU0IUi6pmbWN2fPbNbgJLoXl1HKupKjU3HohxcknRH5D9ZG
   ffMgfRU4ynvrfjkmz9K3lh1fj2p8zjT075UFS6CL3BGORTZF2jylq4tCb
   XEmKW+1ns+Zn4WqHRMM8dH1WGypoDRFl2W1JxteIMvLD2DdN0DP6CHsRN
   o/1bS/R4iG/IJ3YxRLvkZ1sZkIK25NROX3Ja2BRom3Dl9S8QmzBBRe+M+
   dryH9bCHn4h+uHHAmvyE0pYYFT7704XU0zHxgOryISitONmCif0vuQtsp
   Bk+qsCvLPig2QthivuDIk19kpWXsVl2SROC/Gl8IS47MicVLOQT7zdux+
   w==;
X-CSE-ConnectionGUID: Ccc5atpASAKKLmkuZ91SLw==
X-CSE-MsgGUID: nPc1hj4ZTjqqJ+Vo2KSNxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409455"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:59:05 -0700
X-CSE-ConnectionGUID: 4twIm8ilTaKY3K7XkHdB5w==
X-CSE-MsgGUID: d1EX/Jw2SJiNUYIV59LElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30173048"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:59:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 83C4F120358;
	Fri, 26 Apr 2024 12:58:56 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v6 15/18] media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date: Fri, 26 Apr 2024 12:58:19 +0300
Message-Id: <20240426095822.946453-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Update MAINTAINERS file for Intel IPU6 input system driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 037d065fb8bb..5a178aaf21b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11005,6 +11005,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
 F:	Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst
 F:	drivers/staging/media/ipu3/
 
+INTEL IPU6 INPUT SYSTEM DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+M:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Tianshu Qiu <tian.shu.qiu@intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/admin-guide/media/ipu6-isys.rst
+F:	drivers/media/pci/intel/ipu6/
+
 INTEL ISHTP ECLITE DRIVER
 M:	Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.39.2


