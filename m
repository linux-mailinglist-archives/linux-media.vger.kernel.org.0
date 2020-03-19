Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1695918B56C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729771AbgCSNST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:18:19 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34576 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729763AbgCSNSS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:18:18 -0400
Received: by mail-oi1-f195.google.com with SMTP id j5so2634509oij.1;
        Thu, 19 Mar 2020 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDQpti7t01GpCTV3F9lVKa0JXF79TC4yEbf9DOSPn8g=;
        b=mcAQ0yZCaJg48cbZ+UPok9xqwUcsLaZsb9fzmjLgeh8zdqkKXz81zq/ILbwNrBso2a
         MN4btAAs+YQirt8xgKGSVUBCNTD5zHSZMVoAo15X2tUTWsKNcvIDf9ULConjYj0Aprz0
         bpiQ94KXoh7flze0IXswZPt+qyF2ZmgAi+FL55Ar139q+XJxp4ZasBrKaZYUwGFxD95X
         tRz65ibnOZuh9KDbSY3lfdkiqYrn9QcbjX/2NHFqETcoSloqNpfMtrf5PdxLbZOgMjA/
         GFpujd6djm/SWaidRo4GwHfr2sGBvYlPciDOrkswyNdJYyeprCBX+oLvAN4PxdBkODDL
         lXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDQpti7t01GpCTV3F9lVKa0JXF79TC4yEbf9DOSPn8g=;
        b=NgK+Nb2BDfym+91DR2b7pBSA+2CY96Hu58aoFKaBGWv1hVxUi3LMHUIbeGKzWQfOTX
         cRj84OuHwjf7BcBJyUZy7/ApEnKoyjIOmlMuRZqm/cZDITEn9aPAzMjmfU3ew1OElFy5
         V7nXWvK2wOdeyJpgoKWZ39QBV/W3ZI0dmfiuFKR+NCTnxgpXOMNkrOcEmC4GvzxgQz4D
         6Ze6H/sdKpjGrYDoMC5/BjawN21XX1iTWSsNTCYtIQcVAvWt1YJp9JQdF+XXjgH1RLvH
         UPzUnfwG1RfHVMSnbserkpdWxnBkCOelT+igAGm8SF9nnWfc7+a+2/9ppZ1JxmmoWd6n
         tE5A==
X-Gm-Message-State: ANhLgQ2mBDrS3Luc0AhFr5qD3BrVu8k55A+T7Ghmgudo91RxlO2ImPKb
        oUCJ9i4Kq1deKpE18kMynHlkL52yCsAat6jNb1A=
X-Google-Smtp-Source: ADFU+vsS6/XH+ew6MFOJMJjm3XI7q3PIxIoAJ7KFCUkmkMgL0Zaluvh9eiLo/6KcPprvw6aGuxFV0AQaeSh8Jiiw3FI=
X-Received: by 2002:aca:ac89:: with SMTP id v131mr2290732oie.7.1584623898057;
 Thu, 19 Mar 2020 06:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200319124452.3yfcvq754vi4q2rv@gilmour.lan> <20200319130348.GC4872@pendragon.ideasonboard.com>
In-Reply-To: <20200319130348.GC4872@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 19 Mar 2020 13:17:51 +0000
Message-ID: <CA+V-a8s-GZsYuBLyGnzURZfGD42f0c+QEan6FSwb2ew1=7Gj3g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Mar 19, 2020 at 1:04 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime,
>
> On Thu, Mar 19, 2020 at 01:44:52PM +0100, Maxime Ripard wrote:
> > On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > > Use assigned-clock-rates to specify the clock rate. Also mark
> > > clock-frequency property as deprecated.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > index 72ad992..e62fe82 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > @@ -8,7 +8,7 @@ Required Properties:
> > >  - compatible: Value should be "ovti,ov5645".
> > >  - clocks: Reference to the xclk clock.
> > >  - clock-names: Should be "xclk".
> > > -- clock-frequency: Frequency of the xclk clock.
> > > +- clock-frequency (deprecated): Frequency of the xclk clock.
> > >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > >    to the hardware pin PWDNB which is physically active low.
> > >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > @@ -37,7 +37,8 @@ Example:
> > >
> > >                     clocks = <&clks 200>;
> > >                     clock-names = "xclk";
> > > -                   clock-frequency = <24000000>;
> > > +                   assigned-clocks = <&clks 200>;
> > > +                   assigned-clock-rates = <24000000>;
> > >
> > >                     vdddo-supply = <&camera_dovdd_1v8>;
> > >                     vdda-supply = <&camera_avdd_2v8>;
> >
> > clock-frequency is quite different from assigned-clock-rates though,
> > semantically speaking. clock-frequency is only about what the clock
> > frequency is, while assigned-clock-rates will change the rate as well,
> > and you have no idea how long it will last.
>
> The driver currently reads the clock-frequency property and then calls
> clk_set_rate(). I agree tht assigned-clock-rates isn't a panacea, but I
> think it's less of a hack than what we currently have.
>
> As discussed on IRC, maybe the best option in this specific case is to
> drop clock-frequency and assigned-clok-rates, and call clk_set_rate()
> with a hardcoded frequency of 24MHz in the driver, as that's the only
> frequency the driver supports.
>
Does this mean any driver which has a fixed clock requirement shouldn't be a
DT property and should be just handled by the drivers internally ?

Cheers,
--Prabhakar

> > If you want to retrieve that through the clock framework, then just
> > making clock-frequency optional is enough and falling back to
> > clk_get_rate on the clocks property already provided is enough.
>
> --
> Regards,
>
> Laurent Pinchart
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
