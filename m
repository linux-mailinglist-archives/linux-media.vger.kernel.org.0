Return-Path: <linux-media+bounces-15398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9893E71D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 18:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98EE281172
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2024 16:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DE91553A0;
	Sun, 28 Jul 2024 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy2EjsLz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682361FC4;
	Sun, 28 Jul 2024 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722181792; cv=none; b=Ru+HH3Sw20JWVbUJClksEbfNqaMgC+V1gXjaQcagMgQiH2zI/1b4DeWGWnCGpH5fLbVoNDYiO4CtTj3d+/5I8fSWcFM6e1ODwJwGSsAZfIDJHoFan+/jftJVyAVc+CyzFUrlvP7rrKFBp2eQCrxRnLmmDbgIQiIohsMg4H10oHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722181792; c=relaxed/simple;
	bh=WhoMDi3JLe+XeQRf6d1g4HSZ2Zj0m/r0petxVnL4flk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJbxe/BysKkdb1YY6JR2zvtbdjlmw5WWNDdWqGz4a/6c7HuSIikxdd37rOdIBi4oW8rGCxfxQxos1W+/7O5Kwz1co4X5z5FFhwpeL9ZhEATSs57hQa7l2nbdCDgzLw8MHHrCMuY0nq+ovIEy/ODMSarUh3NeS+PApJwQVTxfDuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy2EjsLz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3DDC4AF0A;
	Sun, 28 Jul 2024 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722181791;
	bh=WhoMDi3JLe+XeQRf6d1g4HSZ2Zj0m/r0petxVnL4flk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fy2EjsLzEj2nvfxSmClKAL54IvqRYWRVI6MJLMjre6DyddHhaCddmTpstaVBjsJLV
	 IQVhQHD0yHrs7D0BzlcNr/ueO1eNpQFyfvyL9lHz3vxUrUbCsiLAVSR9/qwJcHP9iO
	 iMlqDHRRXfIS8yyBJtGFMpB9vYlItZSFCvtAvHlT9nbiIwVgkD35Y+makBJ8l5VLuN
	 Qd56Gtn5kr3/jbDhoTD2RQLXj35tsp71zhf3zgGRKsCpVnYNS2nzc/bnUea2nd62is
	 bxXXJyJaDR1Xqe2MsGTT22e+KAVmClv+SaLkR26fEK/hXNtFNGiRnlV0lW4Ew9rpYy
	 Q1xImltOpXZeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/10] media: uvcvideo: Fix the bandwdith quirk on USB 3.x
Date: Sun, 28 Jul 2024 11:49:04 -0400
Message-ID: <20240728154927.2050160-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154927.2050160-1-sashal@kernel.org>
References: <20240728154927.2050160-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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
index dbba68701b4a1..30c8bcdda437f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -210,13 +210,13 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
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


