Return-Path: <linux-media+bounces-22984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D819EAA28
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA9621886E9C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C4A22CBF3;
	Tue, 10 Dec 2024 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHfFAqGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050B22CBFB
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733817560; cv=none; b=fukVY4xcPuPe7Hjk98c6GG53QNy1QnZQX3TJouxqsrSiR+euloEzbP96P71mkxn64+Xw9yQynFYUUdORh6JkKwdYKu9o0vgGjs8eWcRHGUozlKRrErQPxYyVMlqW0tX46mBlwKxv9s6pWwnFDTgnFaHpQ42YUlvzBzrnVaOf/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733817560; c=relaxed/simple;
	bh=Uux61wXa6I8IETIjf67iUveQJLxEhK5wNG4h5Cu2w7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/eON6JATjhnlEfOaYuVM8U0jLf/yODe9c1sx5K4bmwMP/9ApiA9kstCgf555HE3G5+/d7XacP/OyEPIcJ8Z80Wrvl28Ly4vEMpBJi796aReDKjWXEaUTrPWyhVjtKQLl81tawn9f+8IDI7b02sDJoiqZ0dY7U56slJZirBcRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHfFAqGd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733817559; x=1765353559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uux61wXa6I8IETIjf67iUveQJLxEhK5wNG4h5Cu2w7s=;
  b=dHfFAqGddkTIeuNvHSMkMWnw7jPQY2nJfp5WrUtETU7HW6VLWMeduskj
   GFp4TLJB/STVT9uXc0VPqYiQYRUySQPrQpotepdfWQsnlxcgo88McRG/e
   omWdRzVi08ypL/Kgp9bWAlchHGWVVLUhkw8pahUxEniBhbM76vHc9Re9u
   hloDgmAvtQ4E0kkh4g3P+GL8l+Ro/qTGzk8WJy/UzREuvQP2oRKjFTnii
   /sIRIefjRXa+R1Y//ynTdqHf4UVDBWcerg5Du+xxwPG4UrkApIqzKQ/Wo
   pUH8omVPW6xxt5ys72DLZ0GbXBjbnzpYH9KathBA9aSYs+sd219lpiA83
   A==;
X-CSE-ConnectionGUID: e3tgbTaTRF6qeT3rD+6G9w==
X-CSE-MsgGUID: HbDJ6FdhTcmu2GAi+4kj2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45544657"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="45544657"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:18 -0800
X-CSE-ConnectionGUID: DIl/ijMRQk6lmln2kgfVAQ==
X-CSE-MsgGUID: CaXMxqmxTkOTzRQxgdifZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="99808238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:59:15 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 496CD11F71F;
	Tue, 10 Dec 2024 09:59:12 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v7 5/5] media: intel/ipu6: Obtain link frequency from a sub-device
Date: Tue, 10 Dec 2024 09:59:06 +0200
Message-Id: <20241210075906.609490-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
References: <20241210075906.609490-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Obtain the link frequency from the sub-device instead of a control
handler. This allows obtaining it using the get_mbus_config() sub-device
pad op that which is only supported by the IVSC driver.

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


