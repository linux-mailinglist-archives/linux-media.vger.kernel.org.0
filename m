Return-Path: <linux-media+bounces-10377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 672398B61B1
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 21:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 991B91C2190F
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 19:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4343913B2B9;
	Mon, 29 Apr 2024 19:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHU5Ma+I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181113AD29
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 19:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714417740; cv=none; b=VpqEC3vRPcU6MytqFmhTC8Az0RDeHE4RFei6Bjcoh40DqSl6cnjywwtk3zOzeG6SO47cXM+Ncss4AESx2f3uYhtpK7zu4Behtg7jFttBMtLgFKMY6PkSF7vciMNICem5W5NOxQ6hqY9D8A0G4TP/yyBESWTejWf1+Mtbfp4y7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714417740; c=relaxed/simple;
	bh=Xns0lP6SxmJ3DlnIEONicXGfYk2FNFFx8g3cLDe7ljs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qhxT5bcQgO3qomEYE18Qb1thTEQXs05vfA29CZxrYC2QqN6Es1gSvc2sHuAfWE7rJxd913uE9VSbfXVPaMV4WCvvTLYay/RWIaxJ/HJR8+lbQtxpJbgKjFY9a+7VLi4KXvG088IANsoF3lEeyZNo1xaaKegU7UEqBOtelQ/LW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHU5Ma+I; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714417739; x=1745953739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xns0lP6SxmJ3DlnIEONicXGfYk2FNFFx8g3cLDe7ljs=;
  b=aHU5Ma+IO+rvbeut+nzYHF/UoF/CyfJGlzwPAeA/A+tTfw91QO8I8DJL
   ZBIaKW5WELT3ZwVeHK04AsxoyTyyG/r3IFNCud/y9nvmHbKYnMR59g7MS
   OOp7gnHpmnQhMj8MZ+3mek85ZHAqiJzJZDz5AfHNr48lo6/byuIRor4cB
   IIl8bVRIBOcp/E/wC5S6iTjF+3WWKei5YDICaWUagEQRHZXOt3IALgn5r
   JLZb/BHXk6y5wVy/KiXRkPguysDTrfRcuICDz54kp8u0qcDlH/tPqd+2L
   bzH2MbzYQCm61D3OrMbNGG5JAKNmjsNUUS4zy6NyRfMsX8XrNmebP+cJk
   w==;
X-CSE-ConnectionGUID: RDZ4DLmbSfCoxTsKzS1YtQ==
X-CSE-MsgGUID: gba0ng3QS8a0c+eT7l+WaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13875332"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13875332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:57 -0700
X-CSE-ConnectionGUID: oM9Y+1VmQQmBZ4+yBw1R9A==
X-CSE-MsgGUID: k6NSF2EHSOK5ai2xyITYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30846312"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:08:56 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06C491201CC;
	Mon, 29 Apr 2024 22:08:53 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v4 2/4] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Mon, 29 Apr 2024 22:08:50 +0300
Message-Id: <20240429190852.1008003-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
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
 drivers/media/v4l2-core/v4l2-common.c | 13 +++++++++----
 include/media/v4l2-mediabus.h         |  2 ++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 7f69b5a025fa..09b26ce612e9 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -503,15 +503,20 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 
 s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
-			     unsigned int div)
+			      unsigned int div)
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


