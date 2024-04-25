Return-Path: <linux-media+bounces-10153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B48B2B52
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 249991F249C4
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0680155A2B;
	Thu, 25 Apr 2024 21:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n51w6ppi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011C155A5D
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081744; cv=none; b=iZ+AXn9EdPBs+I95a5ar71DTF8bVwUDjvlJ4IYfe4PAtS+Lrn4NgYqzxowzDktIHAaLdBcZMC1sVBK4xgd7tNI41Qud56rejRt5h6ZvzAFP2c/cDnXdfoQb3H9AS1WekklkkgJMsKfH0oxiuBlu5Nue2va30QsqV80IYdMmupfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081744; c=relaxed/simple;
	bh=Af6E/IZaN14wGRF8Njmnqqpc45WAScqEfj6XoD9e8m0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mapuoh8JHK5fBz+FparyZXGsZzDFyeTJmL3okIiL00mNVr5x9ClgtFI4rBsrMtvGqTGjmn++CcuiReyeYz1O+25Hsc62UpI/F1sO47Xxj4JS3hCdGo3MN6MR6WQ59wJHMbudtRtzEZlRdosDym9aEpmzZXY95VkLKmXJDgCLTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n51w6ppi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714081743; x=1745617743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Af6E/IZaN14wGRF8Njmnqqpc45WAScqEfj6XoD9e8m0=;
  b=n51w6ppiaZw7jVhK7SqmZ/QTRdlM/07ENLN9X/6d5Y1gD2wULTahZ/IA
   /rfjQBbdiQUe4zBZPlWsBuANtpcTQyW5l671ywgy5Vw9wWbZonGsTa33e
   eQZI10LHoD2zDnoMMJTq/zxfV3Vi/xFJNkHU7Bi3uil0x9mAjd8M8EavM
   nHQPdBlLiQSFGzKBEF5KxPqOeNV1B1v9xAND1GURs3yiLN/aF9dt66/eR
   i6ShVsAbb+ZJpikAYUAXueQhsfGCzLC31xSlHf6LvLqSuLx+tBsx7gplQ
   NzNnAXUg1rBw4zzT1N1aqpXwBrVrCbxRc+DgPT8t1o7taEEbOeX/wM/k8
   Q==;
X-CSE-ConnectionGUID: 1wXBDY9pT7mQcH/IYkuyZg==
X-CSE-MsgGUID: JdCFcIoiQSmikCYt4YXR/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10335977"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10335977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:58 -0700
X-CSE-ConnectionGUID: ucflir2kR+KCLRJ8m7w6lw==
X-CSE-MsgGUID: sdgFVlXATe+f/ZkgYlRWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25712205"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:55 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6FEE311FC19;
	Fri, 26 Apr 2024 00:48:50 +0300 (EEST)
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
Subject: [PATCH v5 15/18] media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date: Fri, 26 Apr 2024 00:48:06 +0300
Message-Id: <20240425214809.930227-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
References: <20240425214809.930227-1-sakari.ailus@linux.intel.com>
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
index 7c121493f43d..f9f6cde4b9f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10998,6 +10998,16 @@ F:	Documentation/admin-guide/media/ipu3_rcb.svg
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


