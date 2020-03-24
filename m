Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8261419159F
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 17:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgCXQFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 12:05:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38806 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgCXQFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 12:05:11 -0400
Received: by mail-oi1-f195.google.com with SMTP id w2so7967306oic.5;
        Tue, 24 Mar 2020 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BPzC8bByA/HvMLHNDuJ/sryGIc/DaJrplgVtUGBycE=;
        b=HHkvzsimNnAlbEd2ZUuSi3tppCCvuexXM92gmWz1PrPvT8/YodDM04j4ICKWyAnScu
         lQVc8GqPm4s6NagQmUmrlPB8LC59XBwe3fmOfxFvTQGDlBc/DJ2kCEYJuPyjN/jdZMCM
         WiGVrfbWQgF3pVXk+hsDa3w91B18+Biggx1VXjLNfI5FxYLHGf0VdRKmKAdrd2uze/Df
         j3/Cdi7oHcf5/pk9AXFpihMvrZN+eeoVsYw7CYhCxrifXYc4ZvSBdl2dCQZ6SZAoS63j
         7YOSDq8EkuTiktCrVOqggeQQ7SfhdhgjX+Rk4fNnZ0gV+jVf1rd/C3UA87E3s4iGSJBU
         XjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BPzC8bByA/HvMLHNDuJ/sryGIc/DaJrplgVtUGBycE=;
        b=EhYdHJTxBwrHxlB4+C3Ou4tFP6XqdGhA4pdUhNPWIFpPyOzFMILMtHu5rYnVdSWM5c
         cEK7WjSbMPV+aO/kLpNiwpvCTPEgNoF6XThm0D63tq84fs7uuG7D+1lGu/nzEqLYlYmX
         0YORDKY+cI7EB4LvGnZ15oCCimeBfBRbD1gSUnGETIJUNKyge4NNtkWjlhuDjxjeI3Jk
         exz7CvAvXepyoeuO9jaNTAHc8GF5/yZ92da+hQYq13mc/9IR/18Q/FBQf4F2kuWwOiZm
         avW2xOKtHW1f6iMtlccCilX/Sc2FKAuksFkGiHM5TlyfzDzCQfpjpq68hlmRjlkIcR4J
         DlQA==
X-Gm-Message-State: ANhLgQ1I7xffVsiugQC86JTFvcq4l9WR8SRzR6S1oPiJgW5PzcSVfJ6x
        gws2/S4LWmj/V1k/Rk2wEloH1zZuVl1+IpyDMGc=
X-Google-Smtp-Source: ADFU+vtuwcJhmNvSXVMH0kkPrvHbOp86UIi0sjchaCanrt6uGW6T2n+s1rq6XKFSlBRFrUjjFNxXPvfnLddzYsV6iIY=
X-Received: by 2002:aca:cf0d:: with SMTP id f13mr3817816oig.162.1585065910345;
 Tue, 24 Mar 2020 09:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319124452.3yfcvq754vi4q2rv@gilmour.lan> <20200319130348.GC4872@pendragon.ideasonboard.com>
 <CA+V-a8s-GZsYuBLyGnzURZfGD42f0c+QEan6FSwb2ew1=7Gj3g@mail.gmail.com> <20200324154045.whiy6uvlg2mrjv5a@gilmour.lan>
In-Reply-To: <20200324154045.whiy6uvlg2mrjv5a@gilmour.lan>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 24 Mar 2020 16:04:43 +0000
Message-ID: <CA+V-a8tMVoJOdgM_S0sJ0WEGhwBirCC4mi-TtxLCn1SKVXXiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Tue, Mar 24, 2020 at 3:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Mar 19, 2020 at 01:17:51PM +0000, Lad, Prabhakar wrote:
> > Hi Laurent,
> >
> > On Thu, Mar 19, 2020 at 1:04 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Maxime,
> > >
> > > On Thu, Mar 19, 2020 at 01:44:52PM +0100, Maxime Ripard wrote:
> > > > On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > > > > Use assigned-clock-rates to specify the clock rate. Also mark
> > > > > clock-frequency property as deprecated.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> > > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > index 72ad992..e62fe82 100644
> > > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > > @@ -8,7 +8,7 @@ Required Properties:
> > > > >  - compatible: Value should be "ovti,ov5645".
> > > > >  - clocks: Reference to the xclk clock.
> > > > >  - clock-names: Should be "xclk".
> > > > > -- clock-frequency: Frequency of the xclk clock.
> > > > > +- clock-frequency (deprecated): Frequency of the xclk clock.
> > > > >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > > >    to the hardware pin PWDNB which is physically active low.
> > > > >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > > > @@ -37,7 +37,8 @@ Example:
> > > > >
> > > > >                     clocks = <&clks 200>;
> > > > >                     clock-names = "xclk";
> > > > > -                   clock-frequency = <24000000>;
> > > > > +                   assigned-clocks = <&clks 200>;
> > > > > +                   assigned-clock-rates = <24000000>;
> > > > >
> > > > >                     vdddo-supply = <&camera_dovdd_1v8>;
> > > > >                     vdda-supply = <&camera_avdd_2v8>;
> > > >
> > > > clock-frequency is quite different from assigned-clock-rates though,
> > > > semantically speaking. clock-frequency is only about what the clock
> > > > frequency is, while assigned-clock-rates will change the rate as well,
> > > > and you have no idea how long it will last.
> > >
> > > The driver currently reads the clock-frequency property and then calls
> > > clk_set_rate(). I agree tht assigned-clock-rates isn't a panacea, but I
> > > think it's less of a hack than what we currently have.
> > >
> > > As discussed on IRC, maybe the best option in this specific case is to
> > > drop clock-frequency and assigned-clok-rates, and call clk_set_rate()
> > > with a hardcoded frequency of 24MHz in the driver, as that's the only
> > > frequency the driver supports.
> > >
> > Does this mean any driver which has a fixed clock requirement shouldn't be a
> > DT property and should be just handled by the drivers internally ?
>
> It's hard to give a generic policy, but here, the hardware is pretty
> flexible since it can deal with anything between 6MHz to 50-something
> MHz, it's the driver that chooses to enforce a 24MHz and be pedantic
> about it, so it's up to the driver to enforce that policy, not to the
> DT since it's essentially a software limitation, not a hardware one.
>
Thank you for the clarification, Ill drop patches 1-4 from this series.

Cheers,
--Prabhakar

> Maxime
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
