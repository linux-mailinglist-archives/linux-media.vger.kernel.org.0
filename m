Return-Path: <linux-media+bounces-39918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645DB26830
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 15:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AFEA3AD774
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FA63002B0;
	Thu, 14 Aug 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f65VaF9g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A052D46B6
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179419; cv=none; b=YCDo8IkjbcBIHa3KArE0O7rgwD4219DWODRNwHF47HqbNLrf+w0b8Mq/zHwm2DRmBUP0nOWoq5OYy+nvYpnfoYRUbKMFbmYsRBKeJbN8z18DGGZgbU9m8qRK6OHxcq+lGg+oGgTYfSSlV+gPdJrlWmmRVB5CphzFEWU66p+aOVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179419; c=relaxed/simple;
	bh=AoyDOydQQtOgHpKY1+RPEH1wHJ8mjYkSeOBG5gXUZ3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eTaQcuy2LAGBDDJQHavaN6iI2zxfguHaV8be7HSs2xSCdHWg2bwgMtHZr4CWVH3PNxAgz91tq1/2QKQid+YHKXJngIGl5NKnNQQpY8nX9aBllkqgIUHpoC6zmGHg4O2l8bJe/F/n7zbLtKIu+qDpR6ztiNnpPTfwNaKpmbJUn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f65VaF9g; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755179418; x=1786715418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AoyDOydQQtOgHpKY1+RPEH1wHJ8mjYkSeOBG5gXUZ3g=;
  b=f65VaF9g+8qioA3bvDYxPmxk7dJG3hO8Q0XNtO1TNFkhBfO4GGknDZQT
   aYMLSfM7Uni2sv3UcqnWIixxKNuNLLf4WzdzPcuFR9A9Z6ig8igcf+CRZ
   GBhlhFVyQRq1mO4ydY4PAbTGMRMTTxr4sdw0ygtyP2kwEPCnqRe9GnqMH
   N8iVtQjtimmtapim1DagXwD3KcutpMNUygx8jSm4rHEuu3sKk8sGmFX+T
   czSSUHrlnUM2orl9eAo1K73m9H6EokYcKU+fNyZJT0FBaPCWDivzMhCWy
   KPtXtwoaCwwzBcxWIlZjELaW5fGFssv+l8F+p8DbrdG5TbDw9V8rpi+jX
   A==;
X-CSE-ConnectionGUID: LbZEv4QjTeynqJABWe56RQ==
X-CSE-MsgGUID: hPct7i+HRmKsF4TEQOxJfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57397535"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57397535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:50:18 -0700
X-CSE-ConnectionGUID: ePd0u76jTEqt9xgpVyDzLw==
X-CSE-MsgGUID: PTKz20kxSv6ot/UcU/MIMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167134069"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.197])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:50:10 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 20B1011F73C;
	Thu, 14 Aug 2025 16:50:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1umYLI-00192m-04;
	Thu, 14 Aug 2025 16:50:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/1] media: v4l2-common: Improve devm_v4l2_sensor_clk_get() documentation
Date: Thu, 14 Aug 2025 16:50:07 +0300
Message-Id: <20250814135007.273084-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>
References: <46b76530-023f-4f36-bec3-1d3ab79c682c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the extra leading period and provide more elaborate explanation for
why devm_v4l2_sensor_clk_get() is only allowed to be used on camera sensor
devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-common.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 9d6c236e8f14..39dd0c78d70f 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -623,7 +623,7 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 
 /**
  * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
- *	for a camera sensor.
+ *	for a camera sensor
  *
  * @dev: device for v4l2 sensor clock "consumer"
  * @id: clock consumer ID
@@ -643,6 +643,14 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
  *
  * In this case try to set the clock-frequency value to the provided clock.
  *
+ * As the name indicates, this function may only be used on camera sensor
+ * devices. This is because generally only camera sensors do need a clock to
+ * query the frequency from, due to the requirement to configure the PLL for a
+ * given CSI-2 interface frequency where the sensor's external clock frequency
+ * is a factor. Additionally, the clock frequency tends to be available on ACPI
+ * firmware based systems for camera sensors specifically (if e.g. DisCo for
+ * Imaging compliant).
+ *
  * Returns a pointer to a struct clk on success or an error pointer on failure.
  */
 struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
-- 
2.39.5


