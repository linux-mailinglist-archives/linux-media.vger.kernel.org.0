Return-Path: <linux-media+bounces-3287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E18268EC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 08:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551D5B21093
	for <lists+linux-media@lfdr.de>; Mon,  8 Jan 2024 07:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5269467;
	Mon,  8 Jan 2024 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhdHYY9G"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9F58C18
	for <linux-media@vger.kernel.org>; Mon,  8 Jan 2024 07:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704700350; x=1736236350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PjZ+uHh3PhfA4G/58lYz2SRZgV//G9DrJIApRUmvO0c=;
  b=bhdHYY9G1t2bQzRZne35eYGPmtAJfpXfy6ly0KwrfRTEqb6bpSq8lr+N
   vxbYBVga/VwQrknH9b01F3Plmm3wfBMvZD3gcK7+9SYEcvRDK++RWtBPg
   0Kao0WWSwz5Pv9TAccVapTrq1JBxxfIkXiNJrNQZN4sSs4MBO9t1SkJ0g
   B3r8DwLeoqYwTV5ItQko0iZlINEGLQJzqUmHvkmcW1obhBcTERHiZ1+oA
   fgelYDXngEVJYOARr+OMav1V6TABT5iu42krHycaKrSKeE1jhKDFMBj+U
   3mcT/iFDYODKs/z6b5/GmBuo5IwVQhVRaZlNfuIzl9JP/1umd7OH/7IBf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11163901"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11163901"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="1028325405"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="1028325405"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 23:52:25 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C818811FBD1;
	Mon,  8 Jan 2024 09:52:22 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/4] media: v4l: Add a helper for setting up link-frequencies control
Date: Mon,  8 Jan 2024 09:52:18 +0200
Message-Id: <20240108075221.15757-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
References: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 47 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 25 ++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 273d83de2a87..353e94f52f5d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -585,3 +585,50 @@ u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator)
 	return denominator ? numerator * multiplier / denominator : 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_fraction_to_interval);
+
+int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
+			     unsigned int num_of_fw_link_freqs,
+			     const s64 *driver_link_freqs,
+			     unsigned int num_of_driver_link_freqs,
+			     unsigned long *bitmap)
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
index acf5be24a5ca..cd2163f24f8a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -547,6 +547,31 @@ void v4l2_simplify_fraction(u32 *numerator, u32 *denominator,
 		unsigned int n_terms, unsigned int threshold);
 u32 v4l2_fraction_to_interval(u32 numerator, u32 denominator);
 
+/**
+ * v4l2_link_freq_to_bitmap - Figure out platform-supported link frequencies
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
+int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
+			     unsigned int num_of_fw_link_freqs,
+			     const s64 *driver_link_freqs,
+			     unsigned int num_of_driver_link_freqs,
+			     unsigned long *bitmap);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.39.2


