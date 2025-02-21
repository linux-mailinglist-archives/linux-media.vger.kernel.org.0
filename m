Return-Path: <linux-media+bounces-26535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB71A3EB87
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 04:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AADC3B5838
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 03:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E76A1F9F51;
	Fri, 21 Feb 2025 03:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fq849w1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DCB1F1524
	for <linux-media@vger.kernel.org>; Fri, 21 Feb 2025 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740110147; cv=none; b=a4R7Y7izrnHjM+0aL96AxJD9dO3G3/VxPGZKSDWC4PjDG62HrP4h7gDPuuUpiVq8rsQAeP+FdNU3u2e63v+WgdOgzh7UfHwMXcAmAO9U1rlou3fqtEPtkp0AHbkujlS3/aeAwLz/uzeulnfKSR0fja9+YBq3vJ7MdQwSNEJ9iwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740110147; c=relaxed/simple;
	bh=iG5MA668VIkZx6yw4F2E1Ql8r5D0wiJ2sdzgkM+jrnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+4mEGeFgFz6rYjc5+9FhWZFJcXQQF84cJAd5VGVYxCKlA9YiO7jwl6wU6sbVOmx7yBFnWBh+BnAFm9sBKWZiYIXyfSB3RKJZa2abVGD+LBdSy2vrtIn3R4LnHBxxH36laaKKVbGEq3s5prsSUG8efuirfvEt3TNmMdAeMWATwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fq849w1t; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso257606166b.3
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740110143; x=1740714943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw0vw5qDfG2Y5RQUA0J555gJarSraMWbJS4+ci/UW8k=;
        b=fq849w1tRn6KQ2NiQkXaVfayy49AhKChFvpByNc+ag/eoXPeiIDYoJHQ0dcxtSNtxB
         0seI5P6HuQcdCls6iTdmovYElyyniPSGoff1awx/1jvQEhYbIhMUJBZ8HsgW4eMl1Oqc
         NjGS76JUq5Q5eHqfD+aOsFQ6wxyKgjMUZ6BUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740110143; x=1740714943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw0vw5qDfG2Y5RQUA0J555gJarSraMWbJS4+ci/UW8k=;
        b=gTnW4HfcngQjVKLs/zNEJRLPf9UyJ/i0UKesPMhHikq65YHy+xQ1zMEeYvMXFyjFFL
         77N8vtaaE25qUT/iMH5/ZsSiOiDYvMSixue9wEpcB/TPoS/3N4Xv0DLXCY75TjMATw7C
         8RtBYTbV523ySxgz73qwjACILkKV2+7QwAsG4L8JqTeh+2jJFal2cFOiRuNOhwikfi+V
         kU0biMwX6/sNoN/L3syaxHNp2MGdLsen55+s8iuDWB7EqQqAOeW3lsKsVd+mVRvV6FMn
         na/0cmztB4VOs9Emk6ZWUrPU2tKQoeiyu16LmPGPTsjsRoUkKsPkYHoX5KaPQgIFYPOt
         7lUg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Mfv0vt7wxiKcg5TfUH6n9UVCXyUT26zNFU3fx9Egbk4jRDTavUdqD/9Y5zE4S96UqIyRpaYid9C2gA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2XuuJJGvc3maa4XCLGEPz/uziRcqpfT2XiEaqWmR/c1Iu3wU
	xUjPQi/o+4sKw/OzwEKIT3AsYAc+oftBGTX+uS/TBIXmUIj83nATEF6CHzJ5tzLSElB79b9R1pM
	=
X-Gm-Gg: ASbGncvnXTJlZlGiaEXEOVSbRicZuBEFlTiy3bphTKUD7jFQzHd6HLIC7IGsR737UDJ
	Awr10gsW6iaz8OJ7rCTwYHfVAHsMOpThqz5c19/zW+Jy9nYi1CtwSmubyPhcqDcRh31t9FqrTYd
	oGjajwqWe78QPOcv0zTMX5DxhhAvBhVwrtt4GjIYh2SC2mSEsFgJiFfOJ7pz2gUR//T28PHgfxo
	rP8RmbBANFUWTI92IKynISqxxzo87alhIOvZhp9DpCXXIeZeMezhyyuMKKF7WF4/ndxsC2cma5x
	kdH8xhveLYAtum5fsWv0YAiIj0jF8CNqKKsE4IH0yDKzXWAGDbPROEf7N1SOrA==
