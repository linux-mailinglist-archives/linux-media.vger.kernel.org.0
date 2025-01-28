Return-Path: <linux-media+bounces-25375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7862FA21032
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21611188B366
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54F81FA24C;
	Tue, 28 Jan 2025 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeZR8+ex"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C501FA174;
	Tue, 28 Jan 2025 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086885; cv=none; b=BWXkFUVMe6lizDi1AI1UOMRZoJFVRI7mYPSfdSu9wSwaCjHbfBtRSQ0KS7pw8Pb5lI86C1TASYlf3zNf0UVMq7NFs6XK8cjaZyH/5Kc+vlvxjhD//ByOuWuY4ritdW4DGcvMxUQVy7QtF2tsW3Yden15KT2+VkJXwvHjzJ8Hemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086885; c=relaxed/simple;
	bh=FEITVJmZnFS7pO7eyH2IKqKJlnyTe5UMXDKkUpBetm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TIJTm1ky5wnA77m49sqHlP0tNsUla4LKhPW6HGiTWWX7TGTODkG4WFvCP3t4kR5kbKHQ6d6bQL5shicy0rH4tj98ZrOsyM9w8DzSgCuOUp2gHZ3xjjwRpw35qs8xN6UbRIcrMyUK3cBtZYmAXRGToDTHd/5RmrSJUhV0liRfZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeZR8+ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85365C4CED3;
	Tue, 28 Jan 2025 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086884;
	bh=FEITVJmZnFS7pO7eyH2IKqKJlnyTe5UMXDKkUpBetm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JeZR8+exWNYd6a9rnaGkZ9317B6Y1qj7Rj4pA5OaqPpAZZKeG6luqY4zthzUAJWTk
	 tmBe8j4QN+YEje4hnn0ReujwuoIXorA3vAdradW/IfMM/pKGXrMRYVo4lKcNudtN8B
	 1QCPXLTDvgeP/E2bfdPYlQKevtPeaE00hjlP2wcOOLTwc7tFOM2yIASAsGPhEOVBWf
	 7ylySMjPgt2LuAU3AJXryMZbinkDWu+P4ll8ba+LDWWuWbnHMX02oZiK8GWIxqEs6X
	 venQG/EAcYRHD6pJpjDgs5fbSHTRErjyHvtzgj8yPMyrhrBXXpDE/60hYPPsJ+5apK
	 51MaeBHoSPxPg==
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
Subject: [PATCH AUTOSEL 6.6 05/11] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Tue, 28 Jan 2025 12:54:29 -0500
Message-Id: <20250128175435.1197457-5-sashal@kernel.org>
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

[ Upstream commit 81f8c0e138c43610cf09b8d2a533068aa58e538e ]

The Sonix Technology Co. 292A camera (which uses an AR0330 sensor), can
produce MJPEG and H.264 streams concurrently. When doing so, it drops
the last packets of MJPEG frames every time the H.264 stream generates a
key frame. Set the UVC_QUIRK_MJPEG_NO_EOF quirk to work around the
issue.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Link: https://lore.kernel.org/r/20241128145144.61475-3-isaac.scott@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1b05890f99f4f..20556bae02ecf 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2888,6 +2888,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Sonix Technology Co. Ltd. - 292A IPC AR0330 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0c45,
+	  .idProduct		= 0x6366,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_MJPEG_NO_EOF) },
 	/* MT6227 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.39.5


