Return-Path: <linux-media+bounces-24357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382CA04847
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 18:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E62188883A
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2B1F76A8;
	Tue,  7 Jan 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZdd0Vss"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D31E1F6666;
	Tue,  7 Jan 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270925; cv=none; b=PygWWERQo5fULAappadkodUSh/i4JoynAIgepku1d5eAiEaoCZwuhcQ50s2VAIP/9mLwZqpWBovPVebuNn7dMY5ibUiRH/dtk+A+4VQdad0xPiZ6LYqJjEGpIlydbdUQGx3ZI1ES6hBnJYzNIJOdCABjsxjtTg/WzVa+UQvR3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270925; c=relaxed/simple;
	bh=DAA1UK2KydFrRMt3Qo0I+WPwB/nz2RbIQrtjnir/c6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bd2FM3XqxyLIdqn4Ux6bZt38W1w01Ktw+fDHfK4VRK0n2DAecJeE5WninymeuppAKCQvwXZwIsIMD6SLh8zeDMQ/KJOEbWghDn2uC66KgxOGWPXSkFQZZa7hHAsRIM4jupD39iVWFEGN8TznJaAEzqhVEwyKJ/epyJl/fj6lSs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZdd0Vss; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2a3bf796cccso7001279fac.1;
        Tue, 07 Jan 2025 09:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736270921; x=1736875721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GvcgifYJeQE7xZ/54WkUZwGkobYZRvFniYCDNRZmjU=;
        b=GZdd0Vssrp0TQs4TCBqmeWQMwCt5OzjVMTIRHubu6STLAerTvzXCYlrQplIdkOzHaZ
         NNknN+zEq0pfkJHlBlUqdYoS2AqP86bsf1itt4GP3lNTOnP6QidgzXB15DX9r+GuNO5+
         alo87X6yWg+CZ7Wbo3+410kgMsRsQMPTyBBzHFgj4HocRlapNpnLv65U/INwSd8tTIck
         jeuEeq5Sx2DaUFC2xGxAzBfQgbGKw4tCEJa41vQhx8hEysN6+GAyiUli3hL8Q8BpE4IB
         jHrvUJxmjHRNN6IDOwkWDhLgQWxY2WHy/bblvtGMqjtH5HunPHPjiq0+RKywShlpcUSI
         dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270921; x=1736875721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GvcgifYJeQE7xZ/54WkUZwGkobYZRvFniYCDNRZmjU=;
        b=nqVQRAMNTNzp7cNSpxv8q99ES7ZHrl2wK4T/XsyvEBsaOP3CMAYjHphK1ZW73yIJCp
         RRzQUQ05xWSJIlJKzHQd1L+XA4MRkOKorrEPiGExP1InRWGLBxxvh955RsWa70ZD+/3F
         zWquJ2TvpSt1LisgUTBBiAyE8Mw/wCH9Yreb9ajHdPLflO+uStZw5DaYUYSTgarj1qPB
         1zNaztr0hlZ90wDgDTSKIGw1PN30+dGTrARzZgCbdimkhmqX97NUuIEUEM07VrwsUDa8
         eJKZcNfkqXY7ancc7ylfjHp+uxC92CKpKjvWeej82wDa08O19ZsuWFG9bh+jtfUh8F8F
         roDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpNwEtiDLBJ9r4VFt7qMVbYFDamtrSEeXS+8lel5tvu5KB9zlvEsMrMD01aBtbJY2FMMtKF1rSgKb+T7k=@vger.kernel.org, AJvYcCWRMq2Ms3TIb3+oFcJJH1FugAc+tJJkTaX/12BHpMp1WAXNjpvHJikdeVseG3HZP4/tFexH7Z/EccwBp9Og@vger.kernel.org, AJvYcCWbTcTLOW28/nDYLD7gYujLIszckzCfJTz/WXGqbrVqCZws79//o52lSHkxa9hUbLc3E6PyHRer6Doveuul@vger.kernel.org
