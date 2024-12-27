Return-Path: <linux-media+bounces-24136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1DC9FD4DC
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 14:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0849162233
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A821F37B3;
	Fri, 27 Dec 2024 13:22:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715441E48A;
	Fri, 27 Dec 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305768; cv=none; b=QlMzx2WidSghJRJsQZb6zLnaOpg2dYM4XmUZHKzhBODrpcIaYmUSf9EEKpSGyUDdLLBJKoCRCevcXhgGD0hbFV9VuEesBHyfMXELEOGiYlqfOI2MplaRNSSoj7wroQZDxwciFUcg+bkhhpBs+5Qb6BubtJVHrjKFg/hiWqTkgYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305768; c=relaxed/simple;
	bh=0rUau7uEXW0ctm2xunoSi+fIlF1IH5AxdsLRKkXwgvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2USPoHfWrNNjWILtv5e/maTXFVZA5kyxIq4e8R5X/76lb+t2ur1VO3KFKkOdAmkC9v4eqfQ07OkVS06aSZ/6BxT9LCmTJJ70CdP9tcYveeK02HtQvAOQ07iHwRAEGnG/sewCWysY/wNqCMI3KOsRwpWeYSLk8vJi1wwvX4Oz3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso4780759137.0;
        Fri, 27 Dec 2024 05:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305763; x=1735910563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k29z1oFZlm6g/eTmYkyLQzYwNemll6QpcWJk7cUJlw=;
        b=vQxu2LPHm0KwY1fWvR4sbHDvqWwizDvO9qPrcPaC6g9Y4gjA/eRv0gv7fnHjWRy27S
         VE8zeK/AGc6jVjDWdLvvGYw9KprYJsZdFDa1ep7hNKWETDph9Jo2k2IlbHKamQAl8cFS
         Ak4YRJVbSRHLoGdvYNShV/Y+n5KIS6ZaGHdBZZiQy5t3ck+yUdL2hob5M6ZLQtw2leLF
         EmcA1A6EATmwzbrtypYtNEKbtv8MsUoGLGhDrfhm9slXAfs7rCraTv7ViS9Jy15cSzaW
         4MasKxw64n3PPFBude5rUOpi/R4R5j24Wli2PZxdUfTWCLz7HKJoYO2augCmHS1AveAT
         LsyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/cBufKd0bM8OaeJpwrjtmrHv/RtSAyAS14imomGefllGxZVq3pIIPU2TF8SkQczy1iFcWxcZ32IU52Js=@vger.kernel.org, AJvYcCUEdQu3Z3yDcMhu9JLDfDP2rluAwV2Midbf4hqESfZGBj9MJUopD35Y7otRDm2GFBfBqG9kOaaf4/W/8eyiGkPgV8U=@vger.kernel.org, AJvYcCVtkMk4l8FrjB37iZc1BhP6WpW5N3rbBfD6TYgLJB7JvfH0/hs9HYymjWytPv9dTx04O157cLpRPIzd@vger.kernel.org
X-Gm-Message-State: AOJu0YzL3Ek8JKotzLsiuCfQuicWRjKEIvSgA9U1Esh+zT6nLt1bV5ri
	Z7uw+I2WSKov2Xh8cJFdpRm4OXGbMGJAaBSamLFUtaofxhJVjgjDPaaueitT
X-Gm-Gg: ASbGnctbWXK7rQcVByaSXJnskSihu2VCxrZZF4PEtl4JRCjsssC449G+n/zsXLf+bMt
	lNU80lpR+Cgucv79+SNhCek+OgLeS22yYIVc/qk0j1FjHIsJZIcmL64mKeqpbIl5axr7hqQ7jk9
	SkcceOm0uCHHJqV6VqJDxBXTMg5hDgN4mzKSeFgjHAShVblcKemiDWGs2HVswNLdsC+nDz5Xxvr
	A6tIeDizE5Z6RFmJKotx/PwzcvquCatEDl5os93GpS5UN6CQZ+J35jqkOT+QTy8ybvKhddBMeiE
	rI5MCy1GXNSTZnig43I=
