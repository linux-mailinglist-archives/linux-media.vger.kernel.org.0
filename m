Return-Path: <linux-media+bounces-38811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A3EB194B0
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 20:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B36B7189242A
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 18:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7535B1C860F;
	Sun,  3 Aug 2025 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVJ+oU3p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5C4C8F
	for <linux-media@vger.kernel.org>; Sun,  3 Aug 2025 18:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244126; cv=none; b=pQbV3ui6v8HRDMjs6xez9+ueM9MLO5Dtx0WtiG5j3pPwH/+YkMhjMJEEqaAOBP68xb1Wu1CyiCH7UnfQgjDB2+mxbxdwTo6ai0BGd5we4HFKFey6XwrWs1PY1yUOjHIMJdqe6oH2M03qmXy1827Fm7Gtksfo/6zWZNEsYtlwXt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244126; c=relaxed/simple;
	bh=j7bjrZWrsbdDpFxYOCkbqUx7Wp11ekk4d2R2728yPgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cEarWoaBLV4LT3Jl9DWC/rokAEu+Ntc5xyjPOpZzdcd9ftnA9eDCDLgDfGVdpYSr/kyWFINvRxSHscOAWU+NceoSFoZOQw7XRgWvF9tKQmrbQVSFvFhifoZ+pbR5sl2s/7luabMpKMJvtUmTmNpCGolKKv1iXO2kpcIBuEvDx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVJ+oU3p; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso4778981a12.3
        for <linux-media@vger.kernel.org>; Sun, 03 Aug 2025 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244123; x=1754848923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PswKZBkIj5wvQra9eFzj+cmOMtpOj3ue8YzHhRfK+RE=;
        b=WVJ+oU3pY8YCoqimi8ogR7gBabtvmX5Gegqwdmwy6WNNZnCLR5aee7aMYJFUxPv8GR
         n5ywH4s+p+cBMa2uTTBq5QP2de2EMgToPijdgOEb825F6wWuRnzysXKXv6JifGO6Qrq8
         qZFKYCCqgPSssbrffIhC4UblIX/NFoeMp1ty6thPgeWg87hT+PpQhuwM6L6PPytwJ9zB
         CdhrQxjHR4X6YMOPZ2leb78GG2ix8DixPzcgQjw507kajxtmr3QPa2TweQz8hcaTW7JF
         /i8PO9oK9YEHvd4Fdu6Z+o0whXYRunJBYZqXByTe+vYfq2rcGcX3BnzbL2pve/R1trv1
         938Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244123; x=1754848923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PswKZBkIj5wvQra9eFzj+cmOMtpOj3ue8YzHhRfK+RE=;
        b=ZThw1B8f9YuMnGPr8Pva9mS54VPQz7G67V5o3ub9V5Bn6HX1SNTZk13fxqTuhb7eNN
         Qky8gXJpGWcNXV5Eb2wVsSKd+95ULIKSmIpOu66MF9/0NKalkkH7cN0t4AAbQUdV0BYW
         xTmelGM2ZvU+A2935ZutfUFq8iAuiG6iAVZQ5QGL+kVYG+fJX1i9p3lOgqkeQUHLn29/
         2Z4YcVm8ntkqo84PurS9Tjbpb39ADLMrp0SO6JSo03et+GfPMl5Vc0txdL8AgHCWp7Bm
         C0CpxBLbSn/68TLQ/pdaZhDhzVqh/W1AnnXRpny+h799jwd3yXIO+Higt+R+ZezANqsr
         IDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuRjLUuOQLmtFKSu44/DsZeKjOAgsfAFZmzL7EyTuvXC8x4xw67llObq1yHwQo4BmEqZ9Pr9FztHp/ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgolBoCAaBUAb56ROGWXOknkpnucnpXVBF50BJpxuCNB9Q30m3
	e+4G2zL2QgZRB39AKuzw3VhHXWZ/MR48eotPb9BYB9xt/079xbLIVhBl
X-Gm-Gg: ASbGnctZuEggow4FJL2jI3V8NwgXlY6DgPjDETmwJCIteJ90V5gfMsKU017dqof6iy7
	V4vYibLFoxbs5/2zDHFnd3IBru3reb8L8eJ+98zUF1/sCUkrhluyr1zWpHTIBbvv+ax4oWawT+r
	4/BLnyyd37e175uvkTukilQmhC8O6MFeAziej4KzjZSShpzOTq7pi2f7DGhvpiE8hBzp8Q3GdHs
	OCThoslq3TtbzNqBU3ml4JVw1p1AfrUFPGsrhTkn1Xa9qcULT9bICO0N792x9dPUQLtNi/ngN5G
	UHsJYQndoacZy7Ui651iuIxzYx08mJl3ZD5PESb3QScowL5roQWX2l69OpAJKXVobIRaO1NYJ3d
	DEw8WweC5y2Ds1RRF+0RcFVganxI0+HlMaw2f2Ch1Ixq3wWw=
