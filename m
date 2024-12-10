Return-Path: <linux-media+bounces-22991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746859EAC0A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238D51883AFE
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36211DC99C;
	Tue, 10 Dec 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FdEGy4tl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B478F54
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822938; cv=none; b=oztWEShA/HpX6WWu01zgf7dsZHnf2mTyJfHvcxvb8Z3Pl41PwMiM4hSr63Us3GE8lDdBOhbrmJZ/r9VqedfeuwxuUzRfMCsyHeDa4OI2pgH7kPNA6uBUTApO8BMqjoDaz39kHkGGvxl9tMVWCqnxWVB85OjrWtFt9y9AFqWw2FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822938; c=relaxed/simple;
	bh=64tvBdAJsYjij/MYhZgHmQi1NAwPb0Ws3Nyiuj2wFEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lhB/L90ca0q4INmHdZNlWxuLLX5tgv/km2mqDDM+dZl6RdrwNAJvWmfgABQ5aQv6530AxDXelOmRphX2o8eu1U6jMtZflnk+9M+PWy624AxGwAeedWVg0yK2KJD3A40j9j3BmrxZpSavJ+zZc2pkZbcZqTMTrXo06PyZTfhb5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FdEGy4tl; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4675d91ea1fso19311821cf.0
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822935; x=1734427735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=FdEGy4tlxE1ABYGqzZpRsnZmsirrXrfPFw5SN5s0po1qLptNs1Wpe2BmMkcSQ4MNEt
         cVon5sgpRHRp49yd3SH+QvASBBvNWBoIkbt+x9uTVOYMkmMUt6MfhTzOgM+TtVEFATM1
         8t61iCxynytH5XPsnVfu81+I51SwFTus4tVFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822935; x=1734427735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjvmPnf8Z5eA5SFOWcK4xqjLhjw4Qhz4HdUq4wZg+ks=;
        b=lIF9QGKMujWG+NjHPEvbJqwspOtSZ6Iydodeqmb4wO7XMFY0s45wx08sdfVt3FKPJO
         XxDuwOBfG+p4M259n2ZLacA2LkhKpsSOOxJOD7jehwUp0l+14pvQNHO3A7CT5MaIlTZv
         1hbEwfP+hif5tyE24H55GqNDc0V1BVAB/eXTPly3qXzEItJ8z8RfeS33aYmirqVtHD/d
         /yp2HuoIQm56Hyi+3UI+UCEyn3YclXRJdcyOqEF3bb2mcFsML4fTYQVFFeeOgt4oUuDC
         3Dznc3iJLLkJjJqHGpJWZNdQBt2QDO6Rpos5pMKf4tuSASNr6wLJ1MALT1AI9jKZ4FPN
         S2XQ==
X-Gm-Message-State: AOJu0YxdASGZT5fJ2IRxMQ2qnkFFFf7ClEhBCMkWRd8kUoy/HFUiWmB+
	WfZi2MTtVYubm+pc4pbiF3Tux6rMGy66vTuhp5wGCMCeQ7wdRm4CxMqH4CignA==
X-Gm-Gg: ASbGncvV0VKQ+lFOfB9b+o2hTbCqmW6cMjAZ2BQY1yll5+Nv3FIKwkMsuhsoCNILaSi
	0sWPH/mJP40zgZfYMVbMMmJJ0I751YByX+VS169VLe3W7foPjHEsZaSYyuvD29brEUibc96x2HR
	SMTJm4s+5q3Gpj4Y81dgNqBRwFAM3CJNNixtoC2vtTrLEt8VAwjMNYMVdJj5Q3l1g0pWzHH1htJ
	npMOjpA1rvqSVlJOrs4NGiqg80OOPy5GZcygJjh5stv+A6bsUNytzlWgaVldzC3YKAl6rwmF0fm
	AU9uAOPFUi55d7NqFtvGLs1KuQUl
X-Google-Smtp-Source: AGHT+IHGAkrg9JR1HBN/d9GzBVA8UPusHAYSvN2VMXg3nbckSt2H7xOL5ABV9A5DnG2qBp0kGbezeg==
X-Received: by 2002:a05:622a:1210:b0:467:64c1:c4a0 with SMTP id d75a77b69052e-4677205c693mr65416141cf.56.1733822935529;
        Tue, 10 Dec 2024 01:28:55 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:55 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:48 +0000
Subject: [PATCH v2 04/11] media: uvcvideo: Remove vidioc_queryctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-4-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

It can be implemented by the v4l2 ioctl framework using
vidioc_query_ext_ctrl.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 97c5407f6603..39f0ddb6d01c 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1014,15 +1014,6 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 	return ret;
 }
 
-static int uvc_ioctl_queryctrl(struct file *file, void *fh,
-			       struct v4l2_queryctrl *qc)
-{
-	struct uvc_fh *handle = fh;
-	struct uvc_video_chain *chain = handle->chain;
-
-	return uvc_query_v4l2_ctrl(chain, qc);
-}
-
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
@@ -1563,7 +1554,6 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
 	.vidioc_enum_input = uvc_ioctl_enum_input,
 	.vidioc_g_input = uvc_ioctl_g_input,
 	.vidioc_s_input = uvc_ioctl_s_input,
-	.vidioc_queryctrl = uvc_ioctl_queryctrl,
 	.vidioc_query_ext_ctrl = uvc_ioctl_query_ext_ctrl,
 	.vidioc_g_ext_ctrls = uvc_ioctl_g_ext_ctrls,
 	.vidioc_s_ext_ctrls = uvc_ioctl_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


