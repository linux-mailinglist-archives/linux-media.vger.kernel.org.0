Return-Path: <linux-media+bounces-15404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A093E75D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 18:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9973B282BD2
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 16:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D366918754D;
	Sun, 28 Jul 2024 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wk7v/Mhn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B96187332;
	Sun, 28 Jul 2024 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181870; cv=none; b=d/JupZjgGRfD4qS2bzcH2LD2ZTzfWmbjobC996S9U+wM8uvieCa9NUCxPVvgYQV6XG5MxF0TjDJj+trwWcS7/uEHCSz2bpQDGrVA/W0X6Ng6ShXEFZEenyeZSVZ4nlvA8UHw3qaAp7OzkIezy2Jm7EwCm/V71qcGXU+O6B7S7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181870; c=relaxed/simple;
	bh=3obwsDjbzEGMccyYCCpmXzclqQ5EEWRoQDmNqY9TCD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grylfVeWF34nqKJ//ZdkfHGSHkrZ1lwZbL/lrkmF50XvuhpEaHJZj/T6Kae1CVqORa+upKS32muh1gpO95zRNKCrBSN8l+8UCRO3cNIc3UFoURJjPRgh6WjIiKPOTtinMxLEruHFbMhUO8f2bwDdCisw/Lm3toWs88BMFV8CQnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wk7v/Mhn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16EAC116B1;
	Sun, 28 Jul 2024 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181868;
	bh=3obwsDjbzEGMccyYCCpmXzclqQ5EEWRoQDmNqY9TCD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wk7v/MhnnoDzUsfmixx6+aramLjjOaKsH867noilhzunCRz4euqexmbgnAKO7KcQt
	 xOorAJ9IsSMXjC+nuvncCmCR133dZB8fZtl8o75wrTPmaH6N8Xzh8izN83uMhGnF+l
	 4W2oD3VF8ZUeemSNToDvh3BJey9O0GdhAa58Zq4++pc9ActD/yBBfHmXshT2+v/HvT
	 OvGutHFm2r9V9krv4HbhZ63jgv/wLA0zJxVqXL0Dv539DBNwZnMTA3NB5x4HCMj0+S
	 EfEqxb08NcB8JNSTjnQuWCXwdb6Zcp44PB+4+FPeacJmnYq/7PD5E9sJiUPFGIjZxT
	 Omg+y4xQhHC2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/5] media: uvcvideo: Fix the bandwdith quirk on USB 3.x
Date: Sun, 28 Jul 2024 11:50:57 -0400
Message-ID: <20240728155103.2050728-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728155103.2050728-1-sashal@kernel.org>
References: <20240728155103.2050728-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.319
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
index e2c1b98fb4a25..3f0796141545d 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -212,13 +212,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
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