X-Google-Smtp-Source: AGHT+IHfKJUBeksOuNG4Jcg7GuqyRnhd1W/FpRYbPHqGZjNOgYA8IRh4daZIwLuyXYHzF+MSAzmeSw==
X-Received: by 2002:a17:906:c10b:b0:ae3:bb4a:91fb with SMTP id a640c23a62f3a-af940294d11mr791295366b.59.1754244122844;
        Sun, 03 Aug 2025 11:02:02 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm609387066b.48.2025.08.03.11.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 11:02:01 -0700 (PDT)
Message-ID: <c52ec06e-e4b5-4f7d-af13-0e2b712307fe@gmail.com>
Date: Sun, 3 Aug 2025 20:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 49/65] media: s5p-jpeg: Access v4l2_fh from file
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 linux-media <linux-media@vger.kernel.org>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-49-eb140ddd6a9d@ideasonboard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20250802-media-private-data-v1-49-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jacopo,

W dniu 2.08.2025 o 11:23, Jacopo Mondi pisze:
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> While at it, remove the now unused fh_to_ctx() macro.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>

> ---
>   .../media/platform/samsung/s5p-jpeg/jpeg-core.c    | 25 +++++++++-------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 2a57efd181540183e7d2b66d51f9f2f274ddd100..81792f7f8b1671dba2023f99b2779784d9a14b8c 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -580,11 +580,6 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
>   	return container_of(c->handler, struct s5p_jpeg_ctx, ctrl_handler);
>   }
>   
> -static inline struct s5p_jpeg_ctx *fh_to_ctx(struct v4l2_fh *fh)
> -{
> -	return container_of(fh, struct s5p_jpeg_ctx, fh);
> -}
> -
>   static inline struct s5p_jpeg_ctx *file_to_ctx(struct file *filp)
>   {
>   	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
> @@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
>   
>   static int s5p_jpeg_release(struct file *file)
>   {
> -	struct s5p_jpeg *jpeg = video_drvdata(file);
>   	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> +	struct s5p_jpeg *jpeg = video_drvdata(file);
>   
>   	mutex_lock(&jpeg->lock);
>   	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> @@ -1253,7 +1248,7 @@ static bool s5p_jpeg_parse_hdr(struct s5p_jpeg_q_data *result,
>   static int s5p_jpeg_querycap(struct file *file, void *priv,
>   			   struct v4l2_capability *cap)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE) {
>   		strscpy(cap->driver, S5P_JPEG_M2M_NAME,
> @@ -1301,7 +1296,7 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
>   static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>   				   struct v4l2_fmtdesc *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
>   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> @@ -1314,7 +1309,7 @@ static int s5p_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
>   static int s5p_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
>   				   struct v4l2_fmtdesc *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (ctx->mode == S5P_JPEG_ENCODE)
>   		return enum_fmt(ctx, sjpeg_formats, SJPEG_NUM_FORMATS, f,
> @@ -1340,7 +1335,7 @@ static int s5p_jpeg_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>   	struct vb2_queue *vq;
>   	struct s5p_jpeg_q_data *q_data = NULL;
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
> -	struct s5p_jpeg_ctx *ct = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ct = file_to_ctx(file);
>   
>   	vq = v4l2_m2m_get_vq(ct->fh.m2m_ctx, f->type);
>   	if (!vq)
> @@ -1480,7 +1475,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct s5p_jpeg_fmt *fmt,
>   static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>   				  struct v4l2_format *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>   	struct s5p_jpeg_fmt *fmt;
>   	int ret;
> @@ -1539,7 +1534,7 @@ static int s5p_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
>   static int s5p_jpeg_try_fmt_vid_out(struct file *file, void *priv,
>   				  struct v4l2_format *f)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   	struct s5p_jpeg_fmt *fmt;
>   
>   	fmt = s5p_jpeg_find_format(ctx, f->fmt.pix.pixelformat,
> @@ -1686,7 +1681,7 @@ static int s5p_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
>   	if (ret)
>   		return ret;
>   
> -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
>   }
>   
>   static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
> @@ -1698,7 +1693,7 @@ static int s5p_jpeg_s_fmt_vid_out(struct file *file, void *priv,
>   	if (ret)
>   		return ret;
>   
> -	return s5p_jpeg_s_fmt(fh_to_ctx(priv), f);
> +	return s5p_jpeg_s_fmt(file_to_ctx(file), f);
>   }
>   
>   static int s5p_jpeg_subscribe_event(struct v4l2_fh *fh,
> @@ -1795,7 +1790,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>   static int s5p_jpeg_g_selection(struct file *file, void *priv,
>   			 struct v4l2_selection *s)
>   {
> -	struct s5p_jpeg_ctx *ctx = fh_to_ctx(priv);
> +	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
>   
>   	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> 


