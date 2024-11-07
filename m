Return-Path: <linux-media+bounces-21088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE19C12C3
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 00:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E68B01F21E3D
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 23:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC3C1F428C;
	Thu,  7 Nov 2024 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="erQXudBu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B158198E99;
	Thu,  7 Nov 2024 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731023504; cv=none; b=Yy0jDrEMNrgoUPGwKL8BqdHoRV/ua1ZxcRV/Gul0rzf3waFM/R1ctZP0Ltcb4PoBU27OD5CLl3cc7jBAW6knz5b9fVy0hgsEwQXKBYgs2NsbCYnX+4k2ouh8Amvb10IZioudSrgMZKqSKAeJPS5wv+b3zCoZoW1kWaBlDddmfRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731023504; c=relaxed/simple;
	bh=9x8jvZn+Zr5y7xVN5crOONcZ70PINQOSF3O6PhHUGJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GE2Y0huMhr8Zkm2VVOj5GH21Hy1DW4KydUHMZVuOwI5lP7ljmp7ok1Mry3mq+5R5Ngf+HYjM10OdzZccPVrTBYdBLx4/qjnjncHVXSOXhHp6OVPLE5RnxDBTwovErr1M5XsiHSQ3XDoj3R9kKwWq+t7gDIJ60urD/SsB2aag+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=erQXudBu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 202DD353;
	Fri,  8 Nov 2024 00:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731023488;
	bh=9x8jvZn+Zr5y7xVN5crOONcZ70PINQOSF3O6PhHUGJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=erQXudBuZ/kpa85QJu9hZ159pow0nz4VmwLD+c7vpDU2JWhBbyuABKQrfNSgUKksa
	 JJFUPR3FLL+DSdlC8Uou1KPA8Cm8EO5w2MtcveDqBwHSW8uEDyAyT8s4dEXgRDWw4+
	 2o/6YlNWR4RnffTdf2LoFsae7DA1b5vm6Pw51Wmc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ming Lei <tom.leiming@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Fix double free in error path
Date: Fri,  8 Nov 2024 01:51:30 +0200
Message-ID: <20241107235130.31372-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the uvc_status_init() function fails to allocate the int_urb, it will
free the dev->status pointer but doesn't reset the pointer to NULL. This
results in the kfree() call in uvc_status_cleanup() trying to
double-free the memory. Fix it by resetting the dev->status pointer to
NULL after freeing it.

Fixes: a31a4055473b ("V4L/DVB:usbvideo:don't use part of buffer for USB transfer #4")
Cc: stable@vger.kernel.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_status.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
index 02c90acf6964..d269d163b579 100644
--- a/drivers/media/usb/uvc/uvc_status.c
+++ b/drivers/media/usb/uvc/uvc_status.c
@@ -269,6 +269,7 @@ int uvc_status_init(struct uvc_device *dev)
 	dev->int_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!dev->int_urb) {
 		kfree(dev->status);
+		dev->status = NULL;
 		return -ENOMEM;
 	}
 

base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
-- 
Regards,

Laurent Pinchart


