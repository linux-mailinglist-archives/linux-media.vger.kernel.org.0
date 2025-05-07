Return-Path: <linux-media+bounces-31953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA3AADC90
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 12:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA29116402F
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED5620F090;
	Wed,  7 May 2025 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLxIxex0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC733FD
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614034; cv=none; b=ZdGURzJ7v6vGXhPpqhTj/AVO1q5gJbAVJQjYYb7qV5YFxBNKm/KEaC4LoSD6iyOMmhGhKkSP1Jsi1eus1dBPF8E4nOzdOu8tkzTYFXhaOt/fkorcXlherukULCg5AoxFQl0ExkFXynO8adrj210u9ouWVVO4R5PEIQZP6SAVUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614034; c=relaxed/simple;
	bh=979dsAvrwr51IWkFktx1rOBA2aWk4fH1OPuOUskJgl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHylY9XS6omcIXGmpQUog7VEDLkxo/eVE7r0C4gZNTRfAzR3++wD1WKWAOdvxyJLz0AjlY3zJI5psEmo/F/hJ44chWKT14CbDK806RTw7UPEEOoSruv3NDfSj7oV3S6GoVYfLdyYLiq9Z/4vucNlljsoUuNC/lAc1cUg0H+Cvls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLxIxex0; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4c308e7b84fso1846124137.1
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746614031; x=1747218831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=979dsAvrwr51IWkFktx1rOBA2aWk4fH1OPuOUskJgl0=;
        b=iLxIxex0Z8LD4dBouoxP8D61o5UOO3WY9IPkdEGES/AHFtYPOuN6XsX3vXbqG7eX3q
         ChG3LX6F50qWTy3EqZcj/3O15Z4I9z6SL3UkaRyjsmwB+0tLWKQ8gdCAA/J/fx+u35gQ
         nEL6lAZK6vJomZuJvpF73bqKw7drhPYLoC94fsbDBq6Iedy8Cv5JmlLLVpy3JEANaUmN
         YXBPTolzeG6o9SwdhI55v2SBBQBnhzUCHPjZS2xg2S0Jt2LMWtM7bn5NT/Zg47cmEGPC
         3525AR4gtFdOJbvkb8Lf4uT2z1yUsjFLBJTllcUFOfQKFpMtaglS/SsovMXBdAiGxGob
         xL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746614031; x=1747218831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=979dsAvrwr51IWkFktx1rOBA2aWk4fH1OPuOUskJgl0=;
        b=hb81ySJvl3AGUQS3HVaakZ3KJc7B/0i6wU3LjcJTPb7DzMKiOW1S8jDa1N4PM14YVo
         wBoLQnoRmTFAoOqjVjUufmsyn0gkBycKuoA0sog+IfuWtc18KHzgmQxqZrR/uSe7PdYe
         e7jKDQVHpsbC9dJvo+WEk4Q7yWHh+7yThMilBDKU5NFQm2h3iD8kGzswHXHkYcPu7eZ0
         2EcPkS7cYbCl+HXAZ0QaFgpncGtKzTDInIgiFIcyrfYNcCg7dGG510ODMQ23t8n3l770
         0kn0yBlbnxvsEFoIaBpgptulSyQcTkeU2EXAI86RRArZcYbZUgzo9NoaqNewuQXzRoUb
         XzHg==
X-Forwarded-Encrypted: i=1; AJvYcCXaAcJtEX5QXm55/63I+2kJ1igYJ6K7KFjQ+3JnxNiL6CVdIHb1LSC3qshUOUjTUARKVAuibKCuaBpi0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaT5hJPcJJ21xJyIPK52fpXYXr80xMT3cgZM0JLq2E35s/ug0u
	+tdxyVMq5ww4nIQiRkFgdpybuptU/75qA+ezNYLNWcOpqvRKGYLt+Vl0i6bo4p5NU1ja7bPxQxt
	RhMBKwnJzg144+uOZ6O3C5KRU6to=
X-Gm-Gg: ASbGncuBcdBT/aeLQrTAdsv+6iXv6/zMaCf9Ljzasz6r5TM0xdeERstiDO8yBHvF2na
	on5dhLHtoVzk4h5AzuV6vYMUaofGGXtviHbPFbHaCMmbehY5BBlOgOeaK7Sp9aM38u3nc9LsNa8
	b9nLiCcsBNQ/5HMvsErm6ZMUDdVUN9owiuVeQJQHLpEI3PQEelUhC/
X-Google-Smtp-Source: AGHT+IHX2fD1a77zdtlZE9XOzzIAERlc1ue8LcS0x1EsUvWL/lc5E1xK7UvfP4vyCU1J5HMMHU/GgR+8jBFjcnbUb1E=
X-Received: by 2002:a05:6102:4b8b:b0:4c1:8b8e:e9f7 with SMTP id
 ada2fe7eead31-4dc737d4ac5mr2245715137.8.1746614031386; Wed, 07 May 2025
 03:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <20250507102844.0fa7f798@foz.lan> <20250507091907.GC11152@pendragon.ideasonboard.com>
In-Reply-To: <20250507091907.GC11152@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 7 May 2025 12:33:33 +0200
X-Gm-Features: ATxdqUF36sGoMFhtoHpbsiwdzfsYIJh0fQQxEzUc-Vsc2uAEqjGx-2slYf_rprU
Message-ID: <CAPybu_1uHmSxdkG1tC24Kw5fiOrzeJe-kAjv=JiZWZykd-xF8g@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, libcamera-devel@lists.libcamera.org, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 11:25=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Mauro,
>
> On Wed, May 07, 2025 at 10:28:55AM +0200, Mauro Carvalho Chehab wrote:
> > Em Tue, 25 Mar 2025 12:27:50 +0200 Laurent Pinchart escreveu:
> >
> > > Hello everybody,
> > >
> > > Another year, another libcamera workshop. After the previous editions=
 in
> > > Paris, Brussels and Vienna, we will organize the next workshop in Nic=
e
> > > on Friday the 16th of May. The event will be hosted by Embedded Recip=
es
> > > ([1]) as part of their workshops day ([2]).
> > >
> > > This year, our workshop will be colocated with the Pipewire workshop =
on
> > > the same day and at the same venue (but a different room), to facilit=
ate
> > > discussions about topics that span libcamera and Pipewire. The Linux
> > > Media Summit will also be organized in a nearby location on Tuesday t=
he
> > > 13th ([3]).
> > >
> > > If you would like to attend, please register your interest by replyin=
g
> > > to this e-mail, and indicate if you have any discussion topics you wo=
uld
> > > like to include in the schedule. We will draft and circulate an agend=
a
> > > in the next few weeks after receiving topic proposals. If registratio=
ns
> > > exceed our capacity, priority will be given based on topic submission=
s.
> >
> > Hi Laurent,
> >
> > I'm also interested on attending it.
>
> You're now on the attendees list. We will share logistics details at the
> beginning of next week.

If there is still room I would like to attend as well.

Regards!
>
> --
> Regards,
>
> Laurent Pinchart
>


--=20
Ricardo Ribalda

