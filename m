Return-Path: <linux-media+bounces-36342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEA2AEE785
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 21:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 701B2189E32C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 19:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659732E6D11;
	Mon, 30 Jun 2025 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euTt+xwc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C022E541F
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 19:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312011; cv=none; b=FT8AEYpsevKjN6x1PEaeuwfNJsN0pR79mUQXDL7TBwahrAlx1qq7D0Ae/9hArGk8MBR+S7kc7RUSpMZ4KRDAX4vS6+oCqIyYootqSsieMciuWwF9XrcqjE7Y1ErXNTxbjHeD19jQkSkt4lgEQuiPPHsTwdFk16QvUhBgb9uXg2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312011; c=relaxed/simple;
	bh=L1dWw3ul8yVaWeCdfKGPbkNq6yPKle7qYiNxccwTWIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciNNVjMInb0u50K3HkLlvmxdP/eJXtwfPgLksbkNmACPEyfHxr4hvNYybwwRHkks46qQX7VOYI3Bo5OsX9mWAum58waqVma2Q9A0xyBf0psJcqKoAZpHFd0ozvUyfPto6pOhypVJzbzq5fQbKdBJs6JWBV2nru0OX6oojqXWOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=euTt+xwc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751312009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLG9XHK+6+oCii41uDgkWY6xC+gN79cm3T8XpClkT4c=;
	b=euTt+xwce+49njrGkpM3O/q1vS7ustmCX5TvMXCfvSg9PllsIbaDcErKG1/d1I4UrTEOMW
	uBSSnFFTRpwdsqE21rOtJgBUXDT4OU+Af1+SFGO/nYzM3OHUp+PuWtNUzqxQ+2/sNpvNGc
	TzarQYeLs/EWqhN7YhIo+oYTDPIS0Go=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-l2vNqsZMObei0slGGRLpdg-1; Mon, 30 Jun 2025 15:33:27 -0400
X-MC-Unique: l2vNqsZMObei0slGGRLpdg-1
X-Mimecast-MFC-AGG-ID: l2vNqsZMObei0slGGRLpdg_1751312007
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3df2e89fd03so24355405ab.0
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 12:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312006; x=1751916806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLG9XHK+6+oCii41uDgkWY6xC+gN79cm3T8XpClkT4c=;
        b=xAazkaPgDFrVorDsft8lI68y/I8j6NNTTzunBmKFsKe3K4kJ6aXTXlXC1PWiJimt6n
         rVEOKv68WSaKIpYcmvshwYb5v+qJdHG8ebQ5xFvo3zMnKiK78501IeietSIg1vctxgeo
         mkvGaXcbcs6byxupzd/4/BB4duifeyELuoXCspch3qsPJH8Q50+j09uHexoIMK3At4KJ
         0sf14fP5doyKlGZKcUHbesQqc0fMPtr8ZwPU/SNb3zt/JY8RtAPstPVdgVyhqEG3wjOZ
         55+jJCsfCqPhF/arNVIbJm2VK1oZCV896UQMCRhfpvjTei02Db/Mf5vM/YrBxjWPs2/G
         xp3A==
X-Forwarded-Encrypted: i=1; AJvYcCVVXlmMkeqbNWpeEugYLvvm890ziOmI5fzE/jdbV+FoHSTeoR4jimX0afjG3GX1NH+Ta4N4Bg7iJkYsfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTttPEs4Tak7fWjV8rPLpBc3Bie7v4mh3WdW4Eh4RXHsGaUfqD
	UihJe5urN23AEujWPqamNxsRsabWB1UBWl8CZjM8UQiIEp/SSi6iuCGswxUeUac2E7CZsxDIlV4
	s+HX63rmzT6+/48zBrbXgUPzOPZyb3CLY2i6PvJ7bRKgOCqUKGSzepKlG0xNiB1oa9SF8g814Vb
	llpJXxlTQK2VKfPVXZ7WurYr2fb500QJWlFQXTEohNPfEV8QbRGdio
X-Gm-Gg: ASbGncuPxofRNFCF53tq3doBPRToHd3uIGbBao+Iwn5zvpgQL2qj7UtY7BhLOvgJjsV
	UaYwYhEWM1VgAX5Ys9lCIzurtpzVpnaFFRsIiwDgnh2DyEhZfTXcNMAzTpzdUpU6YUcrVYns4cZ
	2AJE9BpG8Dk6WMq52cXecpUJtxP3/j+7y7EA==
X-Received: by 2002:a05:6e02:19cb:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3df4ab4ba97mr150694475ab.9.1751312006507;
        Mon, 30 Jun 2025 12:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLhV90dERUX5Cd1c5ylxgqUOBdppuowz9AEfillEd98+IoEDDYoWIMv0J5NlnbYP/AW4Dv2idc1WkdgUvuL7M=
X-Received: by 2002:a05:6e02:19cb:b0:3dd:cbbb:b731 with SMTP id
 e9e14a558f8ab-3df4ab4ba97mr150694345ab.9.1751312006196; Mon, 30 Jun 2025
 12:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630150107.23421-1-desnesn@redhat.com> <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
In-Reply-To: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Mon, 30 Jun 2025 16:33:15 -0300
X-Gm-Features: Ac12FXy--Z6I9HxATLzBVcIlb8GTaPJ1_nqz4ejlUIKc7XXzJzGy66npCNZsE3E
Message-ID: <CACaw+exN2qHSPpEmZBNBvXCkrzVUb_VCW7YfYYYaaLzNoOSebg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

I triggered this build error while working in an older codebase that
uses C89 due to legacy support reasons.
Indeed - will focus on submitting C11 compatible fixes even when
working on older codebases.

Thanks for the review Ricardo,


On Mon, Jun 30, 2025 at 12:16=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
>
> Hi Desdes
>
> How did you trigger this build warning? I believe we use C11
>
> https://www.kernel.org/doc/html/latest/process/programming-language.html
>
>
> Regards!
>
> On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > This fixes the following compilation failure: "error: =E2=80=98for=E2=
=80=99 loop
> > initial declarations are only allowed in C99 or C11 mode"
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 44b6513c5264..532615d8484b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> > +       unsigned int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >                 return;
> >
> >         list_for_each_entry(entity, &handle->chain->dev->entities, list=
) {
> > -               for (unsigned int i =3D 0; i < entity->ncontrols; ++i) =
{
> > +               for (i =3D 0; i < entity->ncontrols; ++i) {
> >                         if (entity->controls[i].handle !=3D handle)
> >                                 continue;
> >                         uvc_ctrl_set_handle(handle, &entity->controls[i=
], NULL);
> > --
> > 2.49.0
> >
> >
>
>
> --
> Ricardo Ribalda
>


--=20
Desnes Nunes


