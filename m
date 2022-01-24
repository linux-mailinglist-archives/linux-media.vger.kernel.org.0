Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6586C497F94
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 13:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241446AbiAXMby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 07:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238406AbiAXMbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 07:31:53 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B65C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:31:53 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ah7so20847724ejc.4
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8RhPYuS2G+COq83UI0pFOYrwspRC0HIvjHjPdqohYyY=;
        b=tCsbaFtKKfABsCe4Ogt8GLq8k5ez/5SfbB4TP57iHBgzcz6RnOmWSxAVJX+Ma6lZuP
         8w8R315YVWor56yrGvsOqGF997qU5Elf766jCzRl4yaHg699OArePHIgnP+AJit+PyN3
         ZAl87ElGtnGWVnc5qRuIUnhBlZXzo9kI2DzuHDvPEXYD29i8HXOSpHrm2/iXNv9x3lXc
         6RpwA+1kEzDD8HHGkYnzoMPxWbfJF53ilC/2yV2zKKdwqcwSw25aMKd1SYBchx/n8EGZ
         K7E2bA4OW6ycLzhXxh/NtF+ejpeB97iGd2k+KLeILCxgNlWukb5/FIQtyKokzKGtwaUP
         kETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8RhPYuS2G+COq83UI0pFOYrwspRC0HIvjHjPdqohYyY=;
        b=VppQaO5Eb4QtNwW6mS36WQ2JZVLVFztzh2jzCMpFSYCeid4k75V/EUaWl6HbXXXN/C
         idn5rJp/XrJW32IjRbPn58F0HXLMsZ3USdWabSQGSKnDIawqk9CW5P9uccEt90nyq+Pu
         rPtCUcKI+IM5e9zZ1mmVilhZLIZSfmZOHcNsyYbLMVq2bP4EVqfDqqmAh/Z4bB7Dgf4P
         YmdiZwJQH1GFo08PVW45h2m/GmnPsf2rI3lH0aV89oP7iulkkeZJVpuMFSoQx08Mshmn
         C446/g3lNntIfmdZoD/ANjnsdGii4hj+a2S8wUu65VEtrd91qVSU7dXt4i7nFXj9jDyz
         h0ZA==
X-Gm-Message-State: AOAM530HWRUzEUU4FD4G04b5TKP1g/1p2HWQXCmez40RtoBJZbh9c2io
        lokSo0h5XTNZ6+Ji4khrWqs9MA1dnySo0TClUdsoPA==
X-Google-Smtp-Source: ABdhPJy6TIq9mOvg/feHF5oRvnpf1PBlsIUkzIkXFsnNty13n9tQATxF/WcG0L5T+KwHGseVpQk5G9rGMVlYuraPMg8=
X-Received: by 2002:a17:906:59b:: with SMTP id 27mr12932024ejn.294.1643027511685;
 Mon, 24 Jan 2022 04:31:51 -0800 (PST)
MIME-Version: 1.0
References: <20220121081810.155500-1-jeanmichel.hautbois@ideasonboard.com>
 <20220121081810.155500-6-jeanmichel.hautbois@ideasonboard.com> <Yes3c1v+V1hMlWfW@pendragon.ideasonboard.com>
In-Reply-To: <Yes3c1v+V1hMlWfW@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 24 Jan 2022 12:31:34 +0000
Message-ID: <CAPY8ntDR5AsxGE5fh_KHMonoZait9evxQkpidu10F7EY9CPxZA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/7] ARM: dts: bcm2711: Add unicam CSI nodes
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        devicetree@vger.kernel.org, kernel-list@raspberrypi.com,
        linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org, lukasz@jany.st,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Naushir Patuck <naush@raspberrypi.com>, robh@kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Jean-Michel

On Fri, 21 Jan 2022 at 22:45, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jean-Michel,
>
> Thank you for the patch.
>
> On Fri, Jan 21, 2022 at 09:18:08AM +0100, Jean-Michel Hautbois wrote:
> > Add both MIPI CSI-2 nodes in the core bcm2711 tree. Use the 3-cells
> > interrupt declaration, corresponding clocks and default as disabled.
> >
> > Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > ---
> >  arch/arm/boot/dts/bcm2711.dtsi | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> > index dff18fc9a906..077141df7024 100644
> > --- a/arch/arm/boot/dts/bcm2711.dtsi
> > +++ b/arch/arm/boot/dts/bcm2711.dtsi
> > @@ -3,6 +3,7 @@
> >
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/soc/bcm2835-pm.h>
> > +#include <dt-bindings/power/raspberrypi-power.h>
> >
> >  / {
> >       compatible = "brcm,bcm2711";
> > @@ -293,6 +294,36 @@ hvs: hvs@7e400000 {
> >                       interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> >               };
> >
> > +             csi0: csi1@7e800000 {
>
> The node name should be csi@7e800000, not csi1@7e800000. Now, this will
> probably cause issues with the firmware that looks for csi1 (and csi0 ?)
> to hand over control of the Unicam CSI-2 receiver to the kernel. I
> wonder if this is something that could be handled by a firmware update,
> to also recognize nodes named "csi" ?

It already looks for any node starting "csi". If you check the
downstream DT [1], then the nodes are "csi0: csi@7e800000" and "csi1:
csi@7e801000".

There is no actual action required to hand the peripheral over to the
kernel, it just prevents the firmware from using it and causing
problems (it masks out the interrupt, and that's checked as part of
the firmware initialising the peripheral).

If using imx219 or one of the other sensors supported by the firmware,
"vcgencmd get_camera" should report that the sensor isn't detected,
and "sudo vcdbg log msg" should have a line similar to
"020174.613: camsubs: Ignoring camera 0 as unicam device not available"

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-5.10.y/arch/arm/boot/dts/bcm270x.dtsi#L88

> > +                     compatible = "brcm,bcm2835-unicam";
> > +                     reg = <0x7e800000 0x800>,
> > +                           <0x7e802000 0x4>;
> > +                     interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&clocks BCM2835_CLOCK_CAM0>,
> > +                              <&firmware_clocks 4>;
> > +                     clock-names = "lp", "vpu";
> > +                     power-domains = <&power RPI_POWER_DOMAIN_UNICAM0>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     #clock-cells = <1>;
>
> Why do you need #address-cells, #size-cells and #clock-cells ? They're
> not mentioned in the binding.
>
> > +                     status="disabled";
>
> Missing spaces around the =.
>
> Same comment for the next node.
>
> > +             };
> > +
> > +             csi1: csi1@7e801000 {
> > +                     compatible = "brcm,bcm2835-unicam";
> > +                     reg = <0x7e801000 0x800>,
> > +                           <0x7e802004 0x4>;
> > +                     interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&clocks BCM2835_CLOCK_CAM1>,
> > +                              <&firmware_clocks 4>;
> > +                     clock-names = "lp", "vpu";
> > +                     power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     #clock-cells = <1>;
> > +                     status="disabled";
> > +             };
> > +
> >               pixelvalve3: pixelvalve@7ec12000 {
> >                       compatible = "brcm,bcm2711-pixelvalve3";
> >                       reg = <0x7ec12000 0x100>;
>
> --
> Regards,
>
> Laurent Pinchart
