Return-Path: <linux-media+bounces-23647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E45BD9F587B
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 22:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4421646DB
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 21:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4191F9F4A;
	Tue, 17 Dec 2024 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajSkF7bP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E921DA10C;
	Tue, 17 Dec 2024 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734469885; cv=none; b=Rae/eOZLoYCjrouxz5VJ5cIS+FxMTxskDtW/MUdsS1z8a5QSXMcfbYOlphEb5iVAIAC7utnz12vFsGXLYbCRnWlKE/x2imAnz3IL6ouR7xaE1VJJOyg/tdUbGCSigfE8EYXdO8LwlBxKegXHJfUhbBj5eL4F2/TC3BmyZZu34vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734469885; c=relaxed/simple;
	bh=gNLn5tAMUod+DuG7U+yL+KwuG8p/0CUonTV9rks/7iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blurkHwWqlfaCb+roJNzcRe0bbDtiWUDtDGMX6hkAPUwf9AktSE85TulGbNtfMPYfnd+IEuPcDCu0fH76SkMEyHb9iTr7SHxIxGaOTuNW8mn/fjAkqjLEPXFaBe73JhUG7CYrPTUm53duypjCM5AP3ijr2rxTVBiVOglhzpvH4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajSkF7bP; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so1230400241.0;
        Tue, 17 Dec 2024 13:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734469882; x=1735074682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmOzcn02xMTPY814P29WcJWJgzbLeS13g9MUhDIsB4c=;
        b=ajSkF7bP0wdnCTWnKAvfKTqcO/6+i6T0En9FImC1+3E7aGbQe7hIpWYuD5MXPwU1vR
         pC9KUcUXq/ssDnUDIk8huyxjhX0QlEU/0D7Ct8KG8BhCAIFkGHaWHN1bMLi7n9h2bcdU
         hkSO6pVCdAFwXYdadoC7Fxj8hVuPSyCEnmdpEkdmEfaJ2sLptfGqrv1k9/q4udJW/xsT
         fF3dErVXebh13e5va7O3QTL+MAVEAbsW8GFEex/BLYRXatCYm7GJsrnDyKunGISAVJGa
         QV+JAfwzpg+cHoIKhsqtfCU2KzxmyEuYtCCFJ/qU8JY+oC2vj/A13jYzCVFl04XDA/cI
         5Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734469882; x=1735074682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmOzcn02xMTPY814P29WcJWJgzbLeS13g9MUhDIsB4c=;
        b=E+2LFH3iPyCzgCgjSXWU6RnNNOE7VyTD3pM3aWMrTvjKzeH7JwiFulzEBSikuov9uP
         fleeas+7pNOrF1KXV//OAY+7MXPPhJx5p4/6C2y6LSTP+igzcm01fCl20AhoSq+sy7YD
         0NEzD88AyHFhEMdAaxzU8NtyoOdA9zX3mriG1dgidryvcAY0HVPqsprVv963eLS/YJQE
         pKF99D21rid5EUj6Q0Ycvi2EOwLSj0BXXayxy629Axb5IGSeemBWg3yE+d1g5H0eHT45
         eSVWNOLvVOvp/0zNm46xFcggzCIx4480Plns/eHZKV9DgeU8XhvifUpj9UP+jDY9IcfW
         ivVg==
X-Forwarded-Encrypted: i=1; AJvYcCU0X2rCtorCNrMSGcasEHrmogCcWUcRCXxQgt/ngh0fwXQsELRiIxR7nVVDCla7sFwRiOHcfnuBIh02AAw=@vger.kernel.org, AJvYcCXwhdoFv/J+596SstqYBxVzb1rSgiiyHoR+f+jYkcwfr0pwf3VK1BJY6jQBEhCOy4RlTAKtfJsMPsHjDNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWRps/rcUDWuvQSkCbjsgCM5BJ7ws+RGpNdCwrhCqnsObKtfQ
	pqbWGLbPW3KUAlr999qeYHRPJu53cIrYcTO6jGumGhOKTUSJSS++HRBS+TgVMG5I3jSo0vdyiJn
	VJbjro+C2b853G05A9m78dT27pLJkwkH5ShI=
X-Gm-Gg: ASbGncv+CITdr1unkhcaK4cKIJW10WbYgrXG711O+K8wNzAli6Nc3+bnO/H6bUn5+Ya
	b0cRs83oUN/Pv3rhwSTpUmL85++/RjJMFS6gP
X-Google-Smtp-Source: AGHT+IES0FlCItdgWjpPUYOpvMphQsUndJ7xEMzf77srkiWd+WcuD9mkaa/QCf/DIpXKfTR0cBwOVw2q19DIXUocIQw=
X-Received: by 2002:a05:6122:8c8:b0:515:4ff6:10c1 with SMTP id
 71dfb90a1353d-51a36b65c1cmr847773e0c.0.1734469882383; Tue, 17 Dec 2024
 13:11:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217065151.1281037-1-laurentiu.palcu@oss.nxp.com> <20241217143112.GL878403@ragnatech.se>
