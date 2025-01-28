Return-Path: <linux-media+bounces-25361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4EA20FE3
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D4A3A7744
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F3F1F150D;
	Tue, 28 Jan 2025 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz9fnvpf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A151EEA57;
	Tue, 28 Jan 2025 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086841; cv=none; b=hTmhiZc1e0LcfcclTbYh6Hzvj+00+Fw7zEtHcVFTnkKVW8+HytjbZ0nSDsGBxYrc+LbijNuzFvmSAGeT1Ql8dHgxBvyVKSXoeZF71Q6gxDms+q0y5RE2g21TOzXz4jtkLUSaVJw7SWBXsy90O4QQzJVr93IsiJZRLLVXBtCfiAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086841; c=relaxed/simple;
	bh=LrQC9XId3TURQI6afhx0E28boXtdrpg5E0j7fqK2qdo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qoN0tNL9fa1VkZI4VWnWzXzjgx1HcRz47bSgC978oIlqXxpzdmBtQhr1Os1fHMzJMfs6RU6RsrhPaOkl/g+4W0eL8if2GAR1n+qunqWqvYdu/I/byyH0vWvG6FKnluFCKLeAV/IYyqi4sz0h0PZypONM30G7bKOTR16cGwfFLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz9fnvpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7974C4CED3;
	Tue, 28 Jan 2025 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086840;
	bh=LrQC9XId3TURQI6afhx0E28boXtdrpg5E0j7fqK2qdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fz9fnvpfK1q2kblbdtWVKg3m0Ni9kiIxSjbtf3arq97M+qofdTeyz8qpO5hMTA3R+
	 bWsUU0wvlRQZOjTjBS5/0Fan16e8iVUSaMGbjXIMLCAYwdhDzn6yAtFPkVGtlA7TKt
	 qLrgRnjx1DNZtWm0BgNJ791EwUNyLLrYc7iX1fdI6vrsbQ4g4Y6r6EAHkLzn860BUt
	 SwvycZ/LD88lsEtk9FVM7CHir5YLS/5yNmefFukye2ItCWbvKS62ChgHpJpfrC2lpO
	 7tGxW+GHkWMdAjQurisDF/4M2OU7yJTjUVDBRgRigGMYMYEImOOKZoadVKHbg9FrV8
	 DsOfFa7SBdpkQ==
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
Subject: [PATCH AUTOSEL 6.13 08/15] media: uvcvideo: Add Kurokesu C1 PRO camera
Date: Tue, 28 Jan 2025 12:53:39 -0500
Message-Id: <20250128175346.1197097-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
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
index f76289bd8bb3c..cc5981c3be3a4 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2839,6 +2839,15 @@ static const struct usb_device_id uvc_ids[] = {
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


