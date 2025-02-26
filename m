Return-Path: <linux-media+bounces-27053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEAA46298
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 808A41892E70
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0B722A1FA;
	Wed, 26 Feb 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fmhPMZj/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7746E2288C0
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579817; cv=none; b=HzapJSjAI/oMqOpW95rbhgXvTFR+qZ5T66l8iQ9a828x8W1M36gQbbW7+zbUhXa4deDTA+kPbkhRXb8K+sfUR7NNGdkWDz/0NNEKosfnSX/e5zGfvgGRjP+iIdZcFqwIftf5TTiedAzYAgi+I7LFGwwDLTGo9k9IZq1egQieMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579817; c=relaxed/simple;
	bh=dw2qCpBVW0oF8+tSPBXZ2JZkiHmFw0P6jwMv0gbw+7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dgtc5T3+nAWH0nOutB5wHT/wrWkAJDQ7MzpMs0drqOPREpNvHuI+dNOgkC2EIzUnIbtJPQrxB+hrAt6l3NSWLtaMIg0TsPDzT/g44msVilS6a9gDk6TjRTdO0LMTkv5huqElcXGhPD1j1nvPXwp4GeX53bV421OqpXow6Zcn1pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fmhPMZj/; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c0818add57so692148885a.3
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740579814; x=1741184614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYDs65iHnr/HrHNwFIq/xPxUuGa4QvYVvNxcsi3oCLs=;
        b=fmhPMZj/4voxDZ3TwZxuqRET5S+aTihXU8U326TydySd5BkZSu1Eu4sHVmBKNJ0uGy
         ZOTXD5LODMdyrDSBl1zpknffXr1qmdZ3CffcZi1bW35zv5LUGW4tnLSehYrSsw3epCAM
         oK2yjxf/FkAW6Ey6P08x9MMb09em6QKt1urls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579814; x=1741184614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYDs65iHnr/HrHNwFIq/xPxUuGa4QvYVvNxcsi3oCLs=;
        b=Uqv/Htwvdf1OsWS/SsTdMH8X+DwRWD5mkY7ALLGPcbmScYn24cfnyHS5wASeBsUsvm
         iaDdJKPejuu/XE7wo/zEYc0TFeT3sxkKbBnzUFzS3H1GaDoBWOeGXlGACO1nWQLowjWD
         X0VINudC8xjUBBLi4YlKikiAJ/U6cLUha9v9SGMCU1mbMGhSXxMNd3CJ3u35sI3oqHrJ
         zj7MQqJYUH/b+TBw0jpdEBrBQgSEA5dy3KNUK4Xrvatg0fqyLMpcIl6ouXSNcYlxp3ZB
         AumZ+Hp6s1uT071uPT1oUi+KblUD+ii779ifiZM6BfMBgouT6Vrhk1RFEODYBZnZVftq
         luJQ==
X-Gm-Message-State: AOJu0YwbivBkIbggpAUinpaRJz5Xf2A0r/O0zq3La8RPYeXW257RqeSU
	v5OKxfW793vSSWBfN+ALW99indFHiTnHdIXUNDns1775KTHI4gTbdN8bbCcr1SR00eXlN6RKFSY
	=
X-Gm-Gg: ASbGnctXVicP/PEaokCnJHTtBrNjKv/9xHJHYlDB/r5v90xDXlesKWJAzQwNQE3zheE
	STNXcQcl3TA6RtPba4ks2OkO6KG6AhM+7oCfxypwI3H+zE9J2vTH8jqggvBclOki484ODKOIvKi
	TqCCvFF8qErr7A+ESEHniZfga27ObZEc5GSoyMA8AdQ3fIXnuPTDCzkzwGAFDsrbDLKmGvCg8/F
	gXKhGKZ+DaKsVeTpPP8bHYabj8D04F4d14xfGDDXDe2teH+UH15jiwkLiuN9rs0ntv1s2sRjeTT
	nv2FdlsoV4pf6MPbsgxVxI0vZZF27no0J126yixtIXOSq1ae2BPOOv4ABGG6K0lLwLAMFbndoZW
	GOM0=
X-Google-Smtp-Source: AGHT+IHuBFTmRowGPXy5shP9GSkIqBZ6nfFU0exVZOHDnxwl24falNaz1yGkMFwRvKIgYhyKtaXQxA==
X-Received: by 2002:a05:620a:2a0f:b0:7c0:b76a:51d5 with SMTP id af79cd13be357-7c0cf7d816bmr2776159885a.0.1740579814399;
        Wed, 26 Feb 2025 06:23:34 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c33cfb0sm246336085a.103.2025.02.26.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:23:33 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 26 Feb 2025 14:23:30 +0000
Subject: [PATCH v4 4/5] media: uvcvideo: Make power management granular
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-uvc-granpower-ng-v4-4-3ec9be906048@chromium.org>
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

Now that every ioctl takes care of their power management we can remove
the "global" power management.

Despite its size, this is a relatively big change. We hope that there
are no size effects of it. If there are some specific devices that
miss-behave, we can add a small quirk for them.

This patch introduces a behavioral change for the uvc "trigger" button.
It will not work unless the camera is streaming. We consider that this
the most common (if not the only) usecase and therefore we do not consider
it a regression.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 1c9ac72be58a..6af93e00b304 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -652,7 +652,6 @@ static int uvc_v4l2_open(struct file *file)
 {
 	struct uvc_streaming *stream;
 	struct uvc_fh *handle;
-	int ret = 0;
 
 	stream = video_drvdata(file);
 	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
@@ -662,12 +661,6 @@ static int uvc_v4l2_open(struct file *file)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = uvc_pm_get(stream->dev);
-	if (ret) {
-		kfree(handle);
-		return ret;
-	}
-
 	v4l2_fh_init(&handle->vfh, &stream->vdev);
 	v4l2_fh_add(&handle->vfh);
 	handle->chain = stream->chain;
@@ -701,7 +694,6 @@ static int uvc_v4l2_release(struct file *file)
 	kfree(handle);
 	file->private_data = NULL;
 
-	uvc_pm_put(stream->dev);
 	return 0;
 }
 

-- 
2.48.1.658.g4767266eb4-goog


