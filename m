Return-Path: <linux-media+bounces-24946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEEA16B26
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68CDA1657AA
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA291B425F;
	Mon, 20 Jan 2025 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5J+qj/q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977001991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370944; cv=none; b=ZgHWIOlePIQEwTs7OWGM2Ibitn9IRlNvWi86wVR75FNHGFvi3ND8fuWDTeu3L9gjIlgdZZap+2Zt2goAfxhbsWdSdxb6OoAQVTwaXEY+Upo4Jn27z5NHajHKinRnFpNW5n2hD1mgqR6rRqdiAASHwYRL2Wok0PlC7P5s41iuWig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370944; c=relaxed/simple;
	bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YwxgQDXnWj4QjooeLSAMkLxW0EcenCZu5dQoKPYBWjDVOKGKi/aVRECw4WxBkE0D23HcrwYC4Y1G5zqU9y3vHvpi+1dO6A9xk3ssdxnQqllUzpAF5ZVmucOzLM4KjPY3a00CZMTEPvRG5xs5ciIUKpbfcyrV43/vi3c68lWbmyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5J+qj/q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370943; x=1768906943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ss2le2bg2PCpLXGM/QUZlPmxsO2vDgpi7atAPfCy0ro=;
  b=c5J+qj/qQQYiC4S/1FVO8nBACOTax4Gk9+qAO4JT5ul7kc5Eltv6cUMX
   zqJrL4h8J+FQ3UxdQWUYry6LWqpqN9+lk2vzTRTx0OqLJcIhlwhqCyCcP
   t/J3lixzTjbPf/nsv/N9BiSKYkaUmSaPR9pHXD5mF71CqT/X5KrR8Mm7q
   75sarK3Z38LE+wEtSpxt+qmpW3uW8+8BPXg2UoSZmF1memfsSVZ7DqH1g
   T7GKu7EpIt1HdrENWV9u+scQJpRjJ66vOL7Qpql+j7b1acmb8w5HMgnM4
   Yl0MZK1i1B03MHSAVMtNDz1j1914FOxX0sYnBudfdozbnI1NKlngaDlER
   w==;
X-CSE-ConnectionGUID: J+GZRZU/RAu2NQA5A9uytg==
X-CSE-MsgGUID: cyQKENpnSK6iiVvI7+gQ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914566"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:22 -0800
X-CSE-ConnectionGUID: kAXnqCquQTCD7yAwsfDslg==
X-CSE-MsgGUID: Cq6C3OisRTSjd1xF0w9puw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491142"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:16 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C6E9120289;
	Mon, 20 Jan 2025 13:02:09 +0200 (EET)
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
Subject: [PATCH v10 3/9] media: Documentation: Update link frequency driver documentation
Date: Mon, 20 Jan 2025 13:01:51 +0200
Message-Id: <20250120110157.152732-4-sakari.ailus@linux.intel.com>
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

Add the get_mbus_config() as the means for conveying the link frequency
towards the receiver drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index c71003f74b1c..6f9eba189a9f 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -49,6 +49,10 @@ Link frequency
 The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
 receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
 
+Drivers that do not have user-configurable link frequency should report it
+through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
+field of struct v4l2_mbus_config, instead of through controls.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.5


