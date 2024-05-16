Return-Path: <linux-media+bounces-11554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5398C7652
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 14:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECE43285AC7
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216C1145B24;
	Thu, 16 May 2024 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idtgcf2c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79BE1465A7
	for <linux-media@vger.kernel.org>; Thu, 16 May 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862349; cv=none; b=leT05RZi/iedqUseGGtB1vrieqme5zqmaJ8rJsXFFIwkhnIjrSOciP28FE88M4qsHNIq+18N/RtGhlNCUT+Oo9HgttDYt5eC0gMQolzjPLKHQtxkJybA/dc/06nHIT47C5Jf8SIaNE5WXSL9yeIze9RpC1ZEVAmyShhMwKT1OuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862349; c=relaxed/simple;
	bh=64y+LNXtPE6IRjNRZAQADhQ74oRVlheAoCp3oZ9Yyj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4SSrijyeyN6p6a+vfubX6IVA2tQ+kWuPA1nzWoKrLMl3nHwlT4AjPeMKkK7Qewp2k0qNE4UuObD3iZTcgzJk6iRP+ZzW+NkNza5XV0rthn5xC8CLYAee6dZPmVsakt2ZV0hatEiMFGPYmADO2jbO1/YNnhQSMEQ8bmHEBAuIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Idtgcf2c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715862348; x=1747398348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=64y+LNXtPE6IRjNRZAQADhQ74oRVlheAoCp3oZ9Yyj0=;
  b=Idtgcf2cfPNFW2Mg/i23MnusYb4H9M9VW2VY5WyywdnYBdOtxAiPcv49
   +M7cmb5qWdvB0kEUu98tkVJCoZbrJOqLlHmZULRU6az4yo7BDdDU92q/S
   HxV+r+qPJmF6cNy9c212Ys0HWCZRUAAWNae26+lssr2tjcy9CYl6uH+or
   ZlKo3i2CFEXGx0LsHHbkfW7lbRZgZyCfd3NOVz5GzpuFV7AkmPeN+8HoX
   9f7f/CmmfNtd1LqA9Yr3aDKGbmAZ0dM//+AvZxVEDhsM3ogK3yaYVJFV2
   MLkBB7gmTAdVa2fqi9NWytskYjtpalFk7ba3CyCaRv5lU+rdG9efWiftj
   A==;
X-CSE-ConnectionGUID: ccEZr7RUT5m0Qqqr4IksSA==
X-CSE-MsgGUID: qfz81XrwQniS4QNiePso7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37345818"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="37345818"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:46 -0700
X-CSE-ConnectionGUID: 9m1vB0CTQg6ny9okDHWTMg==
X-CSE-MsgGUID: wQ2F7RvJQlKUSE0ZjytjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="36290258"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 05:25:45 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AD17E120D1D;
	Thu, 16 May 2024 15:25:41 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v6 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Thu, 16 May 2024 15:25:37 +0300
Message-Id: <20240516122539.30787-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
References: <20240516122539.30787-1-sakari.ailus@linux.intel.com>
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
index 01650aed7c30..ff859a340c5d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -506,13 +506,18 @@ EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
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
2.39.2


