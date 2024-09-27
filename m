Return-Path: <linux-media+bounces-18690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB89882BC
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9619B1C2119D
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912D0189B88;
	Fri, 27 Sep 2024 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFNzDfHT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D613698F;
	Fri, 27 Sep 2024 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433852; cv=none; b=BNp5LnsCfeUOFCA3ILr1QUuVP40zXMHzbXFS+M+nWjzfsrvEmUB4qi6Q/wrGFBjeKwjG03qRBFW4LIhzLKsQBw722w0/+5aptpH5OrM/32NlmeMidawKvUnAHRq2TOgU7kaFhkCaF2oxjAWCMvrok4nIVusKIyddFAyogAWKXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433852; c=relaxed/simple;
	bh=fz4ehh1bQZ2voJetS6zPYXn8bzrKSGjb88ZmDK5++9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=se7Tm24EirUZvrAsLm6zv5oiomuxCyhPXaAFB21Z9ya2PaEeMR238j872BSIMn9hv6cGxhaPr59nLZ7HDl4B/GZZSRM26WGyKw3aqAF0cR+EAIATbPzMiC4Pr1ehaJzjaYKpX2pc2VMi3eSukUN8k1gJNw20UQFM1EYgvF2O+9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFNzDfHT; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75c6ed397so22146551fa.2;
        Fri, 27 Sep 2024 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727433849; x=1728038649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty2QooaMm3MgyPtlbZ33W8k1ZyXnxkvNjudQ7UqFkNM=;
        b=CFNzDfHTyIcsJ+8SsO+i00yAtPj5w/p/lOXirVJgBpgsfK3uPVxnTd57C9lxjRBdKg
         a14usdxH4D561EdO0cjMA+KMQYJ2pLf7UkC4Of5C7Zbme1uxkYQlpvznz6FPi5V4jwMN
         VFACsvUaiSrzTrf/QbjaFtMj6X4lZl2Qy5o7+Ljd37bN9wmSHarcT2jLEnxGZlDJpFuu
         H2A4jHTmVTJ4m8GyVHJ5DlXpOlG3r0RlxLIv7Ibkah/6V7ZgrgTCRhPD2h3fSBdRruxY
         U97yvsJcbOBHwSFw/aGejkYUTjJDMoHOufzDNGv2gL9zN3iYFWzPAA50EGTkmrazm4no
         QPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433849; x=1728038649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ty2QooaMm3MgyPtlbZ33W8k1ZyXnxkvNjudQ7UqFkNM=;
        b=w9EtN0hPJiIBeLKMrYGDN89LuDa7bgwigG3yJ013Ld9VvUfmv29EXew8KTQWdxNp6e
         tz+GVOUiBMgc9HPH3eMeSPP8CnfR1ZyaaiMMgJobPrVQ5fKyUTDNt3OP0lPvKdsFFGD9
         izBT/et3eaQKOyZYQm39OdiEjTvOp+3pOIBnUf/1p1kdmcvpaFNdXDscyDaUvPMDfHEj
         4Bwj7J1bkJZwCL/9r8EIsnLuA+qzaAbfKVf1yFvlye5WWZal/E6lgBFNX+bGi7CjJ9ve
         UfyqtLngHKvVMIVG7X+bXBAN7DbXzjy17fDZnOeSXZRfYW01pD1mX4ema1qDlvo8AgA1
         FCJw==
X-Forwarded-Encrypted: i=1; AJvYcCXaDVp//JCVKtQZvPCtx9ZMZdOFrJmJIaF/T4P9wTZbkPUJ8OAsnE50kklJUNLMjCUpqXOgy6odS9X/0Qs=@vger.kernel.org, AJvYcCXqssBcDaqTLG4bimSpci9gWsfbSmskbXl67gJKwqvOxNzizsTpo0AxwvQz8xZ4yMWGk35blNlgvs11fsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7xFo4LEG1amt8NdOnhhjHMy+CR/7h96m2fbtAgOnuavv6FIYe
	arOyEqGoI/8XMyFaVz9pTFbnnDxK8le6UdbQaa0fkL2YvmdZL5reu+yKWBGLeoPEPhWpamKBs9i
	RVQb6+5m3/Oks6abO1Sn4HSfqgY4=
X-Google-Smtp-Source: AGHT+IFVnUKDhHiI5ExDkrPLHRaGwU3uwx4kd6LA7qpPwEJIJZck9E7xMesSOCKsp0IAit02EvrDjtJRWN14zBw0Y9o=
X-Received: by 2002:a05:651c:b12:b0:2f7:500c:2212 with SMTP id
 38308e7fff4ca-2f9d3e47a58mr18319481fa.10.1727433848583; Fri, 27 Sep 2024
 03:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org>
 <20240927-cocci-6-12-v2-1-1c6ad931959b@chromium.org> <CAHp75VeGAzU1BT5bE0BrVj4MR=TR2KEzjwhoFUnN5Q=fUanJZg@mail.gmail.com>
 <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
In-Reply-To: <CANiDSCvF4g7H77Tuy=YUfCG5xYxcb8R8oTsvCjSt65zPAsepog@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Sep 2024 13:43:31 +0300
Message-ID: <CAHp75Vcqpn3Jtwo6V27rHvC9=a50-kwFqMx+axySxsCpYagJaw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: ti: cal: Use str_up_down()
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:16=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
> On Fri, 27 Sept 2024 at 12:10, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Sep 27, 2024 at 1:02=E2=80=AFPM Ricardo Ribalda <ribalda@chromi=
um.org> wrote:

...

> > >         if (i =3D=3D 10)
> > >                 phy_err(phy, "Failed to power %s complexio\n",
> > > -                       enable ? "up" : "down");
> > > +                       str_up_down(enable);
> >
> > You never tested this, do not bother to send untested material, please!
>
> Do you mean tested in real hardware or compile test it?

Obviously both as one can't be done without the other.

--=20
With Best Regards,
Andy Shevchenko

