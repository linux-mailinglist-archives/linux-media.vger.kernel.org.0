Return-Path: <linux-media+bounces-31460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39EAA4D01
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 15:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE4E81BA3C4C
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D44C24DFF3;
	Wed, 30 Apr 2025 13:03:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629F259C9D;
	Wed, 30 Apr 2025 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018209; cv=none; b=quLkdaZMRupNPQhzTS0qbMx1hNUCqxMPwtQvJ3mk1YTy8mb2nXAqPmArwAlrIKAsN63YymryfIxwWICxlYXSoT2wevUavHyU7o0prwEjEZBwwYfvuu4fm27qINtMibfaxrugVElIeXDwx+Kv4Ff/Ety0oTbXFhAV8pxqfI/KdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018209; c=relaxed/simple;
	bh=iFixx+t4HjD7fQ89CBPw8tcEnpXOvIN8tzy2ETRCd7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3xj/BNrE8I4Qyl77Ne2lUZwLevPf2YumQOy9iHr5qkwYIAkJbSPB5I2F3+hX8X/YMJdDdDYXhYGVjwcPg0fw5fxHLtMl61zEAZS8XRKPFw94QOEXDwiOYO7mqjLpSSbMmG0PSPd27LgUFbCDzVEFiNv3IiyslnxRRLDWkf1eHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so12934286d6.1;
        Wed, 30 Apr 2025 06:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018204; x=1746623004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rW1MhyT91saKVAFuqB6OQab7qD4mL9UWcfPujvEtR98=;
        b=QyjVf7QlNTNnAOV087cp8g9svTh1ZnJD+uClmVimbTPi+AStuDUQGtgF4LuYKklLKK
         oeVfI7yk67poEoF0vQfnIP6YG2TXI/j+Kw2rVAcYKn6PnwvPVi64efQmHshwo+Q0Whlh
         USfmwi1KxDAHJGj9BNZxELi9TKG4fw+QOw5v/8MgezUPkhyivS6VHGsN+c+uPKEnkfWe
         0yrFo0WZyhYxgw9vR8/NOnUu0R8AjzuhONCXfSMs2R2Ck3Aw6pfefwjMECHbpT6UG2kC
         a17oWQM7tHRiIKJzy8Ppjn1BqcMtpqiYjvt/HZVWqPC3Gwof0tlBDg4Dym7YXP1czrMy
         PxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUAmKshSfqgrf0PVHb7Fkd6d5k2YWjxN/nixVwy3X+7dA3iz3eOTmvOdKD6jhZYoqPW/jGWItWs8wi3sKU=@vger.kernel.org, AJvYcCV6x6V0UJqm//iI8caBFTH9yDGXjPNBsoHJ0tgH9LSJN3qyRBozpy1CGQbokClC0ZwJqSgt3oUZ9muv@vger.kernel.org, AJvYcCXgWPIfTgaisnjpd61UT94ROT9puj1adpJN1MrViVXOoOZEOW5u7GvvQBc0cr0Jv+QtnJOuNfHlavhAfpKhgOXzq/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdeBN899V6pEn1WLChtjbE+6gmHDfMMKtDDBil8j/UuVB6rZgf
	1M2SdpJhTyeqrgYV6xM4vBy6RHBaujZpNW4sfW7AWE0LzPJzF1emTxPC9elS
X-Gm-Gg: ASbGnctF+tPm0tlmcb4vZoNRP1JzFyH17/pm/HY5RVUNRfNwDC4ot1XY7bcHTZtObuW
	UTSmAD9AVw0lcMVVpFF6eNYliHx7Wh7IjUbMYOs3ddwz3FIm5HTLEDK8LHyHhRWYQDxgYSaJJH6
	Jt0bpwoRlf6B7HBPKYc3iInbSh3bw7rLHNaJuVyKSaKLWmMC+uu4ReamIQgAcs6OUpxRsNlOS+g
	SQlCph5+PPltOSMltvV+N6z+oWvBAtEWh2VyuqfBXKoYp0XbLFJ9XGmgUN6h/S9CMVRlHCDg1mg
	vLsTHgvqaTXsqxqF7utBtBbld6aSsSzQQCSPm+vg/NnMTG1hwxOB10qVrFfax0lT8HywRmq3raw
	zfW6ybqs=
X-Google-Smtp-Source: AGHT+IEsCRz6fQ8DZvemdv9TJXlflJAxZR4Q++cXXVHa8V9fHyeQ0pIdrC2a4BojyzqD24OeFz+bGA==
X-Received: by 2002:a05:6214:f08:b0:6ea:d503:6cfd with SMTP id 6a1803df08f44-6f4fdd831b0mr46409886d6.19.1746018203756;
        Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe6ad681sm7941076d6.1.2025.04.30.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c922734cc2so113479185a.1;
        Wed, 30 Apr 2025 06:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7NepP1HnOBdICYvBCKuSDAFHSYYWaP+q7LeSxoe/G+V8wRjCjpeFWWq1eudNlj5fxqHptENeciUwL@vger.kernel.org, AJvYcCVtPmey4NGXY60YXaQdC05gfJXDZ4vXIBteiJBPfRn+LQ97a91V9cZADJnR8xgiQDtIbBUQIczbfdIg0+HdRnvnn+Q=@vger.kernel.org, AJvYcCVvIsR/s0OQNin5nIA9tFOCqJ02dm+RxpS0p2br4k1feH3MYq1g2V8mTYMlWbSs0aK8ONHy1XbXhJnTZas=@vger.kernel.org
X-Received: by 2002:a05:620a:2890:b0:7c9:574d:a344 with SMTP id
 af79cd13be357-7cac7b5c591mr351112885a.25.1746018203056; Wed, 30 Apr 2025
 06:03:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Apr 2025 15:03:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
X-Gm-Features: ATxdqUF5SmUHR6IS83F_BlSTuqKqxW8yJEwc4_Me4L0hReYlvlJOP5xqk2h4aew
Message-ID: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, 30 Apr 2025 at 14:58, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
>
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes =3D <1 2 3 4>;
> -                    link-frequencies =3D /bits/ 64 <445500000>;
> +                    link-frequencies =3D /bits/ 64 <222750000 148500000>=
;
>                      remote-endpoint =3D <&csiphy0_ep>;
>                  };
>              };

I guess the link-frequencies property should gain a rule that it
needs two values, too?

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

