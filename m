Return-Path: <linux-media+bounces-6966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792D987A389
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 345872820B8
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603F4225A9;
	Wed, 13 Mar 2024 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+AOQvOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74092225A2
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314769; cv=none; b=AOmvrjpPlhDHBm4jOjtQkUsgzVMN7W3bDDMrtlG+oyqv1X6J1h0oBkbCCpyqJEmjfVyXSEKIez7KivW8AM20HrrkuxjUuVfLyPAix3JKoUcdZv8wC2K/NwIl3hrEBNgSe0nTZRHQCVHIeeT3kcSCHjhSteVFdwFViQJ7ByuM25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314769; c=relaxed/simple;
	bh=q4xa07Cjh2CpHDT8rlKUu/LqACxzzOlduWuEi+utzyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZVnS/kIn/FG9pkYrHfdzq8+q9mWB6yjGbx51FfdabofYh90S3yvN8Gf50f4V06W2bgci6n1LiblHQTAMksl5ZCqi1J+cXTYvNVWXw1IPt+9KaZcbiL34JZnb/3KFW0X2rhx3jIQmMz9VVe0cI6VwArQIiA+qblPUSCWi0lxBVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+AOQvOF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314768; x=1741850768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q4xa07Cjh2CpHDT8rlKUu/LqACxzzOlduWuEi+utzyU=;
  b=Z+AOQvOF7PfltbC4HbhCGbMV+BL6XLE1xL2LWZeKmj1s/tDDOeCJPXKe
   tWro0DzAxLPiO3ZvkA+emjaWqMDKB0tAw74qrijnkOMR6t+qInPlzQh4H
   awe9uGT7wHxtZ1iBhqm90x3Y973PIy6xj9xoQMsneAKjNFuNJ9S23Akxf
   3nhyOzspxBRnqegtbVHjhzABpX/14p7Ul9D4w5KUe7Ju0UOfiOxGC/gvn
   THuKaLZh1Wqow5AEJTqbrw8mX94XfZKO9cmixtE3tctyCAVaEutK0h2+T
   dIEmrnYnxa7xAFQuP3/bueQc3v7Gf5svJEgnM5DQIpaGSMioO7Zz/cLuW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909305"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909305"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542344"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:05 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9A4291203B3;
	Wed, 13 Mar 2024 09:26:01 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v8 30/38] media: Documentation: ccs: Document routing
Date: Wed, 13 Mar 2024 09:25:08 +0200
Message-Id: <20240313072516.241106-31-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 34 ++++++++++++++++++-
 .../media/v4l/subdev-formats.rst              |  2 ++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..bc2804ec663b 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,36 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (internal pad
+1/stream 0 -> pad 0/stream 0) and the second one is for embedded data (internal
+pad 2/stream 0 -> pad 0/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The media bus code
+used for this format is :ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED
+<MEDIA-BUS-FMT-CCS-EMBEDDED>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :ref:`Data units
+<media-glossary-data-unit>` for that particular bit depth. This is indicated by
+the generic metadata format on the sensor's source sub-device's source pad.
+
+Embedded data for bit depths greater than or equal to 16 may support more dense
+packing or legacy single metadata byte per data unit, or both of these,
+depending on the device. The supported embedded data formats can be enumerated
+and configured on stream 1 of the source pad (1) of the CCS source sub-device.
+
+**Copyright** |copy| 2020, 2023 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c8f982411e70..ca4da6a400ff 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8592,3 +8592,5 @@ levels above.
 This mbus code are only used for "2-byte simplified tagged data format" (code
 0xa) but their use may be extended further in the future, to cover other CCS
 embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.39.2


