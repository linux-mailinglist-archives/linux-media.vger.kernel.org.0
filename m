Return-Path: <linux-media+bounces-18877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8D98A8C5
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 17:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A6F3281CA7
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6887191F8A;
	Mon, 30 Sep 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X3+s/iQz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F31922F5
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727710512; cv=none; b=Ssk18iJR+Et613Sj5CZ3xw9v9mj//5rwxW7XNM9T0qb7gTjcFdo9182PVYS6Bp+8HTRNWLVL+Ub2OoDu66e7Hnh1vBnfo1/nTdbltbbOL/KOXbhl08l3yZlIcwEq3jIucIneA+vpM9TAKLpOo5ECilLyN9360dYqND2sjc0Cp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727710512; c=relaxed/simple;
	bh=0XJpAdHnjMSi0vjMY45hVoBPZADVUp0uIsFIR0QVyeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SShZ7OLVmDH/Baj5P26FuknBm9JgtyoXPiE7NN9e+HpyLauWwECFjkwdcNkR0fnDoY3wNcCxc7YjDYZVeaTygkQ9uyfHU7NkEW1jhUMThO7iE6uyxXUJE68EuH4BaclZqSD+9bGMtJx/1+XWjrcylBYJ7BRUTmZUlFeIxV94jtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X3+s/iQz; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3a1a4870713so15445865ab.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727710508; x=1728315308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZc5l7HwmrBo73UWrdHZ1JVPdCSgRTelmWziJOuNMk4=;
        b=X3+s/iQzVwTNjXxVDzrjOS/cJr8rc2YJ8jNdvpLQEbvF7W3qMJ5JZM2ap0+r4zQ90A
         /Gb7HKJUlqH4XNNpc/c8j9VR+ktaFeyLOvQj1YCSdGAHyPpKnw/3Rt9vEm7xd0NRuuaV
         Wpbhlm+Cl5en94snBONcwJE/jLuogGw9RbSSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727710508; x=1728315308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZc5l7HwmrBo73UWrdHZ1JVPdCSgRTelmWziJOuNMk4=;
        b=rPUmvPnEe09b9ScwPy1t/x4omsAEUrKUvbz9UtS0soVD2K1l/b7jUh80AbH+nXivNS
         E5gWhBAXs6RqLy5AsqeNFF/CQv66AceOTQyozpose/cYz1HkemQyJFaUxJFStve89SAW
         DWHUh+o0Xx9oIm9Ec+EoJ2BFwX2YOwmee4MTF/y9AGR10ZzhNYWoFBB/XmmMk+7I+fs4
         wOP/K6PhGBvv74KlBMTUhynCrR71WHCJwRGNKEzVKMTtSBIMDPpNAqS0i1jph3Na8o6i
         f/mCJootUq7E99hr584ldKZwd6zIqS59c1dzeh4OumtEmlQF8smDW+xLhkDggg1/JVyn
         /HKg==
X-Forwarded-Encrypted: i=1; AJvYcCXw7iVdyjtYymPmQIFd4wZtzM3xhmC5ShNLTIMrN/FEmj7W2AMSAzt+3YUKH8BuH/SzDFFJjbwJH/e6dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzArCfKOSQdUoxngb/wJmZGLKJPWGPowzda6kSifnCRDGN2QWLs
	c3WQe3FN8BgqzHKhSshfPF/H/tMgsQ75Pmb2hbYMFS6XeXsIj7WnSjxgwGznms6Ma/zkH0j1iAd
	22dh0
