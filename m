Return-Path: <linux-media+bounces-12857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD990215D
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419101C2140B
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9ACE7E799;
	Mon, 10 Jun 2024 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HVZuL62/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A853C30
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021786; cv=none; b=Kr9OVfHgDtM2uYA+1PuGEqFv+u2msAT/+7L+mt5ElNuJHckW04MYWXknywP6rQU6/g9ngZs+RJlVR/DKVu2E/rHiB2o0q23iyKrsgSxiRsDGPBHUGS/7eR6MVaJVGBXizxbLI1X6MHTJsPQ7IvdZOLLpJF4/1MEzGrzWl0TknmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021786; c=relaxed/simple;
	bh=sCpbsMts3EqPTB+iPfmA23wmVsRGlKO3aV7biLx5tYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4ZlOBFPnPaFAXgg+EE3WNcaRO8ZHSjQaxo51Pp2Td+Ejg5zKW+RcPrgY7TX9vuSq7JsQOapc/0LmTb5mFUrshIY85OnlMIekX2gAxQRRZJirHZMeF8wuvVZQCRvArka8vy6D5rx7EaIOGcFrUhlVR2U6opp0sRVyt+ONsR9Pco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HVZuL62/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D53B4230;
	Mon, 10 Jun 2024 14:16:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718021771;
	bh=sCpbsMts3EqPTB+iPfmA23wmVsRGlKO3aV7biLx5tYs=;
	h=From:To:Cc:Subject:Date:From;
	b=HVZuL62/MiCCSGFVwfUCxWtILYx9CB4x2gX+zpM/Vg0wxDQ177UdeZciIWS0HMcT9
	 mi1N8aviYvV0Z+6RuqrhymyIdlvVKK4wWkX31O/qvxrpHYbt+1We+LmXp0o6/IOkY/
	 0Ne8z+Fam6xDrsU92kJ95Y+ODjnhasrQMHrvvu9Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH v10 7/6] media: uvcvideo: Set INVALID_DEVICE_SOF quirk for Logitech C920
Date: Mon, 10 Jun 2024 15:16:03 +0300
Message-ID: <20240610121603.10566-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Logitech C920 seems to be affected by the same firmware issue as the
C922 that leads to invalid SOF values in packet headers. Set the
INVALID_DEVICE_SOF quirk to work around the problem.

Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Closes: https://lore.kernel.org/r/5764213.DvuYhMxLoT@natalenko.name
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I plan to include this in the pull request for this series.
---
 drivers/media/usb/uvc/uvc_driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 6e55f91ac17f..95bc87a80a5e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2580,7 +2580,8 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceClass	= USB_CLASS_VIDEO,
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
-	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					| UVC_QUIRK_INVALID_DEVICE_SOF) },
 	/* Logitech HD Pro Webcam C922 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

-- 
Regards,

Laurent Pinchart


