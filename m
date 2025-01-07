Return-Path: <linux-media+bounces-24340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2EBA03D65
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 12:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ABE41655CB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D001E284B;
	Tue,  7 Jan 2025 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9+8mDP7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F71E1C02
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 11:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736248507; cv=none; b=HtzP9A4BY54cRXkm8PJZ1sy3cQ5kV+H0C+otkWoOWVLgh9tFjFLV2gN7VcJ1GsrEllZPwvZLMaAKqlqrefOeuZB4RBHK5wb/iAOTPSQ+eY43l+/I3OUAcAQdRNF5hxPrDOTX9U2ySaEajuLMV1VdyzHcutTk7onV80nTyVtulsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736248507; c=relaxed/simple;
	bh=KgIY1FKTRLzpFPckl123BoGuHK517RwR0PXKjce5B8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EjnpbJ94FdtZg9o6WrKMkKLE7DzJnQt4+JOCzitbLe0Fv3GST1Dsn7l7qwBIw3atiZQAJnaOdHaEzYxUizd7UujFZ4UbWciSFvwS/swrBtUvxp7BZgLpGCNg+TaDk2wFLEI6fGbFQnv4co2lTo6vtQyTwpK05yTGqI+32wjNn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9+8mDP7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736248502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUaJjpsVXRoORRkXE0LhWYFr2HvlCV5BeKiI5SY7cGE=;
	b=c9+8mDP7T70VqoE3YAeCi2BwjHxh/WDSFZOefTFdJG2INrwISx2DQ7aEpB37bflzYHYBis
	6W7LvFj/qMlC+gNP55Hqf0LP554ZUJXKziITSDhYwidtSBqTahyWD9vVc17EZ04JN2I423
	nDFO0AiYaY+msnxyLmLqLlLAmzX3KZs=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-Pyvj_8LZON6pSsVKHwpxog-1; Tue, 07 Jan 2025 06:14:59 -0500
X-MC-Unique: Pyvj_8LZON6pSsVKHwpxog-1
X-Mimecast-MFC-AGG-ID: Pyvj_8LZON6pSsVKHwpxog
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e549dac2eccso8099378276.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 03:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248499; x=1736853299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUaJjpsVXRoORRkXE0LhWYFr2HvlCV5BeKiI5SY7cGE=;
        b=nIf+PHtIPEZ7R30cpt7UXIMd5nzyLqLFVDBiW5IpELIBYNLVz8W6BqD+2B5xmsUPZk
         FmRaWNzbMrw+UX3fE2VFqIe3fzuDfeJ8FfyKAKFnptWlFfHUlJWSp92UJDiSjas3xynJ
         j41K0+UDKqNdRaKYsSiBm5Ju1OaIZm0D8eZSfP8tSahU/LTbYINRDqTaYU8BbLb6R1iq
         Kjt6HpgPot3lUQcd2VJMlWOYqGmDhuoy4rwxShIL4v2TkdHdAlp0+0nawld4Qpciz6hj
         7T7bg3GyGAiBkEVrBrkB+inUeqAFzqq7AZvwhAqxP/NTU03GfX7FRO78T7nMe0QrwKQs
         BgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDXweAE1Wp5vZ8fukspY72icaFIQFI7PC5tvELj/9q4vJYvtBp6yjdyvSrBtgryYeskStKdmAOqf73gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAuB6NMvA0YFCZUu7vTP2hQzDpArChvdbPM6Q5Jh5HVsBv6/SZ
	UUPC+l672TIUOm2VG+XnibxA8UwYVHblRjr6zyWhCjgFL5+yUwWelUh4n9ddvlUOnTGv4UZfdo5
	Di2nj7LVvay8rAreCgFhfNKEUjdgDUq8Wyy9pxRitZSo1EkDabcxrGS1oW+4uxVuVq4ZgysM0mt
	+TSY9JFVcEDRUqcjHRwSP5Y54rQc0pR0xFsVM=
X-Gm-Gg: ASbGnctggWzHyq3SkSwUlwmQPeHvL3sUjLtawSMb7jCzvbAm/FvsvJEhcP1SguSIufa
	ES8QNDiT2uVyqyFuEgMXLq6BXnLcEzNvdlm1M6Q==
X-Received: by 2002:a05:6902:108d:b0:e30:e39b:9d72 with SMTP id 3f1490d57ef6-e538c256ae8mr46408488276.16.1736248498821;
        Tue, 07 Jan 2025 03:14:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0ys7pp3PYltb89+odK6t+kYDNIkFvej+sUkqUbFdO92SoUUTkU5SmXGH5z1d+W38E0UsqvFKyZQCcN0GlvkE=
