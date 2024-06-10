Return-Path: <linux-media+bounces-12856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B7902159
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 14:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E1AFB23443
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB7C7F466;
	Mon, 10 Jun 2024 12:14:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02D4AEC8;
	Mon, 10 Jun 2024 12:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718021674; cv=none; b=oFUWsU3PY5XFSfXqFReVDw4bxH15E/6XRDqIBApxIFlWgXrxJIpv2m5Gv51Ru6I3Lfa8JjjGtZohfehTi0fgin1Vn4vAc829+zo6kyjxqf0koDMOSdt5Gxny3sRhZ8yxXmnf7zfXaFZiivWc8zKBGf4bTSJqgFb5mgYTpcQru7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718021674; c=relaxed/simple;
	bh=tSD/spwG0jlfg5BNTrfBgNtnqVVQfXYcZXTvLSD3ctc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W39DYci1GXLkw95ivQz8ypbcMQL4XIExC0Bg7GXb1aj42hlYpCqYvZQVHTsPz3I9HdqqmQ4dfe6UNZdYSyPms45nuTROKOfViEin8FETOJFcbxXkHBhwhUi5Rjm09f/FX5mOyWo/qJ+nVW90O1XC261P7bmF2vKgO32ojbprRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a080a171dso44182737b3.0;
        Mon, 10 Jun 2024 05:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718021672; x=1718626472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHN5PNSfpyJJMvIa1bV6iDaPxyd3BjfSogHZhJiBWEk=;
        b=ck6OqPMukpBWSWK43K8dz4Z0kI4aXNByw4UC4CHyRDcrMcuhR4efizpY9C2tlWvd7P
         8KZ7b/lABd/XSxhu2yacXWUv3ZG9QxRYZUTsuge8jfJBgxOw6IR++cEt/Rq0hNaMenk9
         Ok+JvauTo8lAxWcIaySEX14l6e44Nbdcg1MsZbJ9aUbCbEVs9Un0eDyjI0M18Zq74dIy
         UrLMWb02NHPoLbrhafD10q0DcvWDpdUwL6sU5GZg7+dbMbCWtgYsxNEwjRWxDeWYlJ3j
         LwQT06DJv1W1tkHJDBTfzdT/QWcF1LemXrDgrloUCayBMkpqwZk+c/so40DE+F64ABuh
         pu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqsLOw/mJkCwZp6L1gerbt+CB7YZiH6NzIMn2CKtF+UgLD1YWx8r22f+IP9ferW6Ms7Hoee2v2GOFDV3InusyW/1nN2M7NkENQ1/FBuIvyHR4u1/KWQyXT9VPaYIbvH9IKD1ttd5icNavtGSSllqnNFD82oWQaON2MINUArFpTWpwQQkBmq+hChGE=
X-Gm-Message-State: AOJu0Yw8nlsj1mSUDaq0DWiu5z2r+g5EIf1QjXlDHbQ7wFfEUgF+IRs6
	WUGb8xQEyIooz8nv0TO1UjQKd0/Q6BHIb423v3en04v3xZn0UAGKgDH9PPTw
X-Google-Smtp-Source: AGHT+IHvS5l89CXOreedNxW7h0jInGjTe8YMGJp1kmIeF7iohejDwc4vfqSdBfapodUl36KAHthkMA==
X-Received: by 2002:a81:a7c4:0:b0:62a:530:472f with SMTP id 00721157ae682-62cd568e9b9mr92371547b3.32.1718021671572;
        Mon, 10 Jun 2024 05:14:31 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62d0889cc81sm4400717b3.70.2024.06.10.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 05:14:31 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dfaff6bee06so2299395276.1;
        Mon, 10 Jun 2024 05:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4b1/ooVzzrH9xpDvG2TrMT6kxFYgs5i1oA4D1KNMAkhTw73a/l4OV0rvaUhp9DDuwGIByxYZogc1AgQl+YKFnQ3trgLo4OCLazyFnxPNvS+Ue0P/rODtcVX/f/mG+msc4Seg9Ispmlv1vc2aJ4xcmWgYEoF+6uNApAxpDbBz/k+FN8aPXF6o4Z2Q=
X-Received: by 2002:a25:255:0:b0:dfb:538:6a49 with SMTP id 3f1490d57ef6-dfb05386d33mr7559585276.5.1718021671217;
 Mon, 10 Jun 2024 05:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se> <20240610113124.2396688-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240610113124.2396688-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jun 2024 14:14:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJqY=CRdhSe68tgE6xFAko-bEemwZBqJuXyX+9iP9eZA@mail.gmail.com>
Message-ID: <CAMuHMdUJqY=CRdhSe68tgE6xFAko-bEemwZBqJuXyX+9iP9eZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rcar-vin: Add support for R-Car V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jun 10, 2024 at 1:32=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for R-Car V4M. The V4M is similar to V4H and uses the ISP
> Channel Selector as its only possible video input source. Reuse and
> rename the info structure from V4H to cover all current Gen4 SoCs.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Create a shared Gen4 info strucutre.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1283,7 +1283,7 @@ static const struct rvin_info rcar_info_r8a779a0 =
=3D {
>         .max_height =3D 4096,
>  };
>
> -static const struct rvin_info rcar_info_r8a779g0 =3D {
> +static const struct rvin_info rcar_info_gen4 =3D {
>         .model =3D RCAR_GEN3,
>         .use_mc =3D true,
>         .use_isp =3D true,

FTR, rcar_info_gen4 is (still) identical to rcar_info_r8a779a0.

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

