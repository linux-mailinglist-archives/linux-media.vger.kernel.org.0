Return-Path: <linux-media+bounces-18860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AE98A3AD
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04541F26701
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6620190489;
	Mon, 30 Sep 2024 12:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W518w4cw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72C18FC91;
	Mon, 30 Sep 2024 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727700925; cv=none; b=VUwaWjdNYvv89qagtpmbnHRGJBns+wvhyjBZVMLudmHGIpwLmzp7/BKCukpRh7LX2YB85MgH/avhC2FhWWr1c5J9CdbKjddzrLlY2un7o0wDxvmjLvO3JJ/8X2yiw5kVYc/St3OXpl+zMqBrpwMpjtIn82rzTwsFTIrDowliYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727700925; c=relaxed/simple;
	bh=zw/y+UNWxgERZtnnDq2lyrP4lI3o6iHEXNLrMTmIRwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhF9Nr1q2sYyRneOtmW1MSxt7rqQYDY6Idagv8SDZhGY7TLDySVxgPBtHP1V4Lyi3JgvbgGZc6E9TQ+enmBiPwTHXXwoknqT2e6Qv1bOx5uEGOQRhVpPMltmdIetaTnq3yWu0958OpvkwYOBCfan8mBOdMe0aMYA2C8BADenMks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W518w4cw; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84ea1042bbeso1165025241.0;
        Mon, 30 Sep 2024 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727700922; x=1728305722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMtBbqf7rFABFDWogn5dRNaqGbCGUPXU8/FL2DFBHJs=;
        b=W518w4cwr2e0mRABf8FbPYwzJbP3QtX1euXHgmHDixWe5T7r3rdGMViChiWXwzmU4o
         CutruPzJyvg1QMYwV4ryGrVc+UCJxksan4dFAzxen1MYFFOlFXQS6ZC9MIdouD2CiLGj
         pvYJH1ABb56mwqillCMAGgvyTB7oaMuQZXBC5BF1m+AVn/vHQ/CeGOcx2+N2Obz5lpGD
         PZpsGOLew0afNEONQdJXZ4T31hb1JCzYWoV/reJkP4TTwMQBuMFeH9I94XDCUDdnzlEr
         8MlHgAFzVBB6AtTkFFXumJkgr84pYctG1bR3C5J4kGZvrkJ+pqUFkGcphwWsNv14V0M3
         XLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727700922; x=1728305722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMtBbqf7rFABFDWogn5dRNaqGbCGUPXU8/FL2DFBHJs=;
        b=M9C+jbceqxchxRpBW8LHAHeS69eZ1mwO4P4lNRjYq3iEKLeGSwhyx0mpJBQufWWZeZ
         e3A2ekeTHPli/MXJQutV1NnNrNzBYltWPDGjARCTduH5JtX8qYsQxTMGCAIn5Y3+hcM4
         dH41u9PjlW4nwAWW8o89iZSfNj1/zcfaL7e/GZocfBUDxX8SEQP4/pu1i2auD6Lj1QLY
         31oUnb4XvEsviIC1JClP/xPOawOkFGAZPXvcfNYm5IxN3wqBXNGvrCLVsROSgSLVIF5h
         g2KEwbwFJclB/+L6OVlZ0T+FSaavOc9QT1SRC2vauaPwhQzgY/TikkhAGJIcbj7hhn0K
         dfxw==
X-Forwarded-Encrypted: i=1; AJvYcCWY5JyynvVx+7uMehJMSPqS88u4LoLxXRC8Xrw4LuBKNEaWvjejhd267bkC0a1kv+JArkNV6pm0T2K1br8=@vger.kernel.org, AJvYcCWijvZVSw1GNrNrKiKVzW6tljdi7H8WM8ANNWdI0PV7o4PbyK4SHkbuUM/N4XNfD9Bv2oS8j3vCZzTVQmp09tmCvm4=@vger.kernel.org, AJvYcCXsjCK3PD2J2qk6bZTfDgKjkftmh7S9ODiEhPWm8Qvrx2COPxL+o0NkUYMmgQrwe2wVFKtbJ8hAh6pm0II=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtf06rGMQY6L9m6dtPPLoE6z2JSvgeNX7WTd2NCDxcumq05S5
	/I3/H8HnCZ5bfDFZKk+feFHfOPOnKL9UVE7jbD+DqJe4KrmLWjqcaiK1tYAN985oC8Q2ROxYltE
	GH8EQVlBk/vnQ/w6Hbxck1dLPvV8=
X-Google-Smtp-Source: AGHT+IGjdQYqkWEHY542aqcKjJdBsMjMbOQpmTRObXPHjGuTOWna7xzqo6S26Uwlt98DP/LVTLztNtFovE3TcqTtOmQ=
X-Received: by 2002:a05:6122:54f:b0:50a:c6f5:e672 with SMTP id
 71dfb90a1353d-50ac6f5ecf9mr1274645e0c.13.1727700922420; Mon, 30 Sep 2024
 05:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240927231122.GN12322@pendragon.ideasonboard.com> <CA+V-a8vzf7gjcO-jPTB2Sd=4GBmpSkUfWDCnAR8BbL1xohytvQ@mail.gmail.com>
 <20240930125200.GH31662@pendragon.ideasonboard.com>
In-Reply-To: <20240930125200.GH31662@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Sep 2024 13:54:55 +0100
Message-ID: <CA+V-a8uuqazJTZE1M52at9uQiRHHr81vvt+p2jXLjSaweDCCKA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] media: platform: rzg2l-cru: rzg2l-csi2: Make use
 of rzg2l_csi2_formats array in rzg2l_csi2_enum_frame_size()
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

On Mon, Sep 30, 2024 at 1:52=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Sep 30, 2024 at 01:19:25PM +0100, Lad, Prabhakar wrote:
> > Hi Laurent,
> >
> > Thank you for the review.
> >
> > On Sat, Sep 28, 2024 at 12:11=E2=80=AFAM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thank you for the patch.
> > >
> > > I've just noticed that the subject line of most of your patches is mu=
ch
> > > longer than the 72 characters limit. Please try to shorten them. You =
can
> > > replace the prefixes with "media: rzg2l-cru:", and reword the subject
> > > lines that mention long function names.
> > >
> > Ok, I'll rework the subject line so that it fits within 72 characters.
> >
> > > On Tue, Sep 10, 2024 at 06:53:55PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Make use `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size()=
.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c =
b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > index 79d99d865c1f..e630283dd1f1 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > > > @@ -570,7 +570,10 @@ static int rzg2l_csi2_enum_frame_size(struct v=
4l2_subdev *sd,
> > > >                                     struct v4l2_subdev_state *sd_st=
ate,
> > > >                                     struct v4l2_subdev_frame_size_e=
num *fse)
> > > >  {
> > > > -     if (fse->index !=3D 0)
> > > > +     if (fse->index >=3D ARRAY_SIZE(rzg2l_csi2_formats))
> > > > +             return -EINVAL;
> > >
> > > Same comment as in 11/16. With this fixed,
> > >
> > Ok, I'll drop this check.
>
> Don't drop the check, drop the change. if (fse->index !=3D 0) is the
> right check (testing > 0 works too).
>
Ahh sorry for not being clear, I meant I will drop the updated check.

Cheers,
Prabhakar