X-Google-Smtp-Source: AGHT+IGZdclcwpBfsD2kpNXuwtM1Vk7Vspv6KnJqWyMT/FqVERwHjz59xYZV4TneZCbbTEYmH2abrw==
X-Received: by 2002:a17:907:6d05:b0:aba:598b:dbde with SMTP id a640c23a62f3a-abc0d97e504mr113626066b.8.1740110143440;
        Thu, 20 Feb 2025 19:55:43 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac60d938sm748968066b.147.2025.02.20.19.55.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 19:55:41 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e08001cff4so3517a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 19:55:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqh3YAWMkh3t7A3bIB/QIrRYr76pl6Gj9b9fo/pu3JrWY48x+wwfQGXar89yzMV+VQWqw202VPXc/VNQ==@vger.kernel.org
X-Received: by 2002:aa7:d5cb:0:b0:5e0:815d:4e0a with SMTP id
 4fb4d7f45d1cf-5e0b871d417mr35634a12.5.1740110140496; Thu, 20 Feb 2025
 19:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com> <e794c047-ab0e-4589-a1d2-0f73b813eacc@xs4all.nl>
 <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
In-Reply-To: <b1721d46-ffbf-e21c-ce18-e96e3e8ee35f@quicinc.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 21 Feb 2025 12:55:23 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
X-Gm-Features: AWEUYZmeIjhMEJHyZ3B3-kUW6g12qVNZHewpqyjHWwiKCgJTNAXvvTwbb0Hd1Ik
Message-ID: <CAAFQd5ABR8BwG_9JVPzzp+HZv6O=B9r-ipjKQHku7DdTGASetQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in
 sfr region
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 12:56=E2=80=AFAM Vikash Garodia
<quic_vgarodia@quicinc.com> wrote:
>
>
> On 2/20/2025 8:53 PM, Hans Verkuil wrote:
> > On 2/7/25 09:24, Vikash Garodia wrote:
> >> sfr->buf_size is in shared memory and can be modified by malicious use=
r.
> >> OOB write is possible when the size is made higher than actual sfr dat=
a
> >> buffer. Cap the size to allocated size for such cases.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> >> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/m=
edia/platform/qcom/venus/hfi_venus.c
> >> index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab446=
88580288d7408b50f4 100644
> >> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> >> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> >> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_d=
evice *hdev)
> >>  {
> >>      struct device *dev =3D hdev->core->dev;
> >>      struct hfi_sfr *sfr =3D hdev->sfr.kva;
> >> +    u32 size;
> >>      void *p;
> >>
> >>      if (!sfr)
> >>              return;
> >>
> >> -    p =3D memchr(sfr->data, '\0', sfr->buf_size);
> >> +    size =3D sfr->buf_size;
> >
> > If this is ever 0...
> >
> >> +    if (size > ALIGNED_SFR_SIZE)
> >> +            size =3D ALIGNED_SFR_SIZE;
> >> +
> >> +    p =3D memchr(sfr->data, '\0', size);
> >>      /*
> >>       * SFR isn't guaranteed to be NULL terminated since SYS_ERROR ind=
icates
> >>       * that Venus is in the process of crashing.
> >>       */
> >>      if (!p)
> >> -            sfr->data[sfr->buf_size - 1] =3D '\0';
> >> +            sfr->data[size - 1] =3D '\0';
> >
> > ...then this will overwrite memory. It probably can't be 0, but a check=
 or perhaps
> > just a comment might be good. It looks a bit scary.
> Thats correct, it would not be 0 as its a prefixed one [1]. I can put up =
a
> comment here.

Couldn't a bug (or vulnerability) in the firmware actually still cause
it to write 0 there?

>
> [1]
> https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/platform/=
qcom/venus/hfi_venus.c#L836
> >
> > Regards,
> >
> >       Hans
> >
> >>
> >>      dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
> >>  }
> >>
> Regards,
> Vikash

