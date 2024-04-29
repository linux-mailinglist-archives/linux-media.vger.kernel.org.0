Return-Path: <linux-media+bounces-10291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABD8B512E
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2289281BFB
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D8A10A17;
	Mon, 29 Apr 2024 06:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zqj3pVp8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82034F9DF
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371545; cv=none; b=cDj0yzm6gdGJYGIEq7nd/QQPNKKo1QgoKI0eBIg/3qXkNpCqP7IR+U1m/9kyHk/SBWd7DMRABQkFHDsCZZm/zaH9uOqQrGQLJBN+phrQmXRkUCFpjvytK7SUNbSy2yke6ZQn2YmIwH5DiGOUQr0xTstpmSQ4ok9ac3nvero3iuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371545; c=relaxed/simple;
	bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LoImWVJeoPXl+6IybS85VZ/3XR9SjQ+sOQYux3yiXfxOafjps3a5CE6DGYJdXgY0zJGLzRxAKC3ttg6GAxnBnpmko/I677ytBGgckNmfLpemP5T4cVjz8BUgF5s7g/jhj0oKhTEzqak492wCgJj1nJIM2Qb5NIKiVxSGroXld20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zqj3pVp8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371544; x=1745907544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ1EAm1meVbOpRXaoglFIrtq/kEXEUztkHDfm/aRVS4=;
  b=Zqj3pVp8bwKkAludoitieL+TOkH34jI5ffwpPGyxmRlCyKQwFJtLhPRu
   OcYUi6PXa3mQFX4PBIdOz3fsLPB0SbMvvxDyuOMZ7W7dFM5wufFCYlCE5
   xaHPwLuX9TTUy/bVWLNRCb7Mu9FxcF04Q4jnxyc+PNrZCeAknOf7BTuaf
   3Chbqkd6r+L6cpYZC/LPcJ+BV9QOkFv9CKjdnGNE+3fgoJ9Fk9MHfkOFp
   EkQ8CLhJxbP1YRI4QrBq/8h+Vuel/YnEw23tFRRjUiTCv8ptmuzHe969r
   Ec3QZue1CS9UVaSr2npXxCGErsjwqnkM3yMgq13/65R8GWnFcvMjpwlCz
   w==;
X-CSE-ConnectionGUID: KUEE9GBXQHmEimcPVRFgwA==
X-CSE-MsgGUID: jRSX4VsiRoiBTXcqbFHA1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10187324"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="10187324"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:03 -0700
X-CSE-ConnectionGUID: cC8SQKfOSQWYYX8CeNl9LQ==
X-CSE-MsgGUID: xcto3EK0SSmUlnHznNk9kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26527269"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:18:59 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B5B4211FC19;
	Mon, 29 Apr 2024 09:18:55 +0300 (EEST)
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
Subject: [PATCH v7 01/18] media: ipu6: Add PCI device table header
Date: Mon, 29 Apr 2024 09:18:36 +0300
Message-Id: <20240429061853.983538-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
References: <20240429061853.983538-1-sakari.ailus@linux.intel.com>
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


