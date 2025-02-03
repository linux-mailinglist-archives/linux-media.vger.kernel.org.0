Return-Path: <linux-media+bounces-25586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC7A25971
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 13:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF4161618E5
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 12:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65C7205AA3;
	Mon,  3 Feb 2025 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CrXroWyz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8C2054ED
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585657; cv=none; b=GB/JKeejHw3BkCgJn5rB0tAuoiaeUmQBNwf5m50xqtGiur041B0P/Ik2z0vwxqjVy042ZrtZqEzHD3V2Ob8Zm4hAnitUKI4jDmQqg/LakIxgw2VipOtcT8byx+VRIIM+RbIVEUtfcpW9pLBd5H7mHUIghKA+MJuiq6yGslhQc60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585657; c=relaxed/simple;
	bh=yM86SLF/6jAKbL4AMHEe3in6d4WcCvkufzZCjMCgLeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KudfwtSOjnzLjf7wH72pdsBYiFMXkedvTzS7PExvwoYTcOiTsTp/MTPeKzIUX4fUNP8nMwZQBJhGwEq4MSO+mUpLHF0+mJwE7VryQjb3uuq4NoqLRHjRApR4qCAc37wltF3oCbGSMcBUUSOL8syCH3ZlPP4sB0LurwXYfF5lbOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CrXroWyz; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467b086e0easo18589911cf.1
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 04:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738585654; x=1739190454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hiuieGhjR7AOoPsrkH+6ULiRM3jI6DLF1E4FTTyWNk=;
        b=CrXroWyz5/rIBgI3iizA0mxANf/TufkLET+gWRNG29JzzLdH77e8ppvkhmIxWVaxq+
         1SCp2PMIPJCc+9Fn8VrC5umDDhhR8E+H/d8WFZ2EuL3zLnqezOVetgDRREvgamk5NLkn
         82jMCyTnXQB3Z7gXS8Un/uEk4t8SBrIavXE14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585654; x=1739190454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hiuieGhjR7AOoPsrkH+6ULiRM3jI6DLF1E4FTTyWNk=;
        b=NL/p57C8cueJE7YIax6mumjnmbm4oaSpD8n4K6kkkzbDEOQBxIMVtxOc7vxsd5oKvS
         ODypQfikCgihmu3+JQTgiptYnZ7n4r9foAk3lFDBQo06q2y6DHeJCosX30a3a6nAfLou
         H8CzI9+WSXulhtMfCTW5f3eSQaeihGYkFnJfFPoW/YNriYtj7r7qhy2EmzIADg3U4N9N
         QpWALNEkLtTgm34DLFQP2x7XTSo8ecVKSba3EdHXFtngViyBQCNCJY6kZpZBBJM0IsTj
         xX008eqwgNK3aVQpUJhljZUzQmarsdDvx1BsK81GHo4S40z9BTa6BhVSP3EogULD2Q5W
         qWYg==
X-Gm-Message-State: AOJu0YzfHzrJRvpzWKrVRWiXIpQAGH7X/82625wRFLElnqx6woFNQ9we
	u/i1KRtVMFDsLESyhlKs7iZHsm1meg9lJQyfDTXjBJx7v+WayTw4TFe0jFJLDw==
X-Gm-Gg: ASbGncuNCCikq4YirtUu8jmdmoNLEphiPLm0Mw+9+oLShfofn2Ptnmdzz7gp2oGhf+r
	5iq/UiTL0VKwGoVro46VSvFW8lCjCbfEkGtE0ufuPl96tCR0gQJerVTONniQohfPc5Cd6HOrFcF
	NQfCxTNvzNpyzZSVolYfxsrHaGxxVHODfgTM6z07Qvon1QDGaEaty56Wv5E9NwtZW8O9ywheXWl
	6STJohLmPRlC/f+NU2bSdl1AKGx5Y0T0GXrtv4eHAuRwpGWEBcPcCq0UQjiLFU49PB/4BFge2DX
	Pi7suTDXHVRI8AaQS4Bu252XFkdoLfhaDYulan/BVbJjQa2rOjRh69xQ0W6VrqItXA==
X-Google-Smtp-Source: AGHT+IFIwj70LhWN6hLpuq3VFcv+Apm216xu+A8hJyiHZuuHCWjbdAE/0GZTA+6rZasVQKTSwB6rlQ==
X-Received: by 2002:a05:622a:1451:b0:467:73bf:e2ca with SMTP id d75a77b69052e-46fd0b916f6mr246510691cf.46.1738585654488;
        Mon, 03 Feb 2025 04:27:34 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e0c12sm48240941cf.37.2025.02.03.04.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:27:34 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 03 Feb 2025 12:26:25 +0000
Subject: [PATCH v2 6/6] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-uvc-granpower-ng-v2-6-bef4b55e7b67@chromium.org>
References: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
In-Reply-To: <20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

There are some ioctls that do not need to turn on the camera. Do not
call uvc_status_get in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 90ec6f0015ca..121a582c7945 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1379,6 +1379,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
 {
 	struct uvc_fh *handle = file->private_data;
 
+	/* The following IOCTLs do not need to turn on the camera. */
+	switch (cmd) {
+	case VIDIOC_CREATE_BUFS:
+	case VIDIOC_DQBUF:
+	case VIDIOC_ENUM_FMT:
+	case VIDIOC_ENUM_FRAMEINTERVALS:
+	case VIDIOC_ENUM_FRAMESIZES:
+	case VIDIOC_ENUMINPUT:
+	case VIDIOC_EXPBUF:
+	case VIDIOC_G_FMT:
+	case VIDIOC_G_PARM:
+	case VIDIOC_G_SELECTION:
+	case VIDIOC_QBUF:
+	case VIDIOC_QUERYCAP:
+	case VIDIOC_REQBUFS:
+	case VIDIOC_SUBSCRIBE_EVENT:
+	case VIDIOC_UNSUBSCRIBE_EVENT:
+		return video_ioctl2(file, cmd, arg);
+	}
+
 	guard(uvc_status)(handle->stream->dev);
 
 	return video_ioctl2(file, cmd, arg);

-- 
2.48.1.362.g079036d154-goog


