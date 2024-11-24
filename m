Return-Path: <linux-media+bounces-21895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2659D6FDD
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30730281B6D
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F386C1E0DA9;
	Sun, 24 Nov 2024 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkjRpROU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6681AF0A9;
	Sun, 24 Nov 2024 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452925; cv=none; b=lNFljmc2GjK96T5WKxnGY83yFY6cc5wzLzkBLjaRVLfg3OvlznkcpbJH6P/fb7Ha3WlUt/d7kuLge4nE55PXvF8DmfyjjQ8MH9I/ONgmWYFfLxkXqi9TbZWafJxuiLlwEGNXag+kNGreer1HDYhR5z5kQdhjh0Ok6x6CFO1+h5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452925; c=relaxed/simple;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EC0LpzdRs/1w9Ae1udk5vPlW/R8lBWgH4QGXgqTCr8pfYWqO1y8ARuW2RO12/7sVxd5LtSSqMFVWtDO6dpz06xYBWgXflpw9VGrkkZueUeOjwy6lg5K0Kg38QV5IFkXaOY2QyKEtxSgnckQvISsoi6qyuLTtA/t465BXWrFs320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkjRpROU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE46C4CECC;
	Sun, 24 Nov 2024 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452925;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EkjRpROUEE92jenbxtm0B5qNBiywIJ18RNL+4wI1tY/KFgJH2PThlhoqI+nnQKUdK
	 XBTmJxBatnmLCsiCBwTgSdZ6KUTb5zH1w9T1buj0MGAV6QDcsg5DB1CBDML9J0Pc0o
	 GdRxDF7Fjlpiy2SMakD6/KhedM5/SFWFUqa3b7l1/aULsLhuu6AjtgVkL54gmgTsr5
	 Z+pBUwHZxnAiXc/QpElvE+c25bnJs2rwyDQxdDbCYG7QFYz1CNXYRLnUeydqM1WfCY
	 EULacpxQvlDO+3zXkdWC/e0UHImVTEPQMm5dMI5NXdSYxxyvuLzhA/TdaNZ0YNpmYz
	 M8A8apmbojEIQ==
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
Subject: [PATCH AUTOSEL 6.1 4/9] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:54:18 -0500
Message-ID: <20241124125515.3340625-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125515.3340625-1-sashal@kernel.org>
References: <20241124125515.3340625-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
index 92efe6c1f47ba..bda729b42d05f 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -994,6 +994,8 @@ const unsigned int cx231xx_bcount = ARRAY_SIZE(cx231xx_boards);
 
 /* table of devices that work with this driver */
 struct usb_device_id cx231xx_id_table[] = {
+	{USB_DEVICE(0x1D19, 0x6108),
+	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x1D19, 0x6109),
 	.driver_info = CX231XX_BOARD_PV_XCAPTURE_USB},
 	{USB_DEVICE(0x0572, 0x5A3C),
-- 
2.43.0


