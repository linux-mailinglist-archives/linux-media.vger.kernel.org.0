Return-Path: <linux-media+bounces-29072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A1AA76AF7
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6A3D188C66E
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079AD221F20;
	Mon, 31 Mar 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkNoj1h4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF49217654;
	Mon, 31 Mar 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434871; cv=none; b=smaXMOrQyMueOuQ3HbOjBQRPshbxqGjvUYBp4N0ztiLkwbYLQERgqjrRiCsghjW8H2PhDeXLQEoEHtIsZ8Gjm3hPK9HRtwxmWyaw5QWbeHcc/vyHE4p5SI1O3aGKUkxKryCC3eV8XdhLs020kcrlGsZ9lDN2V/UoyO2e46ak+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434871; c=relaxed/simple;
	bh=zcSxldy4tZU7YfrKElgKAUBlHkircEvdrhseClZd4cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFkwUAhR7yLosR6AwXUYxq3q9qBjGBZSa/ZALMRKOanZX74rrroJeP16OHgud3RIbaCws41LPbAYonpwD2NhXzEKy+hITt6Ci9U6/lOjJXk7R9IFPMw/mAoDW/46cWxv8Wr/yUXX7QNR9Nw8UMiSXNSWlBrAs4E+5gvdtha3uGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkNoj1h4; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5259327a93bso1980807e0c.2;
        Mon, 31 Mar 2025 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743434868; x=1744039668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJLE1nyFkXIStchbJmUYwAf5Y0djUvjW8TujtP3j8yU=;
        b=DkNoj1h4r+LJi38WrELGOy/eSInyRan3u+YN/ziVo43HVPsql033S2njcMogS7eGRV
         eH7RuL0C1xWF78AwNPeKg4LxInDkJMBx+MkXUoWePWj9Vms+4+pFTBnGh2EkRQVuv9Jn
         2HCqDK+MT9TiJw6/YwAaJeFOfH9Pm5zqvavqv/ITucQvW5MBi/H/0GfX6wTVgzJrJhRB
         Gqo2EK6T5SQlOmXSPZI/CpgeE/keDy0nP8MpYd4GT/r1LYbUoTd1kIf5eI0Nm703LYDv
         zuW/JYfSVzaW/3QXvt44/hKA8OpoPF/az2rlQ795yscWxrgOmIploVF5pUiaWrTeObjK
         vZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434868; x=1744039668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJLE1nyFkXIStchbJmUYwAf5Y0djUvjW8TujtP3j8yU=;
        b=owDlLDUs1I1pPw+Q+moF48vvQBiUAAvY7zkIuxINEi5TvnRwYYYYOLmLbSE1Dzgcof
         LUFxzWEXWR5paB++dO6LuEnH5cr14uYzBlv+rtL9SkjadOL72uXc1bl8bjs37hpn07my
         FLSydJvNJwo0z7ZreVX3xK4qy6pLYxaj353ENSjZ2BJ8p5gsHwNo9zDbkcXs9JX1FSm0
         0MHCa1MccvvrcwudgNSZXzCxvwqaWqAtxYkzEcBjjKDkcZtxWyP/H4ylhWDGJZ7lyTH2
         ym4SuKoabkZgXSkhRNNdSnjsmwa5+X/ScBKIcy9js/B3Aa7oCk3AYbWNCSgnYfzGvk5r
         4J1A==
X-Forwarded-Encrypted: i=1; AJvYcCU8622wKOTfX2zklgM2mDrHjT+XkCWRYwaq49z25sUUxjd2VbwvJeY1+NAKyNiPHcYDThgIqqw2skoDmYY=@vger.kernel.org, AJvYcCVL+g1IAGZS36swLHcyiJ8TfxV400fQnNZlbKgo0fzI4pGL3kyrxF9OsSME1etN4Bam6Hq2xq7p7QD4@vger.kernel.org, AJvYcCVj4t7PQ56bspUKbTI9LGoNdOhpk7FDJNlsOROOal0U+FFMN6VQrsYaL71HXznWxysn3yyqlmb0TJVXEif2/hlBPU8=@vger.kernel.org, AJvYcCVnRBkJpQUMfDgoRRwgAxKDi0jszoKQbf9ICk+aN1ptzERPy1hGHy+LI/snVMaL4P9Se7+3etCavP6D@vger.kernel.org, AJvYcCWgopVe+BbdGj/Q4GPIUZDQVGT4VovIodPP/lbqOVft+tQLJZEhqhZGIuFEt5m2YgIoIFy5HoVLGxBeCvmx@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNh0F2gGrq3AR9VfMQK90ksLV7RmPMcJe3Tt8TBGuzdf6Z5Kd
	sw8YrFxDszbWi/RIxW1PzOapIfL4eRirF2noeCQY4YwlYqP3PmSgshocgaHC0pT5qw/7sv/f6xb
	4FkicHb5m4qzcV9YR4E/1jMlaFTQ=
X-Gm-Gg: ASbGncvzUZQit1TnmPdiJtiewzmDa3PrT4YaSmZB+YCrm//0Kqbu2WlqLjDUb5agiM9
	URLWqUxLyzS9mpGzdcm79jswEp1tsVdxeLiGgAVDMLEa/YbZNFuMt5w6F78xg2v4BPf4M8nYjc0
	kWC3t+G8SmYJC/kaFqySlyzvAFBt/FNPCugPrEC3JMvdFCvcTWOBOx5XA2P3Y=