X-Google-Smtp-Source: AGHT+IEL+nhhXs0s5Aj0oBjBDjdT4dUcM+MGY+X/A3g8S/a4TwQ5e/Ue8z7lD3ilBEAqXZT/xE6vsg==
X-Received: by 2002:a05:6e02:138a:b0:3a2:f7b1:2f74 with SMTP id e9e14a558f8ab-3a3451b06f6mr100978395ab.20.1727710507693;
        Mon, 30 Sep 2024 08:35:07 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d8888f99f0sm2158459173.157.2024.09.30.08.35.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 08:35:07 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a0cb892c6aso1027855ab.0
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc+ZXAfNLL73UFinllS0RHYex5Z0An4iOFYQieyKqMA+L7JFoCtW+705UOIxCuODlAL8RtCDTNELgeLQ==@vger.kernel.org
X-Received: by 2002:a05:6e02:1383:b0:39e:68d8:2891 with SMTP id
 e9e14a558f8ab-3a35e53e6a9mr350535ab.6.1727710505990; Mon, 30 Sep 2024
 08:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com> <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
In-Reply-To: <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 1 Oct 2024 00:34:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AZhdZkaM=mVqmKY-uTuGrVUnpaTWTvOqUyOKLDS6LSKg@mail.gmail.com>
Message-ID: <CAAFQd5AZhdZkaM=mVqmKY-uTuGrVUnpaTWTvOqUyOKLDS6LSKg@mail.gmail.com>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, Mike Isely <isely@pobox.com>, 
	Olli Salonen <olli.salonen@iki.fi>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Sean Young <sean@mess.org>, Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Jemma Denson <jdenson@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, 
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
	Andy Walls <awalls@md.metrocast.net>, Michal Simek <michal.simek@amd.com>, 
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Tim Harvey <tharvey@gateworks.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 9:38=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 30/09/2024 14:21, Laurent Pinchart wrote:
> > Hi Ricardo,
> >
> > On Mon, Sep 30, 2024 at 12:03:55PM +0000, Ricardo Ribalda wrote:
> >> include/linux/string_choices.h contains a set of helpers that can be
> >> used instead of hard coding some strings.
> >>
> >> Cocci has located some places where the helpers can be used. This
> >> patchset uses the diff generated by cocci, plus these changes:
> >
> > Personally I think most of those helpers just hinder readability for no=
t
> > much added gain. String de-duplication is done by the linker already.
> > The only value I see in the helpers is ensuring that the strings are
> > consistently written, and I think we can do so through other means.
>
> Just my opinion: I'm OK with these new helpers, but I am not too keen to =
apply
> all this to existing source code. I.e., for new code it is fine, but if w=
e have
> to update all drivers every time a new cocci test is added, then that wil=
l not
> scale.

+1 for avoiding applying this to existing code. It will just make it
more difficult to backport changes to stable kernels because of
meaningless conflicts.

Best,
Tomasz

