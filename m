Return-Path: <linux-media+bounces-36459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E27AF01A6
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B3F445132
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 17:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D5027F727;
	Tue,  1 Jul 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQmnRh6O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475CF27EFEE
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390470; cv=none; b=U0KBj2M3RxXy9akAljWYlI70Bwv2EYVFQ2wLc84nEhkf24GlsAvR3BTCJaxol2CwiRpOWHJiBXHGyvwDL8leKuw7hiyJ1wLFb/ygnkAukJpJGoz/gl2MAVIB+sp45gIPz74QGDdeBk5cV6G0mrRk7DMEl79ux1nNX8XVVQJsbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390470; c=relaxed/simple;
	bh=dWk/tkZS0CGTgxVWky6tt5aAynVh0z72TYL8nDE53fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwEXyPf23AvW7SSrWSLaSok+rF4mRO7cbNQ9T9UMpekKsLXSv1nxZMSrDD4eYaH8ko6JM+bKc4zSHH/w8M7QooR6+yKgmcGpW1IyZ+AFfUtAMedMVRp25YDTdmguuNelVoOhE9XnxwF7z9OE4p+Z4DsmspKVh3Pez3A7Bm8gGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQmnRh6O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751390467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVmGF9RkTyTxvlJMGRELjb+ww1NipZlYERKC83yz/Tg=;
	b=cQmnRh6O6vnntcokaOCICYhbeNReylRzczMD743Grb+K86RlxOIIByceeymcHnv/dsRY7Z
	H4jNJaTKA26ahQhoPseGFt6eaiaIIxJJoi3QYwKmfr2xwYl07tLGf/fOeLlT/zeaMeiy5i
	FVp7QfTnOICbJOzzAPcB8jWpz6CX4Pg=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-KZNcRADkOLuNk717_MmnhA-1; Tue, 01 Jul 2025 13:21:05 -0400
X-MC-Unique: KZNcRADkOLuNk717_MmnhA-1
X-Mimecast-MFC-AGG-ID: KZNcRADkOLuNk717_MmnhA_1751390465
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3df300ab18eso119589685ab.3
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 10:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390465; x=1751995265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVmGF9RkTyTxvlJMGRELjb+ww1NipZlYERKC83yz/Tg=;
        b=adI9uzY3IQf7E/qCo2GJ95jT/Bh866Y3xooH/BzgNw5iw6tRvg8UVIOKFbaLF/gaKQ
         eDWOlZKPTkqu5WxnUT7TUf6zf6IuIBBc7mNaC1Z9SVX4pUfmw4r9HVdusznYRUWN3Qmu
         EKoEsnxwWJzREHdgqgzkGqRd0yraanbUoKSOEvxxka0T9wIatZZhYyQX6wbyJ8kXTiJg
         4UwIZe/aUul7vV/2iHNpF/jm1K1VXFfNqLtIQzLu17PEHrFICnYH5ngQ1A/RDBSiYHDN
         yimy1HOVKfsOBQoLUuu5Eiq3vsBAY9y37FrKZT9GiyImizZdzmvXLgUrjWzxQKS6rxAf
         4/bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpUVSykC0r+6ZYtFxkptPSJXjTISysuhnhWw38GxVRsNqcRlpe0A9O+F08AKbfF78Oq2WA/Oon104mZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+uLqE0KADA6EZs1eCYqitkCscLLlOC4mmie/cNoNb8SoHmvhg
	kSl0pa/u+UMcn5u6Vgh4Pgw8Rt/HqkYapY9iiOAApa+M6dplLSEP59Y03l6b4/b/vuLIrvqBqf8
	0p5m279ti1C0/xtPD89/C8rlh8/mcLXHUOA4KUK/Q9b4tU6WYgsYtJfzlVzfX/UoOWt9o4w/sqU
	TSNlgmL3YuQ6giKccbkqg1wG0o6J2r201wOv5t3CY=
X-Gm-Gg: ASbGncuLRab8DsLBcL9+zcri4Ly5DWT1MnM2I4grpgS2ZgPIWETf+q6N4COpwov32og
	WHD+R3k4Ft4egIBPpKq/K2TVOyoFIsWOewGc9UXoVUeQvgo/axmcQf3n19oUGKScOfqL11f8tza
	EWq1wCAZW7EtJPu2Tj/tgiU7OxtiolcYkMiA==
X-Received: by 2002:a05:6e02:1f85:b0:3dd:b5ef:4556 with SMTP id e9e14a558f8ab-3df4acb74d5mr246873935ab.18.1751390464750;
        Tue, 01 Jul 2025 10:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVFJ9ApGOqaxtagPMUOlZUSCQhwbmJ+8slVbUHrBHNy/C3A8priniKlr4mG8nwDMeilSbFpeyivXOChXrX6xw=
X-Received: by 2002:a05:6e02:1f85:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3df4acb74d5mr246873575ab.18.1751390464404; Tue, 01 Jul 2025
 10:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701145240.105959-1-desnesn@redhat.com> <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
In-Reply-To: <CANiDSCs_Pz-wgnYNVA7Zt4RhtgN256i32aCw0mE4XFv3b49ygw@mail.gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Tue, 1 Jul 2025 14:20:53 -0300
X-Gm-Features: Ac12FXw_YKCphN3F3DlNdnjowckBLusvxuY6xIti8AU5zLzE_L5hGQ0WO8m0PDw
Message-ID: <CACaw+ex_T5xS9rw1651TV_z1myXxPGmtpeEB4HWA7S0xU+C9GQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: avoid variable shadowing in uvc_ctrl_cleanup_fh
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ricardo,

On Tue, Jul 1, 2025 at 1:48=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.or=
g> wrote:
>
> Hi Desnes
>
> On Tue, 1 Jul 2025 at 16:59, Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > This avoids a variable loop shadowing occurring between the local loop
> > iterating through the uvc_entity's controls and the global one going
> > through the pending async controls of the file handle
> >
> > Fixes: 10acb9101355 ("media: uvcvideo: Increase/decrease the PM counter=
 per IOCTL")
> If you add a fixes you need to add
> Cc: stable@kernel.org

Thanks for letting me know

>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/u=
vc_ctrl.c
> > index 44b6513c5264..91cc874da798 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,6 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3278,7 +3277,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >         if (!WARN_ON(handle->pending_async_ctrls))
> >                 return;
> >
> > -       for (i =3D 0; i < handle->pending_async_ctrls; i++)
>
> nitpick: I would have called the variable i, not j.  For me j usually
> means nested loop. But up to you

Noted - I used a different variable name because I wanted to
differentiate the loops.

>
> I am also not against your first version with a different commit message.

Third time's a charm then!

Will send a v2 with the first version having this commit message.

Thanks for the review Ricardo,

--=20
Desnes Nunes


