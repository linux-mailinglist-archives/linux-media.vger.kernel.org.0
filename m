Return-Path: <linux-media+bounces-25369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB4A2100F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09E9188B4FB
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1841F8F15;
	Tue, 28 Jan 2025 17:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTN/qj4b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DF11F8EF2;
	Tue, 28 Jan 2025 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086867; cv=none; b=NUk4+pE2+2XfL46mFWkx2kUx/zFzlmx/nETrGroenvW6bQDJWanuf5mBIXyhkIWAgB1N3DT10ebH8ozjbS6KBmjvWzZFeVuW5cmF1evKzxTNdNzptfeREf8PLV3NjYnU1CKC6UXWnrIlM9UZGsNgioF/yUgOYG92THqAZzDhgKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086867; c=relaxed/simple;
	bh=qfNFoK1bDU2BnqPCheqew/0rnMLXgjuSqRbf9n34Nn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=StjWWz9g1HRpBEKNNA6dZEQJA7oMvXnuIYCvo6pDAfmqfNG5A65ijQb6Z7zdmhkCa2xBxfH+QXb1b8i2cFhx4VrOJQFvsKjVtoOUiAIrtUXgB6RDmnFFwzqTg1zPo9W/pQnSDCBtKumDiaTch+sdv6DXrU3msB6/qcwh4Wtr69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTN/qj4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A764AC4CED3;
	Tue, 28 Jan 2025 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086866;
	bh=qfNFoK1bDU2BnqPCheqew/0rnMLXgjuSqRbf9n34Nn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTN/qj4bw002IrpwIt6DFN5VEnFYgF9tB5kIdsMgtokyysxkcjq3HR8GeHNvXCnKW
	 v/i0FhFBh4zBvz7mtC2MpLNRdMbyXUUF8vY47UHIUcm/htVz07K+eqof3timttJmll
	 +G+KK/kBN9elw7Cu7xX9u7nrx7IxWaojGLD0KJEUfEuyrMxGP3L07SwjxzgTS/Gk2x
	 yqZMrSMP/2UGlcRBqMpWVzD0LxIgKBwbAFQMFn7B3j3WIgELea1RRzFvOXW7Uh8q6f
	 MEClMguL6tOht1AkBeEC4V+af2ekg8Uqq+BXTKnlbyR+wxP+Xt75hA80L4Soskt6pm
	 lIi5wKOObHDVQ==
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
Subject: [PATCH AUTOSEL 6.12 07/12] media: uvcvideo: Add Kurokesu C1 PRO camera
Date: Tue, 28 Jan 2025 12:54:09 -0500
Message-Id: <20250128175414.1197295-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175414.1197295-1-sashal@kernel.org>
References: <20250128175414.1197295-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
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
index ce25e6ded5927..15fb73468dbc9 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2848,6 +2848,15 @@ static const struct usb_device_id uvc_ids[] = {
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


