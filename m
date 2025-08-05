Return-Path: <linux-media+bounces-38932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B129B1B438
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E482C18A3D2B
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4A827510B;
	Tue,  5 Aug 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ej5tHuXt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406D2741D5;
	Tue,  5 Aug 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399425; cv=none; b=kNkydZeqFekujFoLiAZiTVknDOaM3VPAOjq6xnlExMvwkg+cHdxt/ByUrWADP/iNQ+iwJf5I/b7ovrS81EpThPxI5XZBkrCyVMfnt20uoNqJK1FKXpXjC+3n7xweEHWQ5M14hiRmPs8v2g80udhO7qoR52CPThQZwwR8WI/KE3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399425; c=relaxed/simple;
	bh=+sxCywi6qqW+yhLHsh+vSX1JSUvETrlNi/mXJtPrcrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Evt78Ghjb8eRJNLrmdj+5EpblcEILkjuhzdLatKZzQBTIU7K1JiHayf+Wgex6e6zcHUHW0aS4uNsKvdj5JKOpO9fSbcfydBMUOj+4SOCUxrIZRbw80OxF7w4Tzn5AEqmYkflB4dVWv7gKRoGLdGqEmuFaTyGkIZtJNulJDvucx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ej5tHuXt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D0FC4CEF4;
	Tue,  5 Aug 2025 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399425;
	bh=+sxCywi6qqW+yhLHsh+vSX1JSUvETrlNi/mXJtPrcrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ej5tHuXtRnDbv1jwS04RZ1Jwezkso93Qu4u4VDZ+xYyosTQqb+5Ppt7eLtQBgaCiL
	 mMj/GUGMCgEm+z1PFrz2gj4q3le7IXdeOK2nsIRvPzEQ64F8p4WUR+Cd8lC6f2mKN/
	 xs02EcI6NAxLBFPUgfRAjJM42Fd2Qrp/gawiwsOvTVMLlw+mopIHV6wDELDw07vrED
	 j2UXNV00AjMfhyZ+VvdRuZw9lcGlQJ8CwbEFFKWjblqNAT5gMh0przzyK0QkhPWBY2
	 6LjSUJerKqlcsiAZnrBdwvlmZRfIHw84oiyEcTIfXAdmzHqU3TCHathR453Ls0KogR
	 dXQ6eUh5EWYGg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	=?UTF-8?q?Micha=C3=ABl=20Melchiore?= <rohel01@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hansg@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.12] media: uvcvideo: Add quirk for HP Webcam HD 2300
Date: Tue,  5 Aug 2025 09:08:53 -0400
Message-Id: <20250805130945.471732-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 53b0b80e5240fec7c5a420bffb310edc83faf4fd ]

HP Webcam HD 2300 does not seem to flip the FID bit according to spec.

Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x03f0 HP, Inc
  idProduct          0xe207 HP Webcam HD 2300
  bcdDevice           10.20
  iManufacturer           3 Hewlett Packard
  iProduct                1 HP Webcam HD 2300
  iSerial                 0
  bNumConfigurations      1

Reported-by: Michaël Melchiore <rohel01@gmail.com>
Closes: https://lore.kernel.org/linux-media/CA+q66aRvTigH15cUyfvzPJ2mfsDFMt=CjuYNwvAZb29w8b1KDA@mail.gmail.com
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20250602-uvc-hp-quirk-v1-1-7047d94d679f@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## 1. Nature of the Fix
This commit adds a hardware quirk for the HP Webcam HD 2300 (vendor ID
0x03f0, product ID 0xe207) to work around a hardware bug where the
device doesn't properly flip the FID (Frame ID) bit according to the UVC
specification. The quirk `UVC_QUIRK_STREAM_NO_FID` is applied to this
specific device.

## 2. Bug Impact on Users
Without this quirk, the HP Webcam HD 2300 will not function correctly
with the UVC driver. Based on the code analysis in `uvc_video.c`, the
FID bit is used for frame synchronization:
- When frames are out of sync, the driver drops payloads (lines
  2506-2509 in uvc_video.c)
- The EOF (End of Frame) detection relies on proper FID handling (lines
  2515-2518)

Without the quirk, users with this webcam would experience:
- Dropped frames
- Synchronization issues
- Non-functional or poorly functioning webcam

## 3. Minimal and Contained Change
The commit is extremely minimal - it only adds 9 lines to the
`uvc_ids[]` array in `uvc_driver.c`:
- Adds a single device entry with proper USB matching flags
- Associates the existing `uvc_quirk_stream_no_fid` structure with this
  device
- No new code logic, just a device ID table entry

## 4. Low Risk of Regression
This change has virtually zero risk of regression because:
- It only affects the specific HP Webcam HD 2300 device (vendor 0x03f0,
  product 0xe207)
- Uses an existing, well-tested quirk mechanism
  (`UVC_QUIRK_STREAM_NO_FID`)
- The quirk infrastructure is already present in stable kernels
- Similar quirks have been successfully backported before (as seen in
  the git log)

## 5. Follows Stable Tree Patterns
Looking at the commit history, similar device-specific quirk additions
have been regularly added:
- `8c54e58f94ed` - Add quirk for Actions UVC05
- `2762eab6d414` - Add Kurokesu C1 PRO camera
- `81f8c0e138c4` - Add quirk for Sonix Technology Co. 292a
- `b2ec92bb5605` - Add quirk for Kaiweets KTI-W02

These types of hardware enablement fixes are routinely backported to
stable kernels.

## 6. User-Reported Issue
The commit includes:
- `Reported-by: Michaël Melchiore`
- A `Closes:` tag linking to the original bug report
This indicates a real user encountered this problem and reported it,
making it a confirmed hardware compatibility issue affecting actual
users.

## Conclusion
This is an ideal candidate for stable backporting as it:
- Fixes a real hardware bug affecting users
- Is minimal and self-contained (9 lines added)
- Has zero risk of affecting other devices
- Enables proper functionality for HP Webcam HD 2300 users
- Follows established patterns for UVC driver quirk additions

 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..bd875d35ec81 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2514,6 +2514,15 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  * Sort these by vendor/product ID.
  */
 static const struct usb_device_id uvc_ids[] = {
+	/* HP Webcam HD 2300 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x03f0,
+	  .idProduct		= 0xe207,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&uvc_quirk_stream_no_fid },
 	/* Quanta ACER HD User Facing */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.39.5


