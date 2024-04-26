Return-Path: <linux-media+bounces-10194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E598B34AA
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF0F1F21C5D
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A65140E30;
	Fri, 26 Apr 2024 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhI3LWpW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D3140388
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125515; cv=none; b=kgSIl9WUfRwb2HHRHhYfE1xBTZvwWsRQywnRpjKzWFzEXGjmwIxJyOYIODWlKsxndcZFzifJbMWsXOam8ILMQeXoOl03TE1CC2hoOjN+J0/T6LfOOXRQWY65gHEtBRRlaJhNH2Yru4r8NH8TvjGIEZKgKNoOI7Vr3mqB13BBYl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125515; c=relaxed/simple;
	bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XwkCWemyl3hqUKKReJqA725zdB7dP1ZVAW7FIHrhuEQzw056RkO9vnHchkFXSkmKXZLnYE5NBVp5rJ7M5uLmCvrCMoGk7WlTrY2dAWzbhrGqt/o1QWhmoYxqb1zsOrT74FOU2Mkvs8ONSwjiWvrGzT5QYK34VsU3bovMF5OG/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhI3LWpW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125514; x=1745661514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
  b=YhI3LWpWnFBtjGzQZ/pVdQxNtaRC7OoNLl9MzPZq8AHphf09iqsL9/JS
   bHH1MYBdsb7F3dvWUUX1WZ2lKqTuuNfj9nkbnmFL26qbfYvUOc80WWAHN
   EuisxsHZlxmjn8M1YvKVeNxuSJEr6qu7lQh0V0E+tdIfNTsmshVKsHQj/
   WJGEjbRs4Ta/7qyWi51zAH8nsEqRM2eISBUAVjrPAcKU+xr8OwJwJsYaz
   vywaKGuyjephRxoMhwkT9z6CQbKmRP4TQzYQ3WVydkA4qkWZq7K/Dqegj
   NcJWO3HGRnm5Wm8PP9XSUDOUo5XgmmxzHO+VOjtyNly4GyPZwIqBtlU3o
   w==;
X-CSE-ConnectionGUID: QE+e8866QZK8kUhLE5dTfw==
X-CSE-MsgGUID: PRNVTMftSlSCwioKLW/vXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9722793"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9722793"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:33 -0700
X-CSE-ConnectionGUID: ino1gr0NRxiyZfmci7HrjQ==
X-CSE-MsgGUID: hA8J5qK/S4Ow98iiZQ+76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="56303338"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:58:30 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8666F11FA8A;
	Fri, 26 Apr 2024 12:58:25 +0300 (EEST)
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
Subject: [PATCH v6 01/18] media: ipu6: Add PCI device table header
Date: Fri, 26 Apr 2024 12:58:05 +0300
Message-Id: <20240426095822.946453-2-sakari.ailus@linux.intel.com>
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


