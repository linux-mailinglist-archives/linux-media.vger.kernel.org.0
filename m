Return-Path: <linux-media+bounces-39506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CA0B21E07
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66831426AE5
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E79B2DEA60;
	Tue, 12 Aug 2025 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfZecBon"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3393724DCF7
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754979226; cv=none; b=W6ESeHgLMyCT+3rxjf3DYcHCqaKR12U/CYm85VeLtzHJe3d2DBXS4tR/DTcAeH8aH2Hj06Gw9YJs1rGReTFvmpT6zLAbR5MGGIYxU5i4hWkGLFbRj81x9ITCUiVNFFW7cEIeXQH2l0F7UR+0h6l9ocGofTt4n1iWVKF6ngfcloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754979226; c=relaxed/simple;
	bh=WE24xcuGiJV/sxy0c69lRvtOZETwdLLFJSURVBbdgsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zvo+KXnTKkPV8jOtKr6ayAnYbJw1HjAL1L+Qql6oDCMkGndPAmL8zpcClKfvKFAXhBFyuI95+SOEORXcbpHP+sNYwHpgYFz7c98PgbwkohavYZH4Ev22/Pbm4/ASAMMz5a+beTBjVURuIDocO7pFIKraI0zoFPzBoOexYhxoS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfZecBon; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55b8bf653dfso5399516e87.0
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 23:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754979222; x=1755584022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSXRG4UDI370NboKvA/d+qzWYgjnMyk4awDopImJtPY=;
        b=mfZecBony8MOd2ilrfdLd/LH6t/Ni2FsbVyyo/OgOQiGhoh/OJd2GSC9q9vRHBAb45
         N+9bo3u/i3q388GNkhYE4iTpEmcSLWUWv6n1mVp87Kb5ezO7I5/rtSVMJXY3Px5hW3hz
         s4KhnuhhAsaHsv4KJRCZHMNRiMcbQW60rJ5/FU9uPQ1P3M7TRqEkTB/TJnzOD037YxTG
         UrGU7sz8pBFfb7kSTu3IWfEox5DuNUJrUQjPtKPsfq+1rOj3OXR9tZYA1B1YYKK9IR3G
         o3wkccPmuCtWP5qLon5dqi0Ud3QpsYyz8KcGlBr+i0u/0CRnTnEWieyr8szwbdoEvbDw
         hUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754979222; x=1755584022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSXRG4UDI370NboKvA/d+qzWYgjnMyk4awDopImJtPY=;
        b=X8l7r4+B+YxFGt7aSzr/0lmzPhS2SSFaRVDsrNqrozFvvbO6ziC9bvQ5wpq0nqV4lR
         DQMiZQd7Y7ePnvTaKy3q6YxtavO8/ouATp5ad+2HVdVQmoNwyFb0pLg96llzvgsNP+6Z
         pbBhAS7On78yoepiQlGPtrt5zc82zc2Us0pKFvizHggFRubZmQroMZWNKpcwEDiTi1eb
         As/nuykhstyEnZ3uNykpVDP1mrrxZQOFucFC3hxV5TND9/htN18ArF4jTvm6CoY7xW8t
         QoGoIpH90zu0lL1FnbeIjLWdoELkoIfLLIFdvX9D7gv2nes1OE5tHS00HxWyu7GD039F
         oSbg==
X-Forwarded-Encrypted: i=1; AJvYcCW/6swBeqmVO0wAHEcqr0xQtfk8Q8aBkvHzYDRuS+8Lyftdzz4Shz0esUfwn0vr/5QGn7fBPhzfrufn3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHXBhIrsY4UoQ7MvEF0HTVcKd2NL2nB2fIqi9xF/cMTwZ6Lc2
	bZKLGZw0/aNDH87fWPJHg7IYaqskw8r1QIbrtu1Uw7b4HrWmoX8z6FAn
X-Gm-Gg: ASbGncuCC8NZxxHYLsOdr73QDICyEV+ovYT6kroyiXC9aDweIAnm/5CuO8yoi9nPcu9
	i5JmMGUEwvJaysIJmVQnKdQjy9Xes7cloorUemJjirfgx6H0KEzl5W6OYvylnr8NXJwGAJUUosc
	lb/gsFHhGAnBeQ+70R0SrQC0K/fFQrfIgYqzOAPX1aW8TDXpzgucCNyISsYPRKv2dgLUX5eGsjd
	IRFNINY6bsRiiY638ciiygrBbZoulVGcRGQlovV4JynyEwVKragVrodBxtzSshlNYct1BG9hX1I
	YzcfsLGv8R8Lyi14HhS4itN2SYE+nWxmjalsSaifi7JK/cEpBcU7NefqbeFyQlD5OClAtywUvoX
	34K0IlxiRHEIhb5CDfBxB0q9Tyr+V/ebjPEGprn1tZz8ZeAg=
X-Google-Smtp-Source: AGHT+IHD1nKmWw3ewqqmK3tmT5SLNBo0Q1b6H5f7Ay3XURTOzQQPfxP60v/DXVcVArn1HmiAasOnww==
X-Received: by 2002:a05:6512:15a9:b0:55c:d5f8:7866 with SMTP id 2adb3069b0e04-55cd5f87a6dmr841162e87.57.1754979221938;
        Mon, 11 Aug 2025 23:13:41 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-2.lukman.pl. [94.240.0.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cac7626fasm2645563e87.174.2025.08.11.23.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:13:41 -0700 (PDT)
Message-ID: <b6f75a41-d5bb-46c7-966d-eeb1d47736e5@gmail.com>
Date: Tue, 12 Aug 2025 08:13:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 56/76] media: s5p-jpeg: Access v4l2_fh from file
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
In-Reply-To: <20250810013100.29776-57-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Laurent & Jacopo,

Thanks for taking care of this, this generally looks good to me,
but please see inline.

W dniu 10.08.2025 o 03:30, Laurent Pinchart pisze:
> From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> The v4l2_fh associated with an open file handle is now guaranteed
> to be available in file->private_data, initialised by v4l2_fh_add().
> 
> Access the v4l2_fh, and from there the driver-specific structure,
> from the file * in all ioctl handlers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
> Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Update file-to-ctx macro due to removal of fh-to-ctx macro
> ---
>   .../platform/samsung/s5p-jpeg/jpeg-core.c     | 27 ++++++++-----------
>   1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> index 65f256db4c76..81792f7f8b16 100644
> --- a/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> @@ -580,14 +580,9 @@ static inline struct s5p_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
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
> -	return fh_to_ctx(file_to_v4l2_fh(filp));
> +	return container_of(file_to_v4l2_fh(filp), struct s5p_jpeg_ctx, fh);
>   }
>   
>   static int s5p_jpeg_to_user_subsampling(struct s5p_jpeg_ctx *ctx)
> @@ -1015,8 +1010,8 @@ static int s5p_jpeg_open(struct file *file)
>   
>   static int s5p_jpeg_release(struct file *file)
>   {
> -	struct s5p_jpeg *jpeg = video_drvdata(file);
>   	struct s5p_jpeg_ctx *ctx = file_to_ctx(file);
> +	struct s5p_jpeg *jpeg = video_drvdata(file);

What is the purpose of this change?

Regards,

Andrzej

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


