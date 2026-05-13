Return-Path: <linux-media+bounces-61375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP0eKgVWBGqMHAIAu9opvQ
	(envelope-from <linux-media+bounces-61375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B52F53183E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 12:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E2C73052CB2
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4233E9C30;
	Wed, 13 May 2026 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZ2q6O9R"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05893E9C1A
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669045; cv=none; b=fyUhv4i+v2hQgyV7mAkQFlafbhaO66soD3SVsoo+GVwKd+meH1s+QnMSDr87tLFx/Z1fHEqDU6Jbb6BH5Jxt+fH/yp6fkEEz/aoCyE4B5K+gBpV3Q/ykhWIySoip8Fii3CcnQAkFFrmJ70s46hFYUj93QdSr4uWjedXrJ/h5Bjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669045; c=relaxed/simple;
	bh=MFSnvPBwT3gPbeRg07KG/3GMQEclQwbVLEg88UoiXP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5HkSTu+Y1DL25boKv3M7u+1jX1LZzscA1l0ooVa3BxYRyEsXmbdCzrdJ2q8Kqp2KzaJxb/C9Isdw20ClG0h9kPa+h8E/ApSo8bQnWgK9tYRYldMdhF2zZeK0rNq6GPKO8SrHsjCBMVe3TZpPYwOOXKn4Z3exBPzscInHSt9WMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZ2q6O9R; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669044; x=1810205044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MFSnvPBwT3gPbeRg07KG/3GMQEclQwbVLEg88UoiXP8=;
  b=kZ2q6O9RVka0mqMdJ7qrTG5vG/TqM9nkYsXwvOTM2NshwbCwSmWFyUOz
   V0Mztp2DlrLuqghzNbYVSavgqaGlRZoa9BNU2FjF6bcJkfBkb20m9TbRv
   cJ4JtM80wdI1UaXIOOx1UKI//H/ZEsebs5ao7n+hvuTzRbIHY41DIaDZi
   mZ4NmdkxF7Wx6ijPwfq3givZuxmcrYFXOt1X/z8NLd99g8pvFbPJFvPBQ
   vfSUsw9y1MEQE6soItoSKPH8KR+Fn0cDyIXJ+ThdHLj9ub0xaMUMpqF2h
   DOtMJpQxp24dXqo9uqaAOzefvFOdkntg66Q8HXcMu3qWeSoPzs+4Unzx8
   A==;
X-CSE-ConnectionGUID: X6P/0aqZRn2jhzvTvfgctg==
X-CSE-MsgGUID: 9E0Y2Z2jQzu0TGG1jSknlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464439"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:04 -0700
X-CSE-ConnectionGUID: jIDXxIgQSoKfSeIYlrfr7g==
X-CSE-MsgGUID: CMhqShGFRVaQFnE76zD1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599242"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:44:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C0367121CD1;
	Wed, 13 May 2026 13:43:59 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wN74I-00000009S18-2s2Q;
	Wed, 13 May 2026 13:43:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH 01/17] media: v4l2-common: Add mipi_csi2_dt_for_mbus()
Date: Wed, 13 May 2026 13:43:42 +0300
Message-ID: <20260513104358.2252605-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4B52F53183E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61375-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add mipi_csi2_dt_for_mbus() for obtaining the MIPI CSI-2 data type (DT)
for a given Media bus pixel code.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 47 +++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bceafc4e92c8..3f40de563bbd 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -46,6 +46,7 @@
 #include <linux/uaccess.h>
 #include <asm/io.h>
 #include <asm/div64.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -808,3 +809,49 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	return clk_hw->clk;
 }
 EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
+
+int mipi_csi2_dt_for_mbus(u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_Y8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_Y10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_Y12_1X12:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MIPI_CSI2_DT_RAW12;
+	case MEDIA_BUS_FMT_Y14_1X14:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return MIPI_CSI2_DT_RAW14;
+	case MEDIA_BUS_FMT_Y16_1X16:
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+		return MIPI_CSI2_DT_RAW16;
+	case MEDIA_BUS_FMT_SBGGR20_1X20:
+	case MEDIA_BUS_FMT_SGBRG20_1X20:
+	case MEDIA_BUS_FMT_SGRBG20_1X20:
+	case MEDIA_BUS_FMT_SRGGB20_1X20:
+		return MIPI_CSI2_DT_RAW20;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(mipi_csi2_dt_for_mbus);
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index 40fc0264250d..0bea79ab66c6 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -44,4 +44,6 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+int mipi_csi2_dt_for_mbus(u32 code);
+
 #endif /* _MEDIA_MIPI_CSI2_H */
-- 
2.47.3


