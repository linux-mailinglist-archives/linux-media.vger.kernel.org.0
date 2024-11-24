Return-Path: <linux-media+bounces-21891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D79D6FB8
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFAE161F62
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B8C1F8F04;
	Sun, 24 Nov 2024 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLptiSUb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6664D1E00B5;
	Sun, 24 Nov 2024 12:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452826; cv=none; b=R42URRTHWjA6OQRb0lpXzmbDJMIEquCgnDESNzKwEN35DbJ3T9DrfRNjkKlumM8hl06sM9jjNFbs94+0HT/gFuOS/mMaRLVhocAEYBYEDfe5y/H3Xzm0kibzeeu/7y8hsV2cCbAfUpHYcGSOJoxOFUecbQ9Pth34dXYfjh+Cu58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452826; c=relaxed/simple;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUaf/bCKG59mTM7jnxiwwaK145yRiJVUHX7TDDriHDcktQjWbPh6oE0/wEe7CkCx9qYfaEmFd+fdtsP2JCD9cEHTiFZ/XITMnKX7njfPw168uAAvaUnKpg4XC0WjjT0R1XMiWetfbFyTMAKjX7NvsFnEloPSh/brtAguGrHflow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLptiSUb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9B0C4CECC;
	Sun, 24 Nov 2024 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452826;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLptiSUbD6WtU/P0tMG8yHAKJC1bv53k0ab7FIQiNpHY2/powKO3xZwcYFfTAF6+n
	 Ze1Z0xPT6sQcZg7oo7v75hxLex4cIKPw1fUBcWTTrsVO6hMeqcw9Pm7y4M7UqHjSQn
	 v5tPaYPy0y+NEGLAuvfCNaYspSjiRdzytrAi1kHX3eVMIdag4IfVutGq7x/6dDgSyo
	 NRAPQCtUzO8mYwWp4rmBJVe4JAKGOwpCb6Y0J1++g6rm1JKauMlE2U3HmhSqRt6ooW
	 1/E7Qnq8+K2lOUwZw4Q3X+EziMc5A9X1O354l6UqDmR2wxFtMfUsDmD6xRZRjzzk38
	 OY+0yB+23jC0A==
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
Subject: [PATCH AUTOSEL 6.6 08/16] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:52:26 -0500
Message-ID: <20241124125311.3340223-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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


