Return-Path: <linux-media+bounces-6960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291587A383
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAB412834D8
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D2D21370;
	Wed, 13 Mar 2024 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBP3Aeu+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB5200CD
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314763; cv=none; b=K4WCH2b9vxQE+o/LpbkvctHKevJtvGCNi0/es8qBe72kdVugR/1qJUQ6NFzihCeibmZpq1spsaJcfX4oOOm2wfqIsRw7VquEQOLvByedkVjJ0EzbwShjZZv0bq+NDWWvk+d6HCCT/7+2OanVqku7g82WH86KJBtHUYU/uk6JxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314763; c=relaxed/simple;
	bh=QApGfBNqivWY9pTmvw98NRk3haDWO68NeCx7t79Ongs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AS/BMj2y8BG/sMxCz9yryVYlQhRdsM6gXaGSFlBgVh1xDJFSK52CdZyjFBUOcHrO4zdcvcmT/mPDfypzcbQFYmRNQGIeUB8XbgDd/J1S5eQR4COMc1RMFVhFIXUd9ruh4zdEJ1MB1vc5vNQT8TJGrtK5d3gWIfut31ID1gbgh30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBP3Aeu+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314762; x=1741850762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QApGfBNqivWY9pTmvw98NRk3haDWO68NeCx7t79Ongs=;
  b=DBP3Aeu+8t+rFXCzkxVaGYAH1FC9LI7arFqqbLP2Cb0qkbYqfBDeIRd0
   gFtUClB3J10Mka80EMD1b6rdaYEVueGvzYMYFNhW7Vqp6LNejWfkJoPTl
   pVgZ32dAed5dI95j4CkUZuMRpB+5DURHbcfsTxYeWLFU3rHC/OWe/MZLC
   9mt3USyMnpbki0bzhBaUpgpIb1ajZCKmzAqBQ5HYXnAeXC19HnsamE4TG
   95epOjy1bl0IU8lx5gwxAR00Jl3aYGo2b5lvNjnQ/V5hA3ALH4Vgi+7XN
   h3EqipwAxkjqjQK5aMYB8dYxiLIWqzCUE2+JJspctQJydPa0SIZ7xy+NK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575643"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816476"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:54 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F203311FB94;
	Wed, 13 Mar 2024 09:25:50 +0200 (EET)
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
Subject: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI CCS embedded data
Date: Wed, 13 Mar 2024 09:25:01 +0200
Message-Id: <20240313072516.241106-24-sakari.ailus@linux.intel.com>
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

Add new MIPI CCS embedded data media bus code
(MEDIA_BUS_FMT_CCS_EMBEDDED).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 ++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index cbd475f7cae9..c8f982411e70 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
       - X
       - X
       - X
+
+.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
+
+MIPI CCS Embedded Data Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
+metadata format for sensor embedded data, which is used to store the register
+configuration used for capturing a given frame. The format is defined in the CCS
+specification. The media bus code for this format is
+``MEDIA_BUS_FMT_CCS_EMBEDDED``.
+
+The CCS embedded data format definition includes three levels:
+
+1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
+   documented in the MIPI CCS specification.
+
+2. The tagged data format as documented in the MIPI CCS specification.
+
+3. Register addresses and register documentation as documented in the MIPI CCS
+   specification.
+
+The format definition shall be used only by devices that fulfill all three
+levels above.
+
+This mbus code are only used for "2-byte simplified tagged data format" (code
+0xa) but their use may be extended further in the future, to cover other CCS
+embedded data format codes.
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d4c1d991014b..03f7e9ab517b 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -183,4 +183,7 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Specific metadata formats. Next is 0x9002. */
+#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2


