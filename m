Return-Path: <linux-media+bounces-24908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523EA1623E
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 15:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCF51882B27
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2025 14:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0221DF24E;
	Sun, 19 Jan 2025 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MX+pvVD3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DBA1DED70
	for <linux-media@vger.kernel.org>; Sun, 19 Jan 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297588; cv=none; b=KRXvPFFCcpIn0N66TGdfp2Is+H4scx7i1OVidlsMpj+gWj5krOwOSPO4+iacp6vX0obIL7eLVQmdWwpuafSb4bOd/c/JXDiqRw/2QGSJIEaHlIrWjzMM7py8s/zKqnj87sKG4mmuzpJcHdY15vkRicp7EuTY5BzxLbcqbob9GDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297588; c=relaxed/simple;
	bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5xy/w9cZVp1ZbYmRmnODZS6vb96FT5d4JqeUuavij0O7qxYIjtkuGiGCPqd/UQM9k2GM6HqQmMoICHFFK12QtP4/u+OBPp+wwvNyf6JCtAqjm7EpgXEug+dkgyq8Ie3dKZ2DS3axo6tz7nbpYrtsjSAcpx6HxDoahRf9DXN+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MX+pvVD3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737297587; x=1768833587;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
  b=MX+pvVD3w0FwGwCBYm8nZe/ogwNqQCcEznSnn96/Xb6rhHvkDRRQSx1n
   MxlGgAoD/r4c5hgMBoIxNMa4irUdfq61T3M5vUwYNV1sArqQalmqSimzX
   TfMEn1j7pLkEAk+ukuPEE9ysW4Qwdpg+gD9RebpM21h//nttE9Qo/i/li
   ueuDnrlKbnECiCP2A/CiadL5+HS3ursDUpE8u9fBkYTJSCyzKIBj3a7CL
   eYvDPjd7oxintZjNJN+kuNEDcLyZuslunvTOwCRq/AX4Ha2ZNShTo8EOZ
   Mo2qPPju2Nd0aaM1bn756bY+dbgg1hY46zdCVUtQL/u5+1tCJEd063chW
   g==;
X-CSE-ConnectionGUID: McmEuzd+T9mTqqtpAEL5bA==
X-CSE-MsgGUID: nkwVaqlFQDqBZN0wdAFyLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49086288"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49086288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:47 -0800
X-CSE-ConnectionGUID: VlpWVZYAQTWOl2Ll4e1ZvA==
X-CSE-MsgGUID: ZT6MvyZLTKys7XiK0x1zzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106701542"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:39:41 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12D8F12076F;
	Sun, 19 Jan 2025 16:39:33 +0200 (EET)
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
Subject: [PATCH v9 7/9] media: intel/ipu6: Obtain link frequency from the remote subdev pad
Date: Sun, 19 Jan 2025 16:39:02 +0200
Message-Id: <20250119143904.114991-8-sakari.ailus@linux.intel.com>
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


