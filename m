Return-Path: <linux-media+bounces-17882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08276970422
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 23:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4404BB2239C
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 21:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E2C16630A;
	Sat,  7 Sep 2024 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cK0RTEAH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9F9166F33;
	Sat,  7 Sep 2024 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725743047; cv=none; b=ZezKFJF5WaqDMcgbDEqFJkyqF6vgBGet/oMqgNTDTEhVgV9+ajpSVfbCeKEkZngoM0+u36baaaRpiONQaaxuUhmf6BnNXsectfNUkimUgpU42TSDfgNxUMYCnoGveUYzF6NSJVC3Ye9IBQisErjWrHWu0fl5NKNQ8Jm0rrmIs0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725743047; c=relaxed/simple;
	bh=uV//lxLMzxasc/zCdpYec0V3wLeHo3e7GzQGZwvVFDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1ee89PzxvW7OB1BJy/PTWNqzP+nlAXzSIXDpVusNANxuf12zyBimeboRh60zKkZgW0xNYk1LUiTHIdxf9qZi5hJq9HQ7Hzv5t8zcsaIdcaJIrtn+T0QvE8XrZKctMGoLi7vsts/eGCt3GmQNysYNWiUvNcUSCTcb7vU+pA1R/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cK0RTEAH; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-50108b3749aso940815e0c.2;
        Sat, 07 Sep 2024 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725743045; x=1726347845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS0qJmOAWGvGMAz2sPe3y3syKBWbtUOwrE1+l4wrMq4=;
        b=cK0RTEAHTNtY7nnV7qkHFe7GBzEZDxh97dtqHXs5Kbd0ucobftHVzPkbbmW8zmhO2O
         KdOU5Xd0YPfCmHUWGbVjPvCdzB39I0qejMaHiPPE1Hhu3EEk5ngnKdfKh6I+1DGWXRn5
         Ax2bXT8RKBTRiI2PrMK1LvLZEST4+ogkaPmbbEaWyq+3i1pxFt9IeWSOhRFF3d7ukvse
         scEfesJ89IKStal2sGGVUrN7CtsX3otgE3VW93I8KyKgdWMAPj8j2AhlpiXOyKbqE5Zz
         C62+paIjrpbTP/OCfSY8AwtE7nQTdOmU5Q49AUbBy7ACm4+UACzuGquk+iWsqA73japG
         oMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725743045; x=1726347845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RS0qJmOAWGvGMAz2sPe3y3syKBWbtUOwrE1+l4wrMq4=;
        b=hmBZaWardyCMr367M08TToKp2CBlXsf8xiufM6or6N+PA4sRKnB14vkP/E3apsqscH
         L0y3jMjyOtp2eNoGYk9NVubGW3q76ApAK0peg1+E9Kv9XUlrY2GoOtTlxlIQ9B/iV9Nt
         oo3J0xPUJ3iLkubkL645mNFiVqvqHFhZxH9qxUPydgTCCHfHI220k8hPqNRKx4Ofzm6M
         TUmD5GHjaaBWC1mhTSq2hAoHLXadQ0rqp+dJjEnFpwOFZZn/Wz4dijwlR3tPJuCVna+W
         tf33lIcpVTAhBTS8CDECfxl35pfQO9t29ye4WtSrb/vBYkldMwHVmSKZvatMTt7Vit14
         09kA==
X-Forwarded-Encrypted: i=1; AJvYcCU8wyB2KlBEDhpusQnp+rT2ozCnXlCEaWzcQNDzvTjV1ocizqWJSS+7EirsnodWrb3QGCgh+XedEg/6t6w=@vger.kernel.org, AJvYcCWy3WHkTZQ5BCuLxAggr/TVcJZQSu6SaGxRNbet2oAGAP9I1teQ0CtIEOdwKeBtnhAHj+7hHpwRVI1us6g=@vger.kernel.org, AJvYcCXsu1HK4To5RfIKHkhVESSqr3ZyGtD4LxKfsM0aj09jZk8N/rtZ1doXuRk5tmOYaZRm2rR9Hxe3GtSCHANh28csdYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw31NE4JEjIeQfeFxIf4DtYhpO0Ii1sLtJsHYkUD1qwb2zMBclY
	/uKCZIgXzM7Hv3PAANWn2Od3d0W3GHZOfVmKuieOQr6B6lnaPEREwJYVt3WVX4XxtS55YO+Ki7j
	OHzfZRfbKcFZpYACJc95WEmJsnJ5ptQMq
X-Google-Smtp-Source: AGHT+IHI55YygLC0Avb1oY+2+o0G8tz10yH/2T8BnVIeTuRIrqwvwYyvjzieGpKrJ9lX4C3JP+aqBqOiPhu5AfOUb+Y=
X-Received: by 2002:a05:6122:369d:b0:500:b4c7:b87e with SMTP id
 71dfb90a1353d-502096fa250mr7786835e0c.4.1725743044807; Sat, 07 Sep 2024
 14:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240906223831.GB12915@pendragon.ideasonboard.com>
In-Reply-To: <20240906223831.GB12915@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 7 Sep 2024 22:03:38 +0100
Message-ID: <CA+V-a8u2rd60ueUZar5keyo2wBG565XPUmOknaXg_4U5cq4QtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: platform: rzg2l-cru: rzg2l-csi2: Implement .get_frame_desc()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Fri, Sep 6, 2024 at 11:38=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Sep 06, 2024 at 06:39:45PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/G2L CRU requires information about which VCx to process data fro=
m,
> > among the four available VCs. To obtain this information, the
> > .get_frame_desc() routine is implemented. This routine, in turn, calls
> > .get_frame_desc() on the remote sensor connected to the CSI2 bridge.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/dr=
ivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index c7fdee347ac8..a7e4a0c109da 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -582,6 +582,17 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_=
subdev *sd,
> >       return 0;
> >  }
> >
> > +static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned =
int pad,
> > +                                  struct v4l2_mbus_frame_desc *fd)
> > +{
> > +     struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
> > +
> > +     if (!csi2->remote_source)
> > +             return -EINVAL;
>
> Maybe -ENODEV ?
>
Agreed.

> > +
> > +     return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,=
 pad, fd);
> > +}
> > +
>
> I wonder if we should implement a wrapper around .get_frame_desc() that
> would automatically forward the call to the source if .get_frame_desc()
> isn't implemented by a subdev. That's not a requirement for this series,
>
That would be helpful.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops =3D {
> >       .s_stream =3D rzg2l_csi2_s_stream,
> >       .pre_streamon =3D rzg2l_csi2_pre_streamon,
> > @@ -593,6 +604,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_=
pad_ops =3D {
> >       .enum_frame_size =3D rzg2l_csi2_enum_frame_size,
> >       .set_fmt =3D rzg2l_csi2_set_format,
> >       .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .get_frame_desc =3D rzg2l_csi2_get_frame_desc,
> >  };
> >
> >  static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops =3D {
>

Cheers,
Prabhakar

