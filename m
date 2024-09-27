Return-Path: <linux-media+bounces-18703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46906988851
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 17:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B14A41F21C66
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 15:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75831C0DFD;
	Fri, 27 Sep 2024 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGSTpYpA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B174BED;
	Fri, 27 Sep 2024 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451120; cv=none; b=BuLCxrZ3Em8X8j69LHJyhCOljRZPZGNO8SwFX9OrKRQrOMDh9raMn2kqrI4BCsWC1tSgaI2MYnYP6qEbyJOHcLK6iQkAp426WXCQI7cyKfoUjZdxQlx8ue0+2O9DRW/G7CZvLpxA0uzx6RV9T9IeUnUDQikwJmkXAxnHeSa32Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451120; c=relaxed/simple;
	bh=ecsRbGoKvi94m683sBbOe5u+7jAt/EOz4MF3SLQZLRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHymMlTlARExjT1BzLeTJsat9F1uPNDoORPFurosfbMTxcsdyNfQDMNRv5wvOXUbQFgDrvf93Lbib+Yn9v+7lFcIeCNUNl1m04CpRLQ8SmaEBWL/SUIoAUChpa/JSN3fssib3SwDNozUYE3rlUoV8vr56KErXchOXLIRc+SJweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGSTpYpA; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5eec95a74so1092758eaf.1;
        Fri, 27 Sep 2024 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727451118; x=1728055918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usbGndAEP6RKj6SG8WhrwCRKqwPvgi09AD1FuzxTCC8=;
        b=nGSTpYpA1odliLMKUvHOtHshO/k9RzygWzJtp5H2C+BUDCwaBlClBUcfM1Ly/4am4W
         1dZ0yKlmNilEhBEBXqhpWSKW7WLWFFIGeuEJCA31C5lMf8C0EGx1KYtBlDwfDAr+nbpF
         nPLBfUStyutu3km6cl0RmeuuHD8YqdDkKjTzTKNN3fT1tCEByVcPJbjYfTbo5ZB1VKBy
         Td9aGsR2rDl1EBwbQKLNxe8iqGWPaYSzfVJHgbh47hPL20Z747VbgXaflYi46y07z9BT
         i154cSyCkvpZKfl0qM+FU9uxupdpAH0WNeNZ/h+yA2Y6ojHHt+dq8qVQZXdQtaE/WzLe
         yVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727451118; x=1728055918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usbGndAEP6RKj6SG8WhrwCRKqwPvgi09AD1FuzxTCC8=;
        b=meIh2f1s6bNkk6f0zikvJ2o4nA5fY162rUur275V1zeUN2SP5mDSSmOeGkM6A392bY
         C1Jyz0jqyTeNFX1yCU7EKQ/3GVR8zIu2ngKlmzbl2b7aoHsEDQe5zpIggtPDR7URK+9d
         N8nCpYXPvmusDEHvnehtz6ilsMB2beclf3CP32iBQw7vkKt5MSLE8xM1ziUgO47kl5p6
         3cWT+eKReGligMRoamkNcbPMfAEnfvtTE06JjHvbzczNt5ZgLzMDHL9ERs3C0lmBs644
         +hDEfkLZWekTeYJYfM9ccdPvfa1HnqOmf+HTXBVxPUui1KOgFh8fP4jh/Asq2XdNJxDy
         aOyg==
X-Forwarded-Encrypted: i=1; AJvYcCUTNGXvoP8RHP/ewpVN1oLsFbQqkd84aiOoojs2INsQqHnsR7vKGV/11aANGQoaGDbqAvPCups73UN7olY=@vger.kernel.org, AJvYcCXc8mtD0xsnyATTyZaG8Z1ig0Pxdb9ZJeTVdccaCLbyt4mzyyMP9tVkHadaAmKJxEMSqgKacr2BnFft610=@vger.kernel.org, AJvYcCXqTfvCZiyObFlt+rRcGISeXws6RqWfnLmNMK02BweN6Wp+5srHQBqMtv55adQz26lHrWEZUzrIGnO8KRHtM1jDp9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0qMOro/fMS64peAUe3nPdB9Nmkfh7vR6hFIpMDixLdVJmqxT
	T+WZvboKiRCUjgqlgyMD9YfXmsFJaaRJxzQdFNZuM9bGUPCDZGzbBQdRjnqIPSzwtO+RQwSj4io
	QvkXYA7uk2BNs1Ukokc8J9kZNAJc=
