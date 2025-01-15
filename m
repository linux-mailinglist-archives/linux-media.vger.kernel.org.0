Return-Path: <linux-media+bounces-24774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD12A12292
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 12:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C771889973
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B671EEA4F;
	Wed, 15 Jan 2025 11:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg2jkHq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A029A5
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940688; cv=none; b=J3Z0+EhDvquna1WWJg/RaQ6BwSK2svCJR6YUR0ozTvQutBTxqoTfaDyQpSuxl/FpwkQZQGKP4YdjOsGWC/K/wLrOlctMtlzhG6yIZyacAD+RoLkDkelHIYhcrPmignukphhuZwz/cn+u79lMGxDBv6fhT317+KkzP1sLlaf543U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940688; c=relaxed/simple;
	bh=JLFz6XbP5x4c+099TC/g3c5RoYCHGafKBTnQvYQVX3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mB33uMniEcviVr7mkZ0l8og0C1okJ6/CWpNdL4xsum/qfE7H4IoBj82IpjRl9bGySR4Tdy/tDsTM8IGnbnLpgqzv52uZbwjoojMVzcyA+6jlwzYX/QMXUSSP390Jpf0BzRj70RDSE4wnGECitwL2F2Aey6PFmTI9+Y+e9WZhPZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg2jkHq7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161eb94cceso80633025ad.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940685; x=1737545485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsEMzV7+4lbRlAi3Wlu2J/UUINveZN8oKbfKk5Yf2Aw=;
        b=dg2jkHq7Qfk6f8lLDhb8KqUWMEk7Pbw0vdpi1sTwbSAf7tPm88Brod6mevwBc2gut9
         knpMyYL93dbe6qpTWguxFtqlSqTnYn1sZAnrB66W9bNC2R3K+Xnv6jajP4VdTsy+zhNX
         QiTeMJlzPYE/C14fu6oemHhXYN/kidM9eqNu0bVFULGSUZ+Bk7buv8b5iUxLbUs4RX3g
         AhmP6UBrUpyf1nBjkNIyXlPQs7WqOKXymgMIizskMdzxv4I6yW0yjvSwZACixjfrRmvY
         2K9wooahyUuIWDZYKNc5c8HI0hcwhdc3x78Huv57hpjCU/wHsdOUCe2Ym9p7Qz8zPqwp
         JT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940685; x=1737545485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsEMzV7+4lbRlAi3Wlu2J/UUINveZN8oKbfKk5Yf2Aw=;
        b=Qm5CKv73BoF8ElYciQRbb00PUBDI9nx5wgNuZrJcj3jENdjy/D9ztapw4IpwJ4AjKv
         9D0Ntj6WNqLmXAU+7TBOEFpA7ZSdEtdTxSvh8L841wO1mzzMfwBKMWEE+qA8pNC3WsF3
         9oDtU/l8CTaNTDJihuwMZVNpZVc0cnVTD6bHw2gCuDfnFgTFXs5JU4mAKoM7De6dAcIN
         AogwNLHtMRc0we5Nvfykf4dbX62MAxQNDut+d8SMvItafbwish9fWdI1+vVBWyYWMLG4
         RCrv0Y/aCVPd520gW1ev1cPzPsqu1S6cij+8opD65rzrQjrOAK5+uCfcDmuO+H1aJrVf
         eTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUhsryjAq3l6psipIoM1eG51+3W0TZyq/QLiyk19Wx8bJTBN5W4k8YnbpH6zS0imsmTXHDKMwKO/t4bIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDiVWrw0M+nMqeJzKKXeC2dvv7vBG4fMO67jKyZK9ReHwg+1s
	ABMp+8HsSu5YUO4vKyJLvN2rDrDukJdLZ/TIFORvjVA/Y1LUmv1C5mptAVYaz6nmpc2mCV5QJlw
	X3ayq78U507iIDvP6kaakUg2P+3E=
X-Gm-Gg: ASbGncudZrbKOAmeUDICS/g/++g9dudEF5pFnch+OPOHnoPL7fU9T7yf5E9Flib9ock
	8q9ZO5OjGWlYkITYQtiV0tPZGhTeqrldyXZPV0w==
