Return-Path: <linux-media+bounces-28898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C4A73FF3
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 22:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235001B6178D
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 21:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7B21E0DEE;
	Thu, 27 Mar 2025 21:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cv8Qi2qn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FE31DE3DC
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109538; cv=none; b=nqLcIrPejNeAEwxl703uz22AVvv8V7pVH/LUcynUr4V+raySezuuwYsbuPrIjkJuzoIlG74LCCfIU227fkOhLd4fLOiuYxxQkxuMWicGY4R8SaJ6HX38dNgTFUDReUXI/8Ey8P6VwOAinGW0mLD19wQOe9fmdCf2J1NIlTQI68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109538; c=relaxed/simple;
	bh=u4IW1YMngcRYBzzFD/tv5aieQQ3z97khfAc/wS3zzUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gacMsdRMFrVHBtxC7H7R5KFnQ5+HaV5nfxDcNeEnyn9bH9oc3ePFQYqY6S1wOnvJ+dU+w5gn6X6+C1gIThJd9S9U2pt1KH0orlMJFQF8zMWTMJGvjNwsUDhb0Jf4wgNFe/y96AHFhAQ5quPYhjfOxXNEZlGAgTYRO4zpjOVc5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cv8Qi2qn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47663aeff1bso15427431cf.0
        for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743109535; x=1743714335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KwjlyKhAU+wYuskPmvHPeSJQYXWx/0fJXM8H3E5Qeg=;
        b=Cv8Qi2qnhzE3haful29TGG0L2yPqkNpR0DQg5KHrGCJF/L0YyryKSG8LSep9LcVbJv
         eWdoelib5UfKTmMurcRn4xjnfQLPS7WMeBeNi5x+QVmdAT/PIOSyqwpOmFPoY1WRqCmY
         jrL03262tlf0Bh4K0Dcc2ZVOW7+/2BV02q/Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109535; x=1743714335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KwjlyKhAU+wYuskPmvHPeSJQYXWx/0fJXM8H3E5Qeg=;
        b=clTiEEScxXm5HlDTtEVt/u1tCxFg1E38wJQRMcAd0h5XSA6rNQuvQajwt4Ia17ciR1
         curtxQ4U5ZZcwcjUtJMqZGkzrQ4qMmEfjzGdGzyBCqNU3WO1MzpFvIqy/zyP9Yx4CbnY
         5U8qvlYBeICCmdzGUBGNnuojQkSTY2fuvgrAn0Ts5u3ssreIsID7GQQeh5XlA6luNejp
         B0N0OqG43K8V4cO5g+mBUy51tJIKxahhfsJzmCGAPcThsR+asYcrFRZOXjmCOERJuaRG
         HrEsIZ3UENAog4BEb09/E6JGFKOdZRPegY+PJWZmHFog0IDDkpDsLtO/DLkBSgPnxs0P
         XH2g==
X-Gm-Message-State: AOJu0YzSPJRPU7dryKTbriHJI9y4esUt3uZ1jg5sLvpZQtBVqt8WGt6v
	4XnduKSkR8CSnycsmRZknr6gACEyuWutu5ghgDXqcyIcdcirYTmCUWux10BbaQ==
X-Gm-Gg: ASbGncvPWGLoxzG1wqdDcC4YFNL7Y9qpXntPfOJ2gXtbRhadv7O6oYK7mVrQI1+DG10
	Wgj0Y0LFDceiLa/4TYPmN24SYgDd1srKZfoZ2HxiJQzL4X+gCMxWn8flClUgmvhy3CsrDWY6gB2
	3TN/gBa/RxRSEF21suNfft9Msag5VPLO812e11/iT/Am2YH43IM6j6eeeZeQaOl97TXW33CpjBl
	Bv3M84GJub9wqt5qwdpCpX38RH2mFHVxgUn59vqQjJJpZPPxUTe1RbelfLM2aS1i0F+NlJ+EfqH
	AqLGkDaioNuYeZgEXPIXMlZs3b/Uk3YLOgtXSysCT9Tej82LTl8t7xPKOhnt6/jZe/puSsvr72H
	VfWlyUfW6IFbFP1ZgSNb7xQ==
X-Google-Smtp-Source: AGHT+IEvWoj2opXBtmG7qnr+4ehjapoZ9QQ/ziUB6/R9e5qxlbmj76KkfS1jRPZ9mv2liy+lqer4fQ==
X-Received: by 2002:a05:622a:552:b0:477:6e8e:138e with SMTP id d75a77b69052e-4776e8e1408mr72968861cf.2.1743109535478;
        Thu, 27 Mar 2025 14:05:35 -0700 (PDT)
Received: from denia.c.googlers.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm2275421cf.9.2025.03.27.14.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:05:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Mar 2025 21:05:31 +0000
Subject: [PATCH v6 5/5] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-uvc-granpower-ng-v6-5-35a2357ff348@chromium.org>
References: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
In-Reply-To: <20250327-uvc-granpower-ng-v6-0-35a2357ff348@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

There are some ioctls that do not need to turn on the camera. Do not
call uvc_pm_get in those cases.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 0f1ed0387b2611c8d21e211afe21a35101071d93..668a4e9d772c6d91f045ca75e2744b3a6c69da6b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1440,6 +1440,26 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
 	struct uvc_fh *handle = file->private_data;
 	int ret;
 
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
 	ret = uvc_pm_get(handle->stream->dev);
 	if (ret)
 		return ret;

-- 
2.49.0.472.ge94155a9ec-goog