X-Google-Smtp-Source: AGHT+IF4JspM/zMBLkoNZehhJMPEmtTkj8/Ez0HqBPtRzJrG7epkmEQIYm8UrvsTuDdZxqRg4sw4VNQOBVlqUn6pffw=
X-Received: by 2002:a05:6358:99aa:b0:1b5:f74e:ae3a with SMTP id
 e5c5f4694b2df-1becbbb8890mr235276755d.15.1727451117751; Fri, 27 Sep 2024
 08:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910170610.226189-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910170610.226189-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZvWBlivUaZ92KoAI@kekkonen.localdomain> <20240926174819.GK21788@pendragon.ideasonboard.com>
 <ZvWumaGsMPGGwPaS@kekkonen.localdomain>
In-Reply-To: <ZvWumaGsMPGGwPaS@kekkonen.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Sep 2024 16:31:31 +0100
Message-ID: <CA+V-a8uGmyrSQQULY9sS9r-Ss_Gxw7OBtbYjFYOMpLJ_e=ZRGg@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] media: i2c: ov5645: Report streams using frame descriptors
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari and Laurent,

On Thu, Sep 26, 2024 at 7:57=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Sep 26, 2024 at 08:48:19PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 26, 2024 at 03:45:26PM +0000, Sakari Ailus wrote:
> > > Hi Prabhakar,
> > >
> > > Thanks for the set. It looks largely very nice to me, after addressin=
g
> > > Laurent's comments. A few comments here and possibly on other patches=
...
> > >
> > > On Tue, Sep 10, 2024 at 06:06:10PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Implement the .get_frame_desc() subdev operation to report informat=
ion
> > > > about streams to the connected CSI-2 receiver. This is required to =
let
> > > > the CSI-2 receiver driver know about virtual channels and data type=
s for
> > > > each stream.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  drivers/media/i2c/ov5645.c | 28 ++++++++++++++++++++++++++++
> > > >  1 file changed, 28 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.=
c
> > > > index 7f1133292ffc..c24eb6e7a7b5 100644
> > > > --- a/drivers/media/i2c/ov5645.c
> > > > +++ b/drivers/media/i2c/ov5645.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <linux/regulator/consumer.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/types.h>
> > > > +#include <media/mipi-csi2.h>
> > > >  #include <media/v4l2-ctrls.h>
> > > >  #include <media/v4l2-event.h>
> > > >  #include <media/v4l2-fwnode.h>
> > > > @@ -829,6 +830,32 @@ static const struct v4l2_ctrl_ops ov5645_ctrl_=
ops =3D {
> > > >   .s_ctrl =3D ov5645_s_ctrl,
> > > >  };
> > > >
> > > > +static int ov5645_get_frame_desc(struct v4l2_subdev *sd, unsigned =
int pad,
> > > > +                          struct v4l2_mbus_frame_desc *fd)
> > > > +{
> > > > + const struct v4l2_mbus_framefmt *fmt;
> > > > + struct v4l2_subdev_state *state;
> > > > +
> > > > + if (pad !=3D OV5645_PAD_SOURCE)
> > > > +         return -EINVAL;
> > >
> > > As you have a single source pad, and pretty much all sensor drivers w=
ill, I
> > > think it'd be nice to add a check for this (that it's not an internal=
 pad)
> > > to the caller side in v4l2-subdev.c. And of course drop this one.
> >
> > What check would you add, just verifying that the pad is a source pad ?
>
> I think you could add that, too, besides the absence of the internal flag=
.
>
Checking only for the source flag should suffice, as the
MEDIA_PAD_FL_INTERNAL flag cannot be set for a source pad because
media_entity_pads_init() enforces this restriction.

Do you agree?

Cheers,
Prabhakar

