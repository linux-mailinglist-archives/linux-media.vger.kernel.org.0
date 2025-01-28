Return-Path: <linux-media+bounces-25376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 164DEA21023
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEDDA16569B
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73D11E1A16;
	Tue, 28 Jan 2025 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PjMgq64r"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B501E102A;
	Tue, 28 Jan 2025 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086886; cv=none; b=kH0JCjUl4SkPqMlewP+SSAH80up3pabO86SjzcMG1PvTzKED53uP1OeGzECBF4DrTPdccdUIP4MXg8eHNAGiVdQKhvjYwsk7nXZG0k7v2n5pm1Knt588EhapsKzyvFv/sq6zlXtIkpYb2NLpXAQeeZoIpdgvXFBjRyCLAJkujB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086886; c=relaxed/simple;
	bh=/ZzK0uWLg6BfuIYSMl9oIVAkg8Fr2FlVgozznyb/knM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y4nkoeYpqN57TZu/5Hd74EZkpw200tUqlNhjAR1iAFCQ0xr4MGt9tRsCuQ7EQW64OYxbGfT8APKjLHLovoM0+5bYHQ5sRcj+HUK2RzHuAWMJNJLIxdMfqcEupBeab1hzSmVpntcIyPIT/wFDp7lukDRSJwk3lV9jT3zHIb2RvZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PjMgq64r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C34C4CEE4;
	Tue, 28 Jan 2025 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086886;
	bh=/ZzK0uWLg6BfuIYSMl9oIVAkg8Fr2FlVgozznyb/knM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PjMgq64rjqsO6diP3OXyJrOR7dQIV6x5/NASW9vF5nAFzwTkjMI4IJyJVW53hu38Y
	 01B8kAYSh1ojLiIH8SzT+CtR9ZCJm0LbaOuS0RsUGDXVj5vPPjKb6d5MxW6OvI0zP4
	 mAR0yRwOQhJAVanQLnKF8kb9XvH8rHf4Qt+I5qLoCyI5yQH94qwWwcz2HBDUAqb1JR
	 7OtpHAvJQhM3uM3hn3JLuJfg1ZGnIZU8jcLUO7FQanFe5T3NeVZW2d9cfAyFSM5k6n
	 rg9lUHbFEYQ8IbX8Ij+7kiaNhp0IhjjI93RxMZqCRGbQracM+oPKbIDm17BVoWEtnI
	 YF+ILCqJR3uAA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/11] media: uvcvideo: Add Kurokesu C1 PRO camera
Date: Tue, 28 Jan 2025 12:54:30 -0500
Message-Id: <20250128175435.1197457-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175435.1197457-1-sashal@kernel.org>
References: <20250128175435.1197457-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.74
Content-Transfer-Encoding: 8bit

From: Isaac Scott <isaac.scott@ideasonboard.com>

[ Upstream commit 2762eab6d4140781840f253f9a04b8627017248b ]

Add support for the Kurokesu C1 PRO camera. This camera experiences the
same issues faced by the Sonix Technology Co. 292A IPC AR0330. As such,
enable the UVC_QUIRK_MJPEG_NO_EOF quirk for this device to prevent
frames from being erroneously dropped.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 20556bae02ecf..5dc963d7d8c96 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2925,6 +2925,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Kurokesu C1 PRO */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x16d0,
+	  .idProduct		= 0x0ed1,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* Syntek (HP Spartan) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.39.5


