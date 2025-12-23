Return-Path: <linux-media+bounces-49406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C00FCD8AC5
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 10:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A59C301A1DB
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 09:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF361DF755;
	Tue, 23 Dec 2025 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SbZII4gh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCE2522BA
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483855; cv=none; b=sKRjtRGRgAWN54Z2+qjIPCgY3Ft51ZfQioiJemmSaBTOocowWdweFeCw214n+BjDz748NImqY2rF80oye/55rVGq4D/QEzwQU/N77YK5aydE3WKSS5kSR4KWa7AVEfE0Fe15wjvxH6f4cJ4ZiQpxhIpUJGDB0nMLlgkSMbJ7uEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483855; c=relaxed/simple;
	bh=H6kcB9vxdASqAMUnCMihAw+U+96Gdq79Q4nX4V+t/Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UR/uD3LtpCh2z1jwjC7OJLbDaU1R55XMDfmH1dcsVe7EVVwif8DvaeDJjYqBpZX807UlM44Jqr11n3MG4lS4gd7qPi5rLpg7SDWr4ZvH5ujN337Jpf/ZYYuT55Qiy6b+4qRKt1yilWzz6L5tqERrKhdAU9YIx7FFOByYF9nVal4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SbZII4gh; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59a10ef758aso3946392e87.2
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766483851; x=1767088651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcbQKaDIQemvrPXvwFd+jNWXArT2dsZasu7EBT9ao2c=;
        b=SbZII4ghr07bPEJ8sQ0kCDNTUIOutd2cBMzxLZF6djbTcwYTcneR6OMOV76ejCfq7u
         WBeY5tToWTUvKDFhqAe3GmreDbV7NMtgeWfAs9pjywcirNt42qJ/HE6XY8/60pFeNj3b
         3vwhel/nvbcbHI3fXWzCuXUjK7559p6X4G9LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766483851; x=1767088651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcbQKaDIQemvrPXvwFd+jNWXArT2dsZasu7EBT9ao2c=;
        b=O6Ffn5MMA6hoxOmbwnpjGCJ8cyyRFXSrO0dHxjW8ULdr+E6CSn9bD5D0/XYlUjtFia
         rtLSRILzvydqwMGoGH6eQ/F2tqTK4eVwUko1AIMh8q2ZnycDM7pjjGK5V8lTs84QMcJY
         8Yg8Qafbd8a4+PeB2ZSK8UuMejkKeTP5uSSg5NyGtiekvjxEFR0SjX/uJvPUbL5sFiI1
         Hh450SovrrngZdiNE6b5da7NHPbByo4KbrVVqKCSPNcqhFoInN/sKOyuozsTjx9qms3b
         UC4s4iiI9XI6oxNjrRfrvLj4Coj8gYEqIEyoshuf95a8o20XNGZ1AmFQfVv9NKpeu8ZS
         LmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ1Q7Kn/hZEK91JroVVdnsXmDAtL+MxrFg4D18BumOhzyZJ5LpyJj2zCIs7f17U6DnPhsSfFzSMq9GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqWZVxf9D1ZZkeaMInxQ0AxzSm9H4PbYx17TKc8VA7OfwrQJ8x
	Lw3G3y36f62NzOJTuXelTl1fOQJNKLTGMydIL+h14ZKW6AoWsJlqrg1yQEpBUatGsyMUlGuK3ZB
	M/Ekp9A==
X-Gm-Gg: AY/fxX42ZmIVFkgtC+S4SNRZE8uPTk3XX40FyjEnLKRryCo3aWS1YQ2RvkU6PdQCCGu
	Z9Vkb80knyuRWRY0RjD8wXGcTQ3/5Cly+ub6DG4wJCwoGkv6KKSN3visBjT/OMyxqK3v0mhSwB2
	AZEXEuXEdW9johzStmWSQOlTaAjlkd9r/Mu4H4gQ3A3RAigz2KMuRI1AZJcg19D77WJtw947Rlf
	PKka7pKtA3A1FdY1uapOE1LvAr8JHjpsNYNtHR6iVhrK6OO6DadyheVWOFUVZve8aU1bkaSwZLH
	ELw9J7GSkbBqvseZz28FAegCyrcmuFx9NFOGouQJKUvZXzF8TdsS6gtk8bKV6f+BRs6mhR60L98
	Wv/B7QIjM4Q8ODZpD7fCIRyDlutg+ESExcVTlRWepCBYNrS9RQPD+8tq2/qiXoLda7B58jFmkzT
	8DNjhxDHdDTey/NZ1KVs9Oq4OeQsJzOBRSDQeeYbIZTz/7w0khlfJh
