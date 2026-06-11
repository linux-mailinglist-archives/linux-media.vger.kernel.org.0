Return-Path: <linux-media+bounces-64542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X7hsIC5jKmpTogMAu9opvQ
	(envelope-from <linux-media+bounces-64542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:26:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12866F5D0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:26:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=d1g+wgr5;
	dkim=pass header.d=redhat.com header.s=google header.b=CNS0BHAw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64542-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64542-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D7F3072B65
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 07:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6283AFD18;
	Thu, 11 Jun 2026 07:26:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688EC364EB8
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:26:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162763; cv=pass; b=lIVw5XVOZS3ZbTIEWaQzGS83HL1rdt5EyQAf6jaU3JSs8ndpCgAGeX+D40ckW4NvunD3cs2Pj40eXCijosYHcS2ay13B5XwDQQugus1ChwZ3iP1JCnvfyQGQ4lWgkSJoh+y0Rr44T44U+F84nePNnK1NLLvc4CvMwLOhw+sgWQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162763; c=relaxed/simple;
	bh=Odm2BqB4+IN3tnFMOyBRMyhG5sfY0XO/NgABgiFCebU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKhyKTRcEBMOeJ3MXeouzGGyhuwBWjRD07I0T7BjcX+cGHANpSa1UYYU6X+ke9ACbWrJpNhKl/LolU9Pi8wllELHyhVdmnAk3+VL32B0misUkHpkFbnbJSXpl+LGR22gzQHrruzMMsz3BwtS298yMcrRKF1hbTd7Jd9btFuOCdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1g+wgr5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CNS0BHAw; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781162761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LM/eQe0MQEogdf5HJwCX7Ze5sWxc+WDej3WOtyIvn4=;
	b=d1g+wgr5m/H4zaaHbq9BEFq4Vnos97z7ZDnhU3kWqrBGWVDiUDV8/7Rabhq1Ong09uWXuR
	t8lhi3LPHUjyMLnRrgcreJOn/8DSq1AM4MaOlAIeh3FYus/h7wTpDflefMCf1EskCps1q+
	dmMeJkwy1SUFjNpHTb8UxvGbWx7QwHM=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-qFJyVPZGOEKyq6fAZx-Qrw-1; Thu, 11 Jun 2026 03:26:00 -0400
X-MC-Unique: qFJyVPZGOEKyq6fAZx-Qrw-1
X-Mimecast-MFC-AGG-ID: qFJyVPZGOEKyq6fAZx-Qrw_1781162759
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-486d0cff483so7691613b6e.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 00:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781162759; cv=none;
        d=google.com; s=arc-20240605;
        b=fH2jKFkHASFEpg0vGvlPIgduVVo+x+0Wd/ExVNyDEJGWDHTZAD4qoDGAcS3fyCa5GO
         6lW0qXFHzJwZ48WYs4YPhPklWdwZkEKxfpIkyrj2OAkthrz08dUifkHesGk+s9iJphnB
         oGlsFcItGURKMEVGN3Sf+4iN+6fax/CjQFwRjr7OneEqJAOfSIEIC7NDiTf53rqxDoz6
         wisXzw8T/UYyMLAPDudZkU12QuzfzK8Tlr18XougYfNe3sjdN6oJg9jhuljPI4WG9ZXx
         k0Vv8nt/jMoOOlvELZ0umQPJueno/zi+h/FN0nYV64Zs2WWOOe+53XPkHzPCD4P6nE42
         vBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7LM/eQe0MQEogdf5HJwCX7Ze5sWxc+WDej3WOtyIvn4=;
        fh=5xrQoD7iL8hLQMHhmJnSmSCyCIZzKWXQ6txu3o6pYEg=;
        b=JWKrdvUyzLbPgyq0qYYe0yfaRaAVTrx/7VACb5p1epKfjT1tpzZFI2e/AiCTGZmxoR
         xc5Xp67gnYy3q4AWZ6sXwa1EGPuvS54c+ZkU2ypy8J2urdEp2mJq9SOrMm7jxnYdnKuo
         4hv6+mlF34uFgNDsDz/LmEVhgrOfz+yrTgs8nE+9JIJeqHkCVE3QYu4erxEUZa8dSs/x
         YDt+kvEE5IwZ6WGq2hQaVKAfmnrwfU447r+j3VtCuIsKPZFdpIGeEwpptaRjl9+UZGbP
         rNLg2veby8o7qFss9Ccw8NR2/oSs4lZWJrYSZKaXSeecW0TkFI4ytHKQAsniMThybcSU
         rK/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781162759; x=1781767559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LM/eQe0MQEogdf5HJwCX7Ze5sWxc+WDej3WOtyIvn4=;
        b=CNS0BHAwlGB7WHIiTgwy19AeF1w83RkpYrzxlJEKztHawV0CP7eXNAO4JJJXoieIqi
         MTVRCkUUchXvHiTi5IxjhuKogT8cHvtKXs6u5TOIBINQvdS6kOX6VsNJ4ijzuvcyxuiO
         +ZeCxumLcKu9b4Z34lSd+X0Qx7i6phZ3lZ0Kw/d1IuX5juw58xw1NnbHqKNhftjLi7st
         2Nrw5EOZX+jVrhU90sorJgQCKdM3ZQAPfjZh5BnPqtkfQ10V/DasgQ4ZCMEhvBgSriC/
         //rfykCXp+8727roFHHS0Dt7+h6bYUhNhiDbYofMBtQmtshAPKMTc0iXvHTDz7bJohs5
         d8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162759; x=1781767559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7LM/eQe0MQEogdf5HJwCX7Ze5sWxc+WDej3WOtyIvn4=;
        b=jkSkFZBSS/upXoP6q1C8/lc0AvNS04D+pxS0b493iovHXN1k5Nw+MQxeUEH8RvC6Ot
         203P6M6hdx4Da/ie/AuBmdTJNRfLH/Q6+f9XgG9Wn9FWEzbqWma9jg3wHV07Tred35Jl
         Oz1WZpOWGSTWlClQrBNEZ53gHerDJHo9IUE+KrMPXOhP0NAXaNf6YgZBbFQw3VmTSFiX
         hPX+r2vPmHG6bsjbmd8feJPutCrlrixxBXv919o4HH/r1l6JcSgYg2P3vlhqf3LwmPNT
         8hztI9B44xzEOib2xd4GW5cGOdK4sotyq49kmR5gaVssDvWL/rlwsH/aTIUM0WbpXi5z
         6EFg==
X-Forwarded-Encrypted: i=1; AFNElJ/QBDSY4jp1eHEKNwZ2CIbiT0PJKvix88STKf8m9LY4KkMt3klJQarde64ZBkZ3yqpMM1fEeI42KlctVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+DfU5bDyvDcsYWF2TBC0Y3IPNj5lHBgK5+X+oCuRP1odzeQpm
	CqoN1mhX6dwxaQvjHU6+aXdMRPGDKNTOGhw+Yr1SX8BoCBnu7UqJrgQca3lFLWDmCIc3/fyjtiI
	wbzY7M/DujR1TfonTcLMwWFwNm5gbgSoKWDmsWuuEXNPU/GiYIggoghuB9XsMQm20QPx6v0qqas
	gjfjGxe/hvqfAqgZjwJ6JS9xRNozPJnYd1jz0inBE=
X-Gm-Gg: Acq92OHPlS1lNkRXT0aL/4y8JLwH0DByyzPFPC/FQQagtmU9RSSSuQKUJO96vAg+hXj
	eU44R7WLLUqRqfjdiH1M6qO0tnAtAA8HIjw9D6JgpnkofRrovc8sBVkTbo96OxeUU1Bcq/w6Xvz
	pW3PfD5QdzBUb5uwHsI1abIHyYs/dF9vARiqeryH6i/f6YEOR8yigKRhYHKQKdoEWlMrKQwI4Mx
	uVWyQdCocRx24DW
X-Received: by 2002:a05:6808:4f28:b0:485:4441:7224 with SMTP id 5614622812f47-4871a1b5295mr1177907b6e.37.1781162759449;
        Thu, 11 Jun 2026 00:25:59 -0700 (PDT)
X-Received: by 2002:a05:6808:4f28:b0:485:4441:7224 with SMTP id
 5614622812f47-4871a1b5295mr1177880b6e.37.1781162759051; Thu, 11 Jun 2026
 00:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
In-Reply-To: <aineK26VD67Fmibd@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 11 Jun 2026 15:25:46 +0800
X-Gm-Features: AVVi8CdqR-j0Sbx2Sbkq-Y7f9Gg8mr7ub7E0eJM_P4UbqfO15CxRw0AtNXzBO90
Message-ID: <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mark Pearson <mpearson@squebb.ca>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Damjan Georgievski <gdamjan@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64542-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mpearson@squebb.ca,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA12866F5D0

Hi Sakari and Mark,

On Thu, Jun 11, 2026 at 5:59=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> I know several people have given you different advices but...
>
> On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the imag=
e
> > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > resolve the issue.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/i=
ntel/ipu-bridge.c
> > index fc6608e33de4..9e24aaceecdf 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sens=
or_dmi_ids[] =3D {
> >               },
> >               .driver_data =3D "OVTI02C1",
> >       },
> > +     {
> > +             /* Lenovo X9-14 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             /* Lenovo X9-14 */
>
> How are the two X9-14's different? It'd be good to have some comment here
> which model this actually is: the board name is only available (typically
> at least) in DMI.

According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
They may ship customised firmware for a specific purpose with a random
DMI_PRODUCT_VERSION.
So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
safer and easier.

I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
know the side effect :(
They may propose a new model with a different MIPI camera or HID.

>
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             /* Lenovo X9-15 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             /* Lenovo X9-15 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> >       {} /* Terminating entry */
> >  };
> >
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


