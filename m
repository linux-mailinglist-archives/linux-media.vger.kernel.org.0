Return-Path: <linux-media+bounces-27029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4554A45CDB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 12:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 011A77A8CE8
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 11:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF27F214214;
	Wed, 26 Feb 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyIxPqKr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E1212B23;
	Wed, 26 Feb 2025 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568441; cv=none; b=AmTgfkusr2iOUVcQGaxa59MUCW2E9Lv4UhF/vSdozsl5NUP7UhALSr1YODEsCp/Qur3dB8yUeo+epqYTMH0ddkkaiY6HhI+5LpJGbEZ4dewHS7fVJhDSTDxJK173Ur+YdztQ9RNaw5jFvS9d88b/8QcL5UhiKYlj8fW6tIwndUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568441; c=relaxed/simple;
	bh=RpKzTHa4tswbO4d3DbnkomrITI+ofiXrfDIB2IasJ70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRcDdIEU8Tb2PoAWCLR2JOrW46vMNE7JaSjsRd+1A7AshNlMXbfLGEhMiK16awYIN7SfWBk95MeT0KrfjXCX3sROQL0JvcBO/ESF7YdXmSN1MEOVFKVfOv6lUZ0kq6wnVhnvSExnyVFNZcRfPj2KDrVqMc8YqLKmdI/bJE7ru4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyIxPqKr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso69368061fa.2;
        Wed, 26 Feb 2025 03:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740568438; x=1741173238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpKzTHa4tswbO4d3DbnkomrITI+ofiXrfDIB2IasJ70=;
        b=SyIxPqKrFcoP/iayTs9CkjoqoD7rhbz4uJ+EVNI/SI3kGly58FdrAIektCg93vXrAS
         cwU1H0YLGSQwUUiAyTbMsMwp1Zr/xZhSvzFtAMXQDYKlHMl8LdmxkAqW2w4tK1984+lz
         TWdO4b+B6lnI/s4mKRxfQ8IHXgYfjtEsnquX5n5GMBgOR7abHUsNHE7btx6nwOqa0fT+
         /OQ6RnpTU/4SSYor8wuvG8O+FodG2h2eH59k6AxPKH0GUeBYiFoUu5w8s5egeJF/XSwb
         iUvFZJM5aCljY+CNeWoYVWpVIoE9WqzxcfqteUG0KqPOp2s3UDMbpuDfwdaBv7sSzN7A
         T3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740568438; x=1741173238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpKzTHa4tswbO4d3DbnkomrITI+ofiXrfDIB2IasJ70=;
        b=sPQYX3nwpOHfuX/7TyR7HtKKbXPXhjcqVZnJ/zdk4dcv4olRxC3N3wlH1DXoLVoNl8
         jb3IJwpIIsZ27FANKFXZFzzRZpq3Neb2S8627eqR5lqFmLmUNWhsrEX+6hoJzpLGKsib
         oiJuLVmJqcKiuxb3UF7Z3WwJF4iiXnOJFjFabAao1GCbrW2VfmOVKdkJvy0rOqzA32kk
         v7RCVojX1bfB59eraNAky+7/5eb2bCkiHz637SGmRrXpFfHoKeL2Zu1a5mziXLFeCuPF
         x4LUN0YvAqNwkGug3nxG5T2NPM6BUrktDnhZ4cIFbBojSvDzexh+mojGGwL6VayCecJC
         u6zA==
X-Forwarded-Encrypted: i=1; AJvYcCUgmmZSrflVXQQeAEK0CjR40N03h/I96uY2d7R+Li8C8seWA5aMGrXqB+tG+6GovufeS5JmXQ4OTAVpZw==@vger.kernel.org, AJvYcCXjSrdNsCSLcfiP4e8TH2fClApkZXeZw8tRT+qns78wp552fiZAed0SCHJzAei6GQdlFwMBIoeJU23HmTYkuHBrm6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwNlusdrHYOo/wdlriVxI1M8dMDObeKIWMoSGPkEwTa9hEz9d
	CMNNr8Y6l+aW56chE8UkrGBLcb8Drzpnot3wzenjB/KKExSADuk74lqjtTaTEDcDqSz9B9ZrhNu
	/WeNqqu379qVTd0JD/3vMNwhyXG8=
X-Gm-Gg: ASbGncstx4gTYcLZdNWrRWHtLyXEusHSSjL6JrvEl6/MF64KMgCTdb0U1E0yta/OddY
	nOUCJ4Uk4cJZYLG1o24gJTOHAsxHsWI75SBbdqVGjnQzR7HD4BBJjv6+G9oovU+tR/980naV9c3
	cwYK62nR56maytun+YI0TPT21PuejNcQTwvMsLAwc=
X-Google-Smtp-Source: AGHT+IHoquT89WTWjdY53RvJImfQrLgkUNg7UeSxMQRUD06Zs3Gxehx/vFjJVyafkTbOV8D7bxqPg7JuMT30cAYdP20=
X-Received: by 2002:a2e:9014:0:b0:2ff:a7c1:8c55 with SMTP id
 38308e7fff4ca-30a59970313mr78666411fa.28.1740568437454; Wed, 26 Feb 2025
 03:13:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221230907.1230076-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250221230907.1230076-1-niklas.soderlund+renesas@ragnatech.se>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Feb 2025 08:13:46 -0300
X-Gm-Features: AQ5f1JpmvPq2uN0wKkWOOjaa1WxyxJihqU75yPR6KPaIJCNxaaIOauj0W5SuT0w
Message-ID: <CAOMZO5BWjDEBnEW=y_90iahfqQuh9WH7JL=dwEVgyysQkn6Fzg@mail.gmail.com>
Subject: Re: [PATCH] media: adv7180: Disable test-pattern control on adv7180
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 8:09=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> The register that enables selecting a test-pattern to be outputted in
> free-run mode (FREE_RUN_PAT_SEL[2:0]) is only available on adv7280 based
> devices, not the adv7180 based ones.
>
> Add a flag to mark devices that are capable of generating test-patterns,
> and those that are not. And only register the control on supported
> devices.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

