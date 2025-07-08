Return-Path: <linux-media+bounces-37072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA25AFC6DC
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 11:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBE1188CAB7
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 09:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52B221C177;
	Tue,  8 Jul 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LewibExZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8CB18035
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966206; cv=none; b=eSzTFPEs7wvZr+x+ZL9LOs9+QfMMnHha+5RnFIDFJWF4yiBNgO1XZkMhtsod9KcFZRdBY39TXGcaaMrIOXP5XqAKRhUCYhh5FssW4QHEaIyA4uPF7frwD+IXQI6qH6XL28nzreaa3xAoEm+wCfMJZzvXu+yDZPvpJ+whLcBi93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966206; c=relaxed/simple;
	bh=oWA+jyYXTFUVOVpq0A1KhzsVCekTcqZUOlf72Qn1/FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCDVZaUeBv6Nyo6A5sLzjfGnkmXiR77upLa6/BWLCYqwpPqJwwj5s0bI7ncKUfjX2dqAgQMvqr9mGzyqDcM0+wvVUMep7hXk2iIbLLpZ/uuqLyh20O67GGYkh/KLxMMabMGUM8alXyZYSruhJ0f1RJC7zhK0XAxOedss9ZBkMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LewibExZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so4998153e87.1
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751966202; x=1752571002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyLgLNqxZVEVrHG4u8oZzb76t/clebyyt0lejdbang0=;
        b=LewibExZ9ull8f0lBV59s15uo3Dl6RcH9Doj8bhQbsYpc6Y08U06VyZRBlp2TqHjDk
         g8PmwF7tuIU14BLEx8kOgDfw6aHFyvFadmTd4IC7Eq5lhLQPQjVeJ4LdolckZhWkHHtX
         h+4IjsLXfnNsc8KlZERdMeIlp2toWkPGy/J2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751966202; x=1752571002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyLgLNqxZVEVrHG4u8oZzb76t/clebyyt0lejdbang0=;
        b=AVSXf+wf4HHkdv2kT64KIW0bPKTaAwNhivD/+yMJbr8YRYtakQeNwOh6Mjfu2D0O9V
         fx1//rQrpxZKR2ys3dD3abUfzR3Ss6JyutJ4NIuEnD76n78RbLksXKZsC1yzWS+PQMtL
         LHAulG9IZ0c/H5DpqQRq7y/x3AEqYvJv6OXNHoahzhNved6DjePXYHFxpCk0PRhNRYM8
         iEPccAOcFJ7e2c87WFkmAPpMrBYqaMOIQeTc3pePpXvN8tOBmLbZVjeljG9jZnAHfMen
         hjNURf8NH1YoLAGWLsrqX7PgqB38yQnnIsF+Fp0kIBPhnKhyvJ35o/EDJ7Nszz8VEv3G
         ZrHw==
X-Forwarded-Encrypted: i=1; AJvYcCUPQ9h/Sip5N+99icvvHReNMyaWUplUaK2oRE70nuZPRybuWfXp/5yP3sNpihlbGRHjElTJOtISch7Jog==@vger.kernel.org
X-Gm-Message-State: AOJu0YytYmTUh8IsUwGF8Hztt4gV2D40nY5AHAl31KOzaigPwBE4J03O
	V0pd4xQ9wMwzUAMtpIWjBzsNWGbftQH70RF21dXCzUAJzA8FfaV4GQPxNstp0Qxxk4gagB31xnW
	+U3+ChQ==
X-Gm-Gg: ASbGncvnpx7EdAtGaCIrRMWzsUm3LS4cFDiiCmLEdHlbq85YVCF+5sEo2tVOfc8Frfc
	I25/PCSOlpgDY3qYzs4kdV1I0GQlA65UerwRdwLV3V9gUWhlY/9JPCrmgJ/sZV4ir4Cg4GOaLmi
	kdIHEZvZLDzFr0m+tuvX/yFR6S0QTUJtfjz/xxYYMIHncXCDx2QuV6VOmsX86dWljabVKLGfuCF
	aG9NR0RC42TGie4cB8V7DDLpJRiQIoCuyk5b/EYeNQGT8IvXOaqc2V7XO/HXrruQJxloZ9WQq6x
	PujbFBQ+B1ZKM8lm2DulyGjU+YDSMX/54w4fXMCStGzv5YS3Y6sjj6lE1F3vM5W5EHKOrXC4a3b
	RQy2F2Y6ZV44Uer4gfkyVUEAK
X-Google-Smtp-Source: AGHT+IHPRo4cxZO2RuDVVPq/MxhmDbMyDrA39KQ5gor+J8rr9YgJ/y+NVg/oyq9/m/FzK9UQ4Iw3OQ==
X-Received: by 2002:a05:6512:138b:b0:554:f9cc:bea5 with SMTP id 2adb3069b0e04-557aa2930d1mr4922316e87.34.1751966201899;
        Tue, 08 Jul 2025 02:16:41 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d5e71sm1603813e87.259.2025.07.08.02.16.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 02:16:40 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-555024588a8so3931788e87.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jul 2025 02:16:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/EN9VbjL3FaLolDJJmZgQyyV7oInrCjY9oUootsqFzqB+Gv4XK7T5rSKpWa8EuZIW1NzpSuIWCrzfLA==@vger.kernel.org
