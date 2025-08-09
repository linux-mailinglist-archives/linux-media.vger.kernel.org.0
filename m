Return-Path: <linux-media+bounces-39221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF65B1F680
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9804C189BACB
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FA72C08A1;
	Sat,  9 Aug 2025 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bdvGB6i8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BB627AC3A
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774286; cv=none; b=W6h+dNTKHqQdNcODlrnCJ1EcSLE0v7CSKLvD3pOQJPNVh3NEku0KnKpxd1PDEn7tZJm0f1ZujJUaGdzoqByXvpXcUeyox3W7My9mnEaX0tjXx36SzQ9redyMv4LV+rEam/8qbdovIRWkG0OGqg4Tt0NxBRqyXw04AMk/L8NLnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774286; c=relaxed/simple;
	bh=B1Cs5wX1iLlaiXnp1JWvrri6PENFge+j8X75CSJJ54A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LffcSSMG58xqcytuyH/s7DK/0VvIK6DHgvQNwBcjIKHGX8xsU6mKW0Epqxl26awCg0uaYk5/CJxquvy1g4lAZoBUiLX9uvBv0AYWzCwxgHOAbVgSF4XPs+8Gzw4P7U07cbUAwe7aS5EN6MGI/C9nbPUzFBz2thPHVMLiy/n46bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bdvGB6i8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1FD332311;
	Sat,  9 Aug 2025 23:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774227;
	bh=B1Cs5wX1iLlaiXnp1JWvrri6PENFge+j8X75CSJJ54A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdvGB6i8BUNTDGVUiQ6hjaKyDp0pkJgsuLHJ4fjyHYOzcS0ert72q1hS9moRLue2y
	 NtRUWpU/VNFJyWL9JlRkWwlsDY/1kwY+we7yUFjMtoE5CmwxV24DUEthgAdiA/HLA2
	 tkhrk4DBhvDMeqRbYUK+kdsiKgB7HAASDMXRHNPk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH v2 28/76] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH manually
Date: Sun, 10 Aug 2025 00:16:05 +0300
Message-ID: <20250809211654.28887-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
to be set manually by drivers. Drop it from the ipu6-isys driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 24a2ef93474c..f3f3bc0615e5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1306,7 +1306,6 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	__ipu6_isys_vidioc_try_fmt_meta_cap(av, &format_meta);
 	av->meta_fmt = format_meta.fmt.meta;
 
-	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
 
 	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
-- 
Regards,

Laurent Pinchart