X-Google-Smtp-Source: AGHT+IHPeZFJDhyBiy/YgWKMXg/dccLt7grik1fl+81wD7m+oVfRCiERN4iW5E0FK3hSYJQ+xtbKLg==
X-Received: by 2002:a05:6512:239e:b0:594:26cb:fce6 with SMTP id 2adb3069b0e04-59a17d417bemr6328376e87.34.1766483850786;
        Tue, 23 Dec 2025 01:57:30 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm3888497e87.43.2025.12.23.01.57.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:57:29 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso42284671fa.1
        for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 01:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiCDx3zQgLWxXiKkoA9MSjhitGH4NgjvBXHfhe3X2RiFdWbWc3hh3ZRCTput/cI3TUk0k/MNmC0LwJhQ==@vger.kernel.org
X-Received: by 2002:a2e:bc18:0:b0:37b:575d:6403 with SMTP id
 38308e7fff4ca-38121566d15mr43298201fa.6.1766483848778; Tue, 23 Dec 2025
 01:57:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
 <20251216-warnings-6-19-v2-2-12075e3dece7@chromium.org> <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
In-Reply-To: <a90943c6-0e7f-51cb-05d6-41e131797196@oss.qualcomm.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 10:57:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCt2+jqrcTEFXk+Qx4hv7XE2ReSdojGFdLgVOoOM9LKw9w@mail.gmail.com>
X-Gm-Features: AQt7F2q8tKmrjpznyuaGTBd-ivAL0-SHsAmqJWL6ETs3H9P3HZNyV4Yx_-HbshQ
Message-ID: <CANiDSCt2+jqrcTEFXk+Qx4hv7XE2ReSdojGFdLgVOoOM9LKw9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: iris: Fix fps calculation
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 10:39, Dikshita Agarwal
<dikshita.agarwal@oss.qualcomm.com> wrote:
>
>
>
> On 12/16/2025 9:12 PM, Ricardo Ribalda wrote:
> > iris_venc_s_param() uses do_div to divide two 64 bits operators, this is
> > wrong. Luckily for us, both of the operators fit in 32 bits, so we can use
> > a normal division.
> >
> > Now that we are at it, mark the fps smaller than 1 as invalid, the code
> > does not seem to handle them properly.
> >
> > The following cocci warning is fixed with this patch:
> > ./platform/qcom/iris/iris_venc.c:378:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> >
> > Fixes: 4ff586ff28e3 ("media: iris: Add support for G/S_PARM for encoder video device")
> > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/iris/iris_venc.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> > index 5830eba93c68b27fa9db87bac63a691eaca338d2..3b941aeb55a2f498898a27a5f8cb58cdb26fdfed 100644
> > --- a/drivers/media/platform/qcom/iris/iris_venc.c
> > +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> > @@ -382,8 +382,7 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >       struct v4l2_fract *timeperframe = NULL;
> >       u32 default_rate = DEFAULT_FPS;
> >       bool is_frame_rate = false;
> > -     u64 us_per_frame, fps;
> > -     u32 max_rate;
> > +     u32 fps, max_rate;
> >
> >       int ret = 0;
> >
> > @@ -405,23 +404,19 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >                       timeperframe->denominator = default_rate;
> >       }
> >
> > -     us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> > -     do_div(us_per_frame, timeperframe->denominator);
> > -
> > -     if (!us_per_frame)
> > +     fps = timeperframe->numerator / timeperframe->denominator;
>
> This is wrong, should be timeperframe->denominator/timeperframe->numerator

Ups, sorry about that :S

> Also I think it would be better to clamp the fps?

Do you mean clamp instead of returning -ENOMEM? I have no strong
opinion about that, but I believe that should be a follow up patch.

>
> Thanks,
> Dikshita
>
> > +     if (!fps)
> >               return -EINVAL;
> >
> > -     fps = (u64)USEC_PER_SEC;
> > -     do_div(fps, us_per_frame);
> >       if (fps > max_rate) {
> >               ret = -ENOMEM;
> >               goto reset_rate;
> >       }
> >
> >       if (is_frame_rate)
> > -             inst->frame_rate = (u32)fps;
> > +             inst->frame_rate = fps;
> >       else
> > -             inst->operating_rate = (u32)fps;
> > +             inst->operating_rate = fps;
> >
> >       if ((s_parm->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE && vb2_is_streaming(src_q)) ||
> >           (s_parm->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE && vb2_is_streaming(dst_q))) {
> >



-- 
Ricardo Ribalda

