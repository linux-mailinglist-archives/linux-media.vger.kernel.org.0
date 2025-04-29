Return-Path: <linux-media+bounces-31251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB4AA008E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 05:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E011F7B0F56
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 03:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5752741D4;
	Tue, 29 Apr 2025 03:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ5+pbRC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C12741CC
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897359; cv=none; b=JNlUU8hW/3o9hSPPubZKzLftXuzsSiet6BaTZAcDuc1vDt9sxx3kbMBl3KKJ6IpsEtDZYvToc+mAZYrPFD0aygtmVjOnPJMoehK9v5wOqMDQXlM8+9LxH2F1XIAL8yOYzuDv9KKe5zppMZhIRKOIaP25vSA6S/4/ZR5O/DSK9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897359; c=relaxed/simple;
	bh=lGH27NsGG25nWzD8WvO5ZkFYArqqIIaZo/KobUiVk18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A62sLprcjdaGdcgop3BQ3SHmHkJzoLNzWVpfR9PfUG/nvYRjT5FCNzQE5rQI8TBxsFvxIvKkJfLF9nXQLXljNWZVKSF28i1PRSxEaoWUEmpWPjVNwONN6z+NzEmAruFubjl7Q0L+UWpwDDfdzuB6beOAzNH6MhovfI5XMUfAaYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ5+pbRC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745897358; x=1777433358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lGH27NsGG25nWzD8WvO5ZkFYArqqIIaZo/KobUiVk18=;
  b=iJ5+pbRCEbQx2AvrZVJ4E0EeApx8LEk9mDZjMZHe+ZsZKzVe6QrEALY1
   l/0vq5UzwOeE3wpTwC3CXUeJSPG5ZCfa9tUhpU2yQzaHODf4oUtYWtY3+
   vlJsjX4nX2j4EYzUVQpVA4WoS/3x5ZPysrJ4740r83Ac6ncANKVn2SqMc
   4anWRD0HxPnT6lbQeoNES2m3i1aKZ6Zd7fuZdrH6o0qX5xDwtbhSfsR02
   fyHx7xEcq0oabTPM7R2ct/a96CV4puTf1/AhM+h0KjoPIglcgSCsK8G0d
   Ej2wx7d1F7mPwpYWuvnKGn3f4Akx1RIfHLbAuC39RCg0+w8fTTH+lMR1p
   A==;
X-CSE-ConnectionGUID: nIOwcuAXRaifurxjLyXPwA==
X-CSE-MsgGUID: Cna94xrzRu29vz3Zeq0bgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58158646"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="58158646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:29:17 -0700
X-CSE-ConnectionGUID: K35IMQZzRHikZmHGLmQ76w==
X-CSE-MsgGUID: OZNm/60uRca/+DhOJe8wRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="138791791"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa004.fm.intel.com with ESMTP; 28 Apr 2025 20:29:14 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	phasta@mailbox.org,
	helgaas@kernel.org,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 8/8] MAINTAINERS: add maintainers for Intel IPU7 input system driver
Date: Tue, 29 Apr 2025 11:28:41 +0800
Message-Id: <20250429032841.115107-9-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429032841.115107-1-bingbu.cao@intel.com>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Update MAINTAINERS file for Intel IPU7 input system staging driver.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f31aeb6b452e..044c8e341074 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12035,6 +12035,15 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/ipu6-isys.rst
 F:	drivers/media/pci/intel/ipu6/
 
+INTEL IPU7 INPUT SYSTEM DRIVER
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bingbu Cao <bingbu.cao@intel.com>
+R:	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/staging/media/ipu7/
+
 INTEL ISHTP ECLITE DRIVER
 M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.34.1