X-Received: by 2002:a05:6512:2386:b0:553:3407:eee0 with SMTP id
 2adb3069b0e04-557a132beb0mr6054641e87.4.1751966199327; Tue, 08 Jul 2025
 02:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org> <aGw_1T_Edm8--gXW@kekkonen.localdomain>
In-Reply-To: <aGw_1T_Edm8--gXW@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Jul 2025 11:16:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
X-Gm-Features: Ac12FXyzhfInZK890Wq_-YMIwMPEqs5CfSkqVHt4PZPUUwV21icplYQB7hfeIEM
Message-ID: <CANiDSCup2iRx+0RcaijSmbn04nBY4Ui9=esCPFsQzOKe=up9Gg@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown rotations
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari

Thanks for your review

On Mon, 7 Jul 2025 at 23:45, Sakari Ailus <sakari.ailus@linux.intel.com> wr=
ote:
>
> Hi Ricardo,
>
> On Thu, Jun 05, 2025 at 05:52:58PM +0000, Ricardo Ribalda wrote:
> > The v4l2_fwnode_device_properties contains information about the
> > rotation. Use it if the ssdb data is inconclusive.
>
> As SSDB and _PLD provide the same information, are they always aligned? D=
o
> you have any experience on how is this actually in firmware?

Not really, in ChromeOS we are pretty lucky to control the firmware.

@HdG Do you have some experience/opinion here?

>
> _PLD is standardised so it would seem reasonable to stick to that -- if i=
t
> exists. Another approach could be to pick the one that doesn't translate =
to
> a sane default (0=C2=B0).

I'd rather stick to the current prioritization unless there is a
strong argument against it. Otherwise there is a chance that we will
have regressions (outside CrOS)


>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 30 +++++++++++++++++++---------=
--
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/i=
ntel/ipu-bridge.c
> > index 020aa52f590d66b6d333adc56ebfb9ab0561db51..6f436a8b4d23373af8a6668=
530333a827eca467a 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -236,37 +236,41 @@ static int ipu_bridge_read_acpi_buffer(struct acp=
i_device *adev, char *id,
> >  }
> >
> >  static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
> > -                                  struct ipu_sensor_ssdb *ssdb)
> > +                                  struct ipu_sensor_ssdb *ssdb,
> > +                                  struct v4l2_fwnode_device_properties=
 *props)
> >  {
> >       switch (ssdb->degree) {
> >       case IPU_SENSOR_ROTATION_NORMAL:
> >               return 0;
> >       case IPU_SENSOR_ROTATION_INVERTED:
> >               return 180;
> > -     default:
> > +     }
> > +
> > +     if (props->rotation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> >               dev_warn(ADEV_DEV(adev),
> >                        "Unknown rotation %d. Assume 0 degree rotation\n=
",
> >                        ssdb->degree);
> >               return 0;
> >       }
> > +
> > +     return props->rotation;
> >  }
> >
> > -static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struc=
t acpi_device *adev)
> > +static enum v4l2_fwnode_orientation
> > +ipu_bridge_parse_orientation(struct acpi_device *adev,
> > +                          struct v4l2_fwnode_device_properties *props)
> >  {
> > -     struct v4l2_fwnode_device_properties props;
> > -     int ret;
> > -
> > -     ret =3D v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
> > -     if (!ret || props.rotation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> > +     if (props->orientation =3D=3D V4L2_FWNODE_PROPERTY_UNSET) {
> >               dev_warn(ADEV_DEV(adev), "Using default orientation\n");
> >               return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> >       }
> >
> > -     return props.orientation;
> > +     return props->orientation;
> >  }
> >
> >  int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor =
*sensor)
> >  {
> > +     struct v4l2_fwnode_device_properties props;
> >       struct ipu_sensor_ssdb ssdb =3D {};
> >       int ret;
> >
> > @@ -274,6 +278,10 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev=
, struct ipu_sensor *sensor)
> >       if (ret)
> >               return ret;
> >
> > +     ret =3D v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
> >               dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vc=
mtype);
> >               ssdb.vcmtype =3D 0;
> > @@ -287,8 +295,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev,=
 struct ipu_sensor *sensor)
> >       sensor->link =3D ssdb.link;
> >       sensor->lanes =3D ssdb.lanes;
> >       sensor->mclkspeed =3D ssdb.mclkspeed;
> > -     sensor->rotation =3D ipu_bridge_parse_rotation(adev, &ssdb);
> > -     sensor->orientation =3D ipu_bridge_parse_orientation(adev);
> > +     sensor->rotation =3D ipu_bridge_parse_rotation(adev, &ssdb, &prop=
s);
> > +     sensor->orientation =3D ipu_bridge_parse_orientation(adev, &props=
);
> >
> >       if (ssdb.vcmtype)
> >               sensor->vcm_type =3D ipu_vcm_types[ssdb.vcmtype - 1];
> >
>
> --
> Regards,
>
> Sakari Ailus



--
Ricardo Ribalda

