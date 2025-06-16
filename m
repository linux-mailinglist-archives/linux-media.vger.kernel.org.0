Return-Path: <linux-media+bounces-34897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD256ADAEEC
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F523B539E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D639C2E7F06;
	Mon, 16 Jun 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WvW97kI7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EF2E3395
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074279; cv=none; b=SAhCQW50LBjM1Aynz7R5730S3wnXgwURUvWYeEt5R+0El52KxOvE9avhYWNBu5SxHF4d2xfvXYKcuL3kCWnulAoNvSU8aYXgxtzuC4wcz5arJUTv7T1hcByDcwB1OIq8g6VVwltFr7sZ4c2niYk1wrsBb7Z9lCXrSIZ5o3rk7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074279; c=relaxed/simple;
	bh=6OFo5pBMYnYh2m/fkEpOWd415EFJQ4PzegzdB78/qh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n43TX+LT1ok03nEPg82NmOFigMsHveyegt4KVf8QSAbmIQWKlTZN3fh2bxK9g8W2B0BOGmo/6RyCS3BAnZc51PKxJZLQiE/0Z+bTTMBNQ//OnrwRjozXtyAPiGl1JPVZQgHs/tAN91Wn0uHVJPIiehF2QGTJuoUjnz3epZtP9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WvW97kI7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b51f5218so2644998e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 04:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750074275; x=1750679075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=WvW97kI7MGz08Rj1VhMCOZXdEpVYtnTclE8suo1tn2OFf/uHasAyMkUDSfDVwIopMg
         1x+xquc9+WR5RvaVgc6bXWN7Bu8jP/pCfZ4UHGQcJ5t3l93phdoYcAbouP/K4iIqjGlQ
         gzgpsE2XWk6q1PWe+1E7RpVOHnjh68umB+z+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074275; x=1750679075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC57BNOILQO91SpxcwM/H8uetMBSbdJpDUePGneKOZM=;
        b=Ye5csn0CznqG2cC8O8w0dwP6L0QcdlKf5lfys9a51iUam0iSR7YAKp1yStaxOcSafs
         CMoHyJJqsm2XD4cJG6hAZMGyAa2CHMT4CE+9GWiGxtPzzVK/vy0wHGgOCsfKl4LF4Hzz
         HwbrvbgOIAuiStOvU7XMyaN8VJJ4LBBreaHZn4UjPwZ1S2Kk5SJJoE2mVr0szgmIk8jg
         +HPl/iaCnW3XNGcF4QF2xbZKfMhp4bDG5jsmHXS+uRhkbNRPgBaxFbhWEa9eGQC6aPZk
         9cpJWLxzgSOnHkkGeKKi7fuCAI1iufONVsTgZNtxZOsbGEIkcwLbqiDaoV7ZDj0kGBPb
         ogfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw3UXhlBFpFxDY3WC1BKo9xhnDr/NwfiPKYy/z8VA/7jnxJJ7Bw+sdsnffpxmfg2MQb5m2M2U39WXQGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoKU1QoF1jtrVcPt2PwWIKj0NQvgfMn/3bSg05GZjt7fctTvZ
	LG6lzGsLlFGgMVANiV7thCGwpT0YPbQMg/14+w+XnhaMm0Lfj2clxBWtLRd2tu1YUgSxQCAq7xs
	BFKI=
X-Gm-Gg: ASbGnctyXmpr4j3aiikFHgHDvzqMGJ9JmLHxsxWnmGwRLl3XqOdyxgRu9P8wv68ESLD
	zsBlAjXTSKE+TC0sLRrLU1r8yoU30trBx9fnrfC6zkKlPcgkMJEaaaoYT+URw+GswLgLlwV6SIe
	PWuE2A5xV0Df3HX/SnOjoQWLCbWmOzFdM1mkgYvUVvx1uRtqMrHOqxH5ls7Tj6MzHO/s+0oyfL8
	CIip7oytvMawAk9Oy7BBiQQLlUwml/vU30GIJ1fORP0mZJWrweZh3u3FQm1zwQWvlTORp6x2Op0
	/FGMvtCVv2SPKGQ9S8XXr4/jMnLJUtnJYyej3naE39/shAcTDmOyb9wplpp5djwFYdlXVtb8tGl
	LMzKIHPJQc6d5l0apRChjMHU5
