Return-Path: <linux-media+bounces-29057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C250A7673B
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0833018865DF
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 13:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC02213244;
	Mon, 31 Mar 2025 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcmBW1tJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B76211A3C;
	Mon, 31 Mar 2025 13:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429554; cv=none; b=gafJNywYIPNvrR0P/b4Q6/hybggULWL7GlnwTCXTxN4pxtdyflmUsyi8QgbMZuQeMVwsibnSits+a53qvFkY4skVzkmjGBHbR26OLotCVK6inPQpZp4FWllZUjQFkxWLHlOmNHvmpQf0qsPWjEhSqJt9PMQY6T5Zx9k13RjHpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429554; c=relaxed/simple;
	bh=MIqhvXp8WBemNHMJVHGEFEWnP75tcOPHwOSzbrpeq1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4BsV1KphoQmc6SQpCw+YdIlcisXmLnQJfgKQ+t41Eybbn8GLVm7uDYYVUPhk1v9uZdplxXk3VNo4kcY8gY7jDbTIO51iQuM4anngURbOjhX8Iz5Q4KmapZ98ClS0sIay3wyd1FEv95defW73c5HXIhBY42YVXOaMoELgZu2RAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcmBW1tJ; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1848224e0c.2;
        Mon, 31 Mar 2025 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429552; x=1744034352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ6luDwotyYfo3kU9jPDlx/S5Xe1wNYednwyw4Of/y4=;
        b=bcmBW1tJJa5AZXfW6k+gFCrFTY8EuBoY0v7W8OvS/uG1YDiaxQ6eTB9BPLHaobpG+X
         bKd5SY230Rl96fOODJ6Jm99pGr+jvYwSAb5Avi3l5P4PBW+XbDSUx96hgVEAtlqrhdoD
         RMJ43NErqXBHS36V3n+AI0icrR/acdNK6uZjfZNb5co6Zxxln+RKmdYlPIzrkINZdlGH
         5Ou85/InouoSU5gTJngFN2c2SYUNeofV0Bcy1mOi91jo1eC7sAvbLGeKkBy780bxORuW
         goyQ22xwH/vN6xtm1mQPXQjcn+NLNoYc2YADTgqTsG0pact9epcmNCBeu8g3GzwPijPI
         STvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429552; x=1744034352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ6luDwotyYfo3kU9jPDlx/S5Xe1wNYednwyw4Of/y4=;
        b=S2w4dm09BA9omrOc8AC6csbqQcb4unZIEgN7nqSGuswEesKR3Ls1oPmjKOiRIPoeUz
         kj0BUtZ3D+Kdzwxl8hsp4dvhLmuX3SyXz4l0aMQ1C0QMCY5EALENRj/LWHZf3hC0JwTS
         YsVueiVLRXon+DR8EFRXTOlgY4EYqrn6np+zI7yUTmJfe2TnRPQx5ENDGuveZBtraNGf
         2qg9E/8gzhAtncgURa5yRVy26tOGTZXXbIl+kScSxfqvCscH+mhY+E9VgBHLONVZSsB+
         oh/Fdb3xAozB6tiBb4olPkgoDRgbkALwhr0Q+lCE/iqOIsi8hMaBAaiy49QpBMJwm3vi
         xysA==
