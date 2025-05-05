Return-Path: <linux-media+bounces-31730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D3AA9D45
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 22:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CF93B01DB
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 20:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30052270548;
	Mon,  5 May 2025 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I/Lbi1CV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA21C861D
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477275; cv=none; b=bnmHaao6pV8e3jcQvWMCy+GbfMLxrwtPqevTtNH0tkLy9eu33L4qIPGSGuWNzIIeS/b/M4XEPFAsjJSpB2mrYkDWa7IJqYYL+ZG9gY7y05U5Bbqtjt1vWqD0eD6CTMM348D6E1yWYNX0i96sU+zP/qouCtVUmO7ZEnGHbwJjq0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477275; c=relaxed/simple;
	bh=eXsbeYaStEdVkB/9iiuPPvCcb0GJ33j+Y7Lm4GpCn+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifRKKrsPU4sBtCB9PQjlJNYnRy0YVOzZDoLP+xjU+5uwD7KSagHL/szhe/Zkuss9jVnYh0mI72RW2DeeZHUc6Tdgi2D67Eq4ezLhGjUl7z+zWtTfKOtFKbYYl3ZojArV5IzLtTT7B2tdJ3BiN6xK+d4LOabbJOjCxloTF/jHXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I/Lbi1CV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54998f865b8so5306356e87.3
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746477271; x=1747082071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=I/Lbi1CVZDl1obG0Fb/2EMGdznGkHEAP980LT0oBlKAb39k9aPyq8cCLUWC7GZtrR/
         rJZfD4xgng58xottKDQH5b7Y40adyt9beewyCkNl3QyGgsLqUFV2uDC2jNQOHy+JoNjS
         9kxQy5p1eLTrg1ioVr0GLrR5s/tj5cc88xCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477271; x=1747082071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aad+O7LlnePo9Jud5k6L+0x2zxiP/d5GA/t21nuBedc=;
        b=qf/lpAoVbJg9B3/TbxjMEVJhgUk1ICCx7k5KhVUGcR4Bp4uQHV0GhGtEmCtHSwp8E+
         tBrJOF7cayD/jJJq/QZITtyH0X/v5J8xAXjRUM8xNiY/DtZMHkzq9U9GLYVObUq7mJm4
         FHhoAb8InPqv7cc1TrefKBeqQZKU4GeMomSNv/MSPFNAPE/kKg+NB+o63e8JfESWYbwh
         Kg3uyQV+0U2g/FVrUisT2zF8OvDgCZlVitT22Ks3O5GSwGxvFv4rr7RE7NuT7cyrOuXr
         PjlQ7YyPw8R1BJRTOnG9xmoHrIGZgyxBIW/w74HHsEKUFCq6Kj84/pmh2jcSzcSZrD3M
         PkBg==
X-Forwarded-Encrypted: i=1; AJvYcCVzg71knrYBkc1Jh4N/EUkbyI5cQa7f4PyxfJ2uwUAXZRB2obdUBTY6rjmjEBQBopSLBm9a8fE//npC0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hRtAJHMiNGcfDtryO8ZVMPIQk6UhP1aKHloKemp0gToeuztZ
	RIYpJeT0bwlOyFduWpebl8xP+t0lzMyzXtVfNr1knhwi7jJcrDxxV2MK/jIx3MDnkODC9djcLOA
	=
X-Gm-Gg: ASbGncuR5Shknpg6+j2l3Y+YAG3wZGw9BLSiKP3GLx+ltBEhxGW9FVAAFL2kekw2GqG
	EWTBEd5THtdg88RSiY+TAZ58hJLsGuE4GfdwwhIzPDM0rEm4nqiLuqkOxa6w1hefoarQsni0Ckr
	dDfKIkSUffGgT4VkhTNzDnEO3Hk/NYgpH57y9z65aLvJXEgJTqZnzyo1f0M8+tUFyz9a9P5HJpa
	T4XfTY4HF+FXmrCjwlBXDFm6R6VGaVY9WL78NLnvZYDSr23e/JBUqJ90b4Ttr9AS/vbJvvT1veW
	JmGM/JNVHO9clD9u+dVXmLQtgm3kU7F8LnszkxWuZkgIoX34kZ9vC60MLWE3U7ZZqouhW8ExgP0
	mYN6znC4=
X-Google-Smtp-Source: AGHT+IGPYP2JS3h6iOfckJUsuVQYaPrKXzbhxeyfZTZC5UIYBI8wHfBItz4oWyIWvP3FPv/9w4Eamw==
X-Received: by 2002:a05:6512:3b24:b0:54b:f04:59e8 with SMTP id 2adb3069b0e04-54fb4a5df10mr126380e87.23.1746477271458;
        Mon, 05 May 2025 13:34:31 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1d4dsm1850620e87.18.2025.05.05.13.34.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 13:34:30 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfca745c7so44914981fa.0
        for <linux-media@vger.kernel.org>; Mon, 05 May 2025 13:34:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqZNLHLbOgZG+LN5VTVwVt2H1rMvw+nNnofywNHRgr0tmMIRZ114YWAgrvpRdg/9rqpDKuv9v3qcf7kA==@vger.kernel.org
X-Received: by 2002:a05:651c:b2a:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-3266b59789emr751721fa.10.1746477268328; Mon, 05 May 2025
 13:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org> <Z_uIyEe4uU_BC5aY@valkosipuli.retiisi.eu>
 <CANiDSCvQC25ZrSZgUuFt6deCogFL6=GPsYYrsegK1NOK=uzRJA@mail.gmail.com>
 <dd471b51-333b-4537-ac58-29ad2a10f1e2@redhat.com> <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
