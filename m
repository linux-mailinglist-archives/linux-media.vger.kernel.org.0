Return-Path: <linux-media+bounces-31788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCFAAAD83
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 04:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21DF47AA1FE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AC628ECE4;
	Mon,  5 May 2025 23:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ8tAhT1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B82FA7E5;
	Mon,  5 May 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487371; cv=none; b=EM/K06a7qa/SZOSHFwhWPlaAjzpmYF3ZDuiWzQjORWYS+rG3bEAqGOtK8MAdZPMuw1lhLmikBprAUcUnrIBJSV+o8/P3nd6PlSxJ4WrvEEqkoX/hwtUcr163Z0JV0oV663i2HSceZdFDoppauonfHEkkggkDuZb66URJ2YoAV2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487371; c=relaxed/simple;
	bh=ikzvWiw406GCJXyN70LZHbijw0+CfJ3pc/l3O/+uycY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BQudxIWbTQ00B4IZAPDW0KHVNlA+MHumpruAin3bWp2tIYRP4G098w/PWoDY6cLN6Ek2tQ1QBueDTnZ3j7SMZD6g9LjeIB1bs9rbc5hTNXkWiktuPJ3UEcvLNV57vpHFQNzctkxEVvmAENw15csVtZuaHLdNDrLzaAUvN8pkyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ8tAhT1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B4AC4CEF6;
	Mon,  5 May 2025 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487369;
	bh=ikzvWiw406GCJXyN70LZHbijw0+CfJ3pc/l3O/+uycY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJ8tAhT1V3uaMBE8osu7IquYbV9PVa+n11mJn+lK+AgOMuto4eQ9MOvPQcWr/9mvh
	 jNtCWjpyd0YWplPvfAxiaWS6jpXbbkuyNRRSPvHTAhCjujDW14o7mBY4SC60MOe7X+
	 c1eJXfCeSBYFEO5vm1jyAywu4SVEfxrwHiFYHvwqoSqt+J+dToQsQhoTto+1hbyh7p
	 o3odwlQ1GnQcCf7nbQqm8uLf/9y27waL2eYEUbw8mK+gMHlyotSwlAQLWaMfxdpOlq
	 1PraShq3iXz9rTy2nL1qfpR6K/iR6cV92WF6Etx4Lh73c7MjjSDIwPhAtvv3/5DRis
	 GM2z02c0oAxfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	ribalda@chromium.org,
	christophe.jaillet@wanadoo.fr,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 34/79] media: cx231xx: set device_caps for 417
Date: Mon,  5 May 2025 19:21:06 -0400
Message-Id: <20250505232151.2698893-34-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

[ Upstream commit a79efc44b51432490538a55b9753a721f7d3ea42 ]

The video_device for the MPEG encoder did not set device_caps.

Add this, otherwise the video device can't be registered (you get a
WARN_ON instead).

Not seen before since currently 417 support is disabled, but I found
this while experimenting with it.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-417.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index 6d218a0369661..a9d080823f10a 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1966,6 +1966,8 @@ static void cx231xx_video_dev_init(
 	vfd->lock = &dev->lock;
 	vfd->release = video_device_release_empty;
 	vfd->ctrl_handler = &dev->mpeg_ctrl_handler.hdl;
+	vfd->device_caps = V4L2_CAP_READWRITE | V4L2_CAP_STREAMING |
+			   V4L2_CAP_VIDEO_CAPTURE;
 	video_set_drvdata(vfd, dev);
 	if (dev->tuner_type == TUNER_ABSENT) {
 		v4l2_disable_ioctl(vfd, VIDIOC_G_FREQUENCY);
-- 
2.39.5


