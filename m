Return-Path: <linux-media+bounces-21909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55D9D7022
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2773162F7D
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE53620012D;
	Sun, 24 Nov 2024 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vARjVWR8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE6B1E1C09;
	Sun, 24 Nov 2024 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453146; cv=none; b=Scm8T76H6YLLCvIqa+54+3hYwoMJv9S8zbVNAzs3udmTlLb33StjY69tXSCWmhAoCgd9GucgBlZf4O0r+CymK4h2ZGwwrM9XdlCuJFCo1KYJq98Cu+WGCckQR13Y/gnkZ+0TXUw8u8WRhSJB1poGRx8MvhCzj7QT7spksc0SPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453146; c=relaxed/simple;
	bh=2EkhjLYctCgkHc274CsIrTKjqjuj8O1oY1geuVLQ3S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qU4KUvDexXVLMqz6fuInmNox2KImy1tr7y+ANq/mzzbLgXWDp10Q8etrwGH/R9OfVAuhGUz3WgAubZfFNz2Yqjb4Lbh9cLw+P0QYTeXm/P/MGJk5NvvW3zUgP0tF6/dEE0sTQJ1f7g6RJ8WOxQAnXxuED0mlQRRIjED341b5rmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vARjVWR8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB2BC4CED9;
	Sun, 24 Nov 2024 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453146;
	bh=2EkhjLYctCgkHc274CsIrTKjqjuj8O1oY1geuVLQ3S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vARjVWR85MVBCL9vOInhpy2BtdjqxIRvAtjY16qZ0/ayXE1Opay5y9ulbtGOPlgt3
	 AUMMFHE1hZZKy+vZcm7xDK3Mwf3RfOwvmHX9mFAd0jgJ1CdIOnhEb4DWP02rA5IyKu
	 nqkAuMhspUqleikD7gYhK3+L3XqtEsCcIuTtlL4REeJqfg7AoYb3RlBrzBawZm6X+v
	 ctQitr55RdBjr8RF806h+XerEUYF51q48L2gD0Uk/f56NpN2SO47MWKU7weme64oTr
	 HxWcEQwrIU5sWRI/BLalNx6CvjJixfvSIf8eWtF5Sqj8G22de4UElsWnxkSZ5rPQpY
	 SvG/aLZ0Zalmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rohan Barar <rohan.barar@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	f.langufo.l@gmail.com,
	linux@treblig.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 3/4] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:58:41 -0500
Message-ID: <20241124125856.3341388-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125856.3341388-1-sashal@kernel.org>
References: <20241124125856.3341388-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.324
Content-Transfer-Encoding: 8bit

From: Rohan Barar <rohan.barar@gmail.com>

[ Upstream commit 61a830bc0ea69a05d8a4534f825c6aa618263649 ]

Add Dexatek Technology Ltd USB Video Grabber 1d19:6108 to the cx231xx
driver. This device is sold under the name "BAUHN DVD Maker (DK8723)" by
ALDI in Australia.

This device is similar to 1d19:6109, which is already included in cx231xx.

Both video and audio capture function correctly after installing the
patched cx231xx driver.

Patch Changelog
v1:
 - Initial submission.
v2:
 - Fix SoB + Improve subject.
v3:
 - Rephrase message to not exceed 75 characters per line.
 - Removed reference to external GitHub URL.

Signed-off-by: Rohan Barar <rohan.barar@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index a431a998d58f7..db7d64b5858e7 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1006,6 +1006,8 @@ const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);
 
 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
+	{USB_DEVICE(0x1D19, 0x6108),
+	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x1D19, 0x6109),
 	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x0572, 0x5A3C),
-- 
2.43.0


