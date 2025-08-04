Return-Path: <linux-media+bounces-38874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F508B1AA6F
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 23:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E551889C80
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 21:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461B423B62B;
	Mon,  4 Aug 2025 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NdDiPQV3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1062923AB88
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343706; cv=none; b=axrrUfKEvFkx3qO5S4SSfDLwQ4aCmv45yqWBKsS8OGbuTsmYr3CSSwkcjK0JliNEEg5Hs5jKIdM8e7Y1zSGZUfcNaA2fm1A+xm6mtlqUHYnAZEBQyiNjOEn6x41h9LgEOF7RoPAqAqu14Z0OJh/ZsHmdHVfRz7/YwSrRA/b2O30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343706; c=relaxed/simple;
	bh=MzbaKWoYsmX2KoTLgvUepSeztsU0BMCNzGejYe8VXlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SU14BiPunAZ+aYImTU2c3Z2wS0GM3BLFwUDBU1U3+AJZLMvZMajvIiDbOHQRH5KEAIO3gOroWWiZ1x0CNx/RZ+/o2lX3xRzGI+Bk1oVTuP7+F0VxN6iZ++1nU8jaiVqYMYD8B3bqhCZKw4D6LhicRCcs0Z2ahlxFSj+0oZM8ezo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NdDiPQV3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C6EB617D1;
	Mon,  4 Aug 2025 23:40:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754343656;
	bh=MzbaKWoYsmX2KoTLgvUepSeztsU0BMCNzGejYe8VXlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdDiPQV3M51Kk7jaesk5YplpFm6IToUFlqzuHhTqDJx/2LW9ra82+7Gws0muwvEpV
	 QUHBMWGmXqfUg8WpdNRI/DfQTWMgq2LeQ4xETfIIOs9tF5jCKztaT00d8iQbb2QeqB
	 x/vicUDexyevowD4A9hjMawIoXWdurppcyREfe6c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/2] media: ipu6: isys: Use v4l2_ctrl_subdev_subscribe_event()
Date: Tue,  5 Aug 2025 00:41:26 +0300
Message-ID: <20250804214127.22217-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
References: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipu6-isys driver uses v4l2_ctrl_subscribe_event() to handle control
event subscription on a subdev. While this works, it is the wrong API.
Use the subdev-specific v4l2_ctrl_subdev_subscribe_event() helper
instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 6030bd23b4b9..d1fece6210ab 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -109,7 +109,7 @@ static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	case V4L2_EVENT_FRAME_SYNC:
 		return v4l2_event_subscribe(fh, sub, 10, NULL);
 	case V4L2_EVENT_CTRL:
-		return v4l2_ctrl_subscribe_event(fh, sub);
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
 	default:
 		return -EINVAL;
 	}
-- 
Regards,

Laurent Pinchart


