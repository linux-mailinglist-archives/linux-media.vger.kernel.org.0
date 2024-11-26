Return-Path: <linux-media+bounces-22102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 759AC9D9BBF
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE429B30AB6
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008001DE3B5;
	Tue, 26 Nov 2024 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jtS5RrYw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A91DD543
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638035; cv=none; b=XCjsEOmvU9K6NoPzZfRK1OLebvb8Ul0HchWeFWbP1m1S9gH4JlqwRNZujt80PLRgm8OW0dEpJ0J2ZrQgbyNpf0Fd+zZ5mn6BEjrF50o+ubFccQDsJBsiAPTMlhJJ3v4/r8QpgbVNyuk/5rX6f2x9XuljtLWLjBxKGleI0/juMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638035; c=relaxed/simple;
	bh=3AS4904ZrJWWmtzo+XQDjxmA+Exv2p0QUHnWYejIDuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZRMp+M4xyjyUNWpwTK/kU7PoFIoz4KNGl8ktRIOZAFMcK7/Y59JMqBoUQFOPwMlV0gKw/XDLjpz0NYpI6bZSqgilepYge++GMKfGoJ+AOeLY/EsfpWi/kYqQ7H0uVcYdSX4RM5Bgk+wG2cqZIau/5iGkbvlmtLNUgDXXB8kpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jtS5RrYw; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d3e9e854b8so60485116d6.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638032; x=1733242832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38DVVdNZ+9OXPNjKWQaX+5zY7dH2BnytoxnJmJsLz5s=;
        b=jtS5RrYw9EeCtS2ZR2MwAnH1UDCU407zwTtDCQKj3ekRSvqxLdi6ftIBIOwPrZBZq4
         0VDChiwy+jBjcz7V5VIzhsL6AHlxXjBza4rzkDdCyIv9YlC75i7jLswYisWdcMlgb19U
         8QHMY0f9AK0qy7RTvtP4CsB2oYjcBcTlThnxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638032; x=1733242832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38DVVdNZ+9OXPNjKWQaX+5zY7dH2BnytoxnJmJsLz5s=;
        b=MxAXPsFAiFshq/v+AkYEaDntUZsClRArVn0YEPR9l13ZVNnbENPXKKJOl1Wm6oLIFm
         qPPD1P3lBGq9MjEugF3myTKE2RMKK06FH+06ZgBsalLhLNaPSX430rZAbnVzYH62/Fj1
         kyLEMyQW2b2NWiLutqx8wIMJPGYS1D8/RkFUfRgsJS8W8cRpiyfCdPFGXGn1LsS4l8M0
         D/12JBf6pwznq7ueZJTS7vL/LrzHwnFy0xdlMUbSwPegSULycDM7S5P8iFhUjQ8ifZfI
         cM3RHBf1ksqKgFjfwhlL5QBCWdDRhtNUKCM/JuTYbB0/DnVe31muqf+XdOcNDEqo9Cy0
         r+sA==
X-Gm-Message-State: AOJu0YxCvVra6cI+g8ilYo2K4duKj1rG0P3UwAOURW9H514/13jluuAn
	FaGV0uRhh3cS6XbGNAK0N27ezYdCp7aIaKwdmyDjccnT1gpdS2B5hwOYI4J8kQ==
X-Gm-Gg: ASbGncs1/UyGULzf60hAE8/L9oc2ilN8+trUCOnKkLQ9pzbLP5TdcyCAOf27c2X1o6l
	yppIQbLFGIb9PJkSGUxKCoNF5AWKdcrsQHPp1TBydZZPABifKSzzDbd2tcJlIc6FPi8WRbidmPP
	s7cwylLuPq8qzAthdNpipnzP3LVsDo/OMTNyDfL8+ImMc+QKuV5RXfBA1YvyRrPI5CaTwu9xnVx
	E55jEXI5BbQECvoR+lwX8xw+zVEXXG52FZ6Le0CMypEMBBJuzs7RkegxYn4tfrl3jPQlcvoJuJ8
	8V/BH8RlB8x7gkYn+8INTxIg
X-Google-Smtp-Source: AGHT+IGr/+2B6+LJ1kyUP+IBLvQ2LLQlOOS30Ru02Ofx3ziT/PGCoQW+M+Ou9DSuWC6URGy5iQFp+g==
X-Received: by 2002:a05:6214:268f:b0:6cb:c9cf:cd40 with SMTP id 6a1803df08f44-6d856bd1e51mr59641196d6.8.1732638031784;
        Tue, 26 Nov 2024 08:20:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b4e8205fdsm346532241.1.2024.11.26.08.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:20:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 16:18:58 +0000
Subject: [PATCH 8/9] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-uvc-granpower-ng-v1-8-6312bf26549c@chromium.org>
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
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
index 3595f67fd7e2..0a058798d075 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1455,6 +1455,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
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
2.47.0.338.g60cca15819-goog


