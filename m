Return-Path: <linux-media+bounces-29058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60676A76744
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 16:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDFE188B355
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF842135BB;
	Mon, 31 Mar 2025 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRSPXdRx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301251BDCF;
	Mon, 31 Mar 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429676; cv=none; b=EvgWNsi93p5Fv74H266TpXguSyrPHuVTSzW8CXbyVJxNU6GnQqv1uMWeffm9ALGQHvdClyGf4e4NoAlaiQW0bwS2PGCYoWU5lKXutV1KnMpsk770jA6gFOmsPpEjIOV6ZPmI+2XGw92eUHSSnlu8SzliDnoDDofCL47t7iwiejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429676; c=relaxed/simple;
	bh=czkGsZLdHxfBOeuovwxyjIgd6M1qTJyYazfrkVpMj4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXOIeXuPHCqxfYn2pE+p4z5MTvxwMzyeb4QXNvhkAb9ahOZV/aOFWy4i8sqZ4POUaHxnKLNAAkw2MsScj5OqozKNSt+iitQMGmA0ngMEHEcVNgOyPD8jEh+6l0j0ltGKcdPiA2TLV0EcQycMNIkPMtUPZeE+iGR5vU7utrjGagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRSPXdRx; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47686580529so46416951cf.2;
        Mon, 31 Mar 2025 07:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429673; x=1744034473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cerp9RlMWGuZOXebiJLr88zSJ3nZkbJw4WxH3PYMHbw=;
        b=mRSPXdRxwXfh13ISPP2Lv2hUgLIdz2F5v4EpfRsjtLSR2x6hTczWoV+pBravm9RCjZ
         PRWrWWoc50++kgNd5dImFEzF9gt/lIkq+2TahRJ1/Lo/ZW4l6dLKpFp3ME36kXE2FLAw
         wR0//IdtGKXj74sICCug+/+mVMSEfXAO8auGJNLM2RxlHQy+K+fOA/dCMonWjSgL6MNp
         04mFlhld+9I41iQ7Ry06locN2U2/A7yV3Kv/9pBYyUQkciQHoJl+BsaaslRrXP1wFa6k
         JVReasP50HM8SBsmYTNUcpvuNGBLQ/V+iO5flrAs/JUqrnyUoVmJKs25z/LXmPSEEQHE
         GFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429673; x=1744034473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cerp9RlMWGuZOXebiJLr88zSJ3nZkbJw4WxH3PYMHbw=;
        b=tjSiLn60NPKQtfMMYiuop7JC7wqOMtRP4Ax3iNHYcxtJgJ08t/fQEtHr75vYygg8ax
         04A/KVdoWn+PxJMzIqCiennHNPYzcshYWVgZHZHhcp5ITEA4l+NxqlOdGuCFXv5LYudI
         eZx22Pl6Hokl7V8TirzedrwRf1/q8Jug8WS2YY6ujAwMsIhkpqenCpDV9aFiijcvdbU3
         fmyTmDfaBYr7N3XcnObA7YVj+MkMPtFaA8lbJ3hraZ5v/qEE7cXlsBCxiHWzQHT/bdgk
         gqfSFkFVrJDPRsh9uy8jIdB5jqu4ULg/wtIfa4VXiq+gBnDlAfZB2041Ro1TWq9NNDBO
         4nsg==
X-Forwarded-Encrypted: i=1; AJvYcCUKglMFrOAGTVFTnoFipRyCFqpogVYTGTi49NWQVYG6J29qkrs7LE1w6nBNAzJ7oJif0MSVl+iworuV@vger.kernel.org, AJvYcCVNZ1pSnLqb4UmzMNSQrXVTzZA2E1GwIY4Qq1dDX/BTYhOtYCfYMJgqT+KxD1n/49XPkcmCAHNSY+Q4@vger.kernel.org, AJvYcCVjae5wgisQW7OZjLpxnvsRRpM079El9bqwFbVEoP7KP0Jp4oNFJ9tO7Vz33+3iSUuN24BbAPWYO0p4he0=@vger.kernel.org, AJvYcCWlLk8e3r+b8NNvIiXwKGsl/aTURMMFuCYYCiQCUhAIQCfMy4Nz7klWZkxhJyyYePzYwpyBesw4CLRfj2LOmQsSScs=@vger.kernel.org, AJvYcCXl8ZAYw3kRto1eDamZ5P6oUKh2yYsd7+7i7qQOfr2s8t0BAh11YmvpZmui4CKWS5H1pMg7lnBoTdGBqo3v@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNc1tugvdlH5gZg5tk7tDTTF9a6ty9ye//nfHAeMyVXHQSZTZ
	cUjRiAUu7GzOEBdANc+Fkp98074NaRMouo8Bum5qx538bnNEhRj0BTMo0HTo+ye40rmD82aa0c8
	blB33QW7kWOuZn+4LvfKa1xNstjEY7KJLp30=
