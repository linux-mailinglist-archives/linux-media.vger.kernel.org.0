Return-Path: <linux-media+bounces-64566-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Dl/JWeDKmoQrgMAu9opvQ
	(envelope-from <linux-media+bounces-64566-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:44:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793A670877
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:44:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=dHZpXlUU;
	dkim=pass header.d=redhat.com header.s=google header.b=LIeInIoo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64566-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64566-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0359230913F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1240E3C10BC;
	Thu, 11 Jun 2026 09:42:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196D3C1F26
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:42:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170946; cv=pass; b=gwAhcXt/AYqaPc9oooZAajlQZRBsHZkUOG3VNBmcmvpomfDNvk1CxuGaybcSMS7jEmJ/X5zFERHqXHV6YkTMijA3xvykPdmgeiP9dxZYz/XHNg+j3lRho9PXYHrrvDFXv61KxCx6hRRMAPTE1XOwNlCtaAK+trhghNDzavMQuzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170946; c=relaxed/simple;
	bh=TR/06g8VtK5CwjHciOgRn2x2W8TCGth4wlqmUX5s8kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txKnndAwTPNls0/DBO3q+bAJMPtdIdVoBsMZW26LWrB9606UrTJDv2HVyeZ5GqpjJwbXUtegyPk5tmH16VJzuT7nrRcraUM+CRlffnNkJOgr+IPSm3kvqD5bPO7Anl77+IuKwylwwaP5dmljBhdghvifrCPT2VZcThR9FjYXs2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dHZpXlUU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LIeInIoo; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781170939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0thyvR+ycynFVTEeiVDBCJnAjgvoXfn6mWbOS68w6c=;
	b=dHZpXlUU2tmhhrNf9lOTk3ObLbkQ/heXm4r3Ngh6tAF7VYAc30EIR6WwGcr7CkypqWJad0
	77vqRuHSAd721FILsJexheoqgiMQ0iaQ0N1Ykf84iVC3M+wuA2hggJ2lNRAE7EPeARtF7/
	RMVRX+z7mjcBSSTfZ+ieZvL8Z+6yTSo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-lyG9WGRiNkiyZdXYWRKYAg-1; Thu, 11 Jun 2026 05:42:18 -0400
X-MC-Unique: lyG9WGRiNkiyZdXYWRKYAg-1
X-Mimecast-MFC-AGG-ID: lyG9WGRiNkiyZdXYWRKYAg_1781170938
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48661b2ef8eso2803639b6e.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 02:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781170938; cv=none;
        d=google.com; s=arc-20240605;
        b=YmzmBBl398tZu5+Cm1lCvrvyIsJJGsE5c6eQpzAPOUvQBbnj5T5jBDhw6yi2wB1WTX
         9MWxPc5Dqtik789zz0HNCyxvT8ubctyE2n1zwfoAbpzkBogte9ST8z4e0KV+WF82DH0Q
         0vfiHpE9kIL8ZxU2capTN5O3jnxJfw6za/MeGnxAaKEzyzLOKbcGenjiXkiqXrUFU1II
         W1jSf1ZDB9/e+QXvfKFCQKbCz/z36aQEx+Bny+1hMljyujGI6KKp+ZCXQcjA2lltYfTG
         DCLBzOB1WU5QTeTqULtJBGd0oPG6/nPLLeK8MZ3jQjWrFb4R5UHCs6mQ5k5F5Zqt6hCn
         HHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0thyvR+ycynFVTEeiVDBCJnAjgvoXfn6mWbOS68w6c=;
        fh=xRHb8wPed+D12HM8gSA7NuWlnbzqpd3/P/YTyi3CM4s=;
        b=A2KfP8vQXz+eGe5DICdprenNke+oNebcBsrUOOIJGSuCPmBLZKKNp4u+Wfxjtck2Jd
         g0/cMX6/xQfM/QH45svS8Y2iqohSqQ5SMazPTgdsTapq1Mif1ip3hiY622EcX5vmuIpm
         KU6VcRtLWkfUxQvh1IqErTF7ymIJO2Hxi28jCYCKQkUu2c0Jk8+AVSzUcueVapm4jVlW
         to0lIf1cNr0ni5+9d4JCeExteJUBvpsTg7/laDq9EmD0SXh+PsUttB5Aq45o4tAcYkqR
         xz526KsKd/6WrFyT55382d0R54lsMbModiWEvVH9ReFnk9dspdVUdan0H5wy1/fi3fzd
         ddqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781170938; x=1781775738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0thyvR+ycynFVTEeiVDBCJnAjgvoXfn6mWbOS68w6c=;
        b=LIeInIooHFXkyARSwXaqciitMA8rywBwoPGR7XLiZHBE2A4ltIp4B1tix71lSVYTi1
         UE5aqxpS4WaC37tlBHels6QoXHhqQLwtpmDRHJtWVysCIAK0oReVptxd3noHODdenF35
         Y3vbzypMKgLLYldFYnA+xVPZF7SW288DqUtFWve6BeegYlTBv3f9hVNMD6A+3PtPIV9E
         4n0OhWh5glVBxLS/X1Lc4OyOGrbf3GLhaGCafWfe66lt2XFkYcQo5en1Aj2IAHDX/SNA
         q8kAqUMtOlGvNqmKJtWzF+88iGg/SF9Ecgh5v3h8mt+RtJN1RROEVlzgZpBDhiF9Pbhk
         E2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170938; x=1781775738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0thyvR+ycynFVTEeiVDBCJnAjgvoXfn6mWbOS68w6c=;
        b=T4YNGWePYoaENdkq7uAHpJtFHqHaWFad7PmiO8tm0ud/Z4JaYr+L3o/VQl2GD25L+6
         Q2b2kEB75hwkkak4mikvo8pjBvBtG4gWPm4ETZ3zq3o/TG/13encZz0ROMl/QdKC34Tb
         S+MoaWKDwiTkNu8FjJb74PNFWK+mt4XAmpp2RvA2TCR4tS8d4dw07uZlAXM8qGA6QCJ7
         YALt+0w/t9qzCxz3qSTWcYjf1h0xVGLf+GBwYne0Av0iCTLI+UL07nvi1yn5eEPHgJBW
         s182mC1IdxmWyTVlZ4OWpW1zTYyMAN1xUQ3eHJIOi2vheEBF1NQrbaTEc3M2c3DWB23T
         jbEg==
X-Forwarded-Encrypted: i=1; AFNElJ8crpa/DDpCTEN2HuK8VBxUSS5+tWikm9WM+UhCdD122nZiZpmPJy+XBlw5OnKdAevq925NHzfT7KJkKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdx/Vnz2j+yA004YjDZQZYrpE88DG7h1bOUdby50jMkRsy0dRX
	7I0HZbfH6mrxJMx4xgjPYH9dHnblUhgDKiNnj1WtfGCX9s+fBNiiSQMq3KkkqA8bIkIydscNEQ4
	WMieDcwmV475kXRVlM1KfHSGkNw/z64ySDfEOLI2OKUKRSNABPCJUa8nLYOlCkwI8T72pzp5tlz
	aieP51Rfx0jaDAEBBHpnToTSuvIOtVKs6BQp7Lkqk=
X-Gm-Gg: Acq92OGHkHYr4d+08n3fBueewmD+5z8xV6mKTezgccFQPA9sBgrlUiOtZHOi88FwJmP
	P2NWCMcjYjsA4S2B8wRHSFKa2Y/aWk9WMBCRkfYnVGNAKn/VcB335qbeq4ugXE6UXS6JMuU1Wp2
	zqTiEHBNX9W2hllRO7SHrf5BfBlJWPcXpzmLK0E4/QsEN1/iuWor4lM+mwzuhDnawADTqiNeZac
	CHyU51rTRfBFjbm
X-Received: by 2002:a05:6808:1920:b0:482:ce40:ab59 with SMTP id 5614622812f47-4871a1a08b9mr1635480b6e.31.1781170937678;
        Thu, 11 Jun 2026 02:42:17 -0700 (PDT)
X-Received: by 2002:a05:6808:1920:b0:482:ce40:ab59 with SMTP id
 5614622812f47-4871a1a08b9mr1635458b6e.31.1781170937235; Thu, 11 Jun 2026
 02:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain> <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain>
In-Reply-To: <aipwpTo5JCiAACVp@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 11 Jun 2026 17:42:04 +0800
X-Gm-Features: AVVi8CeBPyTjWEarwtioRpfSmDioVSrA0rSwx2d1-M8J3_HyRsuUreg8Tte8MgQ
Message-ID: <CAEth8oGzP-_hv2KF_wqxwjdp0tQn=0o9pUokO1HkR21eXnkvBQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mark Pearson <mpearson@squebb.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Serin Yeh <serin.yeh@intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[squebb.ca,kernel.org,oss.qualcomm.com,intel.com,siliconsignals.io,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64566-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0793A670877

Hi Sakari,

On Thu, Jun 11, 2026 at 4:24=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> > Hi Sakari and Mark,
> >
> > On Thu, Jun 11, 2026 at 5:59=E2=80=AFAM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Kate,
> > >
> > > I know several people have given you different advices but...
> > >
> > > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the =
image
> > > > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > > > resolve the issue.
> > > >
> > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > > ---
> > > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++=
++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/p=
ci/intel/ipu-bridge.c
> > > > index fc6608e33de4..9e24aaceecdf 100644
> > > > --- a/drivers/media/pci/intel/ipu-bridge.c
> > > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_=
sensor_dmi_ids[] =3D {
> > > >               },
> > > >               .driver_data =3D "OVTI02C1",
> > > >       },
> > > > +     {
> > > > +             /* Lenovo X9-14 */
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > > > +             },
> > > > +             .driver_data =3D "SONY471A",
> > > > +     },
> > > > +     {
> > > > +             /* Lenovo X9-14 */
> > >
> > > How are the two X9-14's different? It'd be good to have some comment =
here
> > > which model this actually is: the board name is only available (typic=
ally
> > > at least) in DMI.
> >
> > According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> > sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
>
> Is the CPU SKU the difference here? If so, can you add that to the commen=
t?
I looked into the datasheet and it is hard to describe the difference
between 21QA and 21QB (X9-14) or 21Q6 and 21Q7 (X9-15).
The 21QA and 21QB cover many kinds of configurations.

>
> > They may ship customised firmware for a specific purpose with a random
> > DMI_PRODUCT_VERSION.
> > So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> > safer and easier.
> >
> > I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> > know the side effect :(
> > They may propose a new model with a different MIPI camera or HID.
>
> Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think I'd
> use DMI_EXACT_MATCH(), too.

The board name is a 10-character string, and the first four characters
are used to identify the SKU, called "machine type". For example, my
X9 is 21QBZCK... so DMI_MATCH() matches the first 4 characters (21QB)
to identify that it is a X9-14.

> >
> > >
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> > > > +             },
> > > > +             .driver_data =3D "SONY471A",
> > > > +     },
> > > > +     {
> > > > +             /* Lenovo X9-15 */
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> > > > +             },
> > > > +             .driver_data =3D "SONY471A",
> > > > +     },
> > > > +     {
> > > > +             /* Lenovo X9-15 */
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> > > > +             },
> > > > +             .driver_data =3D "SONY471A",
> > > > +     },
> > > >       {} /* Terminating entry */
> > > >  };
> > > >
> > >
>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


