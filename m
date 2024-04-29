Return-Path: <linux-media+bounces-10360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4F8B5DD6
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 17:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27701C21099
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 15:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FAD8287A;
	Mon, 29 Apr 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAIZsHFz"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47207E0F6
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714405033; cv=none; b=PO4ljWqbBmi1usBZTk8MeHBBDt9EBSTKhas9Ry0+shJQLlJxcC0NhhNhKzK2Alb2eqmUAagWRaLoD9XtiYjETDxRmlPSkKcuOobt4INueSQtTTdzqh9/29LSVSaVfrQL3tU4D0Wsmrmh/xiQraU1VNzmAybDli1ObRD2p0/Ul8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714405033; c=relaxed/simple;
	bh=8aAe83M65yKP/KjHImA9/dFMtPj0CRONrK7LtF8MOu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e8jOddVJmKdX32+juTk21sKkgw4t6/TVyqoefnA+n3pdinVNWP4GBfPS2pCr1qnh9TfLQ2x3hifmivxUT25cEjjUHmJ1WrmwcrMFEkcsJnd74Xn2T89X1I43msPwqPM7g/EP4Z+3lf2htfLylqwgAURMFXdJJTnaFPVYGaYFaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAIZsHFz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714405032; x=1745941032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8aAe83M65yKP/KjHImA9/dFMtPj0CRONrK7LtF8MOu0=;
  b=nAIZsHFz5MP6LZ2/0Ne/KglKem6kOMz65uwqwij1uif3zAkl0KNXs57D
   0vgCP3ZpONUYQkOpdEiZv3KIwpzO+x4HmvoICi4EB8775C5vRI5ThUrNb
   yrsTyoIv/bJVbIgs539nUXARDjcHTb5IAyZrfLD8iOOB78ONvLsCnqQVN
   4NlQoAM3+deuOxB1WJbXpBrKYW/63I+5W5wKeLpyYd68knosYOgBXnNBV
   rNr+RMqCu5XScbTgxucSE0kihzGGDhnq596l/ORBd9BPAYPqfcqn1fywS
   P7jqqqv5TAPlIm+lfIBNAnM7lJqsKLkQKrah+0n87Qbs1GnyY2CMw0GQz
   A==;
X-CSE-ConnectionGUID: VmdG32UIQye8XFktoWseqg==
X-CSE-MsgGUID: SBPEFISqQsqzGju6ypLBMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9951169"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9951169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:10 -0700
X-CSE-ConnectionGUID: 7X+7gYvfTjShiU73oODsXw==
X-CSE-MsgGUID: zMr+K8l2Q8qM8uOAW10aaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30972903"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:37:09 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 92C351201CC;
	Mon, 29 Apr 2024 18:37:06 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v3 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Mon, 29 Apr 2024 18:37:02 +0300
Message-Id: <20240429153704.1005192-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
References: <20240429153704.1005192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add link_freq field to struct v4l2_mbus_config in order to pass the link
frequency to the reciving sub-device.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 12 ++++++++----
 include/media/v4l2-mediabus.h         |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 7f69b5a025fa..a26217e2193a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -503,15 +503,19 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
-			     unsigned int div)
+			      unsigned int div)
 {
+	struct v4l2_mbus_config mbus_config = {};
 	struct v4l2_subdev *sd;
 
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
index 5bce6e423e94..2f39b52bb4d4 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -159,6 +159,7 @@ enum v4l2_mbus_type {
  * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
+ * @link_freq: The link frequency. See also V4L2_CID_LINK_FREQ control.
  */
 struct v4l2_mbus_config {
 	enum v4l2_mbus_type type;
@@ -167,6 +168,7 @@ struct v4l2_mbus_config {
 		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
 		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
 	} bus;
+	u64 link_freq;
 };
 
 /**
-- 
2.39.2


