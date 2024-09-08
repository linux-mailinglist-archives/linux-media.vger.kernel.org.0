Return-Path: <linux-media+bounces-17887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BAC9709AD
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 22:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A74441F22078
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 20:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B83179658;
	Sun,  8 Sep 2024 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGHutnDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A714085D;
	Sun,  8 Sep 2024 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827061; cv=none; b=UrZV/lGtu+hKZ4uQSu5WDLJh6HpVLqdRtug8dOYCNZoh9S2O/p64DXExrxklb2Joi8NcRFrr4msL31PcauL7xpTM+YCXlgEAO1VpFNrWCXBGKZNN5Ig0rnn+beOJQYamMl8qfSeGGdJt+/lXimyDCnkMsagwhvd1jU3o+3G/I50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827061; c=relaxed/simple;
	bh=qyTMDaNl3wEhwWVcojNWjkZnsJpC+40VxxbDY5HqtT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHTbdF24IO0OFoSxy34rNnYcCLl9QvDQfTpoMvjKlLWsJCWDvqtyeul+rBfFr8qxdW4WKDfT46eHeuPK4RbYao/cR6c9vacokdyAKTbajkQsCzW8oTF4/5MpByRXsru6lA4VQqz6GB1cc6OeAnhcIXzNFMMdmYcNfZJC+VvvZFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGHutnDW; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-502b144f31bso887498e0c.1;
        Sun, 08 Sep 2024 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725827059; x=1726431859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl+8qFsuwS53ls/QxH0ANQIZHTR+8dp3OUKkdq/DQXU=;
        b=TGHutnDWGgum1oCmH31TOFATZ9vSAEoWy1vhH4avZ/PGL0QODpcs6ZOc2CXbpapmqi
         UN+1CEsBM30MCQ/e7939CJO4GsXwUk7ZC4cBFK33WU1JhOFPd09kBwyiI3UtZcNtQEkB
         /sfwC8B/1HFoJcZWj1uJMdcsz155A9wRt/JyQQzVziIeWnm+TgbURDkcGVcfPYVDG9K4
         xk3ozTXHsysn3IeOXw/84xm/KIwd3lYa+99Pai4phWPeJg0nqVnW5I4xLH4zpzqr/VQm
         wTyfwu3cL85HDddKqFYChXijaYYthIGsfGCdrnqWAZEXPGBeeNTZdDFnxWNSPWqDtjDD
         fzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827059; x=1726431859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sl+8qFsuwS53ls/QxH0ANQIZHTR+8dp3OUKkdq/DQXU=;
        b=dh0qhnLmkOwFPgX6K+pU+qnJkq+jbszCvidPvEKuatAQkpDGFLbW2DrBG9GflBRu/a
         ap6HFbD1/x3q5fytXjV/X4rWeAW0AKv33qkeFTxLKXMk/4M3RhFTVeEIR6TKBtAb2tJl
         KHajP7f60XykL06O7ZjAjQKigQ4omhC9lrJ70yCaRtzmA4GQohgj1JhOqOT52Dtrpz8g
         gssW7M1q7MLkkM9tSmDcs25L3htOr35squAb9KLh1GQI4Qa3mo5ldMAH0VidrLwtB9nl
         LOZ9SpO6YGc7qOva9g3Btv8arobb8iFRbVxaTK/mM3QJn1xOTwt+cWeHPeI/jaoHAdQ+
         g1EA==
X-Forwarded-Encrypted: i=1; AJvYcCVtSrUu26lYkO+SWJOuEAhX+m0MKeIUpJs5LjZQ2dj1gtSX6SZcnfu3foAxD+rqFKnRqvApPAjQsiU+SxI=@vger.kernel.org, AJvYcCW8xU6luNVLD6KW0pFET1CSIUAyov3jTkZ1VFAxmVnSFHpoetzdD+ICKJSHx2xiNOjOHZbyBQ9vaGDdNyeylbniWAo=@vger.kernel.org, AJvYcCWyPkV8DmvIyzdhMxUSCl0RQ+VxkOgMmYR/bLs/N5Oni5y+tndY1oPFqlalFXjTXJ1ra2/jqBuJSb2PqkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fjRmfNzK7YNwsy20ejXxK3+lavF3xJKLHd4gCVpvp621U3cv
	1SzcMe7tZXuBhTiNeoZpbkgyFr9usqu3How2JrzQfBIveuSOhqcXjQRV8aPoVP6jO6bPtM3qpdb
	XQQHGZZlD0atgCFKfXhle5/24dNzLth5BzuX+Ag==
X-Google-Smtp-Source: AGHT+IHmWtl+POZCFiFgXBKJFuO0g41J3A5BIAsnkX9EHA+oI8Tuq0ND52koymelfGcabRoqf24bHCCox9nxwnWa51o=
X-Received: by 2002:a05:6122:168d:b0:4ed:145:348f with SMTP id
 71dfb90a1353d-50220c7bb1emr10298047e0c.12.1725827059067; Sun, 08 Sep 2024
 13:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906231038.GC12915@pendragon.ideasonboard.com> <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
In-Reply-To: <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 8 Sep 2024 21:23:52 +0100
Message-ID: <CA+V-a8s4UjjDTrQ4aw3OjQuac8B-oq++KqYf-fJEQvuxD5GodA@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve
 virtual channel information
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

On Sat, Sep 7, 2024 at 10:09=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Laurent,
>
> Thank you for the review.
>
> On Sat, Sep 7, 2024 at 12:10=E2=80=AFAM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
<snip>
> > > +
> > >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > >  {
> > >       struct v4l2_mbus_framefmt *fmt =3D rzg2l_cru_ip_get_src_fmt(cru=
);
> > >       unsigned long flags;
> > >       int ret;
> > >
> > > +     ret =3D rzg2l_cru_get_virtual_channel(cru);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     cru->csi.channel =3D ret;
> >
> > How about passing the value to the function that needs it, instead of
> > storing it in cru->csi.channel ? You can do that on top and drop the
> > csi.channel field.
> >
> OK, let me check if this can be done.
>
The virtual channel number is programmed in rzg2l_cru_csi2_setup() [0]
call, below is the code flow of the call. This code flow is called by
spinlock held.

rzg2l_cru_start_image_processing()
    rzg2l_cru_initialize_image_conv()
        rzg2l_cru_csi2_setup()

When rzg2l_cru_get_virtual_channel() is called directly in
rzg2l_cru_csi2_setup() function we get "BUG: Invalid wait context"
(when PROVE_LOCKING is enabled) this is due to we do a mutex lock as
part of v4l2_subdev_lock_and_get_active_state() in get_frame_desc.

So probably I'll leave this as it is now.

[0] https://elixir.bootlin.com/linux/v6.10.8/source/drivers/media/platform/=
renesas/rzg2l-cru/rzg2l-video.c#L311

Cheers,
Prabhakar

