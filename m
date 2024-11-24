Return-Path: <linux-media+bounces-21885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672899D6F92
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B7FF281A97
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98541DED58;
	Sun, 24 Nov 2024 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu11jO9T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A141F1313;
	Sun, 24 Nov 2024 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452722; cv=none; b=nbeOcJh5q74d6t135QUzbLNAR8j0OYWVrW1MgcpenhAWFM/i1+Uait6PkuCIk5abVjTkVLFHrJAcO0R/UBxpgQJ2lYz9lqragnHG6XqUkX5EYXEBIGRef8lisou3FcgN00kmI5NvGY1UmhPLB4UvPJgYKiCFOZS6zN1fIu1cZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452722; c=relaxed/simple;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIMQoE1Btc7tyW0G0Lz0dTO+UTm2cvVyy1bSiz0FlV3JZ9CJg/E0l4le7RCjAcWbvWvAQJ+LB+a7LedVXLCt8aQE4sw+ApFCigYLCHsW9CPnwZNGwD2Yd4sQ7cOzWFDKi8PWIXY7ARwKA6hZ6ClQsq9EHOYg3hh3HkqycnWhC+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu11jO9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0D8C4CECC;
	Sun, 24 Nov 2024 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452721;
	bh=EnkAdan4+3pCTuYiTGcXxGke+TUu8G2a0dJueH2IVYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wu11jO9TBxvKrCzXNJi+ByUiEiDSF5CCmz9K20w3PsVzIeDUvV1uBdELtqVVGhl/5
	 4CXudpN9OnGmS6DshlrggfuXKGy5rWZgLi64T8lm2lmiRiRvLcrxatxYgCZ9vaaQsw
	 46wg2V0X33ZzTo8CV7sj3ivk52nmR71Joa815p1goawZHNPzTyMyLb2H4Ng8esodnh
	 aLviRuIhtmduRSva+RYfM8UWKNFoh3Dp4v3oRQ+nZoLWBEKqHKq5BEQ5RKxZDFGzrk
	 kdeRF9BAkEOIj8ya4Xt83tyJ2mhDclwS2VVArUW6M8stcLF6BC2wu00qPCg0wqG/0H
	 81x9WYPx0VLkA==
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
Subject: [PATCH AUTOSEL 6.11 11/20] media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
Date: Sun, 24 Nov 2024 07:50:41 -0500
Message-ID: <20241124125124.3339648-11-sashal@kernel.org>
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