X-Google-Smtp-Source: AGHT+IGpHFeM1PEqSB+5qLN7Lr5FQecpUXGzGuql2Noc39rDDFuwEs9BW9ZYQICyVR9rLm06phstND84r9FxKQo2QxA=
X-Received: by 2002:a17:90a:d64e:b0:2ee:dd79:e046 with SMTP id
 98e67ed59e1d1-2f548eba62dmr39579644a91.13.1736940685013; Wed, 15 Jan 2025
 03:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
 <CAOMZO5BJt6qzETzMeO47N5Gu8136tppuXKnqv4ypk6HyLR99vA@mail.gmail.com>
 <F5E2D925-668C-4D4D-87C9-8F22126443FD@gmail.com> <CAHCN7x+hUJoKRO8U8dgafFip31AKJRqfQw1kOw7YhvZ6xXqNnA@mail.gmail.com>
 <A3476357-8D8D-4B82-8CAB-58370BECF575@gmail.com> <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
In-Reply-To: <a393b3324c60c2c13994d34ca90faf4eb604ae43.camel@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 15 Jan 2025 05:31:13 -0600
X-Gm-Features: AbW1kvYKwhBnBA4jeK7q_7XxMmfm45yikx15V9pKuDGRRKwKeIBjBREqZIrtRbw
Message-ID: <CAHCN7xJn6SVqLHG5EqK4aPvjA-xa36QGK_xewc+4+wpvAOcmXQ@mail.gmail.com>
Subject: Re: Hantro H1 Encoding Upstreaming
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <dwlsalmeida@gmail.com>, Fabio Estevam <festevam@gmail.com>, andrzejtp2010@gmail.com, 
	Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com, 
	linux-media <linux-media@vger.kernel.org>, linux-imx@nxmp.com, paulk@sys-base.io, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Gustavo Padovan <gus@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:16=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi everyone,
>
> despite Andrzej having left the community, we are not giving up on the en=
coder
> work. In 2025, we aim at working more seriously on the V4L2 spec, as just
> writing driver won't cut it. Each class of codecs needs a general workflo=
w spec
> similar to what we have already for stateful encoder/decoder and stateles=
s
> decoder.
>
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-deco=
der.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-enco=
der.html
> - https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stat=
eless-decoder.html
>
> It is on top of this, that for each codec we have to add controls (mostly
> compound) specifics and details that suites stateless accelerators.
>
> From a community stand point, the most important focus is to write and ag=
ree on
> spec and controls. Once we have that, vendors will be able to slowly move=
 away
> from their custom solution, and compete on actual hardware rather then
> integration.
>
> It is also time to start looking toward the future, since Hantro H1 is ve=
ry
> limited and ancient encoder. On same brand, if someone could work on VC80=
00E
> shipped on IMX8M Plus, or Rockchip codecs, that will certainly help progr=
ess. We
> can also get inspiration from many other stateless encoding APIs now, not=
ably
> VA, DXVA and Vulkan Video.

I have an 8MP and I looked at the VC800E a little, and I attempted to
port what was done before to the 8MM.  If that's a sufficient place to
start, I can give it a try, but if the userpace isn't finalized, I am
not sure how to test it.

>
> Of course, folks likes to know when this will happen, stateless decoders =
took 5
> years from start to the first codec being merged, hopefully we don't beat=
 that
> record. I personally aim for producing work during the summer, and mostly=
 focus
> on the spec. Its obvious for me that testing on H1 with a GStreamer
> implementation is the most productive, though I have strong interest in h=
aving
> an ecosystem of drivers. A second userspace implementation, perhaps ffmpe=
g ?,
> could also be useful.
>
> If you'd like to take a bite, this is a good thread to discuss forward. U=
ntil
> the summer, I planned to reach to Paul, who made this great presentation =
[1] at
> FOSDEM last year and start moving the RFC into using these ideas. One of =
the
> biggest discussion is rate control, it is clear to me that modern HW inte=
grated
> RC offloading, though some HW specific knobs or even firmware offloading,=
 and
> this is what Paul has been putting some thought into.

I'll take a look at the presentation.  I will admit that I am not an
expert on the video formats or how the encoding works, but I'm willing
to try.


>
> If decoders have progressed so much in quality in the last few years, it =
is
> mostly before we have better ways to test them. It is also needed to star=
t
> thinking how do we want to test our encoders. The stateful scene is not a=
ll
> green, with a very organic groth and difficult to unify set of encoders. =
And we
> have no metric of how good or bad they are either.

adam
>
> regards,
> Nicolas
>
> Le lundi 13 janvier 2025 =C3=A0 18:08 -0300, Daniel Almeida a =C3=A9crit =
:
> > +cc Nicolas
> >
> >
> > Hey Adam,
> >
> >
> > >
> > > Daniel,
> > >
> > > Do you know if anyone will be picking up the H1 encoder?
> > >
> > > adam
> > > >
> > > > =E2=80=94 Daniel
> > > >
> > >
> >
> > I think my colleague Nicolas is the best person to answer this.
> >
> > =E2=80=94 Daniel
>

