Return-Path: <linux-media+bounces-33504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BACFAAC6363
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 09:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CF057AC979
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 07:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B4C24634F;
	Wed, 28 May 2025 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvwFNrFr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A7245000
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748418732; cv=none; b=lyZ0QYx/J/s2pcd/P1rv4yHXhQ/GiqiwN92Cg/kQAjMyAgdkMzyrW1k/Qqj/NymFvfGXCrN1EULJvjgiY/ogFvwF/VJkuWpiGrGSyZv6epFoQF1V7d6FHfhW3Us+rHyYma4FS1LV72KLC6wVyg1+xIcvEPcUN650OS52S29wKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748418732; c=relaxed/simple;
	bh=hjYE5Xcmw8oNT0kLn1u5Itu1ijfwfLVqXG1P9umy834=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sTrsLUM4ABZDDJ1DgRFC6wjd78YGe9gX262eStbMYaEhisDrHruDbb6Y3jNDzBhz2TcGxDhio9QqauCuVWt1iwY3JoCKp1Uhijr/M8MEiF9ak0CPKaXTzQwkmu3EVIBgu8PI5Dwy7EGJxCcAqv8TGY9Pq49fdKyUJf1MlmKyhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvwFNrFr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748418731; x=1779954731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hjYE5Xcmw8oNT0kLn1u5Itu1ijfwfLVqXG1P9umy834=;
  b=EvwFNrFrHd+QcyNkHQyC+y8LlNClQ5O2n+R60Ol7ef2lARtF3p8RVrx3
   25Rr8pSpAkM8LzjERMW1jixvVJcjpIsnT33bkEbY8O1RrfjK/qHuo5WmV
   cIBJOITaM0YTb/0RTuFZjTozXk/pMoCV6Sc2/XAza6ZvMNWx2uEe/0Y8n
   nDJ4Sxq8/xGvWc3M3q5hc+yLF2AVaze3b/XCCWwMOx0EYd8kMnXqBX+NJ
   JRL01jdoJCPd77AnLWtgpv9axRZ+AJoj5lAAkNpVUVTracoByVdk0nT9/
   28I0YZsnhH8BXinnbv/DcGzDm52OR1WKvnHDK2L6YKMdNum/SR/e0GpkW
   g==;
X-CSE-ConnectionGUID: dIeun/kRT/GTb8mG6SqiwQ==
X-CSE-MsgGUID: K5IQuQoCQ9OI9trl0PrmCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61092602"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61092602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 00:52:10 -0700
X-CSE-ConnectionGUID: 2WJ/dhg8SkCvb8sxYqYUDA==
X-CSE-MsgGUID: 2JfYDBjxSjyUze8bgBfD+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="144132735"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 00:52:08 -0700
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
Subject: [PATCH v2 7/8] MAINTAINERS: add maintainers for Intel IPU7 input system driver
Date: Wed, 28 May 2025 15:51:45 +0800
Message-Id: <20250528075146.1763079-8-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528075146.1763079-1-bingbu.cao@intel.com>
References: <20250528075146.1763079-1-bingbu.cao@intel.com>
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


