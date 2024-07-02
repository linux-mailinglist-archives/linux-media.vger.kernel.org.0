Return-Path: <linux-media+bounces-14507-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42191F08A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 138581F2277B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC1146D42;
	Tue,  2 Jul 2024 07:53:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8756B55C1A;
	Tue,  2 Jul 2024 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906795; cv=none; b=DQUHdeTta7t1xXPWzCWpYWZQYNgj4Qf8IVsRnscxjN0IbY7W+9DlFuL5s/+QgojTg/yagQuejM+D1XrlWkmqkdJ9etl7C3IC8cPMdUmlXb7OR5PxbLvBsp5KMgAZ3QLsvl8zI2EYMP1ButcabatdVixva1JKVsiSGkcm+yI3pvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906795; c=relaxed/simple;
	bh=s76MJ7N/0mKrLC6ijo+41YeA9FLk3fR4vpSV9jWttLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SedlpcgXTnNfOENleIDLO/LWG/SrVKlHmYMbE2MZnW34DLVdD07c3zD4bWw09kxCPow7Ksj5QLuUxcUkD5vRE1eJ27D269ZpSFHb7lr0nA2gBlnnLffZKfsQz8UVqa0bjoQfXOk5/FrN2LYI6oG9OfOuYidpKru9J7kL5pmPVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e02748b2402so4205042276.0;
        Tue, 02 Jul 2024 00:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719906792; x=1720511592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL8qWD4XHujF7ZC5E0G5SLK1JFPBMDF3gHCdBpC/TuQ=;
        b=rzMajTMYDUOoGIiEXhSLM0Ucx/8SRAJghgUkNXOjnNyrNcovpH1htcJTv2RvSnLP8g
         kk3Hpf+Id7viroj4cDhdbf232W49UlQUApI5CJ7bWnNrm1jbnjwu0L5+Pmem+HIDTtUz
         4N2CL2xRs2qqaPjGStWx4M8QpVutgFeR/z9YGodUQjtqzRR2g8vT3lXK/BxE2ClfVyPT
         Tmp68YR0Whnfiuk7Bb45ysJJ2PRjSYVwe406W2SYCYTkWUkWIRhhY+NAZnUAFwhdtpad
         bhxTzdGe3Fqb2PnZ1RZjTv9PYB+p9Qi8YTWf2zHgTMY1GjpcUbBzI7ZqVTc5xbnRMc4R
         Ouqg==
X-Forwarded-Encrypted: i=1; AJvYcCVV7faRtS8TdJfN2Qn7MzKRwkSuwf0NCCsfgC/wuONDIoEsnBsTDSelDHdRmtOtKdl0kt0CmoQs81Sg78N+odgcs7DsX7KUDUlsUqAPjXs2dX+RKuHFlaU+eugHCNoFxu6YUH/EVtWepXhUi1nBDxvQWlxnxWB+ZZMBUN+cxxmVkDXB6MzIvITsaMw=
X-Gm-Message-State: AOJu0YxW4qp8dY/H0kvkQTVuEmWffszpbLVsuYxJtQCeEPUqA8h33Df4
	BHBcHhJQFpf7QsHAt9uHfe1Ewjnh7wsmJNIExjl4P8YijjQ0sZ+WrJBa6rSv
X-Google-Smtp-Source: AGHT+IEzwDUcExtdQjOD++nsnmDVSNP9Q4cs2/eHPzod9MhSdAm9hhM9XwdX+qhJUayuSH7R6zWqPQ==
X-Received: by 2002:a25:16c3:0:b0:e02:6e8b:af7b with SMTP id 3f1490d57ef6-e036eb618c1mr8890754276.26.1719906791929;
        Tue, 02 Jul 2024 00:53:11 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0353f46219sm1552254276.52.2024.07.02.00.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:53:11 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6439f6cf79dso29642427b3.0;
        Tue, 02 Jul 2024 00:53:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUy+aCOtj5ilLfNt4oavKNV2G0gK9e8kiBKe9pLU017vvqUcynqVZSWLcLSkNgNTEvdSm6vZXp3o8liBKL/OvRLvoL2QrXtwfemGh+70vrlX3znjQa6v03vjEUJppg9MasDtEkTFl1I8Q8ghMdLbe0i4ABXjrtlBlpltQrkUUxtoS8I5hyjgWbL/pA=
X-Received: by 2002:a05:690c:710:b0:64b:3f2c:c73f with SMTP id
 00721157ae682-64c73ae7b62mr81775027b3.45.1719906791461; Tue, 02 Jul 2024
 00:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se> <20240624144108.1771189-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240624144108.1771189-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXoHe11PrE46OZriYSMcVDfgeNDkKSNEb5H3R9s+6r-A@mail.gmail.com>
Message-ID: <CAMuHMdXXoHe11PrE46OZriYSMcVDfgeNDkKSNEb5H3R9s+6r-A@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: renesas: r8a779g0: Add family fallback
 for VIN IP
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 4:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> To make it easier to support new Gen4 SoCs a family fallback compatible
> similar to what is used for Gen2 have been added to the VIN bindings.
> Add this fallback to the V4H DTSI.
>
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V4H for DTS checks if they are not
> added.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - New in v4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