X-Google-Smtp-Source: AGHT+IEThfLrMS/+bJYkjNgUK6oFGjXBCt746n5rqZP/KJzbamEqNBoEOPIlB/uhZABCEsr/E8xpHw==
X-Received: by 2002:a05:6102:3e83:b0:4b2:5d16:2902 with SMTP id ada2fe7eead31-4b2cc323e38mr20030968137.6.1735305763587;
        Fri, 27 Dec 2024 05:22:43 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d590sm2950441137.26.2024.12.27.05.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 05:22:43 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afed12283eso4644228137.1;
        Fri, 27 Dec 2024 05:22:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4y8DvNRvUIG0Z5lFtS7LiJA+3iQ/+chm6rcwEA7//p48Omv/VTPZyFixnjCXI+GU6geLGP8RZVDet@vger.kernel.org, AJvYcCWAXswBdnrZj7YKBjr+qPS/RJKzTncSTfWc1HJn+0zFutpF3HTtcce7Nz0+L5lCP2TemDa3Dg9nDjwJQ/8=@vger.kernel.org, AJvYcCWrgZIWujVRXhPtwXwiBJ8f3UHSVvRS+sxjCMcvrdMB9ZuaVTfj5JuuSDXILzqimND8Wz1DTNf44ZNPYg9+BCu8ack=@vger.kernel.org
X-Received: by 2002:a05:6102:fa5:b0:4b2:adfb:4f93 with SMTP id
 ada2fe7eead31-4b2cc4540cemr24662583137.17.1735305763202; Fri, 27 Dec 2024
 05:22:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se> <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 14:22:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>
Message-ID: <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define
 CSI-2 data line orders
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas, Sakari, Mauro,

On Thu, Nov 21, 2024 at 2:41=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The second CSI-2 C-PHY data-lane have a different line order (BCA) then
> the two other data-lanes (ABC) for both connected CSI-2 receivers,
> describe this in the device tree.
>
> This have worked in the past as the R-Car CSI-2 driver did not have

has

> documentation for the line order configuration and a magic value was
> written to the register for this specific setup. Now the registers
> involved are documented and the hardware description as well as the
> driver needs to be corrected.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> @@ -21,6 +21,9 @@ csi40_in: endpoint {
>                                 bus-type =3D <MEDIA_BUS_TYPE_CSI2_CPHY>;
>                                 clock-lanes =3D <0>;
>                                 data-lanes =3D <1 2 3>;
> +                               line-orders =3D <MEDIA_BUS_CSI2_CPHY_LINE=
_ORDER_ABC
> +                                              MEDIA_BUS_CSI2_CPHY_LINE_O=
RDER_BCA
> +                                              MEDIA_BUS_CSI2_CPHY_LINE_O=
RDER_ABC>;
>                                 remote-endpoint =3D <&max96712_out0>;
>                         };
>                 };
> @@ -41,6 +44,9 @@ csi41_in: endpoint {
>                                 bus-type =3D <MEDIA_BUS_TYPE_CSI2_CPHY>;
>                                 clock-lanes =3D <0>;
>                                 data-lanes =3D <1 2 3>;
> +                               line-orders =3D <MEDIA_BUS_CSI2_CPHY_LINE=
_ORDER_ABC
> +                                              MEDIA_BUS_CSI2_CPHY_LINE_O=
RDER_BCA
> +                                              MEDIA_BUS_CSI2_CPHY_LINE_O=
RDER_ABC>;
>                                 remote-endpoint =3D <&max96712_out1>;
>                         };
>                 };

Using the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions has a hard
dependency on commit 91a7088096a49eb4 ("media: dt-bindings: Add property
to describe CSI-2 C-PHY line orders") in media/master, hence I cannot
take this patch in renesas-devel until that dependency is resolved.

However, according to the cover letter, commit 573b4adddbd22baf ("media:
v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in media/master
causes a regression in the absence of the line-orders properties
(which I had missed before, unfortunately).
So I think it is best if this patch goes in through the media tree,
which already has the prerequisites and the regression:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Alternatively, I can:
  1. Cherry-pick commit 91a7088096a49eb4 first,
  2. Replace the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions by
     their numerical values.

Please let me know if you prefer option 1 or 2.
Thanks!

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

