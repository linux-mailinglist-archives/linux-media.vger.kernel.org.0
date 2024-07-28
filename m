Return-Path: <linux-media+bounces-15384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BA93E66A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4421E1F2196A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8A084A31;
	Sun, 28 Jul 2024 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiWOKvmL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A44839F7;
	Sun, 28 Jul 2024 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181483; cv=none; b=CMQZKP/hDsLpvNnIWLw9ltzQKF1GSC8P2qI3z15uUrfwMFpnGyodvDyyIHcCuaosfrOc8Q50BFbHiImv0J4ANRfB/pUZZdULZkT7TDurDpl6w3SXNyeSan/chz6D5CJ8KiViwTvVcFXrmRh/2QeuRIKHQtc73OzWk05KLDQ9Vc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181483; c=relaxed/simple;
	bh=L24suszFLJCsJwc3tBub30j+RnIAWNNeWC0WfznbaOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4cA4zzjOhBk4K4I4/HUeyyrFt0JUD20JdqFpqcOnjlGPrVk0l7TH8lL2nQf7kXdAOXc+8o5wQqXgjb4cfBpHAbWe7Svah2iu4p4vaNtPrSK2T7H2hjAKy41NVn3G+QZoL8h389iUhy9h3Nl/+1powhhFNjjMXHLQ05FYUAn7FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiWOKvmL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277D8C116B1;
	Sun, 28 Jul 2024 15:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181483;
	bh=L24suszFLJCsJwc3tBub30j+RnIAWNNeWC0WfznbaOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MiWOKvmLXaHro9RDBZYRtnAk98DQVj70ojeGeH9bxs4Zp1oBlOjy30SbqmKHAAnlK
	 rGqRaNPDGjHqO/UXGPnyrZr8A6dHnhp2HmZolK0F0EKxY52xZKj5MtEAgAWzMPWNBq
	 P7XZCoBEnv/+1HMVEp5wzPnptvOgE4tWBug99DWYVNSVrWm51Ff2usxDBxc/0TpGe0
	 nsn9ebOEW5sY2TrtOltZXhrwF8FfXV2s5v0ewIaIxjL1BcFzjBKBZM1rehNaqucGbm
	 NPvR2DGIinzzMveOcZBHv8ezayyNjh9Hzc1tHxFZaew7C/SCXbf0ZtxeH14kK27raZ
	 8TeTb2TWlZ+/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 24/34] media: uvcvideo: Fix the bandwdith quirk on USB 3.x
Date: Sun, 28 Jul 2024 11:40:48 -0400
Message-ID: <20240728154230.2046786-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
index 11ef12d4fb698..20b03dd725201 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -214,13 +214,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		 * Compute a bandwidth estimation by multiplying the frame
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


