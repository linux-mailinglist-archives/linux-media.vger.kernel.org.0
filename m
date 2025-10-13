Return-Path: <linux-media+bounces-44330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7517BD5329
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 18:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F411585706
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C0E30C600;
	Mon, 13 Oct 2025 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KhxEH7aq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5530F7FA
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370974; cv=none; b=p6w4o8NpqePPc4Cvtoh0qP0MizVGsaN/oaH5Njh8hENT9VLIN7+JwxcofG7wzmlK6OCNONlQDeGWJLenczuZlVllieBmpvIDmOo1fWp+MWSuc5ictfkrKGrDH2y6obzgQDvprMd5GtACyy/uFYd4PnVbOhRm2K1PgHHr5hzZYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370974; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAUZ2imxKmVLMjkGP0HeyAyg75BtTkJLQA9ah8FhzyVeC0nJMg6hqtwAK2bdLwHDLkKYQ/s+8P38zDZrTy8SAbwBKyijRlwtI5+PdB8kjfajNtaM9nwIUsFRVdJ/kTMGvWEAauj0t0XgEXKfa8weHtEK4yWPseSbOAbO5frBCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KhxEH7aq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so814938466b.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760370970; x=1760975770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=KhxEH7aqeMg9KQQ5k1DwmfqgdMzIuA/ZHfeq/b9NrTcF5aPpr7IDJjui/lrzH2ukqJ
         evtRShl8jLDgPs9UgH2RqvzYs/9LzX76XTRSebAEvsKmhfIgmBuyEbtknTzCsN3+uoJV
         d5RhuRaO0VmgEnDZoAMROdeIW3BnSMyLXoCyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370970; x=1760975770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=VPS1V3aUJzX6+9p7+/2AyO8zmHrYVIQYZY8HGP+pl7Bvr1v2y2rW2B7Qv+pxviSHLV
         hKQ5NRTA+LkRuy0fm1juIU9VrAZO/9Lp7/VTyPTL3Y+dHqaxkH8HN7uHH0AZcp3f7q8n
         f/SlEA1Cf4TGu68ZAo69x3LY0KQ0TWoZYxUhVH8FoYtPndQUUHSPadqrPcY0pB5uIeu/
         Ne78B7qgFaRaOe1qk7d3ZUdroniD6nrAawqTMH4Fas7TxfdkVDm8XR64oRV+av02wXBn
         Ip6bq3aZRwgpnwt7DXhybikwIy6/R8TmKFH5ql/JGwQvyD87mv7agN7wR/vMDA7zWVsb
         qBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWoKWFQHPXFY3McYQ0ctH/mAZSpqa7GWOQDhKAaXrk+K7tcqsGG/qV/RTKlQ+OL6xA5uBk1uHYzuXUkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHzavqln0AHVQo+2y7eFidSpgBwKQB7kpd3UH7U82XZpedqZzt
	vd/IsXzTEQVolyf/4Evy3t8Rjgu+oQrwT7lJsYaxLejQZPt4jC4aSpnnzE/WxTVJIj7RDBh1oJL
	TMK2IVNGG
X-Gm-Gg: ASbGncu+27icC/JaAvj4/RoujmOTAiWR/5QDcG/ZAw/fx61p+sJ7aLtkKj+9xRLwyAg
	VPTNsa1OJwFFY9IKY+UgQuz0Jc36e70fdaqcaD4uoX5b4gX1For3J/H4oujydD9wLQ1lHJwrmoe
	gYFBW8yj/qnyI/ZGD4WJRJNxcC7wYryWluE1rkTVnN7gsorBEJWGkYzCTujjGdbrRc+SQ9UEsXm
	AmvJtjmjrYwYq4ozoxmIoXSdrA2pWWT2tStRdDLLfWUzassEIwOcXePnNAGpyKgZxH5lObrVx/f
	ZYFudHhpb3Re6HBBO6ThJ2L4JUWi7oCQb3KcbQxv80CRcz7T9NTebcuHkNiqdqPcFVjdLIrPTZ3
	7ea8P7pO69/mWIoKov0OozrPqux/2ouItihz08R1lisBA5mYaB3gxJhHko26+glsfnhJ56rZQIm
	E05Oo=
X-Google-Smtp-Source: AGHT+IF8HCZBZe2LYYqHolnJ3vq25PEGEHTQV0liNqN1WtaCy8XXoLPzUs4d1gVGTlDPW4eTIggKSQ==
X-Received: by 2002:a17:907:3d91:b0:b42:f7df:a2ec with SMTP id a640c23a62f3a-b50aa391ec3mr2234438566b.9.1760370970570;
        Mon, 13 Oct 2025 08:56:10 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b58244d17e1sm529578966b.75.2025.10.13.08.56.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:56:10 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso8231305a12.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 08:56:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/K2nguSFmNEQD/KM4HbZI1obY6jf8YnVy1HSiNaHvYS8TyI7AT2trTVb6ByJTcuikVKBfiC1zzQQQOw==@vger.kernel.org
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

