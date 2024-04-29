Return-Path: <linux-media+bounces-10305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B68B513C
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 08:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682631F2222B
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 06:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD68125AE;
	Mon, 29 Apr 2024 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBklpLWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCDE13AEE
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714371574; cv=none; b=acgDrD+/mR90gL6k2PooggItHG+gHUf+rgu0Ysej2AjzWS86PouRNuhF/F5cQTtnYPqPVeU2ORZW4FqeoFWks0cp5kSz9cIwXTV0QP5+XGAVAU75rAilsNq1kcacdgrtueTgdr+FxWY61GcUALLAFTOC8iA5ceI3gS3XFdregbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714371574; c=relaxed/simple;
	bh=rWqx8tQmXNVdVbo8tcm9Y0PfAXA942PAdZjrrfKvoYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IijvR4h77WVQXvkl67p9XeEEeE9X52S5zLApagctg5uDyd8q7npNOtBLALCmgk9k99MUSCIHXkXxm4kXo957RdwN8NBZ+H+HhPexaqdbawMF1vBGD6+h1rBC8ZTAUAEAFFZr5z69c+eSkh5xUc4rws8u8O5WolC12uVTUE2MNdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBklpLWO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714371573; x=1745907573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rWqx8tQmXNVdVbo8tcm9Y0PfAXA942PAdZjrrfKvoYs=;
  b=bBklpLWOPbeF6/fn5sTt0BmRz+TQtUL5LY8ZFG/jcuwGG5j/p/wIHRgl
   EXF29ZepTvP89J+hdrQu+u0CPtULYy/YHcLSPxDBJaKVUbX7lXhRoCbep
   kD1TvGtBXzu+fQp9W/59dP9cQ+oUfiTzVLoHW9JQDYGfUtCWUZf57pqnw
   FzI6tSForBxU1y8kRFg9YlajEWIsq1DtYX0VPkiZjw/1ObyjzMNmcPOAk
   b96zGsV1tcxES9xgMNoKVVHVMCk8Jo7NmjtNHspSuksq3PfWJ88bQdHw4
   7rj+0wIbT7poFpGxR7VWsof0GQL2m0mNaet9gvAC2Sx4diyr3fOEXZVro
   Q==;
X-CSE-ConnectionGUID: 6JAKMyKNQIqlzkPkX7smqA==
X-CSE-MsgGUID: xNz4WMWMSGmkj66YowhQhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13795575"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="13795575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:33 -0700
X-CSE-ConnectionGUID: T9l1lnGWRgyWM88DNFMRXA==
X-CSE-MsgGUID: LYBCqEa1T22xYIfgo3Hxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26642911"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:19:29 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A918B1205CF;
	Mon, 29 Apr 2024 09:19:25 +0300 (EEST)
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
Subject: [PATCH v7 15/18] media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
Date: Mon, 29 Apr 2024 09:18:50 +0300
Message-Id: <20240429061853.983538-16-sakari.ailus@linux.intel.com>
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


