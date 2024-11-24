Return-Path: <linux-media+bounces-21876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C69D6F7C
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F31B22059
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FA91E8832;
	Sun, 24 Nov 2024 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFvhdrqv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F941E7C33;
	Sun, 24 Nov 2024 12:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452612; cv=none; b=VtDUrgXtnGBNsdFc5CnRKuHMfeMFrrf1ujsCiaz9NAENV0y7K0kzXSFl67ENWHHyfknZBsq73ZxqxIoaHhe2RrAo484fxGTge8GSkl7YMVmJ8a+OLBoR0dVH2MLwPq89XHuJ0DFz82b222GXfAfQHwPkNkSDMhnsIqWDMbObuNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452612; c=relaxed/simple;
	bh=Ce0ygzLU56bYhE5LX8XLPywDwfWKlETVvGomLA+Q8Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zf/bm8AtNYfje3v0N7ZQH0qa3phPx9Sjf4GVUCzSbTtUHKemZ++HvNCHLyjkfjzc6appsnIbrG8/PXZvDad+LIwalC0SbPlwMcj06a7nPd7XkHT+CtGIkNQtm14AIKXwJybrK3A/YaaPoTxKuL3IeyaQIpr7LvlV55J1scgOB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFvhdrqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D447C4CED7;
	Sun, 24 Nov 2024 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452612;
	bh=Ce0ygzLU56bYhE5LX8XLPywDwfWKlETVvGomLA+Q8Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rFvhdrqv1zMEqJ2Mj58ljGD0BSqqQmEtCMI4YozlbK86wAJozXc8yLvW9XQsYM74+
	 e6BcK7lizsAHllewKjg2bnw3ECr1DEwGuez3e42XiCfeGssw6J6kIFO9kEB0cnvPok
	 VJ+9CC3nzZ4g2m/sST4IRUkn1kTA/DtkNeDGlSrZkJCHrPxkSKFXKhFeFkQL0ku8Ck
	 eEThxkyB58N8H/7hVTc8RAPnrIHlgg1grzRt1GE5AG3/wDm/3QId//ip1AFSY1FRRy
	 X5dhTw3hVzSPIE+8WHIQHoocIOrexwPE0bOEwsepKyDw4FOc9nzl38kJW/h/Xo48T5
	 EeXqZ5yjmKgPA==
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
Subject: [PATCH AUTOSEL 6.12 11/23] media: uvcvideo: Force UVC version to 1.0a for 0408:4033
Date: Sun, 24 Nov 2024 07:48:22 -0500
Message-ID: <20241124124919.3338752-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index 72c67e280d01f..ddfcd53f24c36 100644
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


