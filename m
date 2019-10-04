Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B22ECB483
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 08:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730651AbfJDGd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 02:33:57 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43572 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728935AbfJDGd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 02:33:57 -0400
Received: by mail-ed1-f67.google.com with SMTP id r9so4780192edl.10;
        Thu, 03 Oct 2019 23:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVav5b67jOhOUHde3yp5NM10b2GKEryZinKkHvIneDo=;
        b=LpmTE2MWwZwu02xsJ+V2LjjDERnu4C0Kn8/fMNtqI7r56s85qulE+olnqtrTNUmwbP
         KtFzljnrdSH4assFS+rgA88i4YV3XthZUoysoArwgMOUO0NFOYskn1Ts73zZF2EmqAcs
         RFoL/a2do2ZSAL++3Qbo7ux09NMuf8V/8NqdhS/bJiDUk+6l8P8p6TVRWh8V15VCXvNu
         M+Lt3mB/Oj0n8SA+6X9erwSGBs1j+NNWuJpB2brABSTDd+dkmEOIiaVk3taclVtDrTDL
         JkJMW7Q+r3P+a1qMfz88JoT/KDBSdVU+kYM42QVX9Qcffymnm/OrHIpwG6kQCNhNCLh+
         7Svg==
X-Gm-Message-State: APjAAAVzQaqKBapRPwKgjpVITOPRPf8E63kmCIrtvq1vaXv8lpW6ZP/k
        EpGn+4TIa1tR+8n1eM7xFhOzQ4QNhCg=
X-Google-Smtp-Source: APXvYqxLaDckQQ+t/SufphhwZ8YdgENx+x9+/KTYQf7uq8Z5L5yWRYk2YJlxkGWj6bhh9pJcYKWTtg==
X-Received: by 2002:a50:f19c:: with SMTP id x28mr13319827edl.42.1570170833554;
        Thu, 03 Oct 2019 23:33:53 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id y14sm475589ejb.20.2019.10.03.23.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 23:33:53 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id a6so4462152wma.5;
        Thu, 03 Oct 2019 23:33:53 -0700 (PDT)
X-Received: by 2002:a7b:ce91:: with SMTP id q17mr9335703wmj.25.1570170832661;
 Thu, 03 Oct 2019 23:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191003154842.248763-1-mripard@kernel.org> <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
 <20191003163754.26ciq2ljcbuuvcrx@gilmour>
In-Reply-To: <20191003163754.26ciq2ljcbuuvcrx@gilmour>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 4 Oct 2019 14:33:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66WOZZj15GkARRzCTsSRhZi_6aEFK4w+O+aGmYwvVYGdw@mail.gmail.com>
Message-ID: <CAGb2v66WOZZj15GkARRzCTsSRhZi_6aEFK4w+O+aGmYwvVYGdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: sun4i-csi: Drop the module clock
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 4, 2019 at 12:37 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Oct 03, 2019 at 11:51:05PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 3, 2019 at 11:48 PM Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > It turns out that what was thought to be the module clock was actually the
> > > clock meant to be used by the sensor, and isn't playing any role with the
> > > CSI controller itself. Let's drop that clock from our binding.
> > >
> > > Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > Reported-by: Chen-Yu Tsai <wens@csie.org>
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > index 5dd1cf490cd9..d3e423fcb6c2 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > @@ -27,14 +27,12 @@ properties:
> > >    clocks:
> > >      items:
> > >        - description: The CSI interface clock
> > > -      - description: The CSI module clock
> > >        - description: The CSI ISP clock
> > >        - description: The CSI DRAM clock
> > >
> > >    clock-names:
> > >      items:
> > >        - const: bus
> > > -      - const: mod
> > >        - const: isp
> > >        - const: ram
> > >
> > > @@ -89,9 +87,8 @@ examples:
> > >          compatible = "allwinner,sun7i-a20-csi0";
> > >          reg = <0x01c09000 0x1000>;
> > >          interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > -        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> > > -                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > -        clock-names = "bus", "mod", "isp", "ram";
> > > +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > +        clock-names = "bus", "isp", "ram";
> >
> > I believe what we thought was the ISP clock is actually the module clock
> > for the whole CSI subsystem. So we should still use the module clock entry,
> > and remove the ISP entry.
>
> I'm really not sure it is. CSI1 on the A20 (possibly the A10 as well,
> I haven't checked), and the one on the A13 don't have any ISP embedded
> in the CSI controller.
>
> It makes some difference, because according to the BSP, you can see
> that the ISP clock is taken for CSI0:
> https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi0/sun4i_drv_csi.c#L389
>
> While for CSI1, that block is commented out, and the ISP clock never
> used:
> https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi1/sun4i_drv_csi.c#L396
>
> So I really believe that the ISP clock is here to feed the ISP block
> within the CSI controller if there's any. But it's far from always the
> case, as opposed to a module clock for the whole CSI controller that
> would be here in both cases.

I guess we should try to test this with CSI1 one, either on a Cubieboard
or OlinuXino with a simple camera like the OV7670?

Do you have any hardware on hand for this? I have the Cubieboard but I
need to get some proper 2.0mm connector blocks.

ChenYu
