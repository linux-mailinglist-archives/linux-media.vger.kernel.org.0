Return-Path: <linux-media+bounces-4964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD2850FA2
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 10:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC281C217A1
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B64610A1A;
	Mon, 12 Feb 2024 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAEYdLV1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2BA101F7
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729566; cv=none; b=QuCNMjJpXqH9bxbgPhvm39R7jypE/MBqFj0QKBeuixzSpLS4qo4+MjmPj7PY4mAwR8f8wdVKv/+Pa1g5ZoBGaR65/bd6Jhuphd/KPkhSUmyoTCknbpffiTaozIrOUI/y358xWffnS62Vl0Gtntz/XaSsZDIU+t5dh5wCC4yMtS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729566; c=relaxed/simple;
	bh=jBr2WLgEC67lnkb5UFnRDDLiU15zvANXV0pBXOYKcnc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ph0d/bhB55AaDmDBNadpplIrjS8/hdn8X/9UNgeUmwDadHqYpvq0P1xOH+slhPRQFM0CDYGQnaaXz5sdlLUjQtTDg/C21MzULipELOoOQ5OHmf70vz1Kpl1Jn/H1Q6u8IKBAlu/n6ImuBCZOvSRpxkTCZqQwbNocsPpffVC0FT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAEYdLV1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707729566; x=1739265566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jBr2WLgEC67lnkb5UFnRDDLiU15zvANXV0pBXOYKcnc=;
  b=BAEYdLV1PsGTEsIde3wYdBRbYxqY47uUhsgZ+YOqqusztqhDQ1O8w2gu
   TktXAEF5B0yPj5JcH96ayni3ac9NvKIFiJdWX11jAwlZu+YGRWOfnjyMx
   ky+gux/vP7yKYSkSIfkAJvqd1cVModOfqB0oYJUmk6JtIkSLK1JYmJmRd
   qj11mOg6Dz2chXl9MBVg8vnRk978Qt3ANb+Kp4muCdS7IGCvfLnZUCDHy
   gEJiL6/AYMku2SkfDhlpcoFLfnL/87286lC+l5JkPY+ZIpIg0zHHDlHng
   9iHHafHC4DmIvSrS5I2G9hW/LvMIMaJWTVrMzLCuK/za0h6w7YVyc8YLz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5533296"
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="5533296"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,262,1701158400"; 
   d="scan'208";a="2739968"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 01:19:21 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0D19D11FA12;
	Mon, 12 Feb 2024 11:19:18 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 2/2] media: ipu-bridge: Poll for IVSC CSI device
Date: Mon, 12 Feb 2024 11:19:17 +0200
Message-Id: <20240212091917.342715-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
References: <20240212091917.342715-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MEI CSI device is created as MEI boots up. This often takes place
after the IPU6 driver probes, in which case the IPU6 driver returned
-EPROBE_DEFER. The MEI CSI driver also returns -EPROBE_DEFER if the
firmware nodes created by the IPU bridge (via IPU6 driver) aren't in
place.

If no other drivers are being probed after this point, neither IPU6 nor
MEI CSI drivers will be re-probed. Address this (hopefully temporarily) by
polling MEI CSI device in the IPU bridge initialisation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b2cf80d62ba2..45c39bd93d74 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -4,6 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/mei_cl_bus.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -138,17 +139,21 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
 	/* IVSC device on platform bus */
 	dev = bus_find_device(&platform_bus_type, NULL, adev,
 			      ipu_bridge_match_ivsc_dev);
-	if (dev) {
-		snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
+	if (!dev)
+		return NULL;
 
-		csi_dev = device_find_child_by_name(dev, name);
+	snprintf(name, sizeof(name), "%s-%pUl", dev_name(dev), &uuid);
 
-		put_device(dev);
+	/*
+	 * FIXME: instantiate MEI CSI software nodes outside the IPU bridge (or
+	 * call IPU bridge from MEI CSI). Wait up to 60 seconds here.
+	 */
+	read_poll_timeout(device_find_child_by_name, csi_dev, csi_dev,
+			  20000, 60000000, false, dev, name);
 
-		return csi_dev;
-	}
+	put_device(dev);
 
-	return NULL;
+	return csi_dev;
 }
 
 static int ipu_bridge_check_ivsc_dev(struct ipu_sensor *sensor,
-- 
2.39.2


