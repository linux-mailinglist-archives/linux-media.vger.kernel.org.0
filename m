Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471AACDFF1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 13:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfJGLLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 07:11:19 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37342 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727317AbfJGLLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 07:11:19 -0400
Received: by mail-ed1-f67.google.com with SMTP id r4so11990030edy.4;
        Mon, 07 Oct 2019 04:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdSVRSNxLP1konpnVuCvTtNg1cjUO6frfDXS7bB3dZU=;
        b=gLxyrJq96T51v03CW0ii3ur2Nq9q9uoVpfwKtKXckvP0QpfiyfZ7jwuXUXbUhhnjQi
         haW7vIRxIMsvn64EKp+8rmxdpi98yc9BK3J8klD0SfbC3s8YjBWEQ3Ukk4gzZDvJao6q
         paOEu6gLh9QAk8btgxDTnkf6Fc9VX2ZcJMg+3OvR/qh2TA8sY5SrOpfAeX9DpWfHxNnX
         G/y59PFWztAbsVHjKes0I02zZMv+5thgQA6OUzPdc+Z4AQlyCnJPgGLL1MUx/jLLPxZ+
         XMe+q/oNNUm2lJS5Gf3rEPqDm/Q5tmJD4bHLrJbwGco5/B970MP5KiJvFg8p7gzi+1Sz
         /SYg==
X-Gm-Message-State: APjAAAV/yiTPFCif/AePkbGbvmAKUJ7nYgPaOBeDMmVaPOxcwzh7omsT
        FIaAiSmxwIrhGew7ApIKQlffQGTutVY=
X-Google-Smtp-Source: APXvYqxet+PaRoKcx2KyeohqvVfhRenox73T7lauH9Jm2zCnu/gYlL839kFC2Z03mH+sBRYE2XyYxA==
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr15138435eju.320.1570446675869;
        Mon, 07 Oct 2019 04:11:15 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id y14sm1794168ejb.20.2019.10.07.04.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 04:11:15 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 3so11876513wmi.3;
        Mon, 07 Oct 2019 04:11:15 -0700 (PDT)
X-Received: by 2002:a7b:c188:: with SMTP id y8mr21306277wmi.51.1570446675074;
 Mon, 07 Oct 2019 04:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191003154842.248763-1-mripard@kernel.org> <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
 <20191003163754.26ciq2ljcbuuvcrx@gilmour> <CAGb2v66WOZZj15GkARRzCTsSRhZi_6aEFK4w+O+aGmYwvVYGdw@mail.gmail.com>
 <20191007110943.lyz3nep7udr6weu3@gilmour>
In-Reply-To: <20191007110943.lyz3nep7udr6weu3@gilmour>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 7 Oct 2019 19:11:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v6776fWUuE1kOtnuFVA4faFZdtkZu02WwTqHyGAPVi+G-A@mail.gmail.com>
Message-ID: <CAGb2v6776fWUuE1kOtnuFVA4faFZdtkZu02WwTqHyGAPVi+G-A@mail.gmail.com>
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

On Mon, Oct 7, 2019 at 7:09 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Fri, Oct 04, 2019 at 02:33:41PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Oct 4, 2019 at 12:37 AM Maxime Ripard <mripard@kernel.org> wrote:
> > > On Thu, Oct 03, 2019 at 11:51:05PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, Oct 3, 2019 at 11:48 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > It turns out that what was thought to be the module clock was actually the
> > > > > clock meant to be used by the sensor, and isn't playing any role with the
> > > > > CSI controller itself. Let's drop that clock from our binding.
> > > > >
> > > > > Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > > Reported-by: Chen-Yu Tsai <wens@csie.org>
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
> > > > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > > index 5dd1cf490cd9..d3e423fcb6c2 100644
> > > > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > > > > @@ -27,14 +27,12 @@ properties:
> > > > >    clocks:
> > > > >      items:
> > > > >        - description: The CSI interface clock
> > > > > -      - description: The CSI module clock
> > > > >        - description: The CSI ISP clock
> > > > >        - description: The CSI DRAM clock
> > > > >
> > > > >    clock-names:
> > > > >      items:
> > > > >        - const: bus
> > > > > -      - const: mod
> > > > >        - const: isp
> > > > >        - const: ram
> > > > >
> > > > > @@ -89,9 +87,8 @@ examples:
> > > > >          compatible = "allwinner,sun7i-a20-csi0";
> > > > >          reg = <0x01c09000 0x1000>;
> > > > >          interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> > > > > -        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> > > > > -                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > > > -        clock-names = "bus", "mod", "isp", "ram";
> > > > > +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> > > > > +        clock-names = "bus", "isp", "ram";
> > > >
> > > > I believe what we thought was the ISP clock is actually the module clock
> > > > for the whole CSI subsystem. So we should still use the module clock entry,
> > > > and remove the ISP entry.
> > >
> > > I'm really not sure it is. CSI1 on the A20 (possibly the A10 as well,
> > > I haven't checked), and the one on the A13 don't have any ISP embedded
> > > in the CSI controller.
> > >
> > > It makes some difference, because according to the BSP, you can see
> > > that the ISP clock is taken for CSI0:
> > > https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi0/sun4i_drv_csi.c#L389
> > >
> > > While for CSI1, that block is commented out, and the ISP clock never
> > > used:
> > > https://github.com/linux-sunxi/linux-sunxi/blob/sunxi-3.4/drivers/media/video/sun4i_csi/csi1/sun4i_drv_csi.c#L396
> > >
> > > So I really believe that the ISP clock is here to feed the ISP block
> > > within the CSI controller if there's any. But it's far from always the
> > > case, as opposed to a module clock for the whole CSI controller that
> > > would be here in both cases.
> >
> > I guess we should try to test this with CSI1 one, either on a Cubieboard
> > or OlinuXino with a simple camera like the OV7670?
> >
> > Do you have any hardware on hand for this? I have the Cubieboard but I
> > need to get some proper 2.0mm connector blocks.
>
> I've tested it with the A13 before, and it doesn't need the ISP clock

OK! That clears things up!

ChenYu
