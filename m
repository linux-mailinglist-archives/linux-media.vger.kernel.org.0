Return-Path: <linux-media+bounces-29413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D3BA7C088
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 17:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4C4174995
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C1C1F561C;
	Fri,  4 Apr 2025 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/y5A/vF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8853D6F;
	Fri,  4 Apr 2025 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780467; cv=none; b=qgYdn7rOV58BV16P8e6mKrxQ8uIOZAGPPTQCHP1EbQfwh0trFE5U9RIkZkDvp1DuCi0DCdF2LVWhp8gh/eDgYCeV0ysYQdDQZTsXQk+nPzZLB+groWS9Hl/BVbUpEYPi3OVdPb6i6hcY+8pHbzSGrOo6ptj5zrw7XGmo5//HXlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780467; c=relaxed/simple;
	bh=ppAMMplcwEnqZltZtKemeDu3pyGJ/eqR5B0fpfCJImc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGXfN7N3ubyxf6sOnCLma8LHFFpOonnV8JJtrGrwL1+LTGHUltaNna4sBRayw7seMNyWG0ecPSDZet3R4DUW/iOXP4pacFvaecVzpKOnTZvzKle6NC76SEBjgmynhdmNfhRlJcwjDiflUF4LgRv4f0yu8xIlq5yS9sxGn+F9k5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/y5A/vF; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523dc190f95so1099239e0c.1;
        Fri, 04 Apr 2025 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743780464; x=1744385264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyHcTgEvmYhoTiQmPYplgxNdtkYfEagU+yWLnPX7X2E=;
        b=H/y5A/vFa1Elt59ac6oZAsaaOljMWPqzqEuXMGy8zYiEhqGteg2QeVKmQYhZAxLrxp
         hNf28dRy4Fq0fgYWJtSWAUw68Vw1JuLqzeHVOWZJ3aRneNy/9/fakivmVwF0qO5C3BQi
         4osnxyz97P1OSGiSqHAOZfe5SyTH4PBEcOlhYgkeJerPXP9crrzR7uLll5Yv6prWzlPj
         wb9018DbksQB0cdxweTPrfF5bu4mGC4HuJBVhuy+3dF1GLV7WkqprQNcJ5ZnQwuuLHBE
         e2v05amyHHP7YoMv5C5IOI70/aNVQn+AUAKlInNf3YuW/WhdbRZcFUX9DsjvNoQDMe9n
         X6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743780464; x=1744385264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyHcTgEvmYhoTiQmPYplgxNdtkYfEagU+yWLnPX7X2E=;
        b=nD95gX+bClAx/Cw+NGcFKsu7JmUqwTHk8dGUiAR2Kxvjifm+8oyxL+WzE1bJspRZ5O
         GWKCCKjwOltL1cRLh6r9tQfepSt6J7CUDy1Or79lJ+3k+bjggUioc0fFoaQJD90zJjGU
         HG7fN5eiZU7xNGDa3Xx6ncq9L/xFifxwWTTqdVvCC8DZdKPWm2JKxcBIwEbMIyduLejh
         njEPHr7MwXfFanmqsfFAkiIEQlHZHg3STGg4beSqn55/hhyqxYUVRveb6eZ54vH5j6Hs
         MfMqFPG9lhjoTI3cTIFxNfN1ba4PJ76zr8EcCJwbrqfkDIi6RqxyCuaz3zMiykCuJtd5
         JYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXWjGCuOQ+9rr+syKXO+fqRPKK+NKUuG5pQiP6jaaZA4xyqRSvxSY24yLzXbkvV3gNbThOTuxsX4pj@vger.kernel.org, AJvYcCVFNJcrNEFadGxgw8unZiNM0nxS/L3p/Z4cYgcb/itVcGKF8gQyWL1HfwFJN8OjtrO5ATCSmqiW+Hl9Yuy6ZAfltPw=@vger.kernel.org, AJvYcCVKtHUldYcL9E+dTwNFDW7eR9vZtrt9z/BGrG2en0DJlrRQNvs8bMHlyi8urrJ7uvScdcyUKgkslNXl@vger.kernel.org, AJvYcCXTT0t4dwT24IEDP68koAARWNNwMTwYxFj2w1EM9EGyZEpFHyp8KE/Q5PlccU+v8buee93Fo278sptDqpw=@vger.kernel.org, AJvYcCXd0kjQNexPOoYuiGJOT49EpHY+b5/qhZrYwHrTx3m7IrtfS4st2Bf/hgew8K+yaNFbIRmGN2Pfwfjfx5kT@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlOisDwUZrdiN+ObJwz57zFa1wcXScV5gej53l0T/cNfVO8bK
	gU8z6EgMCDONZ5hN9RMTHXsOWaL/nTEsteMUMO46jxM/6BxBv+9Ku7yPNbyfEcSV93KcxRq+/q8
	GVNVhkhXOAXqtScXttyPG7xnInsQ=
X-Gm-Gg: ASbGncv/fzDDm9mwrdxlIWinVdQ3VIsmEfxtUmYTuk6DZy5i6WJZPR5mmMXn0OJSoK5
	+w6ntXZLtxhIg0DPQFULyX+P+jMHfyDmPJr5L0SAJxhrAKlD0fdZ5pCx/4oKOUfCKYeVTtI8zWA
	MOQp5u3q8LZ7W1WtO7CMAZ79piESc2At+mDWDtwzshrCYiKgOoP2Qgj/DfwQ==
X-Google-Smtp-Source: AGHT+IHpqWWi0yrluNQOEGHLp4cKuInHusdtDoz8SY57TW+X7L6P0CcJUrQKzkaOgTZejZMvuGJzRc+ba/iZfntk+2Q=
X-Received: by 2002:a05:6122:3212:b0:527:67c6:faff with SMTP id
 71dfb90a1353d-52767c6fe95mr2008321e0c.4.1743780464136; Fri, 04 Apr 2025
 08:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-18-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134665BB606FE66E50FA372986AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134665BB606FE66E50FA372986AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Apr 2025 16:27:18 +0100
X-Gm-Features: ATxdqUH3IKmpyUumzvpmcjCBEPPgLqRzYOAqAiEDLuje-X9Xwf8ve80bPV3Fv90
Message-ID: <CA+V-a8ufhkKEAMTjKhV8HO8Z+hLVvBfRc_q9=+O93FFK55yvFA@mail.gmail.com>
Subject: Re: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
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

On Wed, Apr 2, 2025 at 7:27=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 March 2025 22:07
> > Subject: [PATCH 17/17] drm: renesas: rz-du: mipi_dsi: Add support for R=
Z/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 450 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  40 ++
> >  2 files changed, 490 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index 26ec0f5d065a..3a70f479d473 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2022 Renesas Electronics Corporation
> >   */
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas-rzv2h-dsi.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> > @@ -30,6 +31,9 @@
<snip>
> > +
> > +#define PHYC1R                               0x034
> > +
> > +#define PHYC2R                               0x038
> > +
> > +#define PHYC3R                               0x03c
>
> Looks the above 3 macros unused.
>
> Maybe either use #define PHYCR(x)       (0x030 + (x) * 4) where x =3D {0,=
3}
>
> Or
>
> Drop the unused macros.
>
I'll drop them.

Cheers,
Prabhakar

