Return-Path: <linux-media+bounces-24950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E641FA16B2A
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 12:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF52A7A00EB
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40111BC066;
	Mon, 20 Jan 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwD32JVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECABF1991CD
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737370960; cv=none; b=A58klsAAIy9mPaAWssasKV0jOldqcsdEG8YyAaxLe4BDa+h6X/tbSUBN5b9wA5IPqX+XbzVtT9CtdOQPurel+24uQo1/ZOZ8+mLYtob2aOD5I7+4mm6smmvfv6KAvjW04Jk1ko9zM0TJ79xzcZ6vA7tqLireFlwUV4QvgQmaO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737370960; c=relaxed/simple;
	bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uSIbkGrSc7UisbjhRzMZWUXC86M0DAZhU/O/IQ7ZBvLVR1UIwWS2G8ZVDzdPVKgypZL48a+wqnW53FQmhNh+nWqywoZUhZwto0saZE8bM1qAxkr0V+YnMdp5zm86zhS1D+PGxr+fHm8dlo4T98hhaw2ZdWUEjqZmltHF9U8yBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwD32JVH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737370959; x=1768906959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
  b=WwD32JVHlcxU2xKK8ddvttfPMwyyQCi45Rh7BMKjbTG38Xi5St5Pd3d1
   DFq1qFl/lJclwCNCgIKhve8NbxE10e+ctNOVvwIFTljiY3o8qD7LtxFdN
   dnd/qFO31tnBYukCkgkgkKv1w1C07i2tcLRbIDRaJ8qzSq55dXTcoQWVD
   8WXSvJlheZuH1vcp8HRpxigJbuTPKfyUEsKTAe+dK7ucZedcTWDN9v9TL
   gr1QMw7FQJUoRktIjE9Y+kMZPRVqetJu/yFkSsVyKKOy1nuU9R39t6pjV
   7ulyDd9YPMaoFd7cpwZRD1991sRQbaMzbZw+ITy9nqyAr5z80LA6UFLIN
   w==;
X-CSE-ConnectionGUID: eY7LbZSwRYGphf0B/uyj0w==
X-CSE-MsgGUID: mf54lc2QRW+KcGXqctgUvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41680351"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="41680351"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:39 -0800
X-CSE-ConnectionGUID: g2uDzSInRje8rLj1I/JzFA==
X-CSE-MsgGUID: ODUV8Da2QGKPqJmjFvtnKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106606515"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 03:02:32 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 507E9120289;
	Mon, 20 Jan 2025 13:02:26 +0200 (EET)
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
Subject: [PATCH v10 7/9] media: intel/ipu6: Obtain link frequency from the remote subdev pad
Date: Mon, 20 Jan 2025 13:01:55 +0200
Message-Id: <20250120110157.152732-8-sakari.ailus@linux.intel.com>
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

Obtain the link frequency from the sub-device's pad instead of a control
handler. This allows obtaining it using the get_mbus_config() sub-device
pad op which is the only method supported by the IVSC driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f4..da8581a37e22 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
 s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 {
 	struct media_pad *src_pad;
-	struct v4l2_subdev *ext_sd;
-	struct device *dev;
 
 	if (!csi2)
 		return -EINVAL;
 
-	dev = &csi2->isys->adev->auxdev.dev;
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(dev, "can't get source pad of %s (%ld)\n",
+		dev_err(&csi2->isys->adev->auxdev.dev,
+			"can't get source pad of %s (%ld)\n",
 			csi2->asd.sd.name, PTR_ERR(src_pad));
 		return PTR_ERR(src_pad);
 	}
 
-	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
-	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
-		return -ENODEV;
-
-	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
+	return v4l2_get_link_freq(src_pad, 0, 0);
 }
 
 static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
-- 
2.39.5


