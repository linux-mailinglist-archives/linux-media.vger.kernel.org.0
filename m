Return-Path: <linux-media+bounces-44331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1BEBD552B
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 19:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04C2B586D1E
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA89230CD92;
	Mon, 13 Oct 2025 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N2zCU/qG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE930C60F
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371352; cv=none; b=lPu6jVVvZ7fchItzfkXEx5ncejAxV85Lassh/rWaMRiyLnU+7SOgiyDLyhRPaS7K1k+XDGkjzpd1hqEgoVRTOqoZMlknl8LOnNHKWnLUwLrN+X2DkcuNBuYhBsab39zHUXEmUTUxlTE5C37tcQCmx29GDGlD7H+oU4KurZR+NUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371352; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3s1UdMIWyDN1AK5vPVUK0TIBLD5uW9BRl/Iazt3TPnf3MXbn436RK+lyh/h+olrZsUBKwjQYYbd0219yRVoiT15zMpiP4c0fERu4Q0F2b//ysiuiB59rOdkuyJmCt94Vyulmp+cJaqOk1puPrq9gaOY9M8bE7jj+QkcbLXwThg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N2zCU/qG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so816080366b.0
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371349; x=1760976149; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=N2zCU/qGJP4rqtlFaLVwct8FCtQTxPhMzuiZoB9ZBcMLXSPbEDt3UPSxZYgWgb1bTB
         qY1ZTcLDXfEeMO1FlsYYblcEPiyyqoPIdOxTzqL35Zv+tOOrDnTLe0LZAOfi911aq0kS
         shO4bI1rTY0eQgWLfdCVpniD7jJSgnPzY0PmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371349; x=1760976149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=mugVDtweWV19lAR2dx+gLAw5MDp0cTVzFVi6ElDLtF+ai77w/+V2ntr/lrzqKeSe0q
         /iL5WKButHEIcdqRG6O/GqJPrv8Dr61FznT93Qnj5IzberC7f6sUsIbjEB3H/T+nUCxW
         C6e5gNixy/1mtr0ei5JswmenE8qMEst46liq1NDRRdPpAau5E3QwlookBZfGjW+H4mbh
         /5DjeIadjCpqiSjafdEGkhYnv40rs0EvOGB+gOWahlj41wbHmmSERRDaep09Murm+SQe
         WrahBctOcfygy4KMsBOQ3kqfNmNoB488bDRRAYTQkaLjjPiTgeJbp+u2ElB4YV66QcbT
         KBGg==
X-Forwarded-Encrypted: i=1; AJvYcCVW7FpL6bEqWm0iHUnEOlHsZgc+EkujMljHF0RmdtYd18VFcEvGO+a6cmoyAppYjoqBWevnGNGuADIheQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZ0CUaM4DChVNaGY4NQTQ09vNJANSZwlFmIVejorSMYHJxEwS
	VIV121oqwrIW12LUd71pLWWP66lavDrAuxmrDH5Wq85TbBhep+o7ehyEEnExXZM9muKUd9Ntgin
	nRknIiE4e
X-Gm-Gg: ASbGncvcfRV3fSZzfdWMhaY7pgl8dMMbOGmYH1m4uM0yLSNEb0uXp+795oOw3wKtWCF
	nOUOqQady1P6JNTgw50jjEbD02vw5XboIksrWlzJm7gu5N040n7SuMob1zGxY5AvCsyFAEfeiIe
	tsEAMuSdGEySmoQzU9/YwsmhhkL58Lch/eKm1gEGjW332FYBaT9VgcO+CEl30r02djCr1ETJLpb
	IbWFwKGVa3Rpia4s3iojQVHgiw47633l/i7q5dvL3wuOF65i8ee5OQvApnhHsfODR4ytoC3lmm6
	zvUt7+vZleYP5WLiso0a2V/8hsYnHo1pT3M7WMsISEWj535YJ0PtkdqSTZp6xao+8v5lZ6HVLFK
	dnm+YvnZukN/Zd9BUO8q4UT9HSJArW7iLCD3912SP5hiMf+/DiiTociICVrZTK2mf9T2lphxNFc
	wZoPI0vkmC7PGB2eCKlWGzO3oJ
X-Google-Smtp-Source: AGHT+IE+UQcVSYOs/9dULd0lJfEcOFF+ImdzP+grQFNHRhOGV9T3V05hfSryDUC/J5AJ/+KM7d60YA==
X-Received: by 2002:a17:907:86aa:b0:b3d:73e1:d810 with SMTP id a640c23a62f3a-b50ac4da07bmr2134395166b.49.1760371347896;
        Mon, 13 Oct 2025 09:02:27 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12b4csm981361366b.56.2025.10.13.09.02.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:02:27 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae31caso943724266b.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeoZImgXliBrykLlHTNEOkUazGyw15b++0L46Ip8ZkA6O8GLlvcA2sAsdUURZGw2HqgLtfkLgwpUqNEg==@vger.kernel.org
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda

