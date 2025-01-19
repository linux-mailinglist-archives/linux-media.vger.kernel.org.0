Return-Path: <linux-media+bounces-24903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08931A16239
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2D61884490
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949101DF260;
	Sun, 19 Jan 2025 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ebr5zxGC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB711DF257
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297567; cv=none; b=Z8fEWy50/cSvHt5ofVxnyIVem1xSMiOdylv7YrnCiUAqBCU3poxZOH16pIsZhtmZodTej1KghrzqBVE7Y6fuu0d/vzcO208Qw4TqgO+S0zP4JBvYkykXSVXL05jmprkIkOjgmpsQenm3FdnOW2ejjOdp4AP5l3sYbW6ip0W4iKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297567; c=relaxed/simple;
	bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nfM0mBTyHX0FxTRZQaZAOOIOyZrwSnuht7hOc7eyD+tEkAgMtKpeR+Wojtd58ouO5DO9RuMpf5zahMNdKa96S9RVIbdKMoJFQc8XCrFMG79+KQKs1lMo4ux+WBX6lZENkt0V29ckrJoeQVE1J6T3L3gTrP4AEc8ItrsQ2iInpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ebr5zxGC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297565; x=1768833565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
  b=Ebr5zxGCES1J2fCnng/sEdWnNHLn4M/Ti5NH9siN0YHcydvRC1AeETg9
   TANG4reH1GsaLPkCJAFsMajHrpRs9l+h/FXHiALfhRc7t9WMxKc9oD+KA
   TM+nrCKJjIB3w0cxq1Te8mTRCY0riZUj1nh+KIrCuhxTH1zw4mt1akDuX
   6S586FnCMBGuCTy+KgEfRi96qp6arWdEQBlhBFTKmDZaHGioCCMQgrfGu
   9uyKU8oDy/7xN7OBdNi1yMgz23q7v1sPTpXoMX3gUVu4ti/G4LxRpucuz
   yj3qN+0GkoZU7wJXtstvzX/TSl1PmAiKbwJ1j/uoi/pj+mH/7x1trL5eg
   Q==;
X-CSE-ConnectionGUID: nSn/LYzIQy28kXr5Nd9JTw==
X-CSE-MsgGUID: f0dQT7RRQTaBrmHB9StDDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37579714"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37579714"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:25 -0800
X-CSE-ConnectionGUID: /WXgZ67aQfCcVKyJ7bTS1Q==
X-CSE-MsgGUID: qoUrF2DLS2CiP96B3oelmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="111232055"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:19 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 382F01202AB;
	Sun, 19 Jan 2025 16:39:13 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: [PATCH v9 2/9] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Sun, 19 Jan 2025 16:38:57 +0200
Message-Id: <20250119143904.114991-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
References: <20250119143904.114991-1-sakari.ailus@linux.intel.com>
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


