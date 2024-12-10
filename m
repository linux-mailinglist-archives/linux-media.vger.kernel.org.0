Return-Path: <linux-media+bounces-22982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A69EAA26
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684481675B6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CE622E406;
	Tue, 10 Dec 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWDqWSS5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECC22CBDE
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817556; cv=none; b=CejaVpxdVIEh5qN7FfS69E2adVpbjUX78EAeDUIb/gAoScFDiVaMhTsJoCQOt09Va+6m+eZSJRhEu2vDyFFbjRCndEdJp2HSB8dR0we2Akpk+MQrvvl86458v0XXXG2BSbIyxhAV4jPfk1JNtBbpLbuNw3sNK3UcLL+2F4PAXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817556; c=relaxed/simple;
	bh=N+x6H0XizXCVwZkBq4aKQW9M4hYtmrad44RU3CmaEPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYpP/0QdI3KbcLG3FnRAMjPSH/DqFfmOj2C2Sc81M57il8ORtHrm/N3DGwCgpL2/8wLkWfcvf8lLwehT0ALM3fw8afdb1eDhuLXVO8QF0LEQvLRP6iLL88E8n+ySvvUq4v+mtlEoqA0cylLHDboXDEzYl9qICTg/OxA6dgpznLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWDqWSS5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817555; x=1765353555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N+x6H0XizXCVwZkBq4aKQW9M4hYtmrad44RU3CmaEPc=;
  b=MWDqWSS5EefUYq/wdZQP5EauuJg4dGcnmTMULHmYyLfj8nKkC4Msv6bU
   hOIJbVvN5RLDzChcBRJggSCVlcA/P23cF2bBQ2lal2JxC8dREQigh+HwP
   dBcUDkQFnfSl7hQrAWTfKB2FOn4WXVyEc0JTGIbZJWVTKQtq2/kvuTz5Y
   HqU6ThQlm1lQtPPHZuwRdfqZfbFR+mH1S0BByZs3zzgk1+EkTnQtSAjSD
   i7X6IvJ/gUJu9OiYVVGkulEXZtoiurlWaVnszz3ylMWQJmx7VLnFxYQkO
   P4kA6T7KvQz3RELDwYtNOFD67ZJo0YZm+2HaAnKUpFueBXlp0t5MSi4zt
   w==;
X-CSE-ConnectionGUID: h/Z3VG8uR0mNrF7ou832/w==
X-CSE-MsgGUID: dMxBHN7DTrmQnRkLR4VWsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544621"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544621"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:13 -0800
X-CSE-ConnectionGUID: bQFdRY9PQte33X/VgoZ2Kw==
X-CSE-MsgGUID: dst8N+49Q9WncHg/WYyAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808206"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:12 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 75D7C12061E;
	Tue, 10 Dec 2024 09:59:09 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 2/5] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Tue, 10 Dec 2024 09:59:03 +0200
Message-Id: <20241210075906.609490-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 11 ++++++++---
 include/media/v4l2-mediabus.h         |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 9fe74c7e064f..88fbd5608f00 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -508,13 +508,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
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
 
-	return __v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
+	return mbus_config.link_freq ?:
+		__v4l2_get_link_freq_ctrl(sd->ctrl_handler, mul, div);
 }
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_pad);
 #endif /* CONFIG_MEDIA_CONTROLLER */
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 5bce6e423e94..cc5f776dc662 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -148,6 +148,7 @@ enum v4l2_mbus_type {
 /**
  * struct v4l2_mbus_config - media bus configuration
  * @type: interface type
+ * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
  * @bus: bus configuration data structure
  * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
  *		  Used if the bus is parallel or BT.656.
@@ -162,6 +163,7 @@ enum v4l2_mbus_type {
  */
 struct v4l2_mbus_config {
 	enum v4l2_mbus_type type;
+	u64 link_freq;
 	union {
 		struct v4l2_mbus_config_parallel parallel;
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
-- 
2.39.5


