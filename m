Return-Path: <linux-media+bounces-39301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF6AB1F7BC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94E001899EAD
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C231E5219;
	Sun, 10 Aug 2025 01:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bnCAZePZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014DC1D799D
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789531; cv=none; b=m7HVV2Jl4rHWcL7xKLYp5rvQPGW2bfbwuNzrE5JrEeYDjJYNmlcj2kFjab1oA8YmuAseK2EDyUOmp5D7xabkfwKzfOHzLxXH13zXCfgnKqEIX381h7wT74IxRy59kw70MgZHU8rthLV3vmeacTBH1RLirw76ON5EuRUaYgX9rRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789531; c=relaxed/simple;
	bh=SAOpAteOX4E9nrlxKfy03ssGLIUVBDZMwi8eVE84vio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrQ2cCZuay8FCyeZaOWU5Bc+rFUkwmf+ll8wUtk1yUhMvS9mLeoSdvaM2rCM+qiH6algeEy1C7KrN/Et6jFAxfs7uJxTsE1BaPjj+PrjdGCZe/Kd3rg1JklDKqPQRRcSnIDcFdfIgZAir0Kf+I7Eu0PwnTgHpyljzljFJVWKQ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bnCAZePZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A4D1B18B9;
	Sun, 10 Aug 2025 03:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789476;
	bh=SAOpAteOX4E9nrlxKfy03ssGLIUVBDZMwi8eVE84vio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bnCAZePZ8seF6xU+QBG8pSeTfcXVy5Lpo49/I8Nn2EI3ZpFYVXBxGKf6l6ljq3Di4
	 yihk7P7sCBdiT7rdFdzedJHpiOa5pjPCifnylLW10iDJetH9oKM0JB1/kVj0m+nE50
	 EtG3AAxAZuX1NKPj6Zr5pD7iS7DxMpnHhkpNNPNw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH v3 28/76] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH manually
Date: Sun, 10 Aug 2025 04:30:10 +0300
Message-ID: <20250810013100.29776-29-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


