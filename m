Return-Path: <linux-media+bounces-15389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D151693E6C8
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 17:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8457F1F24DDE
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 15:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67881422DD;
	Sun, 28 Jul 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnlCPFlR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29881AC1;
	Sun, 28 Jul 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181634; cv=none; b=jFJ4dspxeHz9KaOSSyRAOAXGLs46p8xQbFSDtVvfKz8G0bt+YEw28O/q8qZeCKkQ0E0/EijwiEhK++qCWJGkJ4KlbZSdbl5JkekEVp/8Kgel8ykd40ZgwYdX2a64zXHJfm18s1pmDB/hi+tnmFOc3HZXMxPcqlmgstL08UzVwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181634; c=relaxed/simple;
	bh=V46DqIUORprHxT0tdL5sWUEigjtXxLsPPYmhvSkOZUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8a2ZJb/cFGfu16HPn75K9CXUlACkwP1Ow4pju7jbve6oTbDAXA9H/Reqwv66cOejdJQB93GMoAxSj9dmvZdY0BHW1DyZW4MGpGqfCz9dDZmyODentHadLpTG/QZJYx4WbIPTQHPK5VpN6VOFBgbqijCuhD4g+tc0uHoZ8Rm9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnlCPFlR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A56C32782;
	Sun, 28 Jul 2024 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181634;
	bh=V46DqIUORprHxT0tdL5sWUEigjtXxLsPPYmhvSkOZUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pnlCPFlRRG0SorIqtwgJzpCY/IlBz9G9k8pdUf2Kd4o3AVGVvk39xD3xd7KqmLbZW
	 0Du+uHbxJPjWSjUaTOO+NECpuEppPjz8Kbx3MgBYQ10i6jyItF29Wcs0MFM+rIZu7o
	 kF43l7Z+fw+XXvp5lmoU+bUie8Ih1WxuVXj8rKf3e7FU32+gyf4g63/g1eG4iUWdEA
	 fIjdvaYiJcXdEp3WnYV1ns2clW57Jfaf3wVq2htmm9A0nLfS8NvuXlKPgXoYdWvGQ6
	 RPAXr6hNFV4r6iIsrmoqSvfr4Mt4fgklAZJRIZbx6M593Z3MkPvgcQEkwsSGbK6/Cw
	 nU6MZSNpi5KsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 14/20] media: uvcvideo: Fix the bandwdith quirk on USB 3.x
Date: Sun, 28 Jul 2024 11:45:12 -0400
Message-ID: <20240728154605.2048490-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154605.2048490-1-sashal@kernel.org>
References: <20240728154605.2048490-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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
index dd8ab24b55907..98af275cdfc03 100644
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


