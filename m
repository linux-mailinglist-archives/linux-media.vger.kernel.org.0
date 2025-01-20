Return-Path: <linux-media+bounces-24947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7490A16B27
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5474818878F7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1068D1B87F5;
	Mon, 20 Jan 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgUBLOAU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B161991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370948; cv=none; b=l+gv5sRVg23TsihDb3BQ4lqyOR2ogwuf2/JeeYqFojVrKiA2cQ8yGHU9EqoKymqsZJoITVTidKoDvpt09/Lz3xxqXUkoVX+an5h/fEw5TJXyD+faDnY/iL/wOEOz4qUNdClEgqVWFEBLlH1FbN31KjdHxrTQosexxaaqyzaq9U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370948; c=relaxed/simple;
	bh=CDpJIykji9XXBenkGq/Z8ah3EMNQq2l+P8vJF+EZsUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AKqnBOqT6BqCWnf/JLbEDJTKPtuOm0kdeWUi774jVClvZmxarr8ZGRWG6tMVM6rneB8y8HE83h7K8pcogoU2zIDES1IsDiP6O5kzwo12ILzTDa5pTUdtZy79ucPVWVpWOwhjZKignZ5aXREyIfCtphIid+Olj89AsXcweypj6xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgUBLOAU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370947; x=1768906947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDpJIykji9XXBenkGq/Z8ah3EMNQq2l+P8vJF+EZsUw=;
  b=TgUBLOAULx21T2c1IEJSwbfDlJe0W/oAFZrUl+pfhTasryt4Vb4ZlgF+
   oLMmYmX4TmQj3h/vk2LQ93vCLWS+jFVOj2o9/ER1K4kD9kNZJNG6AL8cr
   g961Y3bs+kLS1xNJGJJnhtmUT35VCdoJn5YxMfWNquZ9Q/Ybg3ngpbEY7
   zBTHIDUeTf5Fu1XEAoMOaZRpCPIxZ4TShMy5jl36cuRY7Die/BQU2YIS+
   2SL1Lf2H9D91k8RsEhcAZHQcxDyvYLnVWeEfWIrUOWJ/3+NgzDgXD86xX
   j8o4Jp/V6OVGkiTZz5SvJffv1ckWL05NX2/GdOG4IpObtsMciHCxTj5LN
   A==;
X-CSE-ConnectionGUID: ym7o8RWHT1qmDRVBkBIZ4A==
X-CSE-MsgGUID: B1XDrkEDQImMUFdd9TCKjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914590"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:27 -0800
X-CSE-ConnectionGUID: E6gRg9TyQFGchcWLtvjbeg==
X-CSE-MsgGUID: JTa4dRA7SbylqEN/MnmdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491392"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:20 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 95D3111F94F;
	Mon, 20 Jan 2025 13:02:13 +0200 (EET)
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
Subject: [PATCH v10 4/9] media: Documentation: tx-rx: Move transmitter control out of CSI-2 part
Date: Mon, 20 Jan 2025 13:01:52 +0200
Message-Id: <20250120110157.152732-5-sakari.ailus@linux.intel.com>
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


