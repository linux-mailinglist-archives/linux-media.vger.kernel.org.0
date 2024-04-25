Return-Path: <linux-media+bounces-10140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAA8B2B44
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CEB5B25D87
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5543155734;
	Thu, 25 Apr 2024 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkqhVi0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF774155A24
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081702; cv=none; b=jYQn1haCyG9Op+n8QF9nVgHC9g3L41bIreB8g1JIllCOYUrbm1ielXcPSuM55odJldMAqs/PeWz4otlFUcs2QSOOF+0HGul2nvXEEHLtzxryuLao7wEDlxpvRxb9B6IqWlW5Uua6upUUZknyus6svJAFjWwBMIVbLwIOBvPMHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081702; c=relaxed/simple;
	bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uz5zsYXGz3zYaW4RgdFwvoPa8nos0oICH3CSXhBiY2BoOxTHBeLaAo0lGwDQ8Ny4Fn/bjqVNh37u3WnUKe11kaAR1yWzrYDZd5O1pMynwcvPa7NzQndGEuTWPOBtvKW1CZDEl3KC97/no6maoFTovRJYICKA93ywlm0ytihTG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkqhVi0G; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714081701; x=1745617701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
  b=OkqhVi0GKVCqaVaNCsfrIHOqXx0VOS8C7AGvSpV1LIA9T7ADX6POLVgd
   KVIWNPPJS0OMDf9G+qcAJQWyMGnEP7KQsGEqnpW2UlU+SRlRILPKMynYK
   wDRG47po/3cYF2L9IBQAWTMBsZKHrriBoE0Ieq6goZYHG56lRy1aO29as
   nSH1/3MJ/QBhBxu8y8FPY1I+pFckcrfBV7wdW6dd4Z9bs/oGiehHNm5wA
   A3MIVQfhBU8ba9XmA9yH+Vu7N4h041UcIc9/COh532wNTV3Owa+FdGvzD
   fHhG5nsxVJsY2socJIiNMH8qA7XX7NzWht1+8LDEBdmk4irR/bIGW6NUu
   w==;
X-CSE-ConnectionGUID: cG40r4hUQgWLipxKPcyDew==
X-CSE-MsgGUID: 4qhAgHMLTiSlsn/cq2ZoMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9655152"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="9655152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:20 -0700
X-CSE-ConnectionGUID: BOGL01xTRnymgrzYFyfxkg==
X-CSE-MsgGUID: DTmpHHqwRiWrIAFAu+rjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25181796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:48:17 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9FAB212027E;
	Fri, 26 Apr 2024 00:48:12 +0300 (EEST)
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
Subject: [PATCH v5 01/18] media: ipu6: Add PCI device table header
Date: Fri, 26 Apr 2024 00:47:52 +0300
Message-Id: <20240425214809.930227-2-sakari.ailus@linux.intel.com>
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

Add a header for the PCI device table of all IPU6 devices. This will be
used by the IPU bridge as well so place the table in a header.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/ipu6-pci-table.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/media/ipu6-pci-table.h

diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.h
new file mode 100644
index 000000000000..0899d9d2f978
--- /dev/null
+++ b/include/media/ipu6-pci-table.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Intel Corporation
+ */
+
+#ifndef __IPU6_PCI_TBL_H__
+#define __IPU6_PCI_TBL_H__
+
+#include <linux/pci.h>
+
+#define PCI_DEVICE_ID_INTEL_IPU6		0x9a19
+#define PCI_DEVICE_ID_INTEL_IPU6SE		0x4e19
+#define PCI_DEVICE_ID_INTEL_IPU6EP_ADLP		0x465d
+#define PCI_DEVICE_ID_INTEL_IPU6EP_ADLN		0x462e
+#define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
+#define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
+
+static const struct pci_device_id ipu6_pci_tbl[] = {
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLN) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_RPLP) },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
+	{ }
+};
+
+#endif /* __IPU6_PCI_TBL_H__ */
-- 
2.39.2


