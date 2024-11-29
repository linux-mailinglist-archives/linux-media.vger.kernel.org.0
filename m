Return-Path: <linux-media+bounces-22313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD39DC1B7
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8424A1638B4
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4202185E53;
	Fri, 29 Nov 2024 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3AGIfV1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9672160799
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873955; cv=none; b=sHMykNw0cQqx69oOdgb/3yzRhHTe6J4vksDkvFifz7SMSMY2yyG39JnXn7AykfsokSN5vtoDeH7k+51KNQg1EjlmsWWyn/mUHSCOAdAQS+WMujo8D5UjZD1rrrj8jqpxTUsj9nkO9lcJ61j8acbo0Vwewn/gbWXkb7dswddTXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873955; c=relaxed/simple;
	bh=il3McMAGg4xoWUtr43NEGpDzUXR0nrbp+NRvbPbT42c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mIrWINY6Ol6l8bAkILNazPAt8WlNTFiYonzcLtq7wXFAfNTeZoqVeOUlj2YD7UY6GojRpatu5Y/6V20HaFI5r0pT8V+5Vb9pchyRM7ovC4rS7QJ3KTmwB35W3o5Q+Aq+pWgyuFSYEDSt8N0FYZu7yerH2l7TQ77Vfz6B3IboEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3AGIfV1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873954; x=1764409954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=il3McMAGg4xoWUtr43NEGpDzUXR0nrbp+NRvbPbT42c=;
  b=R3AGIfV1mNg7ydWqVt3qNkb2o/LXVHDHylw0dlvaKM/eDeHgzfwtLg5B
   KLmlAp8pdE4W7wzQnIAyxqCWyjqZ2+Eja+bO2LH2+CVjmKQUA/0seYpa+
   uX1LZmflHH57k0EUygW23O+GD1m7KYl4i3iMs/JOz7OKU/r8cBEuLIiru
   0PrnMpio71jDKw0KfUJtyC9Bd3Yue3Z8beg73w1/+CZTnBhmM5MiVb9kl
   uHPJM4kIA2vHh6jTIJbYu1c+ovUINRkBlWEs66dTUI5rtc9ksXC7Sp5Tb
   EJoTIbLfnwsCDRqubb44jX43UitzZ/H2tnbcPiy4PjzwS7On6ru9P3U8B
   Q==;
X-CSE-ConnectionGUID: f0679xZ9SoKZPacBd+VQhQ==
X-CSE-MsgGUID: +Eq0tJpsQAyPdL1QW2yDFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33258294"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="33258294"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:34 -0800
X-CSE-ConnectionGUID: 2OOHolRnRNeaxPINSc8l0w==
X-CSE-MsgGUID: vbU90E7SQZuP2HaJ1XhVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="97414424"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:52:28 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3888011FADB;
	Fri, 29 Nov 2024 11:52:20 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [RFC v3 9/9] media: Documentation: Add binning and sub-sampling controls
Date: Fri, 29 Nov 2024 11:51:42 +0200
Message-Id: <20241129095142.87196-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the binning and scaling controls (V4L2_CID_BINNING and
V4L2_CID_SUBSAMPLING_{HORIZONTAL,VERTICAL}) in the common raw sensor
model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/v4l/subdev-config-model.rst           | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 1ae20800f34b..06a94ff4d2b4 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -113,7 +113,10 @@ separately horizontally and vertically.
 Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE``
 rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
 1/0. It depends on the driver which of these operations are being used to
-achieve the resulting size.
+achieve the resulting size. Binning and sub-sampling are also directly
+configured using :ref:`V4L2_CID_BINNING <v4l2-cid-camera-sensor-binning>` and
+:ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and V4L2_CID_SUBSAMPLING_VERTICAL
+<v4l2-cid-camera-sensor-subsampling>` controls on drivers that support them.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
@@ -169,9 +172,15 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - \-
       - X
       - Binning and sub-sampling. This rectangle is relative to the
-        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
-        combination of binning and sub-sampling is configured using this
-        selection target.
+        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). Binning is
+        configured using the :ref:`V4L2_CID_BINNING
+        <v4l2-cid-camera-sensor-binning>` control and sub-sampling is configured
+        using the :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
+        V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`
+        controls on drivers that support these controls. To configure binning
+        and sub-sampling on drivers that do not support these controls, the
+        selection rectangle may be changed directly to configure the combined
+        effect on the image size.
     * - 2/0
       - Format
       - X
-- 
2.39.5