X-Google-Smtp-Source: AGHT+IHt9arRYtbTiWA3a1qC4COLXXXBtiSB4ldzFyRPQHHbGdLcelunUNrve5R2ts6bPGCsAQ1tFbamLH6ltA8kfs8=
X-Received: by 2002:a05:6122:2021:b0:516:230b:eec with SMTP id
 71dfb90a1353d-5261d3c9f51mr5111452e0c.5.1743434868285; Mon, 31 Mar 2025
 08:27:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
 <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8tVQaDBzLXVJUonmV6eW3i_KLTTjVm3L0Kf2A1xrMoUHQ@mail.gmail.com> <TYCPR01MB11332EB9F2552938B490E62F886AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332EB9F2552938B490E62F886AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 16:27:22 +0100
X-Gm-Features: AQ5f1JqriXw8-7MBvStm3Uj9LY3nQv7H2_O7UWqukRvxQWRVF12UvsymQ4KnIQs
Message-ID: <CA+V-a8uh-LUmLEs_85dXwuiYecJTyLt3zd06vyGE749Ye+9moQ@mail.gmail.com>
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

On Mon, Mar 31, 2025 at 4:04=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 31 March 2025 15:44
> > Subject: Re: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data s=
upport
> >
> > Hi Biju,
> >
> > On Mon, Mar 31, 2025 at 3:14=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 31 March 2025 14:59
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Andrzej Hajda
> > > > <andrzej.hajda@intel.com>; Neil Armstrong
> > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>;
> > > > laurent.pinchart <laurent.pinchart@ideasonboard.com>; Jonas Karlman
> > > > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; David
> > > > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Maarte=
n
> > > > Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; Rob
> > > > Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>=
;
> > > > Conor Dooley <conor+dt@kernel.org>; Mauro Carvalho Chehab
> > > > <mchehab@kernel.org>; Kieran Bingham
> > > > <kieran.bingham+renesas@ideasonboard.com>; Stephen Boyd
> > > > <sboyd@kernel.org>; Philipp Zabel <p.zabel@pengutronix.de>;
> > > > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > > linux-renesas- soc@vger.kernel.org; linux-media@vger.kernel.org;
> > > > linux-clk@vger.kernel.org; Fabrizio Castro
> > > > <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Subject: Re: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF
> > > > data support
> > > >
> > > > Hi Biju,
> > > >
> > > > Thank you for the review.
> > > >
> > > > On Mon, Mar 31, 2025 at 1:38=E2=80=AFPM Biju Das <biju.das.jz@bp.re=
nesas.com> wrote:
> > > > >
> > > > > Hi Prabhakar,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > Sent: 30 March 2025 22:07
> > > > > > Subject: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF
> > > > > > data support
> > > > > >
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > In preparation for adding support for the Renesas RZ/V2H(P) SoC=
,
> > > > > > this patch introduces a mechanism to pass SoC-specific
> > > > > > information via OF data in the DSI driver. This enables the
> > > > > > driver to adapt dynamically to various SoC-
> > > > specific requirements without hardcoding configurations.
> > > > > >
> > > > > > The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical
> > > > > > to the one on the RZ/G2L SoC. While the LINK registers are
> > > > > > shared between the two SoCs, the D-PHY registers differ. Also
> > > > > > the VCLK range differs on both these SoCs. To accommodate these
> > > > > > differences `struct rzg2l_mipi_dsi_hw_info`
> > > > is introduced and as now passed as OF data.
> > > > > >
> > > > > > These changes lay the groundwork for the upcoming RZ/V2H(P) SoC
> > > > > > support by allowing SoC-specific data to be passed through OF.
> > > > > >
> > > > <snip>
> > > > > > +
> > > > > >       ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node,=
 1, 0, 1, 4);
> > > > > >       if (ret < 0)
> > > > > >               return dev_err_probe(dsi->dev, ret, @@ -729,10
> > > > > > +750,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
> > > > > >       if (IS_ERR(dsi->vclk))
> > > > > >               return PTR_ERR(dsi->vclk);
> > > > > >
> > > > > > -     dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, =
"rst");
> > > > > > -     if (IS_ERR(dsi->rstc))
> > > > > > -             return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc)=
,
> > > > > > -                                  "failed to get rst\n");
> > > > > > +     if (dsi->info->has_dphy_rstc) {
> > > > > > +             dsi->rstc =3D
> > > > > > + devm_reset_control_get_exclusive(dsi->dev,
> > > > > > + "rst");
> > > > >
> > > > > Maybe use devm_reset_control_get_optional_exclusive by dropping h=
as_dphy_rstc.
> > > > >
> > > > As the dtbs_check doesn't enforce this,  `has_dphy_rstc` flag was
> > > > added. Recently the same was done for the CRU [0] based on the rece=
nt comment received.
> > > >
> > >
> > > RZ/V2H has "arst" and "prst". So, If you add "rst" for RZ/V2H then yo=
u should get dtbs warning,
> > right?
> > >
> > No we dont [0], note DT binding is written based on the recent feedback=
 received.
>
> That is strange. It is triggering warning for me, if I just update the ex=
ample.
>
Ahh right I missed that. The current implementation is based on this
comment received [0] (same being applied for reset). Please let me
know if you still want me to use
devm_reset_control_get_optional_exclusive() (and same for the clk).

[0] https://lore.kernel.org/lkml/20250223181955.GD8330@pendragon.ideasonboa=
rd.com/

Cheers,
Prabhakar