X-Gm-Gg: ASbGncsonmCYw2c4goHiuw83DKRIKGiOYXPKdFNm0I5pmIckC1lZH9VUuQJTqH3DsRE
	PEYB9mHVu5o7E3U0NgJcXtH3VTEmtAVEmbNW6hWrEF27w5RtJaUvWO7GEnZBErX4v+2gbS/0+59
	JBXqqXdRiJO3920iJesNN5rKGfDLjzHIuZRgPN3WGKFP+6dvXRqyrIdqHHkFwQfqtITn87Mw==
X-Google-Smtp-Source: AGHT+IHoL+hoFgBoT0ZrzW/DDYmgtDrmajjVaaPvdx+ESICpzTKMnenBa4ae3kIrj+FZtJE3ta694NQbtC+2QH8S6G4=
X-Received: by 2002:a05:6122:d8f:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-5261d349e2amr4941393e0c.2.1743429662130; Mon, 31 Mar 2025
 07:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-17-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346216346EE729F1E5B200F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346216346EE729F1E5B200F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 15:00:35 +0100
X-Gm-Features: AQ5f1Jqil2i7rQCbwiFbpUPGBltxCBSJoh8IC958_-m-m0MI6dylXY7wx3GY9-8
Message-ID: <CA+V-a8vdwYBnmh3aBR37QesGgkS6+4xbL--APx_r0JXMa1uFBA@mail.gmail.com>
Subject: Re: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
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

On Mon, Mar 31, 2025 at 1:44=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 March 2025 22:07
> > Subject: [PATCH 16/17] drm: renesas: rz-du: mipi_dsi: Add support for L=
PCLK handling
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `RZ_MIPI_DSI_HASLPCLK` feature flag in `rzg2l_mipi_dsi_hw=
_info` to indicate the need for
> > LPCLK configuration.
> >
> > On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required DPHY=
 register configuration,
> > whereas on the RZ/G2L SoC, this clock is not present. To accommodate th=
is difference, add an `lpclk`
> > clock handle in `rzg2l_mipi_dsi` and update the probe function to condi=
tionally acquire LPCLK if the
> > SoC supports it.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index 2ca725a2ccaf..26ec0f5d065a 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -31,6 +31,7 @@
> >  struct rzg2l_mipi_dsi;
> >
> >  #define RZ_MIPI_DSI_16BPP    BIT(0)
> > +#define RZ_MIPI_DSI_HASLPCLK BIT(1)
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> >       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long h=
sfreq_mhz); @@ -63,6 +64,7 @@
> > struct rzg2l_mipi_dsi {
> >       struct drm_bridge *next_bridge;
> >
> >       struct clk *vclk;
> > +     struct clk *lpclk;
> >
> >       enum mipi_dsi_pixel_format format;
> >       unsigned int num_data_lanes;
> > @@ -792,6 +794,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
> >       if (IS_ERR(dsi->vclk))
> >               return PTR_ERR(dsi->vclk);
> >
> > +     if (dsi->info->features & RZ_MIPI_DSI_HASLPCLK) {
> > +             dsi->lpclk =3D devm_clk_get(dsi->dev, "lpclk");
>
> Maybe use devm_clk_get_optional and drop the check.
>
As the dtbs_check doesn't enforce this,  `RZ_MIPI_DSI_HASLPCLK` flag
was added. Recently the same was done for the CRU [0] based on the
recent comment received.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2025032817=
3032.423322-10-tommaso.merciai.xr@bp.renesas.com/

Cheers,
Prabhakar

