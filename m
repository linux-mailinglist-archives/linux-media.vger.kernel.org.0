Return-Path: <linux-media+bounces-24264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A62A0221B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 10:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4CF51635DA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 09:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490CE1DA2FD;
	Mon,  6 Jan 2025 09:46:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C71D935A;
	Mon,  6 Jan 2025 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736156769; cv=none; b=pFaHKBGGRi3Nbg1q6qNDR0WGOGWaSxOkSKRKygVaDUg+FNth2tO+259Z/NuBc882h8nPOUKOrzjAHfbc1HYJ/uIsh0tf6HerMfrBG7zao6R0LOu1wFi8jd8PYsOEqCbuh3CrHNtkrXzJA25TalCxiFD/MJd/FFF2P+10KHCelr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736156769; c=relaxed/simple;
	bh=Fg0nBXDYLwWPzx75YDCa2IGEiKOxkE9IV8BpSohY2nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8MHd4jP0jzVse7QOG3OvP0lo0+Io2DuFr8SWIUneLcgQ0W1GueTKXFhoUsTvx8vue/y6hsl0ydqsNp324H4wUQWRcVk+sGj8+FoqUb+BGOmutrxVHwV6BFFy91MNHmQnu/unCYVX7w57Tdmj7FPAYqFOw6XuondX72CXZZeBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5189a440a65so8312636e0c.1;
        Mon, 06 Jan 2025 01:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156764; x=1736761564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmOuApIikQphda2B92OjzYWtMxOG5l1bhr7Pfo9V7Eg=;
        b=NVay6inMHNcV974HQ6ahfDIHGIQIuxOFoSFdmOvpYLk2Onbw29p8fTU75KndvM1m2R
         1iLuj18BitICgKBFTH7AqlyO2AkUFAXZ156FtikghJunpow0DYK3g6pt6biI9jmuR4OL
         oUfkVMrVV22KjziSshk3wTI0W2mfyPGCOO5XVc2HGFIWxUP2sbySynnA/FfG/eXB+6+x
         gd8OuGO+ojPwjndp13tNs1k1coplm6U8QKjiYZIEdaGpuYudkfF70TIufPDJdyvd0lXM
         BSq+lQiH3dWh4ziDkJF5GOswQX7kguBYIKR7NWMhryRR42iCfLagFKq8Ppj6uwnxmaHX
         7YEg==
X-Forwarded-Encrypted: i=1; AJvYcCUaecIp521kUxUHTNuc5VlIXmzl2isrE8nzbwTwtfjYcLWavpcwEXKGfUPjUSml/+7w4BI3nr4gcyl482VcJMx+g3E=@vger.kernel.org, AJvYcCX4ChGIcg2exeq3hbskOHISu1oNoQ+tCQof36+hWVpM6nH0rpbYZDTuDZy1U0RpLUDQ7LuJmoz4DmrJfTs=@vger.kernel.org, AJvYcCXio2E1K2qFzSs2Aqxg9QQ4ampqa3tao8pPNPb3YeDx/OzW3gpLycOY3Jz5q6MMhQR4aaOvO8LYOpY3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3RweQ5HQe4dXdHFZOyXh1W+EteQFlLeHodaJlyYe52OjI+vG
	A9/BHsxY9PLZhRca8aueGpFVbdwCTX5e4z+NmhpMNt/EN3StUbw7CLqCgdNw
X-Gm-Gg: ASbGncsthMVShkRYNLPBb8KQjVFAwFSeLf94fzEqlN5ONFMX1ZgSjHYdTQKG3pKQ4eb
	CsvkHEx6t9vquLbCcxGY0JvB+JQIxc+RU8dy3OkHkM7vI3RbLOJL6eUNmZVaMCaC8NhD/QY6gLz
	maHq5JKpUx6FTIQeytCPyA5kKZg+CVZDF9gENaSwCND5EtgdmMbefmVoQZnZF/li/1E7YxNkzG7
	Mb5K+XP3FtBm7BNZv9UDfuhXeT4y6sgzwsGghITeqGBh7ZID/YEQ8pjDZOifKY/FUI/G+BblMEB
	WeRbD7fAL2Htad+1R/M=
X-Google-Smtp-Source: AGHT+IG9LoHkHSVs527AJS8onMtChiqW/zLk07/sqp0BqZ7NkMQ3yhwn9YSSPoEDwoSD12TyZUK7yg==
X-Received: by 2002:a05:6122:4889:b0:517:4fca:86df with SMTP id 71dfb90a1353d-51b75c6e461mr46431162e0c.6.1736156764051;
        Mon, 06 Jan 2025 01:46:04 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb49b3sm4364543e0c.20.2025.01.06.01.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:46:03 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so8451762137.2;
        Mon, 06 Jan 2025 01:46:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCrXvNk73YTX3B6/ir//r50ryBOtDFYHR00qff95Hzc9s1ZqdYXK6l5NiNBSZgDyQRdGOFNILlUf0t@vger.kernel.org, AJvYcCWgOjeGu7uljY159Uh9bGG1l3okgMnIZj+LaySsAHf7Oz77s0KCOY/WpCwxegSNpFU+9i7ln8J0x2iWpbA=@vger.kernel.org, AJvYcCXHkbujJ9GuRIMRuNwnztmcMuAsVz515YLH3b1R6Vj0ZOimXolwooDRySxsHXAqERB2N0gWNheSPg+8MzLozGrKcEk=@vger.kernel.org
