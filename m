Return-Path: <linux-media+bounces-29065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC190A769B2
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB619188E784
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C22123099F;
	Mon, 31 Mar 2025 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1c34UHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73121D5A1;
	Mon, 31 Mar 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432897; cv=none; b=E00+EXgjMMGYNEv8fodCmvee/s6cnuRFHU1vce8SWSCClexJnvgFLM5MPSEv35luReU+MQqA/mrYzf/HGzGrvbnh5hKvNYKRaQ9QlbqMcHdq/2AX/SNDTzWcsLx+xMWYJdfcMiyM+8pH5RvtsyOwDmPQdW0Ny1jPdIUT44Gyb5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432897; c=relaxed/simple;
	bh=BqImHxyP5D1K/WYNiKwOS/If7appcnjmTOLGjmFXYEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WRCCVPBNf0sossu7JqQW1sm51sNnCgwQRea3Mf9ouanOs5KA9k7HmgdyAe2yeCrcM5Q4z6yxUYTAZI9HdhaLDpHuGSvPMGfuJpHT9EvFUtSSdLtmY4v/urgypb1S+MaBviC/9ezI8QuIxuzutewACqXh5rLzoSU/LQBJw55KTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1c34UHZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39876C4CEE3;
	Mon, 31 Mar 2025 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432897;
	bh=BqImHxyP5D1K/WYNiKwOS/If7appcnjmTOLGjmFXYEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1c34UHZ/oJeMhbxvg2h8CYSTSQmIUuYUhNJQ+thrNUVGcO8M0n3kD2xJoTjSQStH
	 prf9UanCvxhu1z7X06AWbSJ1wmBIpPGHlllBZCqu1017Mvcu2al7VhSsOe3DMiEIkg
	 CA+H8yMKV+PmHAJZ6HvoqtGsIxJ8V8soHPd8zcGZM6ZeJaCCTNiLa/e9Z1SNgUDauL
	 dV+YuK1qILgEdr2wUk2Dfy4HWYPzE0vco578PokpeEMf++eCXU7puZnVAcKZsEEu2m
	 5F2iYiNV/sXNLzinQ0jqMVcaEwlNGiMmixKt4W2NoMSIBY2zp1/pyJf8E2So21xeY0
	 4rZ4DzI9l94pw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 18/24] media: uvcvideo: Add quirk for Actions UVC05
Date: Mon, 31 Mar 2025 10:53:58 -0400
Message-Id: <20250331145404.1705141-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145404.1705141-1-sashal@kernel.org>
References: <20250331145404.1705141-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit 8c54e58f94ed3ff28643aefd2c0c2c98313ee770 ]

Actions UVC05 is a HDMI to USB dongle that implements the UVC protocol.

When the device suspends, its firmware seems to enter a weird mode when it
does not produce more frames.

Add the device to the quirk list to disable autosuspend.

Bus 001 Device 007: ID 1de1:f105 Actions Microelectronics Co. Display
 capture-UVC05
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 [unknown]
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1de1 Actions Microelectronics Co.
  idProduct          0xf105 Display capture-UVC05
  bcdDevice            4.09
  iManufacturer           1 Actions Micro
  iProduct                2 Display capture-UVC05
  iSerial                 3 -1005308387
  bNumConfigurations      1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20241210-uvc-hdmi-suspend-v1-1-01f5dec023ea@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 011a14506ea0b..396a04542c045 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3030,6 +3030,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_PROBE_MINMAX
 					| UVC_QUIRK_IGNORE_SELECTOR_UNIT) },
+	/* Actions Microelectronics Co. Display capture-UVC05 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1de1,
+	  .idProduct		= 0xf105,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
 	/* NXP Semiconductors IR VIDEO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.39.5


