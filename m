Return-Path: <linux-media+bounces-2103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B860080CD00
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 15:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D38281ADC
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 14:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA8D48790;
	Mon, 11 Dec 2023 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h09b/0iC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C927C46A5
	for <linux-media@vger.kernel.org>; Mon, 11 Dec 2023 06:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702303626; x=1733839626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1PuKgdKoVe6rgoX/8Dw6O+duXMIGOFPMzRog23T6Yo8=;
  b=h09b/0iCuHMBIVDhgjUgL72ZGk+QGSOoJjEiX5LAJJpAWwSxj1+nLlbB
   /dPwLUN2JlLtLYnVglZxrHA2HCONOlI/R1166FZwgGp00E20J1rILQ1kb
   oPNjLOL3Ngv5ABsMx6ZobqqH59uKGaT/bm469lXdfaVn3XhLM3Gy3S65u
   S8v6OkLC+Ca+CXwTwjBsktEq3JaWkFp32rPlWiOaTddL0ylXM0ZT7wX41
   5fgmFk8ZbsK9J2UoG7zcp4VZOfYuWCShc4Y7z3+6/EEgGOjomtmOD7s3W
   ZUC1ib8ElJsqpELFS9CmZeJ+z5mUB2chiCGyxe2Y3halWo9jjGrgdZTej
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374158410"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374158410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896475183"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="896475183"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 06:07:03 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2CDEC11FC21;
	Mon, 11 Dec 2023 16:07:00 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/4] media: v4l: Add a helper for setting up link-frequencies control
Date: Mon, 11 Dec 2023 16:06:55 +0200
Message-Id: <20231211140658.366268-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
References: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper for obtaining supported link frequencies in form most drivers
need them. The result is a bitmap of supported controls.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 48 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 27 +++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index e9e7e70fa24e..63302009db5f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -585,3 +585,51 @@ u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator)
 	return denominator ? numerator * multiplier / denominator : 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fraction_to_interval);
+
+int v4l2_link_frequencies_to_bitmap(struct device *dev,
+				    const u64 *fw_link_freqs,
+				    unsigned int num_of_fw_link_freqs,
+				    const s64 *driver_link_freqs,
+				    unsigned int num_of_driver_link_freqs,
+				    unsigned long *bitmap)
+{
+	unsigned int i;
+
+	*bitmap = 0;
+
+	if (!num_of_fw_link_freqs) {
+		dev_err(dev, "no link frequencies in firmware\n");
+		return -ENODATA;
+	}
+
+	for (i = 0; i < num_of_fw_link_freqs; i++) {
+		unsigned int j;
+
+		for (j = 0; j < num_of_driver_link_freqs; j++) {
+			if (fw_link_freqs[i] != driver_link_freqs[j])
+				continue;
+
+			dev_dbg(dev, "enabling link frequency %lld Hz\n",
+				driver_link_freqs[j]);
+			*bitmap |= BIT(j);
+			break;
+		}
+	}
+
+	if (!*bitmap) {
+		dev_err(dev, "no matching link frequencies found\n");
+
+		dev_dbg(dev, "specified in firmware:\n");
+		for (i = 0; i < num_of_fw_link_freqs; i++)
+			dev_dbg(dev, "\t%llu Hz\n", fw_link_freqs[i]);
+
+		dev_dbg(dev, "driver supported:\n");
+		for (i = 0; i < num_of_driver_link_freqs; i++)
+			dev_dbg(dev, "\t%lld Hz\n", driver_link_freqs[i]);
+
+		return -ENOENT;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_link_frequencies_to_bitmap);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index d278836fd9cb..adf997baf659 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -547,6 +547,33 @@ void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
 u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator);
 
+/**
+ * v4l2_link_frequencies_to_bitmap - Figure out platform-supported link
+ *				     frequencies
+ * @dev: The struct device
+ * @fw_link_freqs: Array of link frequencies from firmware
+ * @num_of_fw_link_freqs: Number of entries in @fw_link_freqs
+ * @driver_link_freqs: Array of link frequencies supported by the driver
+ * @num_of_driver_link_freqs: Number of entries in @driver_link_freqs
+ * @bitmap: Bitmap of driver-supported link frequencies found in @fw_link_freqs
+ *
+ * This function checks which driver-supported link frequencies are enabled in
+ * system firmware and sets the corresponding bits in @bitmap (after first
+ * zeroing it).
+ *
+ * Return values:
+ *	0: Success
+ *	-ENOENT: No match found between driver-supported link frequencies and
+ *		 those available in firmware.
+ *	-ENODATA: No link frequencies were specified in firmware.
+ */
+int v4l2_link_frequencies_to_bitmap(struct device *dev,
+				    const u64 *fw_link_freqs,
+				    unsigned int num_of_fw_link_freqs,
+				    const s64 *driver_link_freqs,
+				    unsigned int num_of_driver_link_freqs,
+				    unsigned long *bitmap);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.39.2


