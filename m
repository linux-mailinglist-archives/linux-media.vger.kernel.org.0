Return-Path: <linux-media+bounces-29323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A60A7A357
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7AE57A4A2F
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506DC24E01B;
	Thu,  3 Apr 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbO8ZoUg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F91425776;
	Thu,  3 Apr 2025 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685564; cv=none; b=p0UEQEFAxRg9X7bywVc02CEGqWgzAORg7oG2DTti/Qg8klGpZ+x8HjvSjacb9arx/KqA4PNMayDrinodUJOGbzW3JcS04KUxgPVrdYzYt9Q3yLhlyzOBrM5Nz5dd9/O36JL+KRNlJStH+ZPK4aMIS9d+i3o0ZDMay6InD/96u0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685564; c=relaxed/simple;
	bh=lsJeZZZY/2URMCsjtrIPjM8KEvccXHmoZdYqAmsM62o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZSs6zqByylJkocrCp6FgwLOzOHQPLxDXXpaYB2lfi7ZxCvH2MlJB7JYHlGZJtbQsCvojLIptubkQMz0BQymr+TYZcwiu12mH06OgAB4VWvwPYwX5ccFj45R/zBjydMbPhk6xOfNbBq500kbfVTmxvQOFfqX0JVDObHMTGoJpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbO8ZoUg; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86feb84877aso414474241.3;
        Thu, 03 Apr 2025 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743685562; x=1744290362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsJeZZZY/2URMCsjtrIPjM8KEvccXHmoZdYqAmsM62o=;
        b=QbO8ZoUgyWjiul967SmErDlE55XLGMpg++wYws+DKbqbc805ZcJfEO1sFdxAJNA/HG
         WQmIoBlWuvBkyuRXsa5jQTsROKkmlvKq5GT1XgdcsIe35XJEmrI3RK37zY6g63LZO3Vq
         +2EquwSUU5Zq2/C5gKCErh6/R/+sLwmOdEKdYYCXQHX/1gmE7v26wleCIeW0h+YGOpl0
         Kugiz0RWtMY0PJzOIFo93LYKTJ5FzUJgj2o3xlwdGQc3zrBMhqHy4yE8UrI0/TpDfEpj
         PZA/EWCDbzHc2HysIKD2E/m9rReuQX86/57V5Wxlts66d17y8bePDYBUbYkplt4PlbZv
         ARgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685562; x=1744290362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsJeZZZY/2URMCsjtrIPjM8KEvccXHmoZdYqAmsM62o=;
        b=WqhFTKf7qWy8Y58gapIhusBMzdoWiZhoQTUAtiFFTQtW9WMOApRNSUSYzfVfm7bl2i
         mMkRFZ5oYGwDeU+IiH1FPu7DCJLVXkvhhIYnJDBLznqa9l3ZA5drOSI+rh8N75cPBLDC
         XHk+RQXN+cDHN8qaNpt3HVMVHmU3k+t7MgKdkzykZyl544H8TiGsMkCnuFB76Wkc1bl6
         03Gu9VoOl0XmYybxXpDc/DQKmFHcMPAZhmzKgwRNQbGFwsv0D2YNtKSB3LeAqY4NLFmO
         B3O2n/gmPyTCNYmoLJyFMQNnUCqaBUlJvDiYnhOQEEJMl4ykwTCGOTER1LKfwsw7tm7J
         fGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0MpY33EHPwxKB8ufzzPqy2uU14FhF0Vh/xM5iOJGNNqWTVpq7nsCIURl+PFZYiUIzFbC9DQEjVJC0Y27p@vger.kernel.org, AJvYcCV1jQ2c9ByItYNAyi7UcX1B9Yalztir7ZtHMZFWAXq5+Mzqjl6JZIgOA/GSdTJyxIdaSRm8KSlUlzEkVck=@vger.kernel.org, AJvYcCVTcCP5ZjYVFTnRlJbZXmwP+x7OgvgiffBhggP4wDga8qJ+m9NgmP6isiDu8CkJv32rgyKS+TBTDSY=@vger.kernel.org, AJvYcCWkM545kr+u4ePkBHTbMPNXcDSsLCNWYyTneR6Xzz+uXMZA7Z4+ZlUnJiNwpEIoIiQe9tzG0SQwTMa3Vwl6Ug67mmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybgLmHSz3F9sEhHAvOYCByA+W8+OReJp5qqab+82aDxX8W0+qb
	Me6Hg9s4KqZDd5/PUNQPKeXP75FhE7G+N4MM2OemRBzCJZF1JNnXdGC75r5jNEpwCLDgh1WxgdY
	A6X3o2/jptOlmLzMOOovX9Hc+ego=
X-Gm-Gg: ASbGncuWBVN4S9UU4z4qF1VHzkh1qOBW0jpDYhEgGM6eEGRNp4A3gIM423fIQPEs0z0
	tC5TA4+xUnr1talaXDiJ4neertAl/r+fXrqk4xJbo5pABOxxsIDl6bcDKZOAaNSU3YVJno0jLSI
	pOh/AaGfLDr/J8xfTSII2NO+rrLg==
X-Google-Smtp-Source: AGHT+IEzDE80EE6cbpeTM2EC/NmVx7bAKo2MiBYm9Z2gGy1h1pAWOHdYS27tRyPRKUwbhW2DvGquTwMOzOZsv1SPcGw=
X-Received: by 2002:a05:6122:91a:b0:50b:e9a5:cd7b with SMTP id
 71dfb90a1353d-52758ecb40emr1666317e0c.9.1743685561913; Thu, 03 Apr 2025
 06:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <49b12329-87d8-4f6f-8498-0ff7430e31e6@ideasonboard.com>
In-Reply-To: <49b12329-87d8-4f6f-8498-0ff7430e31e6@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Apr 2025 13:05:35 +0000
X-Gm-Features: ATxdqUGr8IaAK5c_xkyz_zr7rT2-bUSRn-Mh8kf-15JIdRrzS-lrWmVXghuwU2A
Message-ID: <CA+V-a8uW0sqOCqwpK2J3P9_MOaonpz8uA_CbOjqUiBxwPuXFEQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Thu, Apr 3, 2025 at 12:52=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 31/03/2025 00:06, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series adds support for the Display Unit (DU) and MIPI DSI
> > interface on the Renesas RZ/V2H(P) SoC. The inital patches add PLLDSI
> > clocks and reset entries for the DSI and LCDC and the later patches add
> > support for the DU and DSI drivers. The DU block is similar to the
> > RZ/G2L SoC, but the DSI interface is slightly different. The patches
> > include updates to the device tree bindings, clock and reset
> > controllers, and the DU driver to accommodate these changes.
> >
> > Note, my initail intention was to split the clock patches and the DU/DS=
I
> > driver patches into two separate series. However, I found that sending
> > them together will make it easier for the reviewers to understand clock
> > related changes.
> >
> > Note, the clock patches aplly on top of the following patch series:
> > - https://lore.kernel.org/all/20250228202655.491035-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> > - https://lore.kernel.org/all/20250328200105.176129-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
>
> This is missing dri-devel list from the to/cc. Did you use
> scripts/get_maintainer.pl?
>
Apologies, I did use get_maintainer.pl but must have missed dri-devel.
Thanks for pointing this out.

Cheers,
Prabhakar

