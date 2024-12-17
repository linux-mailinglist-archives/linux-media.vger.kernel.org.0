Return-Path: <linux-media+bounces-23667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A019F5943
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2F2188877B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA81FA173;
	Tue, 17 Dec 2024 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nt2mmMHS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49C1DE2A5
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472496; cv=none; b=J+K3YH5LOIOE4ycanyi6hVieIhRwo5nURd6/JeOn5LtWRyzYK877HlLBZP0G8qmnUoyX92lmX/IzM6yi1teTAOdzo0GrraLR7EhrD92nqxWWcZPGvV+r3fWkiEXaR/Hd49rm4+XN2F4yQYsN+EzUO3FQYFNvi0HRR68a/Nz3iik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472496; c=relaxed/simple;
	bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZpPgMuB/4FOrZTDuN99oMwMID11BYYTzyUFwdPZj534RoREolrM2ww2OBZwhr3OZu7cFpdfvh2RCAhZS5UN6/w9A/WeC3QEhuadS8hbuCB+ogWcC2eakOfKOQ0I5nshgUa76zs/cdKzr0/SD+ybNDO5HQouyzAPQREs1ihnsZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nt2mmMHS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472495; x=1766008495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
  b=Nt2mmMHSycSG4X3+e+EDM1DzwQUMh4Uf7L2LAWe/yIE46fJrGvzFOPsO
   3Djg1/5uPEAKdQixCpvbjiNgxKaMdtDa/3Iah68LIUuIpoxNW3eYLHEgH
   F0+ze9msac2giLNana8gCRV3jwY5cIIe++c6oWeOfRDdMEsojew/LP83E
   PWVFCbpRBAe8ROvX2PCykb8QJQsN/HBaOwsPl+lAE/x7vidEWBx8SjP0Q
   gq+YD66eUaAcVP7uwi95z2BU9YkAZnTd/v/FZ6DF5Gz+GwEPMlPLipzIK
   OywpJvzKMONnedaR9U4zIcjDKYFYT9Mt90vQswbom0q6fmSDF4gjTm+XD
   Q==;
X-CSE-ConnectionGUID: zAfX1enwRDujAt3BNEj3jQ==
X-CSE-MsgGUID: Lj7mwH05SNWI2C2LA3KiGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861586"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861586"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:53 -0800
X-CSE-ConnectionGUID: 2FsyI7DhTmGjyE7DyX9MSQ==
X-CSE-MsgGUID: Ni1wOH2yQsioZqvVxeytJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511239"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:52 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D676411F9C2;
	Tue, 17 Dec 2024 23:54:48 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 2/9] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Tue, 17 Dec 2024 23:54:38 +0200
Message-Id: <20241217215445.901459-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add link_freq field to struct v4l2_mbus_config in order to pass the link
frequency to the receiving sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 15 +++++++++++++--
 include/media/v4l2-mediabus.h         |  2 ++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 9fe74c7e064f..e4b2de3833ee 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -508,12 +508,23 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
 			     unsigned int div)
 {
+	struct v4l2_mbus_config mbus_config = {};
 	struct v4l2_subdev *sd;
+	int ret;
 
 	sd = media_entity_to_v4l2_subdev(pad->entity);
-	if (!sd)
-		return -ENODEV;
+	ret = v4l2_subdev_call(sd, pad, get_mbus_config, pad->index,
+			       &mbus_config);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		return ret;
+
+	if (mbus_config.link_freq)
+		return mbus_config.link_freq;
 
+	/*
+	 * Fall back to using the link frequency control if the media bus config
+	 * doesn't provide a link frequency.
+	 */
 	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index e7f019f68c8d..24c738cd7894 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -169,6 +169,7 @@ enum v4l2_mbus_type {
 /**
  * struct v4l2_mbus_config - media bus configuration
  * @type: interface type
+ * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
  * @bus: bus configuration data structure
  * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
  *		  Used if the bus is parallel or BT.656.
@@ -183,6 +184,7 @@ enum v4l2_mbus_type {
  */
 struct v4l2_mbus_config {
 	enum v4l2_mbus_type type;
+	u64 link_freq;
 	union {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
-- 
2.39.5


