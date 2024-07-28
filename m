Return-Path: <linux-media+bounces-15402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F493E74A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 18:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFE1B281BEB
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 16:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD23316EB7A;
	Sun, 28 Jul 2024 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AASywdkS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4516A955;
	Sun, 28 Jul 2024 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181853; cv=none; b=E62no0erefjxl/vpPn71ifUtWaD3o629Exx3du47cR7yA8Bm97MxMEMVLkvSrbybFV5mOPCF4C3qOowcCO2IJm66vL9aO3iteMxQ2xI5FrYcWXjDVm7jtvMP9NhKQ5rdUEpas6D4MTlVJtv6zkG/Nlv26cPxOfrz/Ddsj+SyE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181853; c=relaxed/simple;
	bh=dhnR+iBNeebtXAmYyH5zqg4VWtDg6d6KypKtjx8G8gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkfVb4KlkysDkG8GQ3xsWOpegszKTzRYuwIAvmaOGqY/Km5hY/LmrgX1VpFi2fxi85srfYcNfkuJmsjtJm8PukiNm4fczy9VoxGEYyBRuZrmJnUtbGrVdl2cMjKnDqQp253DeCJxX32cgtGfsIz8xUbqrGGnZJGjpcCTf3ocNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AASywdkS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D760C32782;
	Sun, 28 Jul 2024 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181852;
	bh=dhnR+iBNeebtXAmYyH5zqg4VWtDg6d6KypKtjx8G8gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AASywdkSvPj6aBBkctWnJKW+gkFWycsQGrSpAD2ky5uvgEJ0IDPjA/KQMgzD/9Yzr
	 FXNbcYz67Qgn6gFdhPn5Zxi1Bfx7GTbwjhJH15tGFBT5AD1yPLL2znhSxI4Y26mEAZ
	 cq2aUSmgU4Qbu0dUh04zEUCuMj4cB3un+whvYNZTTUIGBWQXZvSzlHmn90tzmwFqj3
	 s4T7hD8P6kUAU95pjAzpMUL5IlZMkzEI8JmZeo7LaAY4ngQ490hwCcB4pbIsBqrhdD
	 8n7B1khh9I93brZAo9SkNZiFRsSM4Gze35jpPbkbgrg6NetTDoeUnKOamIv2PQrKWK
	 y4e30kpLucLzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/6] media: uvcvideo: Fix the bandwdith quirk on USB 3.x
Date: Sun, 28 Jul 2024 11:50:35 -0400
Message-ID: <20240728155045.2050587-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728155045.2050587-1-sashal@kernel.org>
References: <20240728155045.2050587-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.281
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

[ Upstream commit 9e3d55fbd160b3ca376599a68b4cddfdc67d4153 ]

The bandwidth fixup quirk doesn't know that SuperSpeed exists and has
the same 8 service intervals per millisecond as High Speed, hence its
calculations are wrong.

Assume that all speeds from HS up use 8 intervals per millisecond.

No further changes are needed, updated code has been confirmed to work
with all speeds from FS to SS.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/20240414190040.2255a0bc@foxbook
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 43c9660b729e0..8a8271e23c63f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -207,13 +207,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		/* Compute a bandwidth estimation by multiplying the frame
 		 * size by the number of video frames per second, divide the
 		 * result by the number of USB frames (or micro-frames for
-		 * high-speed devices) per second and add the UVC header size
-		 * (assumed to be 12 bytes long).
+		 * high- and super-speed devices) per second and add the UVC
+		 * header size (assumed to be 12 bytes long).
 		 */
 		bandwidth = frame->wWidth * frame->wHeight / 8 * format->bpp;
 		bandwidth *= 10000000 / interval + 1;
 		bandwidth /= 1000;
-		if (stream->dev->udev->speed == USB_SPEED_HIGH)
+		if (stream->dev->udev->speed >= USB_SPEED_HIGH)
 			bandwidth /= 8;
 		bandwidth += 12;
 
-- 
2.43.0


