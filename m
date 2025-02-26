Return-Path: <linux-media+bounces-27054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE478A462AE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543BF17C310
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34A822A7E1;
	Wed, 26 Feb 2025 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V3KwENbW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED676229B32
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579819; cv=none; b=rCnFE3G6YY1AYMf+3AGwVhWLQgxa1ECeGlI/QMp7p7sVh73ZUT2JcsRJuGLZIkrX9GjVf9+EdDR+kmhCgvaloeY42q15v5xZhC8NpG0UWNo6hVwd0GVa0a7LFXOTty5u9yeXnPU8HOVOh0pXF73TwKCZV8XiW9/B9IqEtB/1p7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579819; c=relaxed/simple;
	bh=R9QrElg18QTPPLjHryDyJoCPAU+VfX0dGP/jT9Hqae0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYN0u5yevy7cNnsw1FBhJ0uXSxYOlq2eJW3MGyCvJ7jY3bcvDCGf9reLp3z632lukp6T02nplqhtuqa5Hd0tJ2z/aRZYOu9yw/VRq3QlsljV916Xown5YWQ4TE2Ho15yNJehqAJAyrm9xM6mtFFjl14CkrVlqknpS68Ivb002F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V3KwENbW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0b9f35dc7so933892785a.2
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740579816; x=1741184616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KEERa7N5D4CRNojIsTNdFIgtRBSnpqe9YJ9niy4368=;
        b=V3KwENbW4YPlMU9AqXfYm4P+ohsG9TPxKs7iobxygQiqcGWIFDclViut12mcBcLozV
         LqV64WuN4lu+7V0HB6yXPpL+0C50zLwMZnudWvKNrK2SeFNv7oluEmMkaragGqXhLTkZ
         KAUiGuWqeQA6EqvOYNC2lBK1PJ7YjULlpMVzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579816; x=1741184616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KEERa7N5D4CRNojIsTNdFIgtRBSnpqe9YJ9niy4368=;
        b=kVo0x99bM2tTg0N0kp30PD5rmxxqLgd8/XUPldWyZnltA7JKLD0RHYh0bBLJ0iIg7E
         z62hxUvwNMBUDEbNc9vXdLqMMt+VZrAbz4blagg8ljjDGQ89mbMvgewJOFniyqs+A3Eh
         dXqpcyN+1AU5hTC3L/kBKhCAGEcix5ifbbEVGYdh4+2/paCoRo5zCfBpJs7iAmlSD1+B
         isDCMZ7di+qcIf2QWceP0pZhASWJTSx44ocLTqOHL2DOmL/FbX/8aKSSNDpugMvFnd0l
         vDIJALDjpCKMC4/QET+88BBIxPDMhcLckLs+/d7u7yDxtA02nJEJPIPjUkA3pKc1iI4n
         KTdA==
X-Gm-Message-State: AOJu0YxGC1QgCCa2aiQY/ob4DqpD/oCV+ya9FsMHhV3jHPI0I8BBQ+qT
	VKuXdjWRJ2auTSApBuaw5GPx4pRG5aRckhpobwJuEIOhgLfFZKN/VzveE/CLaw==
X-Gm-Gg: ASbGncsTWOjiIVTWi8rCQ/BOfnZnMOEvbzx93VobjzVAO3LIFQkKWPCkPWlc2MFXHaH
	x5u9z7Jsfr7L/3LxGSYnPk+RkMQNTInEIGfmfJJDPxDaJ/gKfZ66d6fG5TfEmbtBKY2D602vn4j
	+Z0Bi/4XiTfwwjVAD9u5BhXBiAgHbhxPHj+0SlaIo0huN2jRZko4vsZ404opq3auO+8S0YDZn9A
	bvqPRewrVfJ4voxolmI9ZNrQEsv3MDei8vB3tn5HLldP7QXlUU5bU8zGRCDirTkCJ4Brd59A1bX
	G4vzkzhwpyifpZe+9rMV3J/9dgRXRhZidNFDZFYWcEM9TtDxW4WGSOSk+2P3rDLkVah2urtk4Ox
	lvDY=
X-Google-Smtp-Source: AGHT+IFYWattDD81UWH54aS/cRKfe95cQMADw1AlcxpsVhbtQXOtLPwSz7HYmPnEqiQEI4Klm2FKVg==
X-Received: by 2002:a05:620a:19a8:b0:7c0:874f:c87 with SMTP id af79cd13be357-7c247fcb77cmr516463985a.35.1740579815835;
        Wed, 26 Feb 2025 06:23:35 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c33cfb0sm246336085a.103.2025.02.26.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:23:35 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Feb 2025 14:23:31 +0000
Subject: [PATCH v4 5/5] media: uvcvideo: Do not turn on the camera for some
 ioctls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-uvc-granpower-ng-v4-5-3ec9be906048@chromium.org>
References: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
In-Reply-To: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

There are some ioctls that do not need to turn on the camera. Do not
call uvc_pm_get in those cases.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 6af93e00b304..de8d26164996 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1450,6 +1450,26 @@ static long uvc_v4l2_video_ioctl2(struct file *file,
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
 	guard(uvc_pm)(handle->stream->dev);
 
 	return video_ioctl2(file, cmd, arg);

-- 
2.48.1.658.g4767266eb4-goog


