Return-Path: <linux-media+bounces-39199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A72B1F657
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8EC87A907F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002E327AC5C;
	Sat,  9 Aug 2025 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eZ4zxezc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0254D226D1F
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774250; cv=none; b=gDkxEBeLeCjAlqi5csmRKcaFz9b/2enuoWUnElHAPcOE6t0SlWMK2x1VexoLy6O0toMrrC7B0MNX7XDbZ5VnGOPTKgxmdPJpCnu3W88gghr5kP62spjWy5kkl4u/24+Sx9hoWxpVmmZJf10HdWAnvLslN7LG2X3mZezHfIO9UIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774250; c=relaxed/simple;
	bh=PZ6leaSodBlVnSk7x4ppe5n7g1jNtZZ4tY4H7GGQd/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goT8wbHMLaSlpVN+eIa/gPVZ2QSJArVtoPhYL5CRJHnIkD8szK5V+SBnImmAvaIvykRUa+8gpGhYcEjcy4voSzk9hByAwKIoGunUbAFnB19zFCTPwHdpM+1DZiL3gotWeAR+NJsuKx45KxvfCfjy1ISmf1t6huxshYIJAxPTu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eZ4zxezc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7983189A;
	Sat,  9 Aug 2025 23:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774186;
	bh=PZ6leaSodBlVnSk7x4ppe5n7g1jNtZZ4tY4H7GGQd/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZ4zxezcuGPpXmqmzc0U/ml2Et4R5QoU9onI5QCF9VGfbxze1SFcI5MZPIVqwfIpi
	 i946cEAQD9sWBY9gu0T1WJzXTZRh1AlTIi+m/9bkc2y9SogheejGNCySkbPVRdqdTb
	 NRDhX0bTIaFMRUA4QKgqjkh9S325/efi/rE3kiuY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 04/76] media: usb: hdpvr: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:41 +0300
Message-ID: <20250809211654.28887-5-laurent.pinchart@ideasonboard.com>
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

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
hdpvr driver instead stores the pointer to the driver-specific structure
that embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

No extensive driver refactoring is required, as file->private_data is
only used to check if a file handle is the owner of the device by
comparing pointer values. The private_data pointer is actually compared
to a struct v4l2_fh pointer, which happens to be the first field of the
hdpvr_fh structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index fd7d2a9d0449..4c431bd9b503 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -381,7 +381,7 @@ static int hdpvr_open(struct file *file)
 	fh->legacy_mode = true;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart


