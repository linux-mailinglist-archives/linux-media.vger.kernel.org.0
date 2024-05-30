Return-Path: <linux-media+bounces-12239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B7C8D4C15
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F77B1C2209F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B6817C9F6;
	Thu, 30 May 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MalR/394"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C31517C9E6
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073635; cv=none; b=XlQgNb3NZYdiIlRhC/eo4dRAWH77hInV6VAHd50b/qQgaJSpA9rDAO7KIiARAsM2iaWp7MXS91gX0Gr+dJVcGQlKVM+3agVEnQ+R/o5gG3zc8S1Hg3AudM1gGgOVLnIEwX6pbndvcIhWyMRL59dDm5dhwyvRIX89g5vrIaRXJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073635; c=relaxed/simple;
	bh=JmFWB1E9XxqG+VY89IJoeubpt81DzBdHjb5aq6Wb+aY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dM0qz5kAjS1VMHVZtjaseL8mUfWPXcWZnDc3OmJzcGWDDu/ClPEgizgEOpuQJST+jTkezMRt2aC080TEIAZrsJxIY9ciEYm9lHYDS300RngEsQZPUapi9rqfBDALi2LeIKwtbl97xvKhGDzcQSxbGVYk4yEJ7upTTKPRr/sHSy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MalR/394; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717073633; x=1748609633;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JmFWB1E9XxqG+VY89IJoeubpt81DzBdHjb5aq6Wb+aY=;
  b=MalR/394NutgdCItRkco6ztOPahrhPhbOvCoNfwFdmXzHOgcPlOoFW6b
   kfyTAWFocE0dP+22BAqcIa+UIsZEnDlucoMNmWpEDrcfE37UoHbk040nw
   HzsvgSLzpw0Z2Z5CpIt8yphjovSFIedJw7bmsI3ItwDwRn8eKQCJRrYeL
   CYAEBAgnlhrmiWhWjBhfQ9FRQgKOuuGv0Juyz3iayZF7Ow5L0/MXYykVY
   zlwvCFIzhRi74rit5sj9O/RHCnK3U2nDqYtgv/QmBuzvHlfNFpDw8RNyH
   InPINKBlly+wyf/1As/XEisFxzO9dXZZCVCO0mc//qTEU9e8WI+IdzP+5
   Q==;
X-CSE-ConnectionGUID: xtIsP7+0S46AFKNC3GP05Q==
X-CSE-MsgGUID: uW8+yZ0mTa+cjtaTCZSzAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24961566"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24961566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 05:53:52 -0700
X-CSE-ConnectionGUID: 1mVU6RO8ReSkJ0hzvKjSTg==
X-CSE-MsgGUID: G3rQfYuTSaSeMh/bXHJs5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="36439004"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 05:53:52 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7FBDA11FA4A;
	Thu, 30 May 2024 15:53:48 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH 1/1] media: ipu6: Use the ISYS auxdev device as the V4L2 device's device
Date: Thu, 30 May 2024 15:53:48 +0300
Message-Id: <20240530125348.316664-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V4L2 device has a struct device field used for a number of purposes,
one of which determining whether a created sub-device needs to increment
the module's use count to avoid unloading the module. Thus the owner field
in this case must refer to the ipu6-isys module, corresponding to the
auxdev of the IPU6 ISYS.

Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5992138c7290..4bc6c348f552 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -793,7 +793,7 @@ static int isys_register_devices(struct ipu6_isys *isys)
 	isys->v4l2_dev.mdev = &isys->media_dev;
 	isys->v4l2_dev.ctrl_handler = NULL;
 
-	ret = v4l2_device_register(&pdev->dev, &isys->v4l2_dev);
+	ret = v4l2_device_register(dev, &isys->v4l2_dev);
 	if (ret < 0)
 		goto out_media_device_unregister;
 

base-commit: d0fa184dc2238e0c988778c4e7d85fe508e86d2a
-- 
2.39.2