X-Received: by 2002:a05:6102:6e88:b0:4af:f49a:ad76 with SMTP id
 ada2fe7eead31-4b3635938a6mr9881914137.23.1736156763459; Mon, 06 Jan 2025
 01:46:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
 <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWqS=zURzutDsCqChSGia35JZpVuDY=njrCBEKP-6=eXw@mail.gmail.com> <20250104121700.GF808684@ragnatech.se>
In-Reply-To: <20250104121700.GF808684@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2025 10:45:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxmMXe7dhFNGmr90AkRovW-Pov_0DA8-=RgDa9j_FWiQ@mail.gmail.com>
X-Gm-Features: AbW1kva0Pma2MzvXDyzGyV80vdluGQNXwlv-UP_jfb4Rq9IiZE9PqnlpxTf5WqE
Message-ID: <CAMuHMdWxmMXe7dhFNGmr90AkRovW-Pov_0DA8-=RgDa9j_FWiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define
 CSI-2 data line orders
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sat, Jan 4, 2025 at 1:17=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-12-27 14:22:31 +0100, Geert Uytterhoeven wrote:
> > On Thu, Nov 21, 2024 at 2:41=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > The second CSI-2 C-PHY data-lane have a different line order (BCA) th=
en
> > > the two other data-lanes (ABC) for both connected CSI-2 receivers,
> > > describe this in the device tree.
> > >
> > > This have worked in the past as the R-Car CSI-2 driver did not have
> >
> > has
> >
> > > documentation for the line order configuration and a magic value was
> > > written to the register for this specific setup. Now the registers
> > > involved are documented and the hardware description as well as the
> > > driver needs to be corrected.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > --- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
> > > @@ -21,6 +21,9 @@ csi40_in: endpoint {
> > >                                 bus-type =3D <MEDIA_BUS_TYPE_CSI2_CPH=
Y>;
> > >                                 clock-lanes =3D <0>;
> > >                                 data-lanes =3D <1 2 3>;
> > > +                               line-orders =3D <MEDIA_BUS_CSI2_CPHY_=
LINE_ORDER_ABC
> > > +                                              MEDIA_BUS_CSI2_CPHY_LI=
NE_ORDER_BCA
> > > +                                              MEDIA_BUS_CSI2_CPHY_LI=
NE_ORDER_ABC>;
> > >                                 remote-endpoint =3D <&max96712_out0>;
> > >                         };
> > >                 };
> > > @@ -41,6 +44,9 @@ csi41_in: endpoint {
> > >                                 bus-type =3D <MEDIA_BUS_TYPE_CSI2_CPH=
Y>;
> > >                                 clock-lanes =3D <0>;
> > >                                 data-lanes =3D <1 2 3>;
> > > +                               line-orders =3D <MEDIA_BUS_CSI2_CPHY_=
LINE_ORDER_ABC
> > > +                                              MEDIA_BUS_CSI2_CPHY_LI=
NE_ORDER_BCA
> > > +                                              MEDIA_BUS_CSI2_CPHY_LI=
NE_ORDER_ABC>;
> > >                                 remote-endpoint =3D <&max96712_out1>;
> > >                         };
> > >                 };
> >
> > Using the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions has a hard
> > dependency on commit 91a7088096a49eb4 ("media: dt-bindings: Add propert=
y
> > to describe CSI-2 C-PHY line orders") in media/master, hence I cannot
> > take this patch in renesas-devel until that dependency is resolved.
> >
> > However, according to the cover letter, commit 573b4adddbd22baf ("media=
:
> > v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders") in media/master
> > causes a regression in the absence of the line-orders properties
> > (which I had missed before, unfortunately).
> > So I think it is best if this patch goes in through the media tree,
> > which already has the prerequisites and the regression:
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Alternatively, I can:
> >   1. Cherry-pick commit 91a7088096a49eb4 first,
> >   2. Replace the MEDIA_BUS_CSI2_CPHY_LINE_ORDER_* definitions by
> >      their numerical values.
> >
> > Please let me know if you prefer option 1 or 2.
> > Thanks!
>
> My preference would be for this patch to go thru the media tree with
> your tags to create the least churn, if Sakari is OK with that ofc.
>
> If not I leave it up to Sakari which option is most preferable to him,
> I'm OK with both alternatives.

Note that it's getting a bit late for the alternatives, as I plan to send
my PRs for soc today, or tomorrow the latest.

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

