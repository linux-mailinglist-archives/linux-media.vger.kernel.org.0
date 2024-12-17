Return-Path: <linux-media+bounces-23672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D289F5944
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 23:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EF40188ED8C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188CF1FA8CE;
	Tue, 17 Dec 2024 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChsaPZ4a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E61FA828
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 21:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734472501; cv=none; b=lSQh/3xVaz5lqFAN0mRdoHFXtm9G+yY4C5WalVwzjEzn7feN593fci2TdCeOrNtse4UII+PAwN4wpm5TqjK4YOKow+0xLcUy2OIwI3E4oKFYCewlkowCFOY2U2pD377DPhBKwfWmijtF/rxjnoOzFUIIgVAYVfs2NzYP/luc1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734472501; c=relaxed/simple;
	bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AaMbwgwZKmrqnVLrSaa1198kLQPpfCXTyckfsJL5azplAD2rxOLrGDlbtehWtmA+xXFr3xhZuSgvTutcItJqG+pRf7lrOmCWO2JV4gML3UhgRpp5aZc46P5PeOpCcHzTc2MAiypHwzbwqLa232Euqidbz4XSAepJ5UvatXnOLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChsaPZ4a; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734472500; x=1766008500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Wo6DzJQ4R9NSy0NkAoyzj1nGHn7ooqeIImKTEXSWgQ=;
  b=ChsaPZ4aw8i4zbzc/PaO4dL+tUVy7VyiWYEtjkQNHs7JqmRPjUUyU/rg
   cS13NDk2ID5V0PNRJ+3b0zDzpbBXs7Y2dB13/uWTpSQP3uwZu8Ku+L18B
   mDocBox4h1IvHSS82eKEB73Uroitp7eZ0fk6Xqq0KM2me2PcWXmhF/E7A
   FYaGAUMCZ96GSbAzxG1nINfuwBCjve0EW6hvEoODjnvawVxLkgLCtq7Y9
   70BcmoAFSbD8IuBg93dWVYKCr6bk19aU1EYo6t41ZWq6cxnTPLBmsj1VC
   plpA5styURXY/xlKzHyFzdxBYQJDxQAhie35FRqKULvtdogx7V3b2oRDA
   A==;
X-CSE-ConnectionGUID: JGGlXFgVTMGxePwxGcyjFA==
X-CSE-MsgGUID: CtPEt1kmSCKd9oUYlKt26Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38861603"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38861603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:59 -0800
X-CSE-ConnectionGUID: oE3dyqw9Q3OQuT2uzUdr4A==
X-CSE-MsgGUID: 0SR+YmqOSciPImdkKbyAPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97511257"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 13:54:59 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 742DE11F9C2;
	Tue, 17 Dec 2024 23:54:55 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	bingbu.cao@intel.com
Subject: [PATCH v8 7/9] media: intel/ipu6: Obtain link frequency from the remote subdev pad
Date: Tue, 17 Dec 2024 23:54:43 +0200
Message-Id: <20241217215445.901459-8-sakari.ailus@linux.intel.com>
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