X-Forwarded-Encrypted: i=1; AJvYcCUICM7vSBccz/gsNQ6AKVPFT4mb9onVrGDcGiVavcLGff5C+/VmzAPvHyA+WuKPJvD3Sij7kfuNashIPd8=@vger.kernel.org, AJvYcCVSGHiM+oDVQs0UW786N5YC4+IZCbPOQUiG3dwP7f29stSedIOSKVYGHv0LppX4Kxs/PkZjx4KhJStq@vger.kernel.org, AJvYcCVTQOl8F+qnD8GI2nyAmsVG/TFkfWN4v9nM+8RPHVEQjpvs3e5eu4YbSvpnoXuHsNMPKUScDQMKgYJikvbr@vger.kernel.org, AJvYcCW47bMW7bthCDzk6jQXVUTqDVwlN22JUuHipzgVx6oSqlyRPJaj+cJ9pUhGtcwonTI9tqfFU1b1jmlI@vger.kernel.org, AJvYcCX11Eu0Fw1Wd6m5c/ZvYEFMHc5jOECZcWQkn4zsqtA26NBDbx86Td0RKg1GhGZCYGcHAquSCztXJm97YbOwdIY+f4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IZlGjiME5mOlXi3XUSGDb2q0Irv8b/WLR7cILRAVDMpP/U2D
	Bl2QedsjHCTslnNUrbmKNqHMSewo8KnmOCKfMiYANc6ZgwNJmOCPPwahIcgOmWQ50P5BmRn1vAq
	d8Rf23l1uWFrmp+6FHI+HDErjehw=
X-Gm-Gg: ASbGncv99ANX5ciBFbCI5M8A6mO38j400aNQBePOOT4VXczaTxmAjhN6/cNfvQLvFjG
	vT9sH+bL+rlZ4W5ZnIUq0VtpaqCLQvQZsxPri9Ko6hoVWuPgN1gJC/xbOpBGeHWleXcQULdK09C
	nZQ9cY89iUH//Q3sw9mr4OU/vL6Ez0TzEv1mzAkcMw2k2qmCGUQHEynN4Gqbg=
X-Google-Smtp-Source: AGHT+IH59r7nYpgJqARq5/wRAz+E8Nw+DigL2d0icCNSxu3ah+ivplUwdQEz1tpyBsv376wnQEYXz8gTxipo+KxFz9c=
X-Received: by 2002:ac5:c5cc:0:b0:526:1ddd:8953 with SMTP id
 71dfb90a1353d-5261ddd899cmr3242361e0c.0.1743429551689; Mon, 31 Mar 2025
 06:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 14:58:45 +0100
X-Gm-Features: AQ5f1JoxVlVsRyhVzBsX-4t-Gwb33Vc72UiPSFj6heP-a0WBV-318MF2ERV85w4
Message-ID: <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
Subject: Re: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Mon, Mar 31, 2025 at 1:38=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 March 2025 22:07
> > Subject: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data suppo=
rt
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In preparation for adding support for the Renesas RZ/V2H(P) SoC, this p=
atch introduces a mechanism to
> > pass SoC-specific information via OF data in the DSI driver. This enabl=
es the driver to adapt
> > dynamically to various SoC-specific requirements without hardcoding con=
figurations.
> >
> > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the =
one on the RZ/G2L SoC. While
> > the LINK registers are shared between the two SoCs, the D-PHY registers=
 differ. Also the VCLK range
> > differs on both these SoCs. To accommodate these differences `struct rz=
g2l_mipi_dsi_hw_info` is
> > introduced and as now passed as OF data.
> >
> > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support=
 by allowing SoC-specific data
> > to be passed through OF.
> >
<snip>
> > +
> >       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1=
, 4);
> >       if (ret < 0)
> >               return dev_err_probe(dsi->dev, ret,
> > @@ -729,10 +750,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_d=
evice *pdev)
> >       if (IS_ERR(dsi->vclk))
> >               return PTR_ERR(dsi->vclk);
> >
> > -     dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> > -     if (IS_ERR(dsi->rstc))
> > -             return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> > -                                  "failed to get rst\n");
> > +     if (dsi->info->has_dphy_rstc) {
> > +             dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, =
"rst");
>
> Maybe use devm_reset_control_get_optional_exclusive by dropping has_dphy_=
rstc.
>
As the dtbs_check doesn't enforce this,  `has_dphy_rstc` flag was
added. Recently the same was done for the CRU [0] based on the recent
comment received.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2025032817=
3032.423322-10-tommaso.merciai.xr@bp.renesas.com/

Cheers,
Prabhakar

