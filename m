Return-Path: <linux-media+bounces-23669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086C9F592D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FC87163560
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FE71FA261;
	Tue, 17 Dec 2024 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcjLCDFD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17EB1F9F52
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472497; cv=none; b=TjfZrb0O7H1qvGA/ayrubbqFzdHa1lc+ZkWx+FIQYZW4WI3/FJi5WnAHQJ2oHymdtIXL8k100Ka/7/bX2utfZTiVKL11gpr6M8nJsm2Oi0utQydKMVbx2izPS3UwLdbol97+YiEDnmd7fw5mcBtpgVsNDb/NhEPIVmvJZOse6rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472497; c=relaxed/simple;
	bh=T5bHo84PirCoeSGBi84XtvnWH0JWp0+xlDqIncvadpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gArI21UxHw8HlP8+Ib3GWGN3ygIw/sdvjhJSD7P61WcDOhRGFNyGOBBSxQr6/FEb83QaOf/FchGFmGlFRdaXGPSiiR14DRYzSk2PYo41s3F6gkK2zwFAc4yC3sGQDr0TnBrue1uftbJsSdK8q5pw4LcuR3mEuJSChWhbFHK/oCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcjLCDFD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472496; x=1766008496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T5bHo84PirCoeSGBi84XtvnWH0JWp0+xlDqIncvadpQ=;
  b=bcjLCDFDlwww9hVc4/x1e0UgjWKwmKcDhsp8q8nQMb0lmRue8XmLVz8X
   vLb4D0xliVPtAac1OwklwAy8zEd8w+H8ywF0RqnXrRXWSQnKk6UBjUY8Y
   8z3Bve1s16nzqolHroYHEXTjuAutOpv5p8HLXLwnm2+ZNMzFtVORi1wSc
   11W7DpEZPYjhFtslYTTD1122iAsHjug8b9ac3RmdB///iFoC8p5C6GI4L
   ZhBYvPRofulAj5Owoea5Ck80ue8OdvqvCtJ0BuV84LMAzXpqHN5mEQ2h4
   6lWGcFzqxHDqZjcMtN8Vnl3Kbc8LUaNNDrgg17NqgcVHCeK16bQhvxTqs
   Q==;
X-CSE-ConnectionGUID: lcN9XkRkRXiFrDTlr03qlQ==
X-CSE-MsgGUID: M4PhLiahRHqO0QXBTNvX0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861593"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861593"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:55 -0800
X-CSE-ConnectionGUID: EGLjhiNhTB+xzstNhr2Xqw==
X-CSE-MsgGUID: iNCHQHi2TH+QSJ/un7tjXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511245"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:55 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0F47D120575;
	Tue, 17 Dec 2024 23:54:50 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 4/9] media: Documentation: tx-rx: Move transmitter control out of CSI-2 part
Date: Tue, 17 Dec 2024 23:54:40 +0200
Message-Id: <20241217215445.901459-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
References: <20241217215445.901459-1-sakari.ailus@linux.intel.com>
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


