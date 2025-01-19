Return-Path: <linux-media+bounces-24906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B50CA1623C
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8056E7A2CE7
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E941DF247;
	Sun, 19 Jan 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcKLGE/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78831EEE6
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297581; cv=none; b=V8zvucuR/USuUG2uuFv9QqwaEkuyfY/m8xzqZdKh9x1AwiOV3QH/nmyUaVmn8XY39BD5/qf/sED7iYMDhERyw4ILRiKrHkmEphqr8Y1E29PS6MNcJNc6CzU8b7D94tDi1NT22NHh+oJrsI9V9EO/dZLa+GEtor5i/yPEFckt9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297581; c=relaxed/simple;
	bh=znKITT5Hr+Rs5mEt6PfK6F5mPmB0LeLfkHLiW6maAp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tRt1Ijh7GusLH+EaMcMHlYr7XB25oLuAj5vxBpeZKEC6nGEBrLtp+CNBbZ4jMzyok0YaGCUAjzP95jT1OLojmLt1XInQ1HzApmAWii2Oy73UUjdALcUOdiug2e2UuUpxzOWBVZyyK7XRGj6BrsHu7E20XEK6ZzFpYpL0VYDWhz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcKLGE/m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297580; x=1768833580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=znKITT5Hr+Rs5mEt6PfK6F5mPmB0LeLfkHLiW6maAp4=;
  b=EcKLGE/muxOnAr7sfxvXggxKXBqrVvFXk7Cp8RCPDfu6KtnhtGy7NmN1
   GxS5JiuANS5xx2EjvqRufMBK8f0hIwSbHRcyhWSiQOZCVFe3Kl+UqqEaG
   SkShm4/XDV72RHRgXLbMUpN6CzdxVs44r6HXzr/9+1m9yJurTQcpjZTBY
   IHBrsdFir0F3yVHPw3EBW//cuusSDoUVMkD+AZ1h8YjfJsFK8Gatjjn3J
   gUMFXINGAkx4g90mn9oPMNuWcftd2WdjndcegB2xMi7aW7IAFoelYsjOG
   lcEAALo6McQDoLtyeCOIo40seHp9X/E53MxOmx5R2WcMQWYhmfGHcD+14
   w==;
X-CSE-ConnectionGUID: YXsPMzS8R5KWa2AdyP/h9g==
X-CSE-MsgGUID: Z35q2GC7TDOimloPPyELgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49086265"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49086265"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:39 -0800
X-CSE-ConnectionGUID: 25vnQVUOSrSXqBOwtzrHCQ==
X-CSE-MsgGUID: usAm/izYSNeTGl5R+EAMgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106701516"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:33 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 47EE711FA93;
	Sun, 19 Jan 2025 16:39:26 +0200 (EET)
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
Subject: [PATCH v9 5/9] media: Documentation: Receiver drivers should call v4l2_get_link_freq()
Date: Sun, 19 Jan 2025 16:39:00 +0200
Message-Id: <20250119143904.114991-6-sakari.ailus@linux.intel.com>
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

Document that receiver drivers should call v4l2_get_link_freq() to obtain
the link frequency.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/tx-rx.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 03768e5aa88f..0b8c9cde8ee4 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -53,6 +53,9 @@ Drivers that do not have user-configurable link frequency should report it
 through the ``.get_mbus_config()`` subdev pad operation, in the ``link_freq``
 field of struct v4l2_mbus_config, instead of through controls.
 
+Receiver drivers should use :c:func:`v4l2_get_link_freq` helper to obtain the
+link frequency from the transmitter sub-device.
+
 ``.enable_streams()`` and ``.disable_streams()`` callbacks
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.5


