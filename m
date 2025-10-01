Return-Path: <linux-media+bounces-43470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3DBB0611
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 14:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 801CE19271B6
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 12:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD3A2EBDE6;
	Wed,  1 Oct 2025 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awFetGzO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F92EAD0A
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759322965; cv=none; b=GB8lkLd5FlSQAeEQFTUY7S9VfwSKjpZmE+CkEFYLM9XvpjFiOrZH1RQvcRyJkmQXQkzbneowHMSwEgnK1e8adL9ux/f6QW6/PE2XNPnuEAtWQo7MKdYZPgntEWioubplV7EIXv8tgrsoXzVo0efkwdh+P4UWlUCcy0ykb2lNruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759322965; c=relaxed/simple;
	bh=wFHNTs49qUJ4R/XkrBRhugaX+baqu/sFEfxqFkSKkLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jo8KRQvOfaiBhq/DpkbkSuD1KPL9VXzlppelFVlZEY3yp5nAZ9nD3owQxOruh0XP8VtKYxUAXqdbjTJjk6aiwKmID3s4BhFiVjAHD35j5DWwCD95uPe8MvdGfg/dOniy4rclBM1iTZJSIFIec3DwgXygSttfJz1hazgQWRHgURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awFetGzO; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5b99f5d5479so693586137.0
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 05:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759322962; x=1759927762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqAAIjc6Qt7FXWVGlCDnEfTkQhmVsUANJKVkWneg770=;
        b=awFetGzOsq9l9h1qUn3/Gs9Xts21pAK0xJaMa3ywJJTk23JJqizLOZBLOmJ0z95A+g
         CKHy51vLcT9NCiS3R+Vck2H274DYsfG1e/DU11JKq46zyaRJ7tyPgyjdblKLAgpjFWr6
         boh5f+9N4BerlT8dRPX9XPTGVg8MPpQSTYBW4C6DwwBN6GZYdqD31/P3NYAN3+Cg0iEy
         0+xL/S/jsqMbQ0CcLLy3LhUQKUohn8a7W+2k7F0Vh+SAQx//sebIgI1w4ccxtUUnJl0s
         qx8ePEIil1FLusqfqSBZ+kdxCG1nxnluPNDCDTxbXdo0eLbWygcAvgxZ/a0ViF9n6sNM
         cK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759322962; x=1759927762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqAAIjc6Qt7FXWVGlCDnEfTkQhmVsUANJKVkWneg770=;
        b=hmDXkzz25xhC5faw433Qzxs3vIHyWQ0ywIZbJQDBE8KSJFAaVvPgjrI6W3kQjzk/6N
         oUR4d84ilUv3s+q1xCOjNUKT7dGwsCt9qsHCn5dPZwuDO0a2s2BQH27byCw/zWrusH2i
         fcYNuJqs+i8e+T2DbLz8omcdLb1EBZDiOe6JzkVlr61s7fWpu9Y6SICbnxQ7NsWu+PLO
         Xkg6a8eGIQW+kQz0smUsvv+GYO6ofFEQrbzwACa3ubk116Wahp8U7Hz6mraZ8tjzN6St
         F6Ya0DNgZsB8BbzvglwViGVMmCxJB81ZfMtaqrmKcHgnGC7ie3aad8FFqRqzmf88cZbP
         ojxg==
X-Forwarded-Encrypted: i=1; AJvYcCXY1UHtLFo4Aic5sPvYnB4FGphI29B3TVOZ748qT5mV2DQoUaGbnNsHFFlUmq4R+4B+0FzdYj+crCpD0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMsHJKfrXSsvLbJAN3eGYnowe7uYTZOpaeYdBBn9wqHeMn8Kt
	0+e6dhWO1CeR0gjoM4RmBHUVWMKkTxf1p5Yw6h9EBKi0YIg8zYTJMHtG1uaWnNRoHWnrDEb6Wjf
	FxnLavgokvjAijb1ii3OlEu5xy7te7CA=
X-Gm-Gg: ASbGncsBS5NFAWAXaM91rzbj9LbyuTxyBfn0TjjqklyQJn2vlwjzHSAWthFZU+NPfbD
	QyqSBAneJs651qFhn3r6jQDX+/c5a3hurEnnleqZhcVV64cg1RU5D+uOtEGXtQU6pHS6RyHKveJ
	gxBFiZVSQbzYoOon6+d4Oh0MC2EWkx/Sp2Szu+KEmlvapPOBLHZrlTvt8NtVtOSYyZ5aNbpnokK
	rgU1/yqb7roRdEEFxPHxLT6A6sHPBtQHZN3GoCfuTwAP46YhqF0n+iHE5eQTA==
X-Google-Smtp-Source: AGHT+IERRwXJp9F//JwG+TdQsrB3cSAJW1qE4AA9Xa8i3nFxtPEvH//jKEKteR1nSfRhCoh0bBRfaE8F5k8Bd8aTBPk=
X-Received: by 2002:a05:6102:2925:b0:4e5:8d09:7b12 with SMTP id
 ada2fe7eead31-5d3fd671c4cmr1832661137.7.1759322961773; Wed, 01 Oct 2025
 05:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250905-b4-v1-1-2cdc261fd86d@cherry.de> <8eec5b1a-9b57-48d2-94dc-0afdb3f942ed@kernel.org>
In-Reply-To: <8eec5b1a-9b57-48d2-94dc-0afdb3f942ed@kernel.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 1 Oct 2025 14:49:03 +0200
X-Gm-Features: AS18NWDdfk93KaRKHr4k-8OGc90WfmpBO-a6_haT_tXpSKG1h5i1GFL8qDXQASM
Message-ID: <CAPybu_03MnkUzbJ8zFRoH7-hQABDjHn_GEq5vojkKUdCs0b=Fw@mail.gmail.com>
Subject: Re: [PATCH] add basic b4 config file
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin

On Wed, Oct 1, 2025 at 11:10=E2=80=AFAM Hans Verkuil <hverkuil+cisco@kernel=
.org> wrote:
>
> On 05/09/2025 14:29, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@cherry.de>
> >
> > b4[1] is a very nice tool for mail-based contribution. A config[2] file
> > exists to set up a few defaults. We can use it to set the To recipients
> > to always add, in our case the mailing list.
> >
> > This shouldn't be necessary if we had a script that b4 prep --auto-to-c=
c
> > could call to find the mail address(es) to send to, =C3=A0-la
> > scripts/get_maintainer.pl from the kernel tree.
> >
> > This allows us to not have to look for the mailing list to send the
> > patches to, just use b4 and you're all set.
> >
> > [1] https://pypi.org/project/b4/
> > [2] https://b4.docs.kernel.org/en/latest/config.html
> >
> > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> > Since that ML is also used for other repos than v4l-utils and I've seen
> > a few people using [v4l-utils] as prefixes, should we add
> >
> > send-prefixes =3D v4l-utils
> >
> > to the config file as well?
>
> Yes please.
>
> I'm not sure I want to have this in v4l-utils, but if I do, then definite=
ly with
> that prefix.
>
> When you post the new patch, please prefix it with v4l-utils as well.
>
> Regards,
>
>         Hans
>
> > ---
> >  .b4-config | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..31873a088f0b32c174363f8=
b56a54a976b87fb17
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,2 @@
> > +[b4]
> > +  send-series-to =3D linux-media@vger.kernel.org
I believe we prefer send-series-cc.

https://git.linuxtv.org/v4l-utils.git/tree/CONTRIBUTE.md



> >
> > ---
> > base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
> > change-id: 20250905-b4-1e813446afa4
> >
> > Best regards,
>
>


--=20
Ricardo Ribalda

