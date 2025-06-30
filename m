Return-Path: <linux-media+bounces-36343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABABCAEE798
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C589117D226
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FE2E3AF7;
	Mon, 30 Jun 2025 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDf8xxCT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1D2441A6
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312189; cv=none; b=aoMhJAaSnBQoQV+s2UK6Ul0mZG1X4PC+4Y9/ojEu5uKMtS2vIYZjnDcFn9USiTiJC54GbdQR5KsccjplrNJqxNkk0SwpspMOqnaX/YLfnYBPKkMNBnAhvy4x+Jh9kPv8+ZH/xEcp+JsNUVI69J835YxsAS9wrDEGNZc9OPjDUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312189; c=relaxed/simple;
	bh=5TpnHzgkPKZyd5eTFqOI9O+gnDg/EXjnpEK1/f1p6E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alF/QtbWgK0xKxf/tcpbnKd95+d86+ytZgRgfyFaN0OTddcgnNyfmsKIIZx/OSuGr2GeISjSQM75V1hRSaY3xpPF7zqCNPVdzQHczl9zQP5pI4zZijQDP20L4GUk6klcmLU1KbxrXxPFyTwIzzRE7RoKHFmTBmNfCf0VQPZpPxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDf8xxCT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751312186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CTPK4eSk+4gUQuoW0j4Bt7UJobRVrOn0d8k/XSxzeA=;
	b=ZDf8xxCT8UbiNUQr/jrBAvKpTEdKYlmcjxAg0U/8X7GvSHyN+NIpFi6ozhiLijPFZW836t
	77z0BCWSKm+6ZetL3as65Pp7bIOYe9eRuXs1h3Se/huK+yLRtHkQJrwBrJrqtFQPDh5/mt
	WSLZoYvDIvX595Dymov+zEu7HGygM5E=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-QKVAmHudN_KFYFSi9SYcxw-1; Mon, 30 Jun 2025 15:36:24 -0400
X-MC-Unique: QKVAmHudN_KFYFSi9SYcxw-1
X-Mimecast-MFC-AGG-ID: QKVAmHudN_KFYFSi9SYcxw_1751312184
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso46001575ab.0
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 12:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312184; x=1751916984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CTPK4eSk+4gUQuoW0j4Bt7UJobRVrOn0d8k/XSxzeA=;
        b=qg4MVcj/OE5PTIYkueYogEwtGIYSmC7KDCcJIuACiZy7FSvH/yIAIiz47dfI39/ju0
         tLdWg98i0xAdTtxfU4cjXulY1p4pB+eenkbyDY5QVaeU8ZzibpVjfW7Bw3mKT32z/TWl
         i8SE8/fD19+XpRFMZqFFyyvL+9BSikrBKcv7+g5Arx14JWFoeOu4cuwjLJtMVHbZeusT
         XunYHzCjCtM7cdzMSrTu8YivCx9odg5T84kalJ3Tzy7lNpsiG6rkHEgZzrJivpUQWNow
         G6cNf1uKvF2BcZIToArCSvLI/ZhtmjtjgyMePLxPumb4K1NDkT9SA5lFYteTnGFGoQv1
         zMaA==
X-Forwarded-Encrypted: i=1; AJvYcCWPmBMyeM6x6zXm49Xlnt5NlCZ0V7LE9fHSgTMNBKF1K+xwuQ5MDK0lYQ68vfSZI/AAVojBd6BWNkEByw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1CuqrJTCLS7271oogxabqBn6xaoNtW6/rsKr0rtle1Unc9Hk1
	Mk6qpj2ClFEzZY+XhNslSs4pAQ6aafDBFq6D4L/MhOHme4iZYVlnmJ/laeaBKaSw+LYcru25Z9S
	e3AY6AmR6tK1um9wskzvDEZdlY+liHDGR/YQtYhzNbf60VmkHCFQ+HdrRbh125yDlfh0xUyzcC8
	vdrmREF/ik04hX2q6oBF/qiGBHcI6JfkLdm0Tl84S1ERaZ5RX3Vv8/
