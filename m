Return-Path: <linux-media+bounces-16173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59F950082
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 10:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1FB282962
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 08:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6383017C228;
	Tue, 13 Aug 2024 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7Rjhw4F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AF13BC3D;
	Tue, 13 Aug 2024 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539304; cv=none; b=dP0cgKWpE2XsKAWU0o/dZqP9H9EphDQbMO6hfAhnyRVAtTtKaeytOtJSXFZKTnTr/Q1ygRH1BefcQC82jwJ+SgD6+oSaCfrceexvHmZXeDVFmTVu8LByO9GbJntKHItYsb0GJUHjzDq95p0UWO+dNIiQG1b8jz3bDcMhJuD2qX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539304; c=relaxed/simple;
	bh=PyreV8fLWUUNEQCIaxKm32e1Dw+o+LsASrS5IIun0hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtWAHG7Y/yaaPy45HbBhO+LB9ylpHFH6lClpnZQnPuia/4n+XNXqx6SECXYEdJcf5Q3yBEbLwEZK3VGvOzKrqiN2kQWDCPQWlzccHKsQ/IlgVDz91EQ7uiKwZtfuY6hGkdIqlwb/837gD5g7TWEDojwV+1wIAJKttrIKQgi6AGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7Rjhw4F; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723539303; x=1755075303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PyreV8fLWUUNEQCIaxKm32e1Dw+o+LsASrS5IIun0hs=;
  b=O7Rjhw4FyIEMSJK7XNRi8wppiqzfs6ZEPm15TdIghhVruL+Abd5i3y0x
   Z6cTlB7uzTGdGa/QUXvJYuYZ+tJBJADz0/3zP8ef1qvz+Cn0khcM1T2U+
   VtB0I9j/o6z5d06IDnonx10xwhWkVHzDweAMIRLTkFHfX55521SMdQ/CW
   EDQ9DzzHGnjlwGvVZw79ILG05d6AE3ViP3Dae/u6mY2zuAWeepkSnXt+U
   qaQidj9MoZvB4jdkFzHFhyMqoKVzbHG8hqo265XmNQqZgPCQMczciNjQD
   HxfWLX+aa/8lluxGuYHBmFz5cHogcCNIRqFb4MSlz++P2BNMcJkoJENhK
   g==;
X-CSE-ConnectionGUID: YvDbc3AoSZ2hgosySoRBRw==
X-CSE-MsgGUID: Yajp2WE5RT+1ngwdtmtOBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="33090674"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="33090674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 01:55:02 -0700
X-CSE-ConnectionGUID: 9Q/Q2MKlQ/OFFhUSRbZI1Q==
X-CSE-MsgGUID: qRGlDdFSS1amXrO/0OvAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58670850"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2024 01:55:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A1F3C3B5; Tue, 13 Aug 2024 11:54:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 1/1] media: atomisp: Remove duplicated leftover, i.e. sh_css_dvs_info.h
Date: Tue, 13 Aug 2024 11:54:58 +0300
Message-ID: <20240813085458.1545949-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The contents of sh_css_dvs_info.h are already included in the solely user
of this header, drop the former for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../media/atomisp/pci/sh_css_dvs_info.h       | 37 -------------------
 .../media/atomisp/pci/sh_css_param_dvs.h      |  1 -
 2 files changed, 38 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/sh_css_dvs_info.h

diff --git a/drivers/staging/media/atomisp/pci/sh_css_dvs_info.h b/drivers/staging/media/atomisp/pci/sh_css_dvs_info.h
deleted file mode 100644
index 6f058f132300..000000000000
--- a/drivers/staging/media/atomisp/pci/sh_css_dvs_info.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-This program is free software; you can redistribute it and/or modify it
-under the terms and conditions of the GNU General Public License,
-version 2, as published by the Free Software Foundation.
-
-This program is distributed in the hope it will be useful, but WITHOUT
-ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-more details.
-*/
-
-#ifndef __SH_CSS_DVS_INFO_H__
-#define __SH_CSS_DVS_INFO_H__
-
-#include <math_support.h>
-
-/* horizontal 64x64 blocks round up to DVS_BLOCKDIM_X, make even */
-#define DVS_NUM_BLOCKS_X(X)		(CEIL_MUL(CEIL_DIV((X), DVS_BLOCKDIM_X), 2))
-
-/* vertical   64x64 blocks round up to DVS_BLOCKDIM_Y */
-#define DVS_NUM_BLOCKS_Y(X)		(CEIL_DIV((X), DVS_BLOCKDIM_Y_LUMA))
-
-/* Bilinear interpolation (HRT_GDC_BLI_MODE) is the supported method currently.
- * Bicubic interpolation (HRT_GDC_BCI_MODE) is not supported yet */
-#define DVS_GDC_INTERP_METHOD HRT_GDC_BLI_MODE
-
-#define DVS_INPUT_BYTES_PER_PIXEL (1)
-
-#define DVS_NUM_BLOCKS_X_CHROMA(X)	(CEIL_DIV((X), DVS_BLOCKDIM_X))
-
-#define DVS_NUM_BLOCKS_Y_CHROMA(X)	(CEIL_DIV((X), DVS_BLOCKDIM_Y_CHROMA))
-
-#endif /* __SH_CSS_DVS_INFO_H__ */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
index 7782f76b9f97..25e5b4570f7d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.h
@@ -18,7 +18,6 @@
 
 #include <math_support.h>
 #include <ia_css_types.h>
-#include <sh_css_dvs_info.h>
 #include "gdc_global.h" /* gdc_warp_param_mem_t */
 
 #define DVS_ENV_MIN_X (12)
-- 
2.43.0.rc1.1336.g36b5255a03ac


