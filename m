Return-Path: <linux-media+bounces-48536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D774CB22E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 08:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE88630A520B
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FB62FE566;
	Wed, 10 Dec 2025 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bpUOAx9z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF42797B5
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765351401; cv=none; b=n/dJEebkRbnn6qy73i9At3sIIunRxqujfwyZc48J6kQkwWsVJz0TtOlhBELQ3VK3ymHVDoG+YQfKeEdPBfbSZ9AvLlFzaKAJvxZahfNef6Mwk3/wSAKVwzYD3dr4HLgDpN7YX59MEOqVUR3I/4xyRtcokDK1YkQAHhGvL6w/jRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765351401; c=relaxed/simple;
	bh=bVoNKoANIG7q10JDhOmNKhsvQTLBx4R95XOF/EenAe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhPkEuHVxs+KBs8GVhbignaMVTGOebHzuAMwNNGeVBiJ29KjojbuC29O7h4QnaytvCKbAUpFOfsSlY2VFJQg0IMdupBKxYNTFGY8wgAQV5kIuA67KlI+3k9EAV9FflNvcRpwKwlkJAVpW2MK5NWo2/IY7v/cKPh/cEE6OEtYHwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bpUOAx9z; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b95f87d64so56935541fa.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 23:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765351397; x=1765956197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E6rTqaNhoHV8bDh9ZGSpURt9oVyaThNhpt0aYUd4hF4=;
        b=bpUOAx9zGaRZ2v2SgGWH72nal9vHd7y+2zI9FjLfwKjgsNedMQby7jB3LynWuRRn+N
         Rwv+3BXcM36N6qqKLa/gIkaMD9AsoeEiVF2uLzeZ9TtGmb667FBJNOk8kirZpawlHPaw
         tSje2iztoVEAlN/Q7vDpZTfwOGLLyhcUDifLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765351397; x=1765956197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6rTqaNhoHV8bDh9ZGSpURt9oVyaThNhpt0aYUd4hF4=;
        b=ppAACTnU9XLfcTOeI3cTrpAxNAS2VRMD5AxceVmQpJS1kNRBf9UoxEDsgBFFDgxt0b
         i0GDpz6HZP2NWzrtldeqTd07yZIlLopJm9rIBy9iZV0kU7xvCTUkXGTinOWyNhpbV2uT
         XmmtMNv/JcqOYCC3qXgoD4Iunja5r8O6A2ROzFhzDJ+Q45pkYdNPx4YCt/0vedQuT4XR
         G5odWr/SusZ7gCZH+Dtb7rkDM6DYIIZ2wtqJqn3j4B5TchHjMKt1mBPfbFnunFzqCG8K
         wQmZrmu2qenivlCADvDNmoo9Es65m1ul61RfAqrQV4/1Uhk+UtlJyG5Nyq60HOP70eUf
         ELIA==
X-Forwarded-Encrypted: i=1; AJvYcCVB/Bg/kI42NlaI4XavAMWy6W/7N3cGr5Y5XNPrWh7uiTc61eNKNjx2lWrQN9LtCrHvVYdLDWlHaL1j6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWbAwV1M9zz/n9nSK/iHgBmzpo9dc1boE7EKjgZccg9cbFAQu
	5i620wt+Ot7MlMgBq5cCCfItadYw34HFb3JE3fFuYUP+4oCLf/2NKACRSyHLUjoWti3BaMON/Xs
	4P4fqkA==
