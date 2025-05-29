Return-Path: <linux-media+bounces-33569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7E7AC7709
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 06:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD804E4D42
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 04:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D4824E019;
	Thu, 29 May 2025 04:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrdUiQqo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654824C07F
	for <linux-media@vger.kernel.org>; Thu, 29 May 2025 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492028; cv=none; b=HyV6MN3kdJEAgiVRDTvx1cD/oNHTP/bEpb9Q+JZrCF8q/YKVsDPCKDj6cnBnJDqt0mLSsbBn3/ecNJmqNwh+W2OEpxOTQHMjTZFjOKEDp4UYJWC4+VlWHtQ0xZus+R0GxdKE2rkKru9JgNYURAI6s5QT2sOe4Ip0SifYuxU8ESo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492028; c=relaxed/simple;
	bh=hjYE5Xcmw8oNT0kLn1u5Itu1ijfwfLVqXG1P9umy834=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MCOW7+KY7c0vlebxVtQH5N7mLXwjT29QTo6FZU7pfdAE77EfFvgS9ejPcGYM96M69oeUB+BPi+XF3gpCbbKcxP1sg17/CH/UeYqwf5JqwlXwKO02gn7Qv+ijNOmdK6sj4UqoNaLkwKwrYN67HgN8oRtIbQp8cIcaZvYnNUXotJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrdUiQqo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748492028; x=1780028028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hjYE5Xcmw8oNT0kLn1u5Itu1ijfwfLVqXG1P9umy834=;
  b=DrdUiQqo8fv4CSWJCUcJRNlcauTznY3a7JSJTEWnWb904oNXYmN3Qh2P
   4Zg5fuL6jauZxoHSSDgzJnUq/KJWoKaDy6uWVxLGzfWBPAYT1/A2E/mqF
   NX5bdH/sEAqF61d0eZB02WGAeXe2O0RGcSV3LKiiVVWv207ETjs1E3e4U
   aDp3ixQKJd5Kj+NYPwqfyM2mAQlEm8Hp1oQi1xzb1BoBkw7gXuSzfAKtl
   Gv+vovj591vztejDRDQ22q1t7Gi5K1xG4g+gImsVydZIeCylc7ncdYjJF
   GacEOt+2Aej8aJoYCLXVBSkxhQyxsP36oCEHXEmh5Q55sJYF4ZvKImHlZ
   Q==;
X-CSE-ConnectionGUID: ZQx19xKrSniyMnnZAloFww==
X-CSE-MsgGUID: axWC5wSyRo6okhi+MifzfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="75928587"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="75928587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 21:13:47 -0700
X-CSE-ConnectionGUID: F55e77RJTFOo7k6/VhLRWA==
X-CSE-MsgGUID: itaeWcVTTF6iDP3aTeLjEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148211584"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2025 21:13:44 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	jerry.w.hu@intel.com,
	hao.yao@intel.com,
	tian.shu.qiu@intel.com,
	bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v3 6/7] MAINTAINERS: add maintainers for Intel IPU7 input system driver
Date: Thu, 29 May 2025 12:13:22 +0800
Message-Id: <20250529041323.3026998-7-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529041323.3026998-1-bingbu.cao@intel.com>
References: <20250529041323.3026998-1-bingbu.cao@intel.com>
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
index d48dd6726fe6..cf71cd9dd9a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12050,6 +12050,15 @@ T:	git git://linuxtv.org/media.git
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


