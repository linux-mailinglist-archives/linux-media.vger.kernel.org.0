Return-Path: <linux-media+bounces-10186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7E8B334F
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DBD71C20DDB
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A4813DDAB;
	Fri, 26 Apr 2024 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esSQJkQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A91D13D89F
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121460; cv=none; b=s3IbnH8bKNDI+9Q1Kxgn9Ca9XyF6rIqqA5mi4QNulsJ3grD+xsB8N03IfU9QNu2ZG8SNWGB+X8rXKCf0j4zquDpqyDXA14JptZQW1Q/c6jVe5llulRcOnuCcJMhW3y9O9DgzXJ9rdjdvOowSnZLBu6uJIm7T2sg8DVy2QHS6Eig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121460; c=relaxed/simple;
	bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KpuwwMkscCeKwATJmY/+D1KzqyUNiNHI6zMIUFErc0ptjo8dsHGVIsBOoC/j/3oDInRGlgSJiZ+D9NMYP53ykE07OEa0DawROiwm7v61WJOZ3BuKwQvBLPN+aIhBpcuDsJcpcC3R3sCLFixT5QMMEwaa+pkdUccwfK3PeYsHijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esSQJkQ2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121459; x=1745657459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HWo70uAnzn4Nud/ID2UJzFa0xSOrIPMcp/Kd/BkRAak=;
  b=esSQJkQ2bol35B5iWrCF4bkhx+vvt3QxTxvNmSJpGU3GUdmMh3Nf16Gg
   MjDQr8owFVN8un9KoFE3KSKEnvuEbnmNVm86CTuM0lMeBCOZHBk/xnwLq
   Ahb2lWmjPF9/VXc2xOkXQ/ExmFK72sXrqLudNBdnc3s4hWns29hUx/IWG
   yCasiK2KdwO9oqQGdR0jKZKDPhxsnD2jbYC4yb14vvi90JE0akiETMbdF
   rs4gEZeN7yBYJr+y3XKLwu62E6TCQWLBMF4WBqCP5TZfGaIotQZOMTOM1
   UyH+Kdi0Xh33ZC5WAq7tpOwd/mbioL27tFSLgXHe2eDNgDwkbfBiH073K
   Q==;
X-CSE-ConnectionGUID: 1DB2zjF9TU283iL7+dIbpA==
X-CSE-MsgGUID: wwKW0jUwRtqhBmw4mH01+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683840"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:59 -0700
X-CSE-ConnectionGUID: FJlZJUMPQ/KXsOAOnG/+IA==
X-CSE-MsgGUID: hkZXGFwJR0yY9SIhVU05mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598541"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:57 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B6F7711FA8A;
	Fri, 26 Apr 2024 11:50:53 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v3 11/14] media: v4l: subdev: Copy argument back to user also for S_ROUTING
Date: Fri, 26 Apr 2024 11:50:35 +0300
Message-Id: <20240426085038.943733-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the user needs to know what went wrong for S_ROUTING, copy array
arguments back to the user.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 5e928e2a2beb..0260acef97d2 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3461,11 +3461,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
 	 * FIXME: subdev IOCTLS are partially handled here and partially in
 	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
 	 * defined here as part of the 'v4l2_ioctls' array. As
-	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
-	 * in case of failure, but it is not defined here as part of the
+	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
+	 * even in case of failure, but it is not defined here as part of the
 	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
 	 */
-	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
+	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
+		always_copy = true;
+
+	if (err < 0 && !always_copy)
 		goto out;
 
 	if (has_array_args) {
-- 
2.39.2


