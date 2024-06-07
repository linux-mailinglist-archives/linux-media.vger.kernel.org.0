Return-Path: <linux-media+bounces-12719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E85900203
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6211F24CCD
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 11:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54DF191494;
	Fri,  7 Jun 2024 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gO4QdWJe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB32188CAC
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759245; cv=none; b=SDxEBCqvJ6UJhvMV9C6LCPTuCHXeJUU50UkQvwlh4pcB/z8YZRKNmqbYoC1xnDukTMJlFNkFZcWeGBVZHpFeI34PCRX+fXRhOzf540nisPbZZQB/3iM6NNGFfP/pCk9hR2lL5NTzk+k8l+8VD7Ve9Ylw+ggGY5pzKSzukKrjp+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759245; c=relaxed/simple;
	bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JihUCBt9C9kDg0VFiSUIKZP4xJGBuuUfd57JaL4Xi3u0VZ6FItCVAacXSMa6fCGZzysnDHxBoj7vLFZxnm1YOlgkDptajVGm6vaL2Z/fS3qi8v1tAg6MLRsDtkAc6XsuBXUlLcNG0PrOgKE/vfpOKjBj8GrVT21UilAVk8Cu8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gO4QdWJe; arc=none smtp.client-ip=209.85.222.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-80ac42098aaso545570241.0
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 04:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717759242; x=1718364042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=;
        b=gO4QdWJe9OScMiLwFoN6U/ht1Sb+0eDQW11z0jeB1DgT+vlwhFMcF9jFaUrNi27q6G
         c5tu/IdaEC4Bv60xhjkQsM1V33qUNM1PxCukt4y0E9TlN3moAETFp7QmI/3i1nUhEld5
         VKICjW3Nvjoll3cNypnqgxAXzaD8Ho1AeboE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759242; x=1718364042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXrg4sVxCUukDDGsNqD6ghGWEjqWMXR9QLDCnb60Xb8=;
        b=aU6KmOH/AJ5QVVyLzOtCkrm5I048w16ZWxGHXUIofnaLs5Cqk8jRVa86nTwETgzRmU
         gLpuiJyxAsKd2D6V7EUoqCVAzGoMyPF6JKTvCSg1lEuwSS9Og2XRAc5hc1tNPkWxqpSX
         //6/vGaor9RvvVrK/ummJ6lfpLMI0WkyZ4fGXIF2j8Bb5iwrpJZS0r7AMKzLei4CQk8D
         OfwC7agD1QDMaRfqtq1AzbrniiV6lbT+bx2FKnInYAj+bGPyP7DbGKKiwJietTUfZfUe
         PgESPoRowyC9MUshcpEn0HsEnAA1o3ondKYoDxOpFp3MSgMBEnAd0r5Kq+H4qHSP188m
         pTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0odzgrfNEBcLR8UmokPAEHh2NEV3iOpl2YNKkmUePR9tiUQPkMPzFMxGeQtTePAUpDP4NvFVFAuJBdxqeOUqBcmiml/pg8bLNMNE=
X-Gm-Message-State: AOJu0Yzv8DNi285SLQMxO3Rm6Ycfw++AQKXyCvgVU2+lVqgHnUr+Ldj1
	/UK2SVK9gEv1W3xt0oO3r1R6lMNKEAStJrFl2u4XWAplQGd85IAefMh3vqmlOu3HXl2Nz2zAVIx
	zRA==
X-Google-Smtp-Source: AGHT+IH5ObenBx0hfppUyrV8SY6X5pQ+EptjI0r+syA0YxDTCKNDFOjwI5OtqfKS+4ffANjj6ENXBA==
X-Received: by 2002:a05:6102:3019:b0:48a:2fd0:bd6d with SMTP id ada2fe7eead31-48c277ffbd1mr2202275137.32.1717759242309;
        Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-48c19ebcdacsm654615137.7.2024.06.07.04.20.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80b7c11aaf9so85967241.3
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2024 04:20:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0g1rWseaqPQOwXO/9op6DEb5CvGCZcNq99McIyOZzRhCoiPRCDjYPiQ09Vw01cWVkG8lz0V4aUfGgNRWLqA/SuV1d7C/DBieHFco=
X-Received: by 2002:a05:6102:34e2:b0:48c:379a:b362 with SMTP id
 ada2fe7eead31-48c379ab51dmr77117137.15.1717759241750; Fri, 07 Jun 2024
 04:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521095536.3869399-1-fshao@chromium.org> <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
In-Reply-To: <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 7 Jun 2024 19:20:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
Message-ID: <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 8:47=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le mardi 21 mai 2024 =C3=A0 17:54 +0800, Fei Shao a =C3=A9crit :
> > In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
> > transfer the data decoded by the lat decoder to the core decoder.
> >
> > In the beginning, 6MB and 30MB were allocated for the trans buffer to
> > handle FHD and higher-resolution contents respectively, but it turns ou=
t
> > that's more than enough in practice and there's room for improvement.
> >
> > The buffer sizes were reduced to 5MB / 8MB respectively and the decoder=
s
> > have been validated to work normally on the MediaTek Android products.
> > It's time to adopt that change in the upstream MediaTek vcodec driver.
> >
> > Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
> > optimize the memory usage per decoder instance and improve the overall
> > system performance.
>
> I don't disagree with the change, but it feels like this is has hack over=
 a
> hack. We have an entropy decoder (LAT) metadata buffer, which of course i=
s
> resolution dependent, for which we hardcore two sizes.
>
> Any chance Mediatek can document this blob, or at least document the prop=
er
> relation between the size and the resolution ? This way we could dynamica=
lly
> size the buffer for the chosen resolution and trust it to remain big enou=
gh for
> a long time. Removing the non scientific claim of "have been validated", =
which
> is producible for anyone hitting issue with that change in the future.
>
> Nicolas
>

Sorry for the delayed reply. I totally agree with your point, but last
time I was told these are what they are using internally so I guess
it's not there... or it could be me that didn't ask the right question
(we want to do this with finer granularity or dynamically).
If we don't get an answer here, I can also bring this up to MediaTek
next time and see if they can provide more details.

Regards,
Fei

