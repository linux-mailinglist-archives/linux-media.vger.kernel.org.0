Return-Path: <linux-media+bounces-29067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9A4A769D0
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7F71655F0
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8776C23A9A6;
	Mon, 31 Mar 2025 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaQJYVOt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E093122155B;
	Mon, 31 Mar 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432949; cv=none; b=cu6ZKLZ1nGZ1mJunCcYOu7jOmYCoQkb99u02k8sNJCcu4o0yCp8538CoazANyiSOpcBJY41o46pueEeYe4MUJXSo2Nx6DC6CtpIXOUgVhG8gT35dwfySXbDI2sSy6lydfOlvP6KsHUWnIfByTGBASJmUYBMFxrpYdG9mp/FjCAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432949; c=relaxed/simple;
	bh=4R0Htt2gq6ksOh9TiwFrgNUtESpDyhLrodCEtfGfqL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y3cExvI5UqtGEP5iKwBEgAUEIDIJgCAP3+estjMfYdGQqapAFLlNAtvL1X4hCbamZW9DwUQgKVpMTPxr23lBPjCRUj0CztQ6NeTQ8niim5/9pRwA+vNX9DxwLeCT6aIQMPEMiwQkBJuiiTMY8Ta3KH43j8iYpnGk5HmRY3JNyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaQJYVOt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67752C4CEE9;
	Mon, 31 Mar 2025 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432948;
	bh=4R0Htt2gq6ksOh9TiwFrgNUtESpDyhLrodCEtfGfqL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FaQJYVOtQM24OItwvLhskbcL0ivzcX6J3XysMHjqS0GzJ6jiOM/Dh90HNpeNA9/oN
	 rtznd5IN/JMGYZsnShOP9fAGf7iNjhgXX/Uvw58oE5ejkQ9hnIn2KYKwjmVWfWsb+d
	 m4tw0/mVL+2AjTBodzE+ok+NJevUGadWZ5PwMJl5tCbmm2bUJsYxZcQw7+fLUwXbau
	 y2rHEiP1B9bjNbcpXFOlmvrdLj8sFssimzoNw6kFM8CVsqLsPMY7k3+APtExoAhrex
	 8yHglHfNfCZqthjEUPYXRCR8/8c93PGWhtGK5F2kyKl+VeG/3WlEalIUFqUzp1QtPf
	 unXAlVZfyhkQQ==
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
Subject: [PATCH AUTOSEL 6.12 17/23] media: uvcvideo: Add quirk for Actions UVC05
Date: Mon, 31 Mar 2025 10:55:03 -0400
Message-Id: <20250331145510.1705478-17-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145510.1705478-1-sashal@kernel.org>
References: <20250331145510.1705478-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.21
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
index 4d8e00b425f44..a0d683d266471 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3039,6 +3039,15 @@ static const struct usb_device_id uvc_ids[] = {
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