In-Reply-To: <20241217143112.GL878403@ragnatech.se>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 17 Dec 2024 22:11:06 +0100
Message-ID: <CAPybu_17SL_n84OHtLOe03tteG8R5w4GSK+N1GENU_kKL69S6Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: max96712: fix kernel oops when
 removing module
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 3:31=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hello Laurentiu,
>
> On 2024-12-17 08:51:50 +0200, Laurentiu Palcu wrote:
> > The following kernel oops is thrown when trying to remove the max96712
> > module:
> >
> > Unable to handle kernel paging request at virtual address 0000737574617=
4db
> > Mem abort info:
> >   ESR =3D 0x0000000096000004
> >   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> >   SET =3D 0, FnV =3D 0
> >   EA =3D 0, S1PTW =3D 0
> >   FSC =3D 0x04: level 0 translation fault
> > Data abort info:
> >   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
> >   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> >   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010af89000
> > [00007375746174db] pgd=3D0000000000000000, p4d=3D0000000000000000
> > Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > Modules linked in: crct10dif_ce polyval_ce mxc_jpeg_encdec flexcan
> >     snd_soc_fsl_sai snd_soc_fsl_asoc_card snd_soc_fsl_micfil dwc_mipi_c=
si2
> >     imx_csi_formatter polyval_generic v4l2_jpeg imx_pcm_dma can_dev
> >     snd_soc_imx_audmux snd_soc_wm8962 snd_soc_imx_card snd_soc_fsl_util=
s
> >     max96712(C-) rpmsg_ctrl rpmsg_char pwm_fan fuse
> >     [last unloaded: imx8_isi]
> > CPU: 0 UID: 0 PID: 754 Comm: rmmod
> >           Tainted: G         C    6.12.0-rc6-06364-g327fec852c31 #17
> > Tainted: [C]=3DCRAP
> > Hardware name: NXP i.MX95 19X19 board (DT)
> > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : led_put+0x1c/0x40
> > lr : v4l2_subdev_put_privacy_led+0x48/0x58
> > sp : ffff80008699bbb0
> > x29: ffff80008699bbb0 x28: ffff00008ac233c0 x27: 0000000000000000
> > x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> > x23: ffff000080cf1170 x22: ffff00008b53bd00 x21: ffff8000822ad1c8
> > x20: ffff000080ff5c00 x19: ffff00008b53be40 x18: 0000000000000000
> > x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
> > x14: 0000000000000004 x13: ffff0000800f8010 x12: 0000000000000000
> > x11: ffff000082acf5c0 x10: ffff000082acf478 x9 : ffff0000800f8010
> > x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
> > x5 : 8080808000000000 x4 : 0000000000000020 x3 : 00000000553a3dc1
> > x2 : ffff00008ac233c0 x1 : ffff00008ac233c0 x0 : ff00737574617473
> > Call trace:
> >  led_put+0x1c/0x40
> >  v4l2_subdev_put_privacy_led+0x48/0x58
> >  v4l2_async_unregister_subdev+0x2c/0x1a4
> >  max96712_remove+0x1c/0x38 [max96712]
> >  i2c_device_remove+0x2c/0x9c
> >  device_remove+0x4c/0x80
> >  device_release_driver_internal+0x1cc/0x228
> >  driver_detach+0x4c/0x98
> >  bus_remove_driver+0x6c/0xbc
> >  driver_unregister+0x30/0x60
> >  i2c_del_driver+0x54/0x64
> >  max96712_i2c_driver_exit+0x18/0x1d0 [max96712]
> >  __arm64_sys_delete_module+0x1a4/0x290
> >  invoke_syscall+0x48/0x10c
> >  el0_svc_common.constprop.0+0xc0/0xe0
> >  do_el0_svc+0x1c/0x28
> >  el0_svc+0x34/0xd8
> >  el0t_64_sync_handler+0x120/0x12c
> >  el0t_64_sync+0x190/0x194
> > Code: f9000bf3 aa0003f3 f9402800 f9402000 (f9403400)
> > ---[ end trace 0000000000000000 ]---
> >
> > This happens because in v4l2_i2c_subdev_init(), the i2c_set_cliendata()
> > is called again and the data is overwritten to point to sd, instead of
> > priv. So, in remove(), the wrong pointer is passed to
> > v4l2_async_unregister_subdev(), leading to a crash.
> >
> > Fixes: 5814f32fef13 ("media: staging: max96712: Add basic support for M=
AX96712 GMSL2 deserializer")
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> Thanks for catching this.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> > ---
> > Changes in v2:
> >  * removed call to i2c_set_clientdata() in probe;
> >  * cleaned up the trace in commit message as the tmux status line strin=
g
> >    sneaked into it;
> >
> > Thanks,
> > Laurentiu
> >
> >  drivers/staging/media/max96712/max96712.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/stagin=
g/media/max96712/max96712.c
> > index ede02e8c891cb..0751b2e048958 100644
> > --- a/drivers/staging/media/max96712/max96712.c
> > +++ b/drivers/staging/media/max96712/max96712.c
> > @@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client=
)
> >       priv->info =3D of_device_get_match_data(&client->dev);
> >
> >       priv->client =3D client;
> > -     i2c_set_clientdata(client, priv);
> >
> >       priv->regmap =3D devm_regmap_init_i2c(client, &max96712_i2c_regma=
p);
> >       if (IS_ERR(priv->regmap))
> > @@ -448,7 +447,8 @@ static int max96712_probe(struct i2c_client *client=
)
> >
> >  static void max96712_remove(struct i2c_client *client)
> >  {
> > -     struct max96712_priv *priv =3D i2c_get_clientdata(client);
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct max96712_priv *priv =3D container_of(sd, struct max96712_p=
riv, sd);
> >
> >       v4l2_async_unregister_subdev(&priv->sd);
> >
> > --
> > 2.44.1
> >
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund
>


--=20
Ricardo Ribalda