X-Gm-Message-State: AOJu0YwGdnkDZ2FDxIWpkO9bZbNKr+16myEF6Sgc0tqufreUQFS6J43i
	9s6xzjIDkuAwxPO4SzkOfp10UT1XonM82FeFVfEs+tXj+PhS9dB1ArqTUSbWEVQtN3ll0+lOv0h
	vo6nEQTnqzLNOxznRppK3sgy95AI=
X-Gm-Gg: ASbGnctVnuOzglWGjzX9+JRe+yiTAgQyCsX2oSQeJQ6aAvW6qFKAGkNhSMF7NgX+YgY
	x+PdY8t2Gh5a735YXj+Lvx0VUj+7EhEEICMrnN2w=
X-Google-Smtp-Source: AGHT+IHWrvfjul8bGWLCG7K0V5IaoxBR0xeFnQU2gldG8cMCp95gzX8UgLTMLPMtg8u83XezlNekJKZzBPTIWi7NoZU=
X-Received: by 2002:a05:6870:a496:b0:2a3:c59f:4cba with SMTP id
 586e51a60fabf-2a7fb0cf188mr29060596fac.17.1736270920998; Tue, 07 Jan 2025
 09:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-fix-cocci-v5-0-b26da641f730@chromium.org> <20250107-fix-cocci-v5-1-b26da641f730@chromium.org>
In-Reply-To: <20250107-fix-cocci-v5-1-b26da641f730@chromium.org>
From: Kosta Stefanov <costa.stephanoff@gmail.com>
Date: Tue, 7 Jan 2025 19:28:30 +0200
X-Gm-Features: AbW1kvbfUwaeL1fxXTsi_WrN9S_jTEC6LrMr24QI4GikjHcwZllkdMOLydzsLnY
Message-ID: <CAJvEA4nC8-2aMHUg+iJ8qMNuQKYnmpbpK_iZMhoivOQX14G5DQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] media: dvb-frontends: tda10048: Make the range of
 z explicit.
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi Ricardo, according to the datasheet the recommended sampling
frequency is 55 MHz (BTW, if you look at the definitions in the source
code and make the calculations that is exactly the sampling frequency
all currently supported in Linux devices are using as well).

also, I spent few minutes time to make the calculations based on the
restrains of the PLL build-in tda10048 and in theory the maximum is 69
MHz. so, if you make next revision of this patch, feel free to update
the comment accordingly, in short - recommended sampling frequency of
55 MHz, theoretical maximum of 69 MHz.

in any case, your assumption is correct and in reality is away less
than the maximum value you assumed.

Reviewed-by: Kosta Stefanov <costa.stephanoff@gmail.com>

--Kosta


On Tue, Jan 7, 2025 at 12:54=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> We have not been able to find the relevant datahsheet, but it seems rare
> that the device will have a sampling frequency over 613MHz.
>
> Nonetheless, this patch does not introduce any change in behaviour, it
> just adds a comment to make explicit the current limit: div by 32 bits.
>
> Found by cocci:
> drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a =
64-by-32 division, please consider using div64_u64 instead.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/tda10048.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-f=
rontends/tda10048.c
> index 3e725cdcc66b..1886f733dbbf 100644
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe,=
 u32 sample_freq_hz,
>                              u32 bw)
>  {
>         struct tda10048_state *state =3D fe->demodulator_priv;
> -       u64 t, z;
> +       u32 z;
> +       u64 t;
>
>         dprintk(1, "%s()\n", __func__);
>
> @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe,=
 u32 sample_freq_hz,
>         /* t *=3D 2147483648 on 32bit platforms */
>         t *=3D (2048 * 1024);
>         t *=3D 1024;
> +       /* Sample frequency is under 613MHz */
>         z =3D 7 * sample_freq_hz;
>         do_div(t, z);
>         t +=3D 5;
>
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
>