X-Received: by 2002:a05:6902:108d:b0:e30:e39b:9d72 with SMTP id
 3f1490d57ef6-e538c256ae8mr46408473276.16.1736248498529; Tue, 07 Jan 2025
 03:14:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231190434.438517-1-lkundrak@v3.sk> <eacf3201-2884-48e3-b54d-2e52e16999be@xs4all.nl>
In-Reply-To: <eacf3201-2884-48e3-b54d-2e52e16999be@xs4all.nl>
From: Lubomir Rintel <lrintel@redhat.com>
Date: Tue, 7 Jan 2025 12:14:47 +0100
Message-ID: <CACQFvQE6P0zdxcOCz4YoTyp2eJKfezRgy9i6GYLLH6=U_PWFTw@mail.gmail.com>
Subject: Re: [PATCH] media/mmp: Bring back registration of the device
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lubomir Rintel <lkundrak@v3.sk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 4:19=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi Lubomir,
>
> On 31/12/2024 20:04, Lubomir Rintel wrote:
> > In commit 4af65141e38e ("media: marvell: cafe: Register V4L2 device
> > earlier"), a call to v4l2_device_register() was moved away from
> > mccic_register() into its caller, marvell/cafe's cafe_pci_probe().
> > This is not the only caller though -- there's also marvell/mmp.
> >
> > Add v4l2_device_register() into mmpcam_probe() to unbreak the MMP camer=
a
> > driver, in a fashion analogous to what's been done to the Cafe driver.
> > Same for the teardown path.
> >
> > Fixes: 4af65141e38e ("media: marvell: cafe: Register V4L2 device earlie=
r")
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>
> Should this be your redhat email? I have a mismatch between the From emai=
l
> and the email in this Sob.
>
> I can fix it either way, but you have to tell me what you prefer.

The @v3.sk address please.

Apologies for the mess, seems like I forgot how to use e-mail.

Thank you
Lubo

>
> Regards,
>
>         Hans
>
> > Cc: stable@vger.kernel.org # v6.6+
> > ---
> >  drivers/media/platform/marvell/mmp-driver.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/medi=
a/platform/marvell/mmp-driver.c
> > index 3fd4fc1b9c48..d3da7ebb4a2b 100644
> > --- a/drivers/media/platform/marvell/mmp-driver.c
> > +++ b/drivers/media/platform/marvell/mmp-driver.c
> > @@ -231,13 +231,23 @@ static int mmpcam_probe(struct platform_device *p=
dev)
> >
> >       mcam_init_clk(mcam);
> >
> > +     /*
> > +      * Register with V4L.
> > +      */
> > +
> > +     ret =3D v4l2_device_register(mcam->dev, &mcam->v4l2_dev);
> > +     if (ret)
> > +             return ret;
> > +
> >       /*
> >        * Create a match of the sensor against its OF node.
> >        */
> >       ep =3D fwnode_graph_get_next_endpoint(of_fwnode_handle(pdev->dev.=
of_node),
> >                                           NULL);
> > -     if (!ep)
> > -             return -ENODEV;
> > +     if (!ep) {
> > +             ret =3D -ENODEV;
> > +             goto out_v4l2_device_unregister;
> > +     }
> >
> >       v4l2_async_nf_init(&mcam->notifier, &mcam->v4l2_dev);
> >
> > @@ -246,7 +256,7 @@ static int mmpcam_probe(struct platform_device *pde=
v)
> >       fwnode_handle_put(ep);
> >       if (IS_ERR(asd)) {
> >               ret =3D PTR_ERR(asd);
> > -             goto out;
> > +             goto out_v4l2_device_unregister;
> >       }
> >
> >       /*
> > @@ -254,7 +264,7 @@ static int mmpcam_probe(struct platform_device *pde=
v)
> >        */
> >       ret =3D mccic_register(mcam);
> >       if (ret)
> > -             goto out;
> > +             goto out_v4l2_device_unregister;
> >
> >       /*
> >        * Add OF clock provider.
> > @@ -283,6 +293,8 @@ static int mmpcam_probe(struct platform_device *pde=
v)
> >       return 0;
> >  out:
> >       mccic_shutdown(mcam);
> > +out_v4l2_device_unregister:
> > +     v4l2_device_unregister(&mcam->v4l2_dev);
> >
> >       return ret;
> >  }
> > @@ -293,6 +305,7 @@ static void mmpcam_remove(struct platform_device *p=
dev)
> >       struct mcam_camera *mcam =3D &cam->mcam;
> >
> >       mccic_shutdown(mcam);
> > +     v4l2_device_unregister(&mcam->v4l2_dev);
> >       pm_runtime_force_suspend(mcam->dev);
> >  }
> >
>