X-Google-Smtp-Source: AGHT+IExapmfHvCLJZT5D3B07AIubt2Ufx335OxV984+2Bo4BkILBF8ncDX6iaS1c+SRuO3H3SrTzw==
X-Received: by 2002:a05:6512:a8d:b0:553:302b:85ac with SMTP id 2adb3069b0e04-553b6f0b0cemr2067429e87.27.1750074275494;
        Mon, 16 Jun 2025 04:44:35 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1350cesm1512920e87.54.2025.06.16.04.44.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553bcf41440so1406002e87.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQiGD4dSm8g0l5imrnDy6usKfS92bh1b58YIIffZ5zWRRFAAVun3jYj11jnLA6DoQ4K+LxvWFnFq5gLg==@vger.kernel.org
X-Received: by 2002:a05:6512:3d8d:b0:553:26a7:70e0 with SMTP id
 2adb3069b0e04-553b6f31f40mr2247748e87.43.1750074274315; Mon, 16 Jun 2025
 04:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org> <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
In-Reply-To: <41cba134-4c8c-bb6d-c68b-a7de8da0689c@quicinc.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 13:44:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
X-Gm-Features: AX0GCFuBOjMnH3G2kUW3qtOUSx12VY80ZFNRDQ0cje6-a_VtuYVOFZQBnrrxyFE
Message-ID: <CANiDSCsVN0gXd=0GLALYvoBZ=cBY8daAJBmL=NJ5UteikZLpNg@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vikash

On Mon, 16 Jun 2025 at 13:04, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 1/11/2025 3:25 PM, Ricardo Ribalda wrote:
> > The driver uses "whole" fps in all its calculations (e.g. in
> > load_per_instance()). Those calculation expect an fps bigger than 1, and
> > not big enough to overflow.
> >
> > Clamp the value if the user provides a parm that will result in an invalid
> > fps.
> >
> > Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> > Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/venus/core.h | 2 ++
> >  drivers/media/platform/qcom/venus/vdec.c | 5 ++---
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> > index 44f1c3bc4186..afae2b9fdaf7 100644
> > --- a/drivers/media/platform/qcom/venus/core.h
> > +++ b/drivers/media/platform/qcom/venus/core.h
> > @@ -28,6 +28,8 @@
> >  #define VIDC_RESETS_NUM_MAX          2
> >  #define VIDC_MAX_HIER_CODING_LAYER 6
> >
> > +#define VENUS_MAX_FPS                        240
> > +
> >  extern int venus_fw_debug;
> >
> >  struct freq_tbl {
> > diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> > index 98c22b9f9372..c1d5f94e16b4 100644
> > --- a/drivers/media/platform/qcom/venus/vdec.c
> > +++ b/drivers/media/platform/qcom/venus/vdec.c
> > @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> >       us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
> >       do_div(us_per_frame, timeperframe->denominator);
> >
> > -     if (!us_per_frame)
> > -             return -EINVAL;
> > -
> > +     us_per_frame = max(USEC_PER_SEC, us_per_frame);
> This logic changes the actual fps from client. Consider a regular encode usecase
> from client setting an fps as 30. The "max(USEC_PER_SEC, us_per_frame)" would
> override it to USEC_PER_SEC and then the subsequent logic would eventually make
> fps to 1.
> Please make it conditional to handle the 0 fps case, i guess that the objective
> in above code, something like below
> if (!us_per_frame)
>   us_per_frame = USEC_PER_SEC;

You are correct. Thanks for catching it!

I think I prefer:
us_per_frame = clamp(us_per_frame, 1, USEC_PER_SEC);

Regards



>
> Regards,
> Vikash
> >       fps = (u64)USEC_PER_SEC;
> >       do_div(fps, us_per_frame);
> > +     fps = min(VENUS_MAX_FPS, fps);
> >
> >       inst->fps = fps;
> >       inst->timeperframe = *timeperframe;
> >



--
Ricardo Ribalda

