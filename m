Return-Path: <linux-media+bounces-21899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BE9D6FF8
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462F2162A34
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F161B4F3E;
	Sun, 24 Nov 2024 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6Gr0DvO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2921B392D;
	Sun, 24 Nov 2024 12:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732453007; cv=none; b=Hr/ogFF99jHfo/TjmxWbe6aYc2sG3xg8IVGcvvFrvw9xAzbRxXz8nFgFc7dBgkFa0UpumI5njASxbrxDyR1gyEg5qj2L+9MRwoyDZiFrpSscPyJ8R7PslarDMKtGqgjS+90jEbn1rSTI3DZNP5EiQlwRH5CRjPvJT3OPRHjaGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732453007; c=relaxed/simple;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JakonXIYUKBorLVaDdUf6OzMvE0MdKElmtaqTgCqInkR6GQ6whqQnesyGkqLN/CUrfoHyhZ97Qx6TGZ5hDBMq++HldcpzQ1UPTa/NFPUqVho2iH2N++DVSO2s1//RF7RAFW/gurdCnAYy+qdYQ3/rp3wnyb0c++xwFrlGOdX9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6Gr0DvO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084CFC4CECC;
	Sun, 24 Nov 2024 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732453007;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R6Gr0DvOjCygiCHTmRjg3tQJtwm4MGTnBTouU2kQ7FkJeOZGXHZI16JPxaU00YTvN
	 vrLziiz7B1LpTlrmmlnSekH+IMy2tMP76pNUItUZrNVKLuHqJsfyH+RzkyICvX+/fx
	 XLYdChHUmsGg667XnftWCSd6XAa5NjpeGFpKcpDDu0uZHmb76SfQkp3UILK1NmMhbR
	 qoMJBVr74jMA6shuICQ2kMYkicmaH2qLIvPeE2+ufgZ5uLI1+J470rLJ1GSZNb07w8
	 LhysD+a4eHcWiee+U64TFvWwTVQq8Cw8pFfAoZidiKv+lUR6dvSS70F7x2TtH/gw9q
	 NSohonW4nURTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rohan Barar <rohan.barar@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	linux@treblig.org,
	f.langufo.l@gmail.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 4/7] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:55:49 -0500
Message-ID: <20241124125636.3340867-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125636.3340867-1-sashal@kernel.org>
References: <20241124125636.3340867-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
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


