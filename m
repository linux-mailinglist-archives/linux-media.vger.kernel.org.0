Return-Path: <linux-media+bounces-3674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8382D20F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 21:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4831F2140A
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 20:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCB612E6C;
	Sun, 14 Jan 2024 20:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFQTgoC6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7EE134C2
	for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 20:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cdae52d355so8410091fa.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 12:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705264523; x=1705869323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fa1LVXxsDL6Dp3KB5B0+Jg/uiEcGcSlK9r/uw/MVq5Q=;
        b=TFQTgoC6YUzZue9GxnTPXqlnBmVkriGIT8H93P5z3d/DjVRVRAWJVPqH7Lay886+sp
         QwKWScYTGLW5aNo4ZGxjgglYQGtqvF9mhvkSXsZn/wKxjMIIXQD/j/sjw+ODQwpfwyOj
         FDQekTr3NQ/2YywuyiaOrPKpQDVCm3FHKKZSVhFywh95cD1Z0xiMVffUgo3sIXM/8znZ
         GKuSl4DZK9YzMJKBKMXM2+la2ytdcuH0K38vmPI/M2+/rzRYEeKEvBIuB1pwLZ4B+IPd
         Vya/E3Je+z/lkGfPecb3q9WtuCT+OIvCtt2hQGB1LfKzMjbmqFSV8OC2WHWgLoii9ePQ
         6GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705264523; x=1705869323;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa1LVXxsDL6Dp3KB5B0+Jg/uiEcGcSlK9r/uw/MVq5Q=;
        b=XAujiI4qJW3DWfF31II2FdYpLgNJFyVzuQn9rSGc+1ktSo/K8QoaOH4lvuP74RnF1v
         cLqPn+P+SaNeTtFT133+icg6KlXBlC4JBHTwb0RlxWjwd0Mi4d/r0rlG/rYV1tz9nPCz
         Ad9fuEP1a5IbnQX7Zmtm4qiunhxRRCNzXFHgAXIYvc/Y3qweuNQCJ4DMLCsR0vYviJKa
         iX5hfXEnanaoQq/b5cdM+IjkzK2ufuYt+PSTcBSQ7NoeiKaTiFFWxmJjvZjC6l4LbA3n
         DcKEek9Us3Sbt21jMPQI3NNAAFmujE5uncBd7FKNtw6Qw9Xge9mAV935v3vKUWbTgbDW
         XN+g==
X-Gm-Message-State: AOJu0YzD/kZjoZ7mjPycogr4kO0coG+sui9nxch/07qnJYi8c2lD7FqV
	jDLk1mUfmU+QpBf/DCQ/tRsY4XB9/VfgmQ==
X-Google-Smtp-Source: AGHT+IESi58968eu0lS8tH/DOBhaLHm79JxP3GrirgyFzczuS4tbWjcHQf1HH/UX7kDnPbbQIIuMeQ==
X-Received: by 2002:a2e:b742:0:b0:2cd:4ead:9103 with SMTP id k2-20020a2eb742000000b002cd4ead9103mr1844780ljo.97.1705264522569;
        Sun, 14 Jan 2024 12:35:22 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id s29-20020a05651c201d00b002cd95030f93sm996064ljo.1.2024.01.14.12.35.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2024 12:35:22 -0800 (PST)
Date: Sun, 14 Jan 2024 21:35:18 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: [PATCH] media: uvcvideo: extend the bandwdith quirk to USB 3.x
Message-ID: <20240114213518.03e22698@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The bandwidth fixup quirk which is needed to run certain buggy cameras
doesn't know that SuperSpeed exists and has the same 8 service intervals
per millisecond as High Speed; hence its calculations are badly wrong.

Assume that all speeds from HS up use 8 intervals per millisecond.

No further changes are required. Updated code has been confirmed to work
properly with a SuperSpeed camera, as well as some High Speed ones.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..4b86bef06a52 100644
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


