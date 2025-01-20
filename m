Return-Path: <linux-media+bounces-24945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3417A16B25
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADF013A6907
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33C01B5EA4;
	Mon, 20 Jan 2025 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3UUE+fi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7591991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370940; cv=none; b=an4IkS+9Aa7edCuNOk4CHIDzJB8zgDyl5mT0dzh6LUffIirZMhLDB+rXKnOALweMPT5v8G34toaQOChgZ7fxzVKRTdIwqciZceFTiWCR5tuYXeDLxWYXQWLWBTznoXx1UNiR27I0v2jEh92H6mQb2gY804vzXLtS1h1nwqpzn14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370940; c=relaxed/simple;
	bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uvLI/NhSpg+LH3KhmajSANdaeLcT9Bb0NGDXYt+343303Pd6BX28YKMDxfzAKkyMnxaplUoo6gkgJZIIHKmu/7jKxPdE+vQ/iGatiOBShX1KR2ZhqnLv2buZ7wt/v0jlDPzb847+azxhPRX99j10wpdmFYBUzTuUTxsi6tO9do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3UUE+fi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370939; x=1768906939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gMwW4TxGjCFHWXNPsbYMJg8eUslune0JQRkFJLwLJOI=;
  b=E3UUE+fiUkXjE1gikME/dPWoegnMB3nOJLQ/CmX5nviL4rtyrQ7CT/iZ
   1kN88W4iZAhqNEjG8Tx1+UgmRdr0Pst6SFoTUQAK5r4p48/9dbz4u0s6v
   bfrIcqgOAfUqkhNpW/NX3B9fLDlAmUEIQIT7DqzsjY7+tbLKmSCwtgva7
   hw9SY6O7NNpiqPTm+XmY0UUchZelwkARo82kdvs7xQRB1tZp7odueuGIj
   T7Iz7KLqKqS93zelzb4nOwesnyt+sx1iSfVJBzPbohogbirDQ6VuVz0gD
   id/B4B68/HRaP4vne5tIZnF4Kg9dxdVUtrlPUKOPSXdopwDG4HXLQhrTD
   w==;
X-CSE-ConnectionGUID: 8+UjKkrJQwCr0AiAaj9WXQ==
X-CSE-MsgGUID: e0Ln7cp7STGGmrZiGgIeAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914539"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:18 -0800
X-CSE-ConnectionGUID: n9uyhQhPRWGLN0S+lB9kIQ==
X-CSE-MsgGUID: TxyzIfNERXG//6ghw3klfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491072"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:12 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BEE6111FAB1;
	Mon, 20 Jan 2025 13:02:05 +0200 (EET)
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
Subject: [PATCH v10 2/9] media: v4l: Support obtaining link frequency via get_mbus_config
Date: Mon, 20 Jan 2025 13:01:50 +0200
Message-Id: <20250120110157.152732-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
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


