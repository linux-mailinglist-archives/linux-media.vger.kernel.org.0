Return-Path: <linux-media+bounces-25368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA7A2100C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E788188B25A
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BC41F8ADC;
	Tue, 28 Jan 2025 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldxQKzxh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5295E1F8AC0;
	Tue, 28 Jan 2025 17:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086865; cv=none; b=Dta2rNT0ux0i0Mv8ZCvSZofr8mI6uQX2onW9H8Yzz7DOwsEjfM6yiGnXfR2xXf9DVTKnc/MI+IKmUfiROFIdlarK8FFmx3vqyYrP7uBL+tCoLe9A+mcudA+YNEjad1gqAe6obTYiar0fSIjg+eMkXf9kAM/Rc47lmhfSDSuCdEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086865; c=relaxed/simple;
	bh=oslsKDanm64YDd0gAzmSpw9O15foHt1Xn0Nh/lvxovM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LrXwdPv/drpniLeOIJZlGHkWSAOn3Jq7cocO7xe9H7NRCdTiuaJBhtgs/seBd42qLdu9Dsz2b+b/QCZGmQrmgYWzzhUlNdiVpVa88NRcHwohJEA7KDQtmHcx4G+E6lCpSdnwuJAer6ElUInNqXYlAphGfGu6oEKBDE/TVJ/KhFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldxQKzxh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31251C4CEE2;
	Tue, 28 Jan 2025 17:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086865;
	bh=oslsKDanm64YDd0gAzmSpw9O15foHt1Xn0Nh/lvxovM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldxQKzxhFsYIcFwzsAEdjleDqLmvFRydTlH5dwXaJO7ChlWQHyHUO4j2d7BGFGax1
	 sIEBcUv8T/mjsm59iMlnboXJ8b/tAqBgF54SBCIK21ee7WEtA+t5SMZk/PIfE1pFF0
	 5zZC1fY2Y2BntxkYcIcCquP5QXhvmJyH00vRZh3YvNetGVyRExD7e7HI89aM99C2wp
	 YiqWkqACZa3rI+9rh/ro+jRYdHqqB0P2RzCwwitVpR7OksLcpoCKGPXPrshjmRgFgI
	 pasLMjwstMH1yhUHHxVEfewcZz7Tq+UNQ2dl/nA46Cg1CzHNK3xHbupPKV34lnD5hc
	 8iLVseKSJywhQ==
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
Subject: [PATCH AUTOSEL 6.12 06/12] media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
Date: Tue, 28 Jan 2025 12:54:08 -0500
Message-Id: <20250128175414.1197295-6-sashal@kernel.org>
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
index 9f38a9b23c018..ce25e6ded5927 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2811,6 +2811,15 @@ static const struct usb_device_id uvc_ids[] = {
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