>
> Note that I never ran cocci in my build scripts, so this is a new check t=
hat
> we haven't set rules for or have much experience with.
>
> checkpatch just checks the patches, it doesn't force you to fix existing =
code.
>
> Some of the cocci tests are clearly checking for incorrect code, but othe=
rs are
> for code improvements (i.e. the code was correct, it can just be done sli=
ghtly
> better). It's the second category were I think that should only apply to =
new code,
> and not existing code.
>
> Regards,
>
>         Hans
>
> >
> >> diff --git a/drivers/media/dvb-frontends/ascot2e.c b/drivers/media/dvb=
-frontends/ascot2e.c
> >> index 8c3eb5d69dda..ec7a718428fc 100644
> >> --- a/drivers/media/dvb-frontends/ascot2e.c
> >> +++ b/drivers/media/dvb-frontends/ascot2e.c
> >> @@ -104,7 +104,7 @@ static void ascot2e_i2c_debug(struct ascot2e_priv =
*priv,
> >>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "ascot2e: I2C %s reg 0x%02x size %d\n=
",
> >> -               str_read_write(write =3D=3D 0), reg, len);
> >> +               str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("ascot2e: I2C data: ",
> >>                 DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/d=
vb-frontends/cxd2841er.c
> >> index db684f314b47..d1b84cd9c510 100644
> >> --- a/drivers/media/dvb-frontends/cxd2841er.c
> >> +++ b/drivers/media/dvb-frontends/cxd2841er.c
> >> @@ -206,7 +206,7 @@ static void cxd2841er_i2c_debug(struct cxd2841er_p=
riv *priv,
> >>  {
> >>         dev_dbg(&priv->i2c->dev,
> >>                 "cxd2841er: I2C %s addr %02x reg 0x%02x size %d data %=
*ph\n",
> >> -               str_read_write(write =3D=3D 0), addr, reg, len, len, d=
ata);
> >> +               str_write_read(write), addr, reg, len, len, data);
> >>  }
> >>
> >>  static int cxd2841er_write_regs(struct cxd2841er_priv *priv,
> >> diff --git a/drivers/media/dvb-frontends/helene.c b/drivers/media/dvb-=
frontends/helene.c
> >> index 52198cb49dba..b4527c141d9c 100644
> >> --- a/drivers/media/dvb-frontends/helene.c
> >> +++ b/drivers/media/dvb-frontends/helene.c
> >> @@ -279,7 +279,7 @@ static void helene_i2c_debug(struct helene_priv *p=
riv,
> >>                 u8 reg, u8 write, const u8 *data, u32 len)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "helene: I2C %s reg 0x%02x size %d\n"=
,
> >> -                       str_read_write(write =3D=3D 0), reg, len);
> >> +                       str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("helene: I2C data: ",
> >>                         DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/dvb-frontends/horus3a.c b/drivers/media/dvb=
-frontends/horus3a.c
> >> index 84385079918c..10300ebf3ca0 100644
> >> --- a/drivers/media/dvb-frontends/horus3a.c
> >> +++ b/drivers/media/dvb-frontends/horus3a.c
> >> @@ -38,7 +38,7 @@ static void horus3a_i2c_debug(struct horus3a_priv *p=
riv,
> >>                               u8 reg, u8 write, const u8 *data, u32 le=
n)
> >>  {
> >>         dev_dbg(&priv->i2c->dev, "horus3a: I2C %s reg 0x%02x size %d\n=
",
> >> -               str_read_write(write =3D=3D 0), reg, len);
> >> +               str_write_read(write), reg, len);
> >>         print_hex_dump_bytes("horus3a: I2C data: ",
> >>                 DUMP_PREFIX_OFFSET, data, len);
> >>  }
> >> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> >> index ba174aa45afa..a43479c3ff03 100644
> >> --- a/drivers/media/i2c/adv7842.c
> >> +++ b/drivers/media/i2c/adv7842.c
> >> @@ -2763,7 +2763,7 @@ static int adv7842_cp_log_status(struct v4l2_sub=
dev *sd)
> >>                           str_true_false(io_read(sd, 0x6a) & 0x10));
> >>         }
> >>         v4l2_info(sd, "CP free run: %s\n",
> >> -                 str_on_off(!!(cp_read(sd, 0xff) & 0x10)));
> >> +                 str_on_off(cp_read(sd, 0xff) & 0x10));
> >>         v4l2_info(sd, "Prim-mode =3D 0x%x, video std =3D 0x%x, v_freq =
=3D 0x%x\n",
> >>                   io_read(sd, 0x01) & 0x0f, io_read(sd, 0x00) & 0x3f,
> >>                   (io_read(sd, 0x01) & 0x70) >> 4);
> >> diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media=
/pci/saa7134/saa7134-cards.c
> >> index 301b89e799d8..79cd61fb0205 100644
> >> --- a/drivers/media/pci/saa7134/saa7134-cards.c
> >> +++ b/drivers/media/pci/saa7134/saa7134-cards.c
> >> @@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
> >>                         rc =3D i2c_transfer(&dev->i2c_adap, &msg, 1);
> >>                         pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n"=
,
> >>                                    dev->name, msg.addr,
> >> -                                  str_yes_no(1 =3D=3D rc));
> >> +                                  str_yes_no(rc =3D=3D 1));
> >>                         if (rc =3D=3D 1)
> >>                                 dev->has_remote =3D SAA7134_REMOTE_I2C=
;
> >>                 }
> >> diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media=
/pci/saa7134/saa7134-input.c
> >> index 90837ec6e70f..239f0b9d080a 100644
> >> --- a/drivers/media/pci/saa7134/saa7134-input.c
> >> +++ b/drivers/media/pci/saa7134/saa7134-input.c
> >> @@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>                         msg_msi.addr, dev->i2c_adap.name,
> >> -                       str_yes_no(1 =3D=3D rc));
> >> +                       str_yes_no(rc =3D=3D 1));
> >>                 break;
> >>         case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
> >>                 dev->init_data.name =3D "SnaZio* TVPVR PRO";
> >> @@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
> >>                 rc =3D i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
> >>                 input_dbg("probe 0x%02x @ %s: %s\n",
> >>                         msg_msi.addr, dev->i2c_adap.name,
> >> -                       str_yes_no(1 =3D=3D rc));
> >> +                       str_yes_no(rc =3D=3D 1));
> >>                 break;
> >>         case SAA7134_BOARD_HAUPPAUGE_HVR1110:
> >>                 dev->init_data.name =3D saa7134_boards[dev->board].nam=
e;
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c b/drivers/media/=
usb/pvrusb2/pvrusb2-ctrl.c
> >> index 448c40caf363..b6c9bda214c8 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-ctrl.c
> >> @@ -521,7 +521,7 @@ int pvr2_ctrl_value_to_sym_internal(struct pvr2_ct=
rl *cptr,
> >>                 *len =3D scnprintf(buf,maxlen,"%d",val);
> >>                 ret =3D 0;
> >>         } else if (cptr->info->type =3D=3D pvr2_ctl_bool) {
> >> -               *len =3D scnprintf(buf,maxlen,"%s",str_true_false(val)=
);
> >> +               *len =3D scnprintf(buf, maxlen, "%s", str_true_false(v=
al));
> >>                 ret =3D 0;
> >>         } else if (cptr->info->type =3D=3D pvr2_ctl_enum) {
> >>                 const char * const *names;
> >> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/u=
sb/pvrusb2/pvrusb2-hdw.c
> >> index 96d3a0045fac..761d718478ca 100644
> >> --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> >> @@ -338,7 +338,7 @@ static void trace_stbit(const char *name,int val)
> >>  {
> >>         pvr2_trace(PVR2_TRACE_STBITS,
> >>                    "State bit %s <-- %s",
> >> -                  name,str_true_false(val));
> >> +                  name, str_true_false(val));
> >>  }
> >>
> >> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >> Ricardo Ribalda (45):
> >>       media: staging: ipu3: Use string_choices helpers
> >>       media: staging: atomisp: Use string_choices helpers
> >>       media: core: Use string_choices helpers
> >>       media: pwc-ctl: Use string_choices helpers
> >>       media: pvrusb2:Use string_choices helpers
> >>       media: em28xx: Use string_choices helpers
> >>       media: dvb-usb: Use string_choices helpers
> >>       media: dvb-usb-v2: Use string_choices helpers
> >>       media: cx231xx: Use string_choices helpers
> >>       media: tuners: Use string_choices helpers
> >>       media: rc: Use string_choices helpers
> >>       media: dvb-frontends: Use string_choices helpers
> >>       media: pci: cx23885: Use string_choices helpers
> >>       media: saa7134: Use string_choices helpers
> >>       media: amphion: Use string_choices helpers
> >>       media: pci: ivtv: Use string_choices helpers
> >>       media: bttv: Use string_choices helpers
> >>       media: xilinx: Use string_choices helpers
> >>       media: platform: ti: Use string_choices helpers
> >>       media: st: Use string_choices helpers
> >>       media: coda: Use string_choices helpers
> >>       media: aspeed: Use string_choices helpers
> >>       media: ipu6: Use string_choices helpers
> >>       media: cx18: Use string_choices helpers
> >>       media: cobalt: Use string_choices helpers
> >>       media: videobuf2: Use string_choices helpers
> >>       media: cec: Use string_choices helpers
> >>       media: b2c2: Use string_choices helpers
> >>       media: siano: Use string_choices helpers
> >>       media: i2c: cx25840: Use string_choices helpers
> >>       media: i2c: vpx3220: Use string_choices helpers
> >>       media: i2c: tvp7002: Use string_choices helpers
> >>       media: i2c: ths8200: Use string_choices helpers
> >>       media: i2c: tda1997x: Use string_choices helpers
> >>       media: i2c: tc358743: Use string_choices helpers
> >>       media: i2c: st-mipid02: Use string_choices helpers
> >>       media: i2c: msp3400: Use string_choices helpers
> >>       media: i2c: max9286: Use string_choices helpers
> >>       media: i2c: saa717x: Use string_choices helpers
> >>       media: i2c: saa7127: Use string_choices helpers
> >>       media: i2c: saa7115: Use string_choices helpers
> >>       media: i2c: saa7110: Use string_choices helpers
> >>       media: i2c: adv7842: Use string_choices helpers
> >>       media: i2c: adv76xx: Use string_choices helpers
> >>       media: i2c: adv7511: Use string_choices helpers
> >>
> >>  drivers/media/cec/platform/cec-gpio/cec-gpio.c     |  4 +-
> >>  drivers/media/cec/usb/pulse8/pulse8-cec.c          |  4 +-
> >>  drivers/media/common/b2c2/flexcop-hw-filter.c      |  4 +-
> >>  drivers/media/common/siano/sms-cards.c             |  3 +-
> >>  drivers/media/common/videobuf2/videobuf2-core.c    |  5 ++-
> >>  drivers/media/dvb-frontends/ascot2e.c              |  2 +-
> >>  drivers/media/dvb-frontends/cx24120.c              |  4 +-
> >>  drivers/media/dvb-frontends/cxd2841er.c            |  2 +-
> >>  drivers/media/dvb-frontends/drxk_hard.c            |  4 +-
> >>  drivers/media/dvb-frontends/helene.c               |  2 +-
> >>  drivers/media/dvb-frontends/horus3a.c              |  2 +-
> >>  drivers/media/dvb-frontends/sp2.c                  |  2 +-
> >>  drivers/media/i2c/adv7511-v4l2.c                   | 11 +++---
> >>  drivers/media/i2c/adv7604.c                        | 25 ++++++------
> >>  drivers/media/i2c/adv7842.c                        | 40 ++++++++++---=
-------
> >>  drivers/media/i2c/cx25840/cx25840-core.c           |  4 +-
> >>  drivers/media/i2c/cx25840/cx25840-ir.c             | 34 ++++++++-----=
----
> >>  drivers/media/i2c/max9286.c                        |  2 +-
> >>  drivers/media/i2c/msp3400-driver.c                 |  4 +-
> >>  drivers/media/i2c/saa7110.c                        |  2 +-
> >>  drivers/media/i2c/saa7115.c                        |  2 +-
> >>  drivers/media/i2c/saa7127.c                        | 15 +++++---
> >>  drivers/media/i2c/saa717x.c                        |  2 +-
> >>  drivers/media/i2c/st-mipid02.c                     |  2 +-
> >>  drivers/media/i2c/tc358743.c                       | 44 ++++++++++---=
---------
> >>  drivers/media/i2c/tda1997x.c                       |  6 +--
> >>  drivers/media/i2c/ths8200.c                        |  4 +-
> >>  drivers/media/i2c/tvp7002.c                        |  2 +-
> >>  drivers/media/i2c/vpx3220.c                        |  2 +-
> >>  drivers/media/pci/bt8xx/bttv-cards.c               | 16 ++++----
> >>  drivers/media/pci/bt8xx/bttv-driver.c              |  6 +--
> >>  drivers/media/pci/cobalt/cobalt-driver.c           |  2 +-
> >>  drivers/media/pci/cx18/cx18-av-core.c              |  4 +-
> >>  drivers/media/pci/cx23885/altera-ci.c              |  2 +-
> >>  drivers/media/pci/cx23885/cimax2.c                 |  2 +-
> >>  drivers/media/pci/cx23885/cx23888-ir.c             | 36 +++++++++----=
-----
> >>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  2 +-
> >>  drivers/media/pci/ivtv/ivtvfb.c                    |  4 +-
> >>  drivers/media/pci/saa7134/saa7134-cards.c          |  2 +-
> >>  drivers/media/pci/saa7134/saa7134-dvb.c            |  2 +-
> >>  drivers/media/pci/saa7134/saa7134-input.c          |  6 +--
> >>  drivers/media/pci/saa7134/saa7134-video.c          |  2 +-
> >>  drivers/media/platform/amphion/venc.c              |  2 +-
> >>  drivers/media/platform/amphion/vpu_dbg.c           |  2 +-
> >>  drivers/media/platform/aspeed/aspeed-video.c       |  4 +-
> >>  drivers/media/platform/chips-media/coda/imx-vdoa.c |  3 +-
> >>  drivers/media/platform/st/sti/hva/hva-debugfs.c    |  6 +--
> >>  drivers/media/platform/ti/omap3isp/ispstat.c       |  2 +-
> >>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    | 18 ++++-----
> >>  drivers/media/rc/ene_ir.c                          |  3 +-
> >>  drivers/media/rc/mceusb.c                          |  3 +-
> >>  drivers/media/rc/serial_ir.c                       |  5 ++-
> >>  drivers/media/tuners/tda18250.c                    |  2 +-
> >>  drivers/media/tuners/tda9887.c                     | 10 ++---
> >>  drivers/media/usb/cx231xx/cx231xx-i2c.c            |  4 +-
> >>  drivers/media/usb/cx231xx/cx231xx-video.c          |  2 +-
> >>  drivers/media/usb/dvb-usb-v2/az6007.c              |  4 +-
> >>  drivers/media/usb/dvb-usb-v2/dvb_usb_core.c        |  4 +-
> >>  drivers/media/usb/dvb-usb/af9005-fe.c              |  4 +-
> >>  drivers/media/usb/dvb-usb/dvb-usb-dvb.c            |  6 +--
> >>  drivers/media/usb/dvb-usb/opera1.c                 |  8 ++--
> >>  drivers/media/usb/em28xx/em28xx-i2c.c              |  4 +-
> >>  drivers/media/usb/em28xx/em28xx-video.c            |  2 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-ctrl.c           |  2 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-debugifc.c       |  3 +-
> >>  drivers/media/usb/pvrusb2/pvrusb2-encoder.c        |  5 +--
> >>  drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |  6 +--
> >>  drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c       |  3 +-
> >>  drivers/media/usb/pwc/pwc-ctrl.c                   |  2 +-
> >>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +-
> >>  drivers/media/v4l2-core/v4l2-fwnode.c              | 12 +++---
> >>  .../media/atomisp/pci/atomisp_compat_css20.c       |  2 +-
> >>  .../media/atomisp/pci/atomisp_csi2_bridge.c        |  2 +-
> >>  .../media/atomisp/pci/atomisp_gmin_platform.c      |  4 +-
> >>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  4 +-
> >>  .../media/atomisp/pci/runtime/binary/src/binary.c  |  2 +-
> >>  drivers/staging/media/atomisp/pci/sh_css.c         |  2 +-
> >>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  4 +-
> >>  78 files changed, 240 insertions(+), 239 deletions(-)
> >> ---
> >> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> >> change-id: 20240930-cocci-opportunity-40bca6a17c42
> >
>