X-Gm-Gg: ASbGncvQPWYPBxtphCg/GfO37CxSOct/3nFCokQF+3kJK7Hmuz2qFBMoHipLabwSvoo
	1YZaKopUeswdTRRh1cu/Abff2pEkpL3S0IdgXKDvyBFjqgssx53RUrTqzE2h6NhBtyrgr95SCMJ
	u7sHs3D9zaYDVWGfv4lhq2GmYavG6yRIax5g==
X-Received: by 2002:a05:6e02:1a0d:b0:3de:12ff:3617 with SMTP id e9e14a558f8ab-3df4aba3729mr168365605ab.15.1751312183697;
        Mon, 30 Jun 2025 12:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5OBjWuB+7mTlohU1GRuvBqPPbNy8Toed/6n+NrVnrOZfDzHRQR/D8D4AhYbheg//ZhwLibndaBuuWngB1530=
X-Received: by 2002:a05:6e02:1a0d:b0:3de:12ff:3617 with SMTP id
 e9e14a558f8ab-3df4aba3729mr168365385ab.15.1751312183324; Mon, 30 Jun 2025
 12:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com> <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
 <20250630152952.GG24861@pendragon.ideasonboard.com>
In-Reply-To: <20250630152952.GG24861@pendragon.ideasonboard.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 30 Jun 2025 16:36:12 -0300
X-Gm-Features: Ac12FXyrTqbZkdz_CB2bOk0z33IvZdWhwaIYre1OeHTeEQcqtFwYYzxgNNpWDQQ
Message-ID: <CACaw+exXoVxeJz+3JdaW8peTo-zuYLez1Vw3+R4fpatjWVY7NA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hansg@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

Yes, I did see that commit and will send a v2 to properly address the
variable shadowing following C11 standards.

Thanks for the review Laurent,

On Mon, Jun 30, 2025 at 12:30=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 30, 2025 at 05:15:38PM +0200, Ricardo Ribalda wrote:
> > Hi Desdes
> >
> > How did you trigger this build warning? I believe we use C11
> >
> > https://www.kernel.org/doc/html/latest/process/programming-language.htm=
l
>
> Note that the local declaration of the loop counter shadows the global
> one. I would have expected a different compiler warning though.
>
> The shadowing was introduced by
>
> commit 10acb9101355484c3e4f2625003cd1b6c203cfe4
> Author: Ricardo Ribalda <ribalda@chromium.org>
> Date:   Thu Mar 27 21:05:29 2025 +0000
>
>     media: uvcvideo: Increase/decrease the PM counter per IOCTL
>
> and I think it should be fixed (while at it, with an unsigned int local
> loop counter instead of a signed int) as it's not a good practice.
>
> > On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
> > >
> > > This fixes the following compilation failure: "error: =E2=80=98for=E2=
=80=99 loop
> > > initial declarations are only allowed in C99 or C11 mode"
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> > > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc=
/uvc_ctrl.c
> > > index 44b6513c5264..532615d8484b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev=
)
> > >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >  {
> > >         struct uvc_entity *entity;
> > > -       int i;
> > > +       unsigned int i;
> > >
> > >         guard(mutex)(&handle->chain->ctrl_mutex);
> > >
> > > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > >                 return;
> > >
> > >         list_for_each_entry(entity, &handle->chain->dev->entities, li=
st) {
> > > -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i=
) {
> > > +               for (i =3D 0; i < entity->ncontrols; ++i) {
> > >                         if (entity->controls[i].handle !=3D handle)
> > >                                 continue;
> > >                         uvc_ctrl_set_handle(handle, &entity->controls=
[i], NULL);
>
> --
> Regards,
>
> Laurent Pinchart
>


--=20
Desnes Nunes


