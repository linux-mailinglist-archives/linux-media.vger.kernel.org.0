Return-Path: <linux-media+bounces-38193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C195B0CA1F
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 19:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FF16C1ADE
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5E82E54B9;
	Mon, 21 Jul 2025 17:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GVCqqHTt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60892E3366
	for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753120022; cv=none; b=cZZT0VAjHyn0AQcUPnH4qjBQv8sp5r+900nQMyTIGh1WaefWs972W50HMWuzPL9MN2ul2hGjzGi8JbmZWsvG8uKaF/JU0JMvhfQ0ZAqKJliEvfEosqtOEtiRU5K6QVoAZmVzOJxb4ObAaya1a7xnprp1ttfZ/rCh0QPHJ8e6NKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753120022; c=relaxed/simple;
	bh=calo2kPchLTx/0RqT5EzXB5IG6us//9yTqxvYPq5t1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFV9Q3g3sxAQShzbTcb/q6lf2TATTe0RkZ4jSke/IAJApXoLx3zYd9wxvUCwiXOk6DfB6TRu+aODQb9BcJ0QlaszBU3c2ZXFG4FpSp+eJcKHLvXeULqVJIQoOMWPWsREQsqkCvAi1ysAeFcSKCimcc/xSZJ6dWQCPVhIMT5S5pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GVCqqHTt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so9831037a12.1
        for <linux-media@vger.kernel.org>; Mon, 21 Jul 2025 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753120017; x=1753724817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgdrHVKYOQ9ppPex2pOtGiCrSp3UKPgYB5yU3nqetfQ=;
        b=GVCqqHTtr733EkehvkMoI9U61Ge61vzPlhFpBNvvknPZJVVCpsLYMd1HQTVrF7/6DW
         4PNsCGZSm+6MQfOBsD4qmvqIXDAG9pDDf9xw/apHAe94ejpKvlka05wCB/qEsEuZZGJA
         EzAWlp7LJIC4rYM5+KyzUJURUrS18zcJsu2Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753120017; x=1753724817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgdrHVKYOQ9ppPex2pOtGiCrSp3UKPgYB5yU3nqetfQ=;
        b=q4B/ZNhl18h/jZ06SOlTKOyfQUr2rGkQ2/8eunEwXYE0RO0CDWNDWHI9SNf1D8XlaG
         f9h1WHbKcmUK1qz3MxswiHPWXJ7etkikzI6DfhXbmhD7vLqCbD6/QyOtsOgmxjkxf+Zy
         7v0CNs7qGF/P4T9wjp5xXvub+atDkk28aFhdj/ZhTQJ4JiLTXSq/m0qv2KVG8iRzIo1f
         9L0v1dn3SycG/RTCZuyL6D64AsqdwB9zM3xQIbUMKZ6/auEj5V3vx7hYYc6+GiTX/aX8
         NiaQTj2YrdU3HsZ7JrTyXljC7tX7TLzrBh5Bfo2NMDV+5nicK8FowcbIrexX5NJs5NMF
         eZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNfGveqwYQervuWb2ov26O3vuPiu6lASgmVMs5ko5V1ZkIvz1O6t3lo+0AKSQFO8lKG4l9QKC/JF7ZNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1dnhLNC2M2YTVKAgH2OtTJjJ8UVm+RvAU3EGFuCqx8BhRX0A
	nf+aRdg1mkN02vzkX04QL7hLiV37co7xBJQdMQ6Lm/mBYJtBIzdiCT0UtwhCMYI/wLtDbHkvIOg
	JRfHYkvatSiudQpdaMNbZv/hYUr1bet7yXmJSN3z/
X-Gm-Gg: ASbGncuE3JbhqnSK12ThHD8Os/zt9IB3weK3j3kdp7LC1x/cp1YMWFRZEnd3NqtXJK3
	W7WPRyuJsTYtN1DWXoksqFD3VmpKRUm8tWZ/Nw1TS1s7iKHXIXMd768KALfJCc0cHjyf86WF7jS
	VKVSg+i3BZXpZ1eN7WepNCTUHzzJOzNOqz/WCHh5abev3tJkIN6g5f9LN52g6LeeHSQbOVLR4tm
	tmZBvM=
