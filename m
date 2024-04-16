Return-Path: <linux-media+bounces-9600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC88A753B
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE3E1F22F0C
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB70139D0C;
	Tue, 16 Apr 2024 20:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhNOj2vV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B09C139CE3
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298279; cv=none; b=IkitAycpaAdkpQ90Js4lQIZX7iV0aMY4Z3Dszi/XWGKSAjogaeVWNWrcU68fy2iAkCw80PcxcH7mURR4sMZjnTGc3tsr4CISMoQkW/22lxhWNW/Gps+dzHOFBhD02OV2X/YWXRb6u3GzUHpyc0T28p2dIXMlFIzA/ixg9kcwEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298279; c=relaxed/simple;
	bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jmhxX1tpF5ZrbyNZoPD+cc4HAdwKAbm+UJUm4vyxLyqP4sF/sC8wUpJ5tYxM/3biCMhyRXoVyYWUQU75b68OaTgL6s1tBce2y4kjNGutDJwWf7nnM52al6oLpFNPCdcPPscrTsOa2wLiqhEE9llPcKeSoQDjUJ4bhzv2ZFlYxNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhNOj2vV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298279; x=1744834279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
  b=LhNOj2vVVQDQlZyN87CObfUmhPfSbG1pm2PkMPCNXPcZY4czLQB+gNlf
   2vcUH6x/ED0flPR085WawQpvj87BMpy4sBsQBMG/Pu/Py1BFwF9iOFHKz
   /DXQAgh0hB8/8l850yKX56hu47aQjr65qiM0T3s60tANy3O2vHNj2U2SA
   xSlPc8lCR7IRlla66Q8rNllMM/4HWaElL2w0Epe1DAKOkt7YvOSMZ6RLe
   L6ZK2lg+tkSl1gO0G8p3tph4014sWZZOYEXpWs8cPrdyXAK8+DfA75bY7
   5PzJRkEWZvfDccF9vwHl/Hyn6OCO1FoW/RBW8NDFfd07Hs04vx/a6Y3xx
   Q==;
X-CSE-ConnectionGUID: eCIUTSIOSxeJhVcY885QPw==
X-CSE-MsgGUID: W0FEl2JxSuu27XdbDkcatw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8626627"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8626627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:17 -0700
X-CSE-ConnectionGUID: phLmQ8jHT5S55zyCOSAmSQ==
X-CSE-MsgGUID: 7NTt1c+tTaarPCT3C90UYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="27172256"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2E39F1204F6;
	Tue, 16 Apr 2024 23:11:09 +0300 (EEST)
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
Subject: [PATCH v4 01/19] media: ipu6: Add PCI device table header
Date: Tue, 16 Apr 2024 23:10:47 +0300
Message-Id: <20240416201105.781496-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
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


