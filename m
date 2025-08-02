Return-Path: <linux-media+bounces-38736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB3EB18B6D
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 10:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D6FD7AF6A0
	for <lists+linux-media@lfdr.de>; Sat,  2 Aug 2025 08:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8848C1FDE39;
	Sat,  2 Aug 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlxW2pNK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB68149DF0;
	Sat,  2 Aug 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754124389; cv=none; b=tSa+bcu0hr+ni2jqd2iNHVc6g3jRhQxWNtBZCfTbWxDuT+AbXqjIJkj4/Wuv96MsB++xhiAwdxV7QXW2mG62vwaCeICHQffcrt/EL0Hlc3D78Xx2dYaYeG5V3YXD5Bp8BaR9LULkdTBtRjiJ7zIlAWFRCnQc55xPPcYCI8WtNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754124389; c=relaxed/simple;
	bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MeWPuDSVWK+1ziwLwnqOVC/1gF406y0mpoJ6dIQTbZOfvpmEc13//uq3vGG9d4GMyum4iuWXNIG1nL29xVhfq/lp2OMMeF2pRhh373ZAOhl4c9sKf02seqUQVHw9B0Mf8gmzFI/3Oo54Hasjre3vvg6xcZKyQIJNAHFeY7p17IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlxW2pNK; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae35f36da9dso510644366b.0;
        Sat, 02 Aug 2025 01:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754124386; x=1754729186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
        b=TlxW2pNKxyQJl6fz8HfkBbrJfySaTWPwSf7u0sAH8TWR5dC8YUIf6uuyxQAJssssEG
         sneqKvJFsLO1DYI+dlY//Zyyjw9YneBn0wNfWV2czz42PrwQJNDbbx41y70oWDMgY19d
         v+PheB+TEXzIwQOoBmoezCPbUkz0nWuk0oBw9x+RqOK+PCrcfN/xn/RxZM23PT/9dcXs
         IJtxxuP0cqW5YN7GCi1xcrjW0u65NIL1yizq4Wi97U48CAWABpE2XBUPj1RRZEPIl3Vb
         5yk6VMFCvKy8P1IxFOaUhI69t8sy86P5Hp90LZlXjCw9MT/pvg0yeK+JNbq86hGc2tRI
         ULcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754124386; x=1754729186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/seSpZTBVa7pglaInZylODcwe9zQfbQrQVk2UFXQJc=;
        b=ew0E+dSszn0JG8srwmp9v1z5DJOpRntXnJ4ko3aDOQYFj5KlCYVRkt7jvHRNaMRHjy
         ZPkQwusmiYJX4biEKfzmc8odzdkxoVR5/oj36GPaKBt1NMewc5iU3kePOTPjxrrHWlp1
         Q5Bm1b8yofZHg3d/Xh/+mWAAvrJgqBPfALYesa0w151tfQV7AeF2nljHQC8AipKkotxd
         SOjUUZXhLLi+8j7mgQjVZW5mRVj6NwEUOPOH2TDGNva1kddAs+DwkzbYZisv4n5+JEe0
         y3QNcZucKl6wAeb/rlrvc10+JR2XHqsdxpnByPUXSK470m0VaLmOLk/9p7Ay8sZGC3lZ
         KMng==
X-Forwarded-Encrypted: i=1; AJvYcCUmQj/QKcOg0XudnJkZ0wMQYTsY/whmmRBLyOhNZxdiwQkph8MOQuuin046FvY46xm7f9B343cc1iFwiTw=@vger.kernel.org, AJvYcCVacURI4iOYrbU692luXJhsy1hHd4fpIccYPSU5gLMZpbvfrreHivLfNkrWf8YOIzYMQvW/zCVAjMkNa9No@vger.kernel.org, AJvYcCX7cuejKNgnKSyxWok4SL/UJIlDLpSOZzGeaCZ1JX89FTMMqaLgjYAQBA/5SP+ak2hCyqf00fZTWkKpMMxqln4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylitXMlnHul8ZTekdZG7HmBmFqys/HJKRCvzWvofMh4xCfqsla
	izx2I1l334074oyAXV+p/GFA/OsEDjDqCq+wZMi1byfUKP3NPKTb4LMGPsG4VyIxKng5DUHjJZ/
	0KFWa/HaVW20G9hImW23Ku823P26HRXFjIDH+pSc=
X-Gm-Gg: ASbGncu1aw6w2IYLgf3MeVX9x/eEpnin1HMx9glwlUDxnjKf4MKjEl5Edo/w2clQTld
	gDfD/sWcZ7dWkiOfQTV/YlPUVNlxw+m8EGH6Ux+8FqpLE05OsUaoJfWsHKZVIw5FUkXdJa52oKW
	k8Kyg0C9h68JT/ZTdj8Eg2eD3AFrmJcpK8MdA+cC+XxTWvPBNis0gBKP7i49UqgoEWHmxrovq7/
	U9ozLD8+k4HcRxopOge
X-Google-Smtp-Source: AGHT+IFu7ym4AUMZiJIN3syKPFo3cqCsRFpYw7GOJNxNkgh8WX2my/t+Xi67EUC0xDbQJXheV+tUvHXzsan6KbmLLn4=
X-Received: by 2002:a17:906:c102:b0:af2:54db:4dfb with SMTP id
 a640c23a62f3a-af9402098c3mr282037866b.40.1754124385470; Sat, 02 Aug 2025
 01:46:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com> <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
In-Reply-To: <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Aug 2025 10:45:49 +0200
X-Gm-Features: Ac12FXyFGX3atCqQQpsJizBgqfX9oK5Ez4o3ld-fUNoQAxHXhH_DqHe0kOWLi7U
Message-ID: <CAHp75VdfZwmRzGAeN7rLoab2oT8eKyUF1mUGj4d+y98jZS7EHA@mail.gmail.com>
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Colin Ian King <colin.i.king@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 9:32=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
> On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> > On Fri, Aug 1, 2025 at 6:01=E2=80=AFPM Colin Ian King <colin.i.king@gma=
il.com> wrote:
> > >
> > > There are incorrect %u format specifiers being used to for signed int=
egers,
> > > fix this by using %d instead.
> >
> > Both of them sound to me like the fix of the symptom and not the
> > cause. Can we simply make types of the iterators to be unsigned
> > instead?
>
> Making iterator unsigned by default only increases the rate of bugs.

How? Please, make sure this is relevant to this case.

> (Although, my stats might be biased because I'm only looking at bugs I
> can detect through static analysis).

In general making a variable to be signed that is never negative at
bare minimum is illogical.

P.S.
FWIW, it is a common approach in the media subsystem to require
iterators to be unsigned when they are truly unsigned.

--=20
With Best Regards,
Andy Shevchenko

