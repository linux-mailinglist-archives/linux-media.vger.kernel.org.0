Return-Path: <linux-media+bounces-11504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 265C08C71D1
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 09:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9F7BB21BDA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 07:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7793A2CCC2;
	Thu, 16 May 2024 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vz5k0/AM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9282744D
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715843116; cv=none; b=XltMKG/ac21Wdbo5/Gyt/v/nM0Chk+R9mv0Fa/pF8mOVHi/ZYbhY+jRBCdq6fCzgujgiBCwH7BhbG1F2BI3V5bFzfrJyfrzGTh9ixp3LhUtb38P/ghuvDPORi8l9Pi+zGHUQOWKpmfOBYK4AHJHdz2ayr8Mg/pUaKazs3UHCCgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715843116; c=relaxed/simple;
	bh=BqH16ScMRMp5QwVlD5CnmByrmX68VJ6U9ftQMkIKvMY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DxoAIxHyQqwa5GO2rS8bEoo/LodOxrE9YmiT6CN0xSUnNom2ZzaZwIwiRUjvb7zjVMAw2BGHhCyrqaXVVvbVcQ07DGsjWlshbMnlBAzA3+9569NkqbREJTyzSpHANHzkPRx2L8BWBngMZ6JJVYa2LNJtjyawCabOPG+Ej3nMUWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vz5k0/AM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715843115; x=1747379115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BqH16ScMRMp5QwVlD5CnmByrmX68VJ6U9ftQMkIKvMY=;
  b=Vz5k0/AMwzcwsi3z5+//ePiifJgQf1fBiURHIkmtznIWJNVeIZGYZVWF
   5m2bRoiUDiWJ+Ru0hBBLaUxoGux9hcnxfBVsXXh4cy3SUG5vrTCGYYUJ6
   +bXxI6Xd7sJzVxfSOvl5edwIRrGqFTDCV3aebr/52mGEBG5kX63lxlqhg
   snf1AMxvA9u7QlzZPPTu0ayzIFyKK8Fn40bJmQ9t/NUF9pw2/GJfgs5Vo
   yib2bGCGeUQmhI561r2IkQptGHTquWhITuKQodFYKJ0ZppOzxqXo/f+9G
   HtzV0Ua0i3q6wqVAiLWLUmweBkGYic8Eu0s33VuT6gZjLtJGQ53PbsrSO
   w==;
X-CSE-ConnectionGUID: CHqltZReR5m7PSuC2Ep1Gg==
X-CSE-MsgGUID: tNCISi5FTlifCJHjTu9W4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12113631"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="12113631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:13 -0700
X-CSE-ConnectionGUID: WNVDeG3RTv2jlb6k722C/Q==
X-CSE-MsgGUID: pvjdaVOTTPiE7YBZTpyc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="31894936"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 00:05:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 698E7120358;
	Thu, 16 May 2024 10:05:09 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v5 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Thu, 16 May 2024 10:05:05 +0300
Message-Id: <20240516070507.21735-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
References: <20240516070507.21735-1-sakari.ailus@linux.intel.com>
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
index 7f69b5a025fa..76848cf2c260 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -505,13 +505,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
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
2.39.2


