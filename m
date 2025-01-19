Return-Path: <linux-media+bounces-24905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6A3A1623B
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282433A3DA4
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B061F1DF255;
	Sun, 19 Jan 2025 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heDOTGMc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD51EEE6
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297576; cv=none; b=gsZ0Q663sqLMEhNcExRSyLc9GX30HgFPIcr9hUcVmciowKpPhnrNJyCbW3Xl/Y9M5RqbFPAXeGhaSUSuHUwYMx/Wd0xShrUPp8+MR9JxdMIqric00oHIbcbbsKuh+z1qnQCgvyD6YEfjItOLFdOcyXXydn4nKPLJG5u9aTRmOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297576; c=relaxed/simple;
	bh=CDpJIykji9XXBenkGq/Z8ah3EMNQq2l+P8vJF+EZsUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ajxO0nqpz86Qf8u3ncGlElaJYmdiRSq3ISJdNL1d3gkOYyMyct5NVRkkH3UKQJekcj8gUo71ZLK5Qo85koMWWv9wNL/0tER9hno8Nnv4qfnTlUCBjYiBuTrNwNEg05bo1YGrV8BRlVaTklSklBnF2pEPCzrMGLFLHjL3ZD06YqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heDOTGMc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297574; x=1768833574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDpJIykji9XXBenkGq/Z8ah3EMNQq2l+P8vJF+EZsUw=;
  b=heDOTGMcIUomyfPLe/X1cdLN7OtMvwF+ijl9y7bRuBpJ5aAtmD9Lj9rx
   ssFqycxdNyZ5+kQrG2tJ7adFLoVPijfGYyI8VG6k9KQE16WzGiHxRL6Ez
   35nEAJ/jqoHDQp46k+tM5xwAiyqGQ3wK9xGYb6m2JS1ZZVZ5r7bQfe6s8
   5zComN2W1BVMksNDTp3E/kbAm8/KTH7SonVZ8jXej10J91i/VvD67SCpQ
   x5h2x56677MyZZo5INj+aSxbGDJVaa58iS6MPlOSaIRiWcr7qxu/kTaKX
   Ue0MZj8MxnvUHsPpIs/WN5TquGFcwF5onpgeMSUdQ5ZeHGPDsyzsQ/UoA
   g==;
X-CSE-ConnectionGUID: dex406WPQiqG1URRsb5VBA==
X-CSE-MsgGUID: scCpzgduQ52Q/Q+sRBonZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37579755"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37579755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:34 -0800
X-CSE-ConnectionGUID: f2OO8+izQS2mZoYTluCktA==
X-CSE-MsgGUID: 0tGSrvufTXuR8GvQ/y6TeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="111232084"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:28 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BEACF11F95E;
	Sun, 19 Jan 2025 16:39:21 +0200 (EET)
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
Subject: [PATCH v9 4/9] media: Documentation: tx-rx: Move transmitter control out of CSI-2 part
Date: Sun, 19 Jan 2025 16:38:59 +0200
Message-Id: <20250119143904.114991-5-sakari.ailus@linux.intel.com>
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

The subsection on stopping the transmitter belongs to the generic part and
is not specific to CSI-2. Move it out of the CSI-2 section.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/driver-api/media/tx-rx.rst | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 6f9eba189a9f..03768e5aa88f 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -62,6 +62,15 @@ to control the transmitter driver's streaming state. These callbacks may not be
 called directly, but by using ``v4l2_subdev_enable_streams()`` and
 ``v4l2_subdev_disable_streams()``.
 
+Stopping the transmitter
+^^^^^^^^^^^^^^^^^^^^^^^^
+
+A transmitter stops sending the stream of images as a result of
+calling the ``.disable_streams()`` callback. Some transmitters may stop the
+stream at a frame boundary whereas others stop immediately,
+effectively leaving the current frame unfinished. The receiver driver
+should not make assumptions either way, but function properly in both
+cases.
 
 CSI-2 transmitter drivers
 -------------------------
@@ -130,13 +139,3 @@ device, so this should be only done when it is needed.
 
 Receiver drivers that do not need explicit LP-11 or LP-111 state setup are
 waived from calling the two callbacks.
-
-Stopping the transmitter
-^^^^^^^^^^^^^^^^^^^^^^^^
-
-A transmitter stops sending the stream of images as a result of
-calling the ``.disable_streams()`` callback. Some transmitters may stop the
-stream at a frame boundary whereas others stop immediately,
-effectively leaving the current frame unfinished. The receiver driver
-should not make assumptions either way, but function properly in both
-cases.
-- 
2.39.5


