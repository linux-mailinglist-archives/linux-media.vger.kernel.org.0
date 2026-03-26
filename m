Return-Path: <linux-media+bounces-57123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBcsEHjCxGku3QQAu9opvQ
	(envelope-from <linux-media+bounces-57123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:22:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7932F552
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F90F304C969
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25519285CAA;
	Thu, 26 Mar 2026 05:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gAkvE/ts";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lDFWHq9h"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474563368B8
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502496; cv=pass; b=BQyKkZzoh6EOYP8Rx3+SoqwY1q5obolOQtushHdEW8XkvQrpX+LvYzKsl7bEfwXHH5M2igPcHJy88Sybv4n19yML90cW4FIFcOrQ6iL4m64LtDgCZdp4zlaDQLXDAJJ1TRzJqZp/HmcjMFbLIIJcoXBGK3KYroPa49PVy7OPNLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502496; c=relaxed/simple;
	bh=l1V/mY3v/TNcUDMwH8mBJDKA8qBcksbdgBrrGmvkM84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKPpKVB0zBpfS/bWJlyaAmq/Sj8G3DFmx5n1c7og9rgOLPdROOTtOWVq+HBxmoKgDc3Ti2FkHVxodiyEerCBQKu/gJ+kboP0SRuND7lUe6aNUSj2Mo1I/kxgku4NwmIxQV98o9pcRsPrd0in4x4kV9nLKrbtK1BygzPVUn+dDXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gAkvE/ts; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lDFWHq9h; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774502494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f18+7E7ahqtc6+M+b7ClGWkEckNXEQjUoqrak6wZpJ4=;
	b=gAkvE/ts70B47MEdfUO2fgvW3j7GfZJb63JQR37a11otekgNO6kwuUsLxcCpSFYFzh1bCH
	kUbICB7uw+FmWWIlAuN2jCxQmpyRv3udsciABvC1VKRqER19pltIEhAtJ8YMI49GF02/8o
	5hSNIh9SQ7bJotNq6crZXNQPd3xsICM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-A_psUTvuMz-Ff8guJwcxOg-1; Thu, 26 Mar 2026 01:21:32 -0400
X-MC-Unique: A_psUTvuMz-Ff8guJwcxOg-1
X-Mimecast-MFC-AGG-ID: A_psUTvuMz-Ff8guJwcxOg_1774502492
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67baeba7a53so4028618eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 22:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774502492; cv=none;
        d=google.com; s=arc-20240605;
        b=MVYPMQnQ9Fw4vDajuA55hay/ex29Lj8BFIBOL5rHAUMKh9GAJHsdsdrl2mNxwOvkNX
         mcxoyhQsNxN9Hbt09xuqJhdhOlcfj+UESCR5d9jcLXCI4IjXuwpinFuHo3Gg1itdYkO/
         xQ+DfiB3LJq8J5bUStpdftQ/epboeMEy0++CRq6fJwh53XHiHYDEryinSy5KJzYLKoQc
         mkk/RgNLGakGomtQQkuFjZWICOhpHo5IzpOabiJFREk67sGgbBob2Ww2RfFFka7SBzeY
         jYjdxXsFAXw0n6SnS1Mf1eTEIzXaCHbQUaKgsE7kktRg3k4li4tTFbINo7AzfBU7Y2Bx
         LZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f18+7E7ahqtc6+M+b7ClGWkEckNXEQjUoqrak6wZpJ4=;
        fh=0lTrsqgwlejJZUDQY6G1quPM1ybyZWGlxx4O6IxLEeY=;
        b=OxGUf56p8++w+/USRQRYlRj8zGlR1i18Z3OfUMLu6OrbBhrUZFJ1dsXreWABuw6OAz
         EYV0Lu5US5e6FWCUm7h7s8PF57n/jQpuB77+f5eQ7R11ET0+SM3YoNBQfmgUvHKxanmE
         sCiCDHWhnar9uRNyufqBO8FoCdcSSbmQ843acyPw0c/gvuDhWCsi0r77k0lUDhKa0/hp
         knoefJK0zXiwZL4j84GHd6P4OWC7iz+o0Kha6v3GpzUJ6vjqkGToP7D9NW/li5igkyjE
         Vxp1SJwLK1gfy53cHKwFonmZjtZUn56zemLEK4N4SJtMMaFx/OXpcXWbBE1g/rPt0ccj
         41Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774502492; x=1775107292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f18+7E7ahqtc6+M+b7ClGWkEckNXEQjUoqrak6wZpJ4=;
        b=lDFWHq9hS3q6SjECBGTFhH+MAEXJnMd7LN16UXpHOUwV0WNBvr0cuOPH/E2wJe2YES
         755iHgm0UOMv1cTdZzQlTumj88c6yLOhwCWq7qf6n7xsRF5BWi4+mDgH3Efy5NcKpWFS
         Z/g1iYCnIEhPrJfrLgXpBQIvEijeeoGkRgbmDhRSFhRTVq5FbHrWPeQ4gv5/FgY/uQOp
         SXPYVoB7btamTRBZufXpcWgTr+AO1Mlgsv00wVajcBHZGExtgbcgwG9AD+TD86pfo5OL
         qG3JAdRFaV0WNunuAJrZF2aTU61CpMnNsBHGm99LDF+Yy+lNxklqjUa3PR9PGSlUjFXW
         0iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502492; x=1775107292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f18+7E7ahqtc6+M+b7ClGWkEckNXEQjUoqrak6wZpJ4=;
        b=OmHUqw8zisegPZyYLAEBJmDdjdyZI/T5cN7ikIg2L5jJhNWVAMNoS4Mw/rk/HIIF1s
         qognI7E5iLuFZOdQLzcip1tR36Qwu48i8iLi6d+oFfQbEez5f4c+C+QzPjbgLTlh6nlB
         eBpTv1w+IMswKDSMaj0t+sMAZ3lryAJmNJOgd8+D2YdFrVcYSeXDbeIdYr1qWRQatM0i
         wVq11fehMhucENBcA/SPsiCbpVTHCfnU9ue1VY1Sll/VSAWQkKJfZCFeOuCsWyRw5acc
         GiErMf7vFpmSzw9pkkMNcHiBauMOK9exy06UbomZ35sHBXD1jF0jpGOsYGsbnC1YukQA
         QiUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpLA9BZnHkxU4GnlZ7z34edKw2ziGWDZ7D/cF8c+5BMm2CDX4XRhmf0nnwUzb3afZ4DF8hgab2d1CqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycm9QWKH5BwAlchU0OCgz/8yxcRtusyylWfMYCD4bh607Csq6H
	gtKKrthuHTSy6jVds9Bng7cIKLMZgcvqCQdfQGIEFSxaOTPt9hX9Dn2bAR9ed7c73VI3R8flwzb
	IprfxjPsvjoFgMIHrwtEbQk4dLXHNCTLucMREZu78wuKO7XRDio7xHgpMbv99h3bA6Dzqh/+hl6
	ronku/eRFzMkNy4qzaqDouM1faRsifYmW7eJ8xUcA=
X-Gm-Gg: ATEYQzwO5GdYPNIycVCXzdFQMMbl9dOPBXPT0eR5iecrXa95zDuXBqikzidKluAT57L
	YJSQdAmk58otw9YQx7e/j5jNws5c2jAVR3hIU6yZK/47QAo2aYVZtnLMCSIk3yVs0P93W3qvzqv
	NuI41qpAdZCkAA7kI5VwelQHkJl7dsJDz5Vd5oS1aoUFirMTBSd7GHkSNcZ28oRcfuXmNVPyX1t
	SQPUA==
X-Received: by 2002:a05:6820:1506:b0:67d:e8b6:fb4d with SMTP id 006d021491bc7-67e10b5d3eamr120775eaf.13.1774502491966;
        Wed, 25 Mar 2026 22:21:31 -0700 (PDT)
X-Received: by 2002:a05:6820:1506:b0:67d:e8b6:fb4d with SMTP id
 006d021491bc7-67e10b5d3eamr120749eaf.13.1774502490153; Wed, 25 Mar 2026
 22:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323071647.38086-1-hpa@redhat.com> <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
 <acKREpGPr1J_1Oaj@kekkonen.localdomain> <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
 <CAEth8oF=qr4KAOSRU29n5DOhaAAo=VH9gfp7r25n0vwkuhfduA@mail.gmail.com>
In-Reply-To: <CAEth8oF=qr4KAOSRU29n5DOhaAAo=VH9gfp7r25n0vwkuhfduA@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 26 Mar 2026 13:21:18 +0800
X-Gm-Features: AQROBzBJurZ6kbxnga3rkNGMDJTdnEas8DuDAu-ARmQnO9B2zIHnvZ1p1XNFTWA
Message-ID: <CAEth8oHNX3da01oxOP3xuHKQc1qUYfBnGSpFifuaUMkKcgzvVQ@mail.gmail.com>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-57123-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E2B7932F552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

On Wed, Mar 25, 2026 at 11:01=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote:
>
> Hi Hans,
>
> On Tue, Mar 24, 2026 at 9:48=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kern=
el.org> wrote:
> >
> > On 24/03/2026 14:26, Sakari Ailus wrote:
> > > Hi Hans,
> > >
> > > On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
> > >> I'm missing an entry for the MAINTAINERS file.
> > >
> > > Thanks for noticing. I already picked this and it's in a PR... there =
are a
> > > few other (minor) remaining matters, too, which I asked Kate to addre=
ss on
> > > a follow-up patch. Would it be ok to address these at the same time, =
after
> > > the driver is merged?
> > >
> >
> > I prefer to have the MAINTAINERS entry before I merge this driver. Othe=
r
> > minor matters are fine for a follow-up patch, but a new driver shouldn'=
t
> > be merged without the corresponding MAINTAINERS entry.
> >
> > If Kate can post a patch for that entry tomorrow, and you Ack it, then =
I can just
> > add it to the PR.
>
> I'll try to propose a new revision of the patch today to include the MAIN=
TAINER.
>
> Thank you :)

The v13 patch included all the fixes and the MAINTAINER update in one commi=
t.
Do you want a revision with separate commits against your comments in
the v12 patch?
If you want, I can propose a new revision.

Thank you :)

>
> >
> > Regards,
> >
> >         Hans
> >
>
>
> --
> BR,
> Kate



--=20
BR,
Kate


