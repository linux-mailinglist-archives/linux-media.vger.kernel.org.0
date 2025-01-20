Return-Path: <linux-media+bounces-24948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD6A16B28
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D99E16959D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DAF1BC062;
	Mon, 20 Jan 2025 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkIBvvtF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186DD1991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370953; cv=none; b=d/jB4s8pOQFYkfv8vLNfgIHtty+ouEKx5BDc2UJ+MrLxbFidXGaf9/bEgyeEw9fNpiXGbFdj/roBt8bRd/mIqApQyfYXZuRBmK6ARELJoVCc3Awig5Vt4tD/lwq64hVcLiF85YGs0rCme9ZbRBP+RbFe0cHJblBfmqXuTWJVTIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370953; c=relaxed/simple;
	bh=znKITT5Hr+Rs5mEt6PfK6F5mPmB0LeLfkHLiW6maAp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XkFP2V/H3JrbKjFtA4vOQYJ+xnCGl/i3FgnGM5+aBWROYVLR/3re/ixPT+ZI1llYT50tmPhCiC3Uk0L344ENMdpOQXQ9W6mG4E8lDU10hi9IPBiYYLS42paC9O8i/8vb4dF96W41ZlKoTMjo6bY7oZgzi9iCIFfE8FpsId8ihhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkIBvvtF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370952; x=1768906952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=znKITT5Hr+Rs5mEt6PfK6F5mPmB0LeLfkHLiW6maAp4=;
  b=JkIBvvtFRPapypfmweQq/kPlE87yYaePWVLFcNwprERS3NMj2hV1UYo9
   7+4jc6H4mqgXuFB4Se1Vcs5AEwhkJ0E8x4hKOGMmtpD3ofjtRL0gu2zhy
   2B/Us3y7FAAXFG+G5i3XyZx2EtC9SsEwjh31ZBAXRwGO/QQMLJJeR/dYR
   slD67oI52WGC950mxZRkjLIyocsC6tgjK0Ud2xNS3F5V9z7chK2OQbWAr
   521zrtRJ6Hd3P8uZyGar/VEMCoPXkuQrPppOoFi1iP5yqwBglRu69J1+7
   SQFVUBOd70gBqZ4rtXrUNOlyO1086L6GC1yfI+SjV/fEvZcCLijFVuq4y
   w==;
X-CSE-ConnectionGUID: /6cvmps3Qf6yzuuWbk4A+w==
X-CSE-MsgGUID: WOD6HYxESzmo+XHlxxRk2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37914636"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37914636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:32 -0800
X-CSE-ConnectionGUID: u5C/eZiZRuWKU9Dt8NN5tg==
X-CSE-MsgGUID: 7UYzEArZQNWeBqqNZLfiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106491655"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:24 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 154F911FA93;
	Mon, 20 Jan 2025 13:02:17 +0200 (EET)
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
Subject: [PATCH v10 5/9] media: Documentation: Receiver drivers should call v4l2_get_link_freq()
Date: Mon, 20 Jan 2025 13:01:53 +0200
Message-Id: <20250120110157.152732-6-sakari.ailus@linux.intel.com>
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


