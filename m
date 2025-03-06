Return-Path: <linux-media+bounces-27731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B04A54F99
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAF016BAC7
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 15:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C90212B2D;
	Thu,  6 Mar 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iRYskNbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045FB1991A4
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276269; cv=none; b=DwZ13J+Ko5Xa4PZegOPbY98xiQAAM0Sy8o2fsAVX1ThjmAoo0XIHasqwCT37gEwuymPS9JYy8GrRG1zSN2tXHVs74Xu5C/xZ1deNJ1B7nD4xuy1hTVZQ3KWDxtHcQtoreH1vTf6ZE2h9hC+AnUfk3qXj06qOjrrhKnUvKZ606+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276269; c=relaxed/simple;
	bh=+tMzP8/U4KAu2Jedl6Pv/UjdmDc9hwAIH6ZLozGbNFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYC+txYwqhjyyXaIOoA6oILPMSmmstn88Dt4K/0r+8kM8g6ng/pkQE539aG93EUqEE+Lf4OuDDlvU7SVh0hdpmmubCENTdr5wAZHroyGP620uvAPXPORAYtzYouOQqOL5p3pWH7hKqF+G21AL5h5ejFAOfy3MjcP6evCmFiS/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iRYskNbc; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c3d9cdb0ccso160711085a.3
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 07:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741276265; x=1741881065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tebyllIN/Zbv6qJSF1gFn0ztQoDPanzaNONkrFerC40=;
        b=iRYskNbcRb5aI0TOVuOq6zWSGMvzSGnD0QaL2TWHuKIAJL+xz6N//zG+mqimioU/TG
         hPl5WyWBZ4/aMjPsQuEVqBufF2zfy9BX6qrp8INHNgY1Ozkpwq1QipfaEcs3dnQi+4RZ
         V/chydMSFMXjadsCMi0sJ+FY3tJkG4qA9rU8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276265; x=1741881065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tebyllIN/Zbv6qJSF1gFn0ztQoDPanzaNONkrFerC40=;
        b=Kp4pM+2c5HXDMJn8xSXQbvvvH+XywKLTFeEJv/8slWcyAm6/vPDV8mkbSda+jDY2AT
         ha97Hfb2mKr3+/h1BL35yaVUfc9CEe/4biT25mide3Ho+T036e28duqneSWsb2E8ZMnK
         9LdEoYNFX4HI8dbqwD9JdDssuka9DfJPh3vP4WyroqzGLl/KelcbJh3PPWBly3eJlZdW
         2CmDnd/3yhDRNPCnjSn+AO07AGGcm2JJ2FArLgKS3mG0FqJIDM49BsibZ51iomjl/MDo
         QULBbmFXles8PXqXYKEBpn3zuruqMywxZWDyEp4pwtLLtnjPHGESRlCjcPY1OWiWZI1r
         Vr9g==
X-Gm-Message-State: AOJu0YzNdf5EIcILpxtvylIS8E336BuGR8Zwj5QUofwQJH2GEWr/oGw5
	peDSN9PeDzupbJdp30uP2IF4fT+0CvHd3aukSnDf6vVAYuRSqdzG32MgB4vSJzCs9V/XOGy+IhE
	=
X-Gm-Gg: ASbGncuk+UI1jG1vmrZJHhO48fbSJ3Oc+BWINbyUS6TdEZ/xKr3L6oDGbDtPKjsu9J7
	DTIn63FF3b5u/qa3hxdW8M9858ppA7wH/3G7NfmOqQAznb0E/rMx3kmM23MFD6EmgTLX6J0dWqd
	gRcV+3wIS0oqwHCp0SnefK4TkOx7jSpXYrpBJn/ICT5a8ABPhU9lbMYvfCYcTslpt0KDPq7gX6I
	20ylMRuFeZMPlJzwRptbfllyNUcdD7nArxjHzftB1hDXgRkCHswT+J2Bby/Iouo6zzl+QRzaJ6i
	0CmvAvnJzoS2/vu4ic53AunCjbEudD2dV/WQucB840iRUwOzcQ8pGx6W5GUO03Kc5paKRm7AzW6
	/ksECxoUCWw2ig52Djw6B8Q==
X-Google-Smtp-Source: AGHT+IH5bWdUn9V+inAAYzX1nFsPFrQPywd00cBMWhKVgBRcwkroYe3aZ88m81OT1RfDwLpdZdOW6A==
X-Received: by 2002:a05:620a:84c8:b0:7c3:d07f:12c5 with SMTP id af79cd13be357-7c3d8e97042mr1392961385a.53.1741276265252;
        Thu, 06 Mar 2025 07:51:05 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e533a1a1sm106257585a.6.2025.03.06.07.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:51:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Mar 2025 15:51:01 +0000
Subject: [PATCH v2 1/3] media: uvcvideo: Do not mark valid metadata as
 invalid
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-uvc-metadata-v2-1-7e939857cad5@chromium.org>
References: <20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org>
In-Reply-To: <20250306-uvc-metadata-v2-0-7e939857cad5@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

Currently, the driver performs a length check of the metadata buffer
before the actual metadata size is known and before the metadata is
decided to be copied. This results in valid metadata buffers being
incorrectly marked as invalid.

Move the length check to occur after the metadata size is determined and
is decided to be copied.

Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007c1f0a766f331e4e744359e95a863..b113297dac61f1b2eecd72c36ea61ef2c1e7d28a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1433,12 +1433,6 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 	if (!meta_buf || length == 2)
 		return;
 
-	if (meta_buf->length - meta_buf->bytesused <
-	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
-		meta_buf->error = 1;
-		return;
-	}
-
 	has_pts = mem[1] & UVC_STREAM_PTS;
 	has_scr = mem[1] & UVC_STREAM_SCR;
 
@@ -1459,6 +1453,12 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
 				  !memcmp(scr, stream->clock.last_scr, 6)))
 		return;
 
+	if (meta_buf->length - meta_buf->bytesused <
+	    length + sizeof(meta->ns) + sizeof(meta->sof)) {
+		meta_buf->error = 1;
+		return;
+	}
+
 	meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem + meta_buf->bytesused);
 	local_irq_save(flags);
 	time = uvc_video_get_time();

-- 
2.48.1.711.g2feabab25a-goog


