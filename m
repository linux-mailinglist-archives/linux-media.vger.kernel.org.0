Return-Path: <linux-media+bounces-15288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA5939E37
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 11:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4911F21C13
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 09:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F0114D43E;
	Tue, 23 Jul 2024 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FhYSjz1S"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C722097;
	Tue, 23 Jul 2024 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728158; cv=none; b=ZnfixS/j1T0PmMGU4/gsGt6cpTq9MBEDe2nZth1v/emQrlGt8NHjCtA3Cod0LT4imE0YubIgrzX1WFoB14zLaGrf9N2SazjLiPlz+W1UgsRWbHOHQI5a37p/H6MsPrlz5BDcglQrqpnWfX5sJFaiivLXKk1yUlgNceKo90takR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728158; c=relaxed/simple;
	bh=LBspR0RbbvdyB9NgEAS7Jm6rYf6aPZu2TWqo0xRIwac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqI3r2IN7RqPPDuWr8MlUbCfCgSBbz1GOnwsvems/YguOprWyXsZ/Kkf6g7Wx2Pvy0kIzbdw1MqzmWOw7iBfhkQLqRjIJa5SmRAxMGguAqijGJHKOugTr4mnjgStl+9YnspBgpHY3NYh7KtHi3XjLfcDyat4KkPM0Vhpl64BiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FhYSjz1S; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721728155;
	bh=LBspR0RbbvdyB9NgEAS7Jm6rYf6aPZu2TWqo0xRIwac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhYSjz1SVPnHMkaNadaN/f0VP8GyKwI9mdowhp7isv5O9yewojPP23aVbCtzT7bRv
	 edhWFV79GnbgMx95dOzgsyuAQN73hMbKItTzYKmN+ShHWM7HLjCmjMJ07Yf0u/Akle
	 nKifgbASm1JesU0OKYDx6rIyQ//OwDQeIYqVpZliJUDPbYtcs+DucbbJzHQY+boEKO
	 MQp7bHcg59oJwivAyYBsnmNhGvLOI2710jaJ8ly62Cty6mWza+1wt56+EQHeK0FPuu
	 m5iOTfwygm1AAYjhFdGeuiSLPwxhEjLNx5uNWvu1+WRYpSVIqkjdntfdY6ZXZrXucE
	 jdWKOI3IrUnyA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7A153781167;
	Tue, 23 Jul 2024 09:49:14 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:49:13 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v5 2/3] media: test-drivers: Use V4L2_FMT_FLAG_ENUM_ALL
 flag
Message-ID: <20240723094913.4zuywzqsthvkowlv@basti-XPS-13-9310>
References: <20240722150523.149667-1-benjamin.gaignard@collabora.com>
 <20240722150523.149667-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240722150523.149667-3-benjamin.gaignard@collabora.com>

Hey Benjamin,

On 22.07.2024 17:05, Benjamin Gaignard wrote:
>Since V4L2_FMT_FLAG_ENUM_ALL flag mostly targeting stateless

s/Since/Since the/
s/targeting/targets/

>decoder pixel formats enumeration, update vicodec visl test

s/pixel formats/pixel-format/

>drivers to use it.

s/drivers/driver/

The rest below basically just strips the flag from every use-case of the
index, before using it.

I wonder couldn't we implement a macro for this, as I believe this will
have to be done in a lot of places, something like:

/*
  * Drivers can support an enumeration of all formats, by ORing the
  * V4L2_FMT_FLAG_ENUM_ALL flag into the index field.
  * In order to use the index field, strip the flag first.
  *
  * See vidioc-enum-fmt.rst documentation for more details.
  */
#define STRIP_ENUM_ALL_FLAG(index) \
   index & ~V4L2_FMT_FLAG_ENUM_ALL

And then use it like this:

u32 index = STRIP_ENUM_ALL_FLAG(f->index);

If we define this in a common header, then every driver can easily
utilize it and you have built-in documentation.

What do you think?

Regards,
Sebastian

>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> drivers/media/test-drivers/vicodec/vicodec-core.c |  7 ++++---
> drivers/media/test-drivers/visl/visl-video.c      | 11 +++++++----
> 2 files changed, 11 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>index 3e011fe62ae1..1b4cd8ddd7c2 100644
>--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>@@ -706,6 +706,7 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
> 		    bool is_out)
> {
> 	bool is_uncomp = (ctx->is_enc && is_out) || (!ctx->is_enc && !is_out);
>+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>
> 	if (V4L2_TYPE_IS_MULTIPLANAR(f->type) && !multiplanar)
> 		return -EINVAL;
>@@ -718,18 +719,18 @@ static int enum_fmt(struct v4l2_fmtdesc *f, struct vicodec_ctx *ctx,
>
> 		if (ctx->is_enc ||
> 		    !vb2_is_streaming(&ctx->fh.m2m_ctx->cap_q_ctx.q))
>-			info = v4l2_fwht_get_pixfmt(f->index);
>+			info = v4l2_fwht_get_pixfmt(index);
> 		else
> 			info = v4l2_fwht_find_nth_fmt(info->width_div,
> 						     info->height_div,
> 						     info->components_num,
> 						     info->pixenc,
>-						     f->index);
>+						     index);
> 		if (!info)
> 			return -EINVAL;
> 		f->pixelformat = info->id;
> 	} else {
>-		if (f->index)
>+		if (index)
> 			return -EINVAL;
> 		f->pixelformat = ctx->is_stateless ?
> 			V4L2_PIX_FMT_FWHT_STATELESS : V4L2_PIX_FMT_FWHT;
>diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
>index f8d970319764..c5f3e13b4198 100644
>--- a/drivers/media/test-drivers/visl/visl-video.c
>+++ b/drivers/media/test-drivers/visl/visl-video.c
>@@ -341,21 +341,24 @@ static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
> 				 struct v4l2_fmtdesc *f)
> {
> 	struct visl_ctx *ctx = visl_file_to_ctx(file);
>+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>
>-	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
>+	if (index >= ctx->coded_format_desc->num_decoded_fmts)
> 		return -EINVAL;
>
>-	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
>+	f->pixelformat = ctx->coded_format_desc->decoded_fmts[index];
> 	return 0;
> }
>
> static int visl_enum_fmt_vid_out(struct file *file, void *priv,
> 				 struct v4l2_fmtdesc *f)
> {
>-	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
>+	u32 index = f->index & ~V4L2_FMT_FLAG_ENUM_ALL;
>+
>+	if (index >= ARRAY_SIZE(visl_coded_fmts))
> 		return -EINVAL;
>
>-	f->pixelformat = visl_coded_fmts[f->index].pixelformat;
>+	f->pixelformat = visl_coded_fmts[index].pixelformat;
> 	return 0;
> }
>
>-- 
>2.43.0
>
>_______________________________________________
>Kernel mailing list -- kernel@mailman.collabora.com
>To unsubscribe send an email to kernel-leave@mailman.collabora.com
>This list is managed by https://mailman.collabora.com