X-Google-Smtp-Source: AGHT+IG4Cb5/Upf1NGKGvBZwFob4DGiucz5xEVtSKX10XiT/wE6bKqZSI17ZGyvJg3qfJi2tuPumtNfMrEU7WAFbjUA=
X-Received: by 2002:a17:907:9703:b0:ae2:3544:8121 with SMTP id
 a640c23a62f3a-af1529e3c52mr46079466b.9.1753120016973; Mon, 21 Jul 2025
 10:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-su-v1-1-0f740fd8bfb6@chromium.org> <7ebb8be3-ce67-4989-bae6-8459aef74528@kernel.org>
In-Reply-To: <7ebb8be3-ce67-4989-bae6-8459aef74528@kernel.org>
From: Allen Ballway <ballway@chromium.org>
Date: Mon, 21 Jul 2025 10:46:46 -0700
X-Gm-Features: Ac12FXyOtiUUTetIfpqOJ6vnbLB_uoBVrW7m1UCGcyztucen20Jk7eiRahyse1o
Message-ID: <CAEs41JAt5Hjp7G6LPr36e+BT0dp6RU5p25kzCwnwBpBfF-3dJw@mail.gmail.com>
Subject: Re: [PATCH] media: ov8865: Preserve hflip in ov8865_mode_binning_configure
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 21, 2025 at 4:51=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Hi,
>
> On 17-Jul-25 11:07 PM, Allen Ballway wrote:
> > Prevents ov8865_mode_binning_configure from overwriting the hflip
> > register values. Allows programs to configure the hflip.
> >
> > Signed-off-by: Allen Ballway <ballway@chromium.org>
>
> Thank you for your patch.
>
> > ---
> >  drivers/media/i2c/ov8865.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> > index 95ffe7536aa6aba814f4e5c3d12e7279470b2f07..40a852d31f13aff960acfd0=
9b378d71525e19332 100644
> > --- a/drivers/media/i2c/ov8865.c
> > +++ b/drivers/media/i2c/ov8865.c
> > @@ -1746,7 +1746,13 @@ static int ov8865_mode_binning_configure(struct =
ov8865_sensor *sensor,
> >       if (ret)
> >               return ret;
> >
> > -     value =3D OV8865_FORMAT2_HSYNC_EN;
> > +     ret =3D ov8865_read(sensor, OV8865_FORMAT2_REG, &value);
> > +     if (ret)
> > +             return ret;
> > +
> > +     value &=3D OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
> > +               OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
> > +     value |=3D OV8865_FORMAT2_HSYNC_EN;
> >
> >       if (mode->binning_x)
> >               value |=3D OV8865_FORMAT2_FST_HBIN_EN;
>
> this change should not be necessary. Lets assume we start
> with the sensor runtime-suspended, then ov8865_resume()
> will call:
>
> ov8865_sensor_power(true)
> ov8865_sensor_init()
>   ov8865_state_configure()
>     ov8865_mode_configure()
>       ov8865_mode_binning_configure()
> __v4l2_ctrl_handler_setup()
>
> Where the __v4l2_ctrl_handler_setup() call will apply
> all control settings including hflip.
>
> So unless you manage to hit a code-path where somehow
> ov8865_state_configure() gets called without calling
> __v4l2_ctrl_handler_setup() afterwards then this should
> not be necessary.

ov8865_state_configure() is also being called from ov8865_set_fmt(),
and makes no calls to __v4l2_ctrl_handler_setup(). I'm not sure if
calling __v4l2_ctrl_handler_setup() here as well is the right fix, but
the driver ov8865 seems to be based upon, ov5648, seems to avoid
this issue by preserving the flip values when setting the binning
register values in ov5648_mode_configure by using
ov5648_update_bits() rather than ov5648_write(). I believe that we
just need to preserve the register values unrelated to binning inside
ov8865_mode_binning_configure, possibly by just using
ov8865_update_bits() instead of ov8865_write().

>
> Note the whole runtime-pm / calling of ov8865_sensor_init() /
> ov8865_state_configure() code in this driver is somewhat
> unusual. So it could be there is a bug there.
>
> But I don't believe that this patch is the correct fix.
>
> Regards,
>
> Hans

Thanks,
Allen
>
>
>
>
>
> >
> > ---
> > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > change-id: 20250717-su-94b187fa3d1e
> >
> > Best regards,
>

