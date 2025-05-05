Return-Path: <linux-media+bounces-31775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B6AAAAFB
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 03:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E676D3B299B
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B058381DE5;
	Mon,  5 May 2025 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMOOKsIF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A92DBB39;
	Mon,  5 May 2025 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486034; cv=none; b=IGGaZ732s3zkab2QnBgC0COPRk8YqOqKP9F8AGiZacDAz+LUyXbSTjypFP6BAjiYAyrdl42RReTzG/FkUhS8xRpFIpZBhM3gD7xIhChiswlVrEpikXk2vdmKu0HPN6LiTIYvN7f/AsM9DgVb0RODIFqCDbdYwYIo2UC6q4Qr/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486034; c=relaxed/simple;
	bh=GXQQVWklXWNAEB0XwIb9nq+0BoP+bo7EBFoAE8e69kU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pqGaErO7pfXV4ChG+ILBPm7S7awRGpM2V86e2zZOFTLEjK/A1SjLeiZITF1OVBlvP0GvPO9W8gqgnZEOHb12GNhsOn3SL1YKVM0yHo19GI6LeBKBYkFFpwJ9Dfx6pXHFMbfAHKfNPjoxk8pGeGCGz/XfJL/ex2R04LGnwZVCdtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMOOKsIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD9C4CEED;
	Mon,  5 May 2025 23:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486033;
	bh=GXQQVWklXWNAEB0XwIb9nq+0BoP+bo7EBFoAE8e69kU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMOOKsIF24LbYELjMEyVq7TVKuzgYmdXepU2nowxSMHv5t4XxwT/nqg7djmBX5a2P
	 TWsbK4Tmpu4DA2ll0RdDZd3Po8Y8GM1rMDAP3nuLE2F5Wgi/R3Yp5Z+Vs2AWTN6tb2
	 uBybEMsaYkOdrAgHmlC8norqdZ6ZcXyqdzRMBrt3X3RbuPV9+P19kcik+95oEBZV8W
	 10TBOhMNqCOOphuKeG0GqOdpscJTJlzMLqpA1sRGGkGm9izVdQPmuZy0jF/DRMSc+o
	 kDh9agkovr+IuaqbO59xxhfUjYLFI6J8CTCQ+rVv6/8S1VX9s4ZHP5W3H2lWHEQOKr
	 FO/QAILgPPF0w==
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
Subject: [PATCH AUTOSEL 6.6 120/294] media: cx231xx: set device_caps for 417
Date: Mon,  5 May 2025 18:53:40 -0400
Message-Id: <20250505225634.2688578-120-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index c5e21785fafe2..02343e88cc618 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1722,6 +1722,8 @@ static void cx231xx_video_dev_init(
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


