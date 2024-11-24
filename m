Return-Path: <linux-media+bounces-21883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F59D6F8E
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436D0280F82
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D5C1F4265;
	Sun, 24 Nov 2024 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9fa7Xxi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7761F1315;
	Sun, 24 Nov 2024 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452717; cv=none; b=Y3eIay9BUJEnULxKPBx8pySJlJ1JEGM2EHvUDe1n+Hj+yWfqUx5+vTK6PSOC0JMrriCX9YwLoXuSFvO7PBXWtO8MIjdlx4Fb3XIxTrp4sOfa1ZG7m79QGJy2b/ldMGyyKG/ibikeS+GCyVj1Lquey593f1+AEryEVWKZakLs7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452717; c=relaxed/simple;
	bh=/0f3KOD20OYY1U528Tfy6HF2upnwachTggjiWUPgwtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApwJWaz/fArxNHUIsCKzNvNJnfbubl6Ggrg9ZSLzc7qeHS+66RCjXZz5QHYRDdXtF0Eu9/WgltY+SYmh3ge5cneq21kO4ns8PE71mk0Wu5clNWx6BdjblnuHRt7Av9pQ/iu85Cxa9iO/qVAAusUhDEU5960PLQTxmKx23qO8dDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9fa7Xxi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB6BC4CED7;
	Sun, 24 Nov 2024 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452717;
	bh=/0f3KOD20OYY1U528Tfy6HF2upnwachTggjiWUPgwtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e9fa7Xxic5b74xl0eSaCg433y+Wk/gHPH01YMU7FbnnONXrbYYmkCYtn2Wa2A2xlI
	 b3Jchmc52Xp7foaAbNRgclJNJbKh5uF/FfnSBSQiPBGEFE4JE+e/kes/fUI8jqd/NV
	 5cgfYBzMXX7UWCVOfadrUPvnzx20sDXnTrfUcJ8yBJ5ano18hjkMkxd1fDOYfrfIBI
	 gSOiurgwsPqSumsYSOiNAIHP8dkVhRx3EANmsqsSp11o8t2eY7484Y+jOHGaznVqnl
	 UXb+fxQHcvMXtIjDDW5RteUZppjJLFWpV7XJ8RxkigRdV+E4vnLDcCTDfqL1Zlyt1t
	 wa2bUWO7cLGQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Giuliano Lotta <giuliano.lotta@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 09/20] media: uvcvideo: Force UVC version to 1.0a for 0408:4033
Date: Sun, 24 Nov 2024 07:50:39 -0500
Message-ID: <20241124125124.3339648-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda <ribalda@chromium.org>

[ Upstream commit c9df99302fff53b6007666136b9f43fbac7ee3d8 ]

The Quanta ACER HD User Facing camera reports a UVC 1.50 version, but
implements UVC 1.0a as shown by the UVC probe control being 26 bytes
long. Force the UVC version for that device.

Reported-by: Giuliano Lotta <giuliano.lotta@gmail.com>
Closes: https://lore.kernel.org/linux-media/fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20240924-uvc-quanta-v1-1-2de023863767@chromium.org
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1f0021f3221e5..79dd5bc729fcc 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2433,6 +2433,17 @@ static const struct uvc_device_info uvc_quirk_force_y8 = {
  */
 static const struct usb_device_id uvc_ids[] = {
 	/* Quanta ACER HD User Facing */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4033,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
+	/* Quanta ACER HD User Facing */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x0408,
-- 
2.43.0