X-Gm-Gg: AY/fxX5jFzpkTsSjOB5aPjSVU3B5DKxt6d9EmutFontlc8i+rmix3V96lfhyjA1lcdn
	Xz6ohDUJaw2FXNUq4u82TtW+SwsOg1rWcbThTiFwfzlv0C+ZAvTHgP+2s/MOYMKE+Wx5IS7Lc/n
	hSOFFg08IZ+3Rq0DCPjuGE+GazXKITa2lH4kUVZcd31uSV9UHWINH8B+MkvL6uUXI/kj7zC3p8c
	Hzm34q6cTyxpsqozC0v9QYWgO2yDYk0N1zTSjdNVXVme2ki7ZGJjXDSpboDB63C07jecEAiyD7H
	N2aNmN8DyYn7LZua6a/y11gTLKT8g0mkoIXIFZnX9VQdVUhkoy63H0zqsrcwYmtY608t7sjAsTc
	eoyLtm4x/O1GviTnYy0232130G7u/hJFPEH31wUo9ZZopMgXekjLZSHC5WKEbLuS600C0IHOiRh
	4f8WdbhUQTkUdJIAhsnM5vSooYnX/YRWFydNr0cPD1eg644NCi
X-Google-Smtp-Source: AGHT+IHTkrjW5udWf8pNPHL859WqsDmu5s3B/6P4nfOYxLYWnkxcdCA8kCeKIlVf+KiO7SWrlK5ZiQ==
X-Received: by 2002:a05:6512:10d1:b0:594:34b9:a817 with SMTP id 2adb3069b0e04-598ee533415mr649231e87.33.1765351397289;
        Tue, 09 Dec 2025 23:23:17 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b245b6sm5963821e87.28.2025.12.09.23.23.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 23:23:15 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5959105629bso6498233e87.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 23:23:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnIkqxELsVZDyO0SEpAlFvymJxB65DwwTy31vbARYMM/iyQSIsq9A1p5fqxdDoJ6n99K1SJLZTR6us1Q==@vger.kernel.org
X-Received: by 2002:a05:6512:3989:b0:594:2d53:545 with SMTP id
 2adb3069b0e04-598ee54ca73mr515132e87.46.1765351394713; Tue, 09 Dec 2025
 23:23:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-3-25308e136bca@chromium.org> <7mqgcndlrffm2wczev4s5osza7eg44zonqykfmbxq4z62u2rzf@3ugznlbhqwiu>
In-Reply-To: <7mqgcndlrffm2wczev4s5osza7eg44zonqykfmbxq4z62u2rzf@3ugznlbhqwiu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 16:23:01 +0900
X-Gmail-Original-Message-ID: <CANiDSCvCGX6KaTcVRFvWb=Z8YQNi-Tj5MVp66UjCyH8ZZF5Nmw@mail.gmail.com>
X-Gm-Features: AQt7F2rC3cSdhIoRJTP60japduwuLBoINlP04hCF9LCAJftVAxsEZzrsdCpa0Ko
Message-ID: <CANiDSCvCGX6KaTcVRFvWb=Z8YQNi-Tj5MVp66UjCyH8ZZF5Nmw@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: iris: Fix fps calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Dec 2025 at 13:06, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Dec 03, 2025 at 08:55:36AM +0000, Ricardo Ribalda wrote:
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
> >  drivers/media/platform/qcom/iris/iris_venc.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> > index 5830eba93c68b27fa9db87bac63a691eaca338d2..730f2aa1a83b2f4f90227ab9a7e04aee7c2c3cfe 100644
> > --- a/drivers/media/platform/qcom/iris/iris_venc.c
> > +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> > @@ -408,11 +408,10 @@ int iris_venc_s_param(struct iris_inst *inst, struct v4l2_streamparm *s_parm)
> >       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> >       do_div(us_per_frame, timeperframe->denominator);
> >
> > -     if (!us_per_frame)
> > +     if (!us_per_frame || us_per_frame > USEC_PER_SEC)
> >               return -EINVAL;
> >
> > -     fps = (u64)USEC_PER_SEC;
> > -     do_div(fps, us_per_frame);
> > +     fps = USEC_PER_SEC / (u32)us_per_frame;
>
> Can we replace this with:
>
> fps = timeperframe->denominator / timeperframe->numerator ?

Yep, I believe you are correct

I will send a new version soon.

>
> >       if (fps > max_rate) {
> >               ret = -ENOMEM;
> >               goto reset_rate;
> >
> > --
> > 2.52.0.158.g65b55ccf14-goog
> >
>
> --
> With best wishes
> Dmitry



-- 
Ricardo Ribalda