In-Reply-To: <aAdkU65ruBfyRjss@valkosipuli.retiisi.eu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 May 2025 22:34:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
X-Gm-Features: ATxdqUEg2rUAsN7TYo98ElSvRXDzyBQACXaWg80nr6xGofF6c5WfqBKJm9vPYRM
Message-ID: <CANiDSCt5_HwfwXDWNGWvzkSAW2ZB4PJwS00=i0EizY_3A-OSgw@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for v4l2_fwnode_device_parse
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

On Tue, 22 Apr 2025 at 11:41, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Hans, Ricardo,
>
> On Tue, Apr 22, 2025 at 10:44:41AM +0200, Hans de Goede wrote:
> > Hi Ricardo,
> >
> > On 22-Apr-25 2:23 AM, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Sun, 13 Apr 2025 at 17:50, Sakari Ailus <sakari.ailus@iki.fi> wrot=
e:
> > >>
> > >> Hi Ricardo,
> > >>
> > >> Thanks for the patch.
> > >>
> > >> On Thu, Apr 03, 2025 at 07:16:14PM +0000, Ricardo Ribalda wrote:
> > >>> This patch modifies v4l2_fwnode_device_parse() to support ACPI devi=
ces.
> > >>>
> > >>> We initially add support only for orientation via the ACPI _PLD met=
hod.
> > >>>
> > >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>> ---
> > >>>  drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++=
++++++++----
> > >>>  1 file changed, 52 insertions(+), 6 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/=
v4l2-core/v4l2-fwnode.c
> > >>> index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1=
c96f2a5ede3fa9d64dab3 100644
> > >>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > >>> @@ -15,6 +15,7 @@
> > >>>   * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > >>>   */
> > >>>  #include <linux/acpi.h>
> > >>> +#include <acpi/acpi_bus.h>
> > >>>  #include <linux/kernel.h>
> > >>>  #include <linux/mm.h>
> > >>>  #include <linux/module.h>
> > >>> @@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwn=
ode_handle *fwnode,
> > >>>  }
> > >>>  EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
> > >>>
> > >>> -int v4l2_fwnode_device_parse(struct device *dev,
> > >>> -                          struct v4l2_fwnode_device_properties *pr=
ops)
> > >>> +static int v4l2_fwnode_device_parse_acpi(struct device *dev,
> > >>> +                                      struct v4l2_fwnode_device_pr=
operties *props)
> > >>> +{
> > >>> +     struct acpi_pld_info *pld;
> > >>> +     int ret =3D 0;
> > >>> +
> > >>> +     if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld=
)) {
> > >>> +             dev_dbg(dev, "acpi _PLD call failed\n");
> > >>> +             return 0;
> > >>> +     }
> > >>
> > >> You could have software nodes in an ACPI system as well as DT-aligne=
d
> > >> properties. They're not the primary means to convey this information=
 still.
> > >>
> > >> How about returning e.g. -ENODATA here if _PLD doesn't exist for the=
 device
> > >> and then proceeding to parse properties as in DT?
> > >
> > > Do you mean that there can be devices with ACPI handles that can also
> > > have DT properties?
> >
> > Yes it is possible to embed DT properties in ACPI, but I don't
> > think that is really applicable here.
>
> This is determined by
> Documentation/firmware-guide/acpi/DSD-properties-rules.rst . So rotation
> and orientation shouldn't come from _DSD properties on ACPI systems.

Doesn't this contradict what DisCo does?


if (!fwnode_property_present(adev_fwnode, "rotation")) {
struct acpi_pld_info *pld;

if (acpi_get_physical_device_location(handle, &pld)) {
swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_ROTATION)] =3D
PROPERTY_ENTRY_U32("rotation",
   pld->rotation * 45U);
kfree(pld);
}
}

It seems to first check for the rotation property, and then check _DSD.

If I send a v2, shall I also replace DisCo even if that means
reverting its logic?


>
> >
> > But we also have secondary software-fwnodes which are used
> > extensively on x86 to set device-properties on devices by
> > platform code to deal with ACPI tables sometimes having
> > incomplete information.
> >
> > For example atm _PLD is already being parsed in:
> >
> > drivers/media/pci/intel/ipu-bridge.c and that is then used to add
> > a standard "orientation" device-property on the sensor device.
> >
> > This is actually something which I guess we can drop once your
> > patches are in, since those should then do the same in a more
> > generic manner.
>
> DisCo for Imaging support currently also digs this information from _PDL
> (see init_crs_csi2_swnodes() in drivers/acpi/mipi-disco-img.c), but this
> is only done if a _CRS CSI-2 descriptor is present. It could also be done
> for devices with the IPU Windows specific ACPI objects and it would be a
> natural location for handing quirks -- there are some
> unrelated Dell DSDT quirks already.
>
> >
> > > What shall we do if _PLD contradicts the DT property? What takes prec=
edence?
> >
> > As for priorities, at east for rotation it seems that we are going
> > to need some quirks, I already have a few Dell laptops where it seems
> > that the sensor is upside down and parsing the rotation field in
> > the IPU6 specific SSDB ACPI package does not yield a 180=C2=B0 rotation=
,
> > so we are going to need some quirks.
> >
> > I expect these quirks to live in the bridge code, while your helper
> > will be called from sensor drivers, so in order to allow quirks to
> > override things, I think that first the "orientation" device-property
> > should be checked (which the ACPI glue code we have can set before
> > the sensor driver binds) and only then should _PLD be checked.
> >
> > IOW _PLD should be seen as the fallback, because ACPI tables are
> > often a copy and paste job so it can very well contain wrong info
> > copy-pasted from some example ACPI code or from another hw model.
>
> Unfortunately that does happen. :-(
>
> --
> Regards,
>
> Sakari Ailus



--=20
Ricardo Ribalda

