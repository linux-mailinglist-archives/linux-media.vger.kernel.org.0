Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443C818A38C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 21:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgCRUN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 16:13:28 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42414 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgCRUN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 16:13:27 -0400
Received: by mail-oi1-f194.google.com with SMTP id 13so158390oiy.9;
        Wed, 18 Mar 2020 13:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TTrA+tMwfg5GaaL0pTTB4SX2vmA9Q9FMRW/WsoCZ0JE=;
        b=EdyaXSK/9dSzcuY7KwTimocBCtQucM4yN4ilyd0nhsZPKf/UZPVgHsa27qIqIEWXnQ
         cPh0Eqo1ASE1ekQGfsFtJNbZhhy1L/klvGKLYsRpvUQhWP06l5H7cwN0ynA4d7cnjgB9
         +mSQIHNkMZW8leB3bfjIIfD9iUaGIpkiVUeiZ526JEb9RorazGGJUyLQGtYJ1Rp9Vngi
         XiuI7qVILh/vxu/878w2zvYPf99V8I/i1Fon1swKN8rVHN1BILMMtig7NlQzyC2xR3Vl
         90HSAqD4+MRRWe0jOLDzen4quH5t9LZP3htJmM24EpiC7E4DvRe4sti7AhcEdUghPqIK
         ZVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TTrA+tMwfg5GaaL0pTTB4SX2vmA9Q9FMRW/WsoCZ0JE=;
        b=ekdjUyFQv2TSMcoOYLYe9YJcq4hwSQZM4jcNX3jjjug/alRE/pMZGcnMhKi6qxWYm8
         s19DRdCoZAjj++czh1IdTQIPfulOAFIO0pjmoUogbRutOvo3P9zmoFuhJIScr9yuIM7H
         LiPFmlt3bLaEsfVe9Io0UP1sMtlOr297ax5ZdBhvP6JpYKexSVx8h7Z19P+hFHT0uQ5U
         0TbLIKFECs2B99Stk787Ox7zS2QZEIuPJAwUvXrLcbNv9M3JfR9iDm643kOniuCaP3rC
         GXvs6NE8BFXUyxA5E+JtjfsodSJnTih8OvHzSR/EAFh5iNlVJ27OsLztNL8VIsy6+Tnw
         AC9Q==
X-Gm-Message-State: ANhLgQ3CT6GATjWRYXWJgU3Y5G2ceYxba5LOOu3bFvru0B56hu1ruLgn
        +4u4eD5MZpgdKJ1k4jg/+CQUuaZoPPNeiR0ls4M=
X-Google-Smtp-Source: ADFU+vufu0AMNL2diBAQJHFss43B9g2oEZMBku7DzmuqAqCY+mQmcA2SGVTBSVyu9mf3O/z+lZkGA1kzO8O/MIO5lqs=
X-Received: by 2002:aca:7512:: with SMTP id q18mr4630250oic.71.1584562407110;
 Wed, 18 Mar 2020 13:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212012.GL4751@pendragon.ideasonboard.com> <OSBPR01MB35905D6D72DCBF154FCF7C88AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200313212717.GO4751@pendragon.ideasonboard.com>
In-Reply-To: <20200313212717.GO4751@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 18 Mar 2020 20:13:00 +0000
Message-ID: <CA+V-a8veXbwMrda8UEu2mN6gGgrBJA8Mp7gdN7Q3-iXNw9c4pg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to assigned-clock-rates
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Mar 13, 2020 at 9:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Mar 13, 2020 at 09:25:01PM +0000, Prabhakar Mahadev Lad wrote:
> > On Sent: 13 March 2020 21:20, Laurent Pinchart wrote:
> > > On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> > > > Use assigned-clock-rates to specify the clock rate. Also mark
> > > > clock-frequency property as deprecated.
> > >
> > > I would phrase it the other way around, this patch mainly deprecates clock-
> > > frequency, and as a side effect recommends usage of assigned-clock-rates.
> > >
> > > "Deprecate usage of the clock-frequency propertly. The preferred method
> > > to set clock rates is to use assigned-clock-rates."
> >
> > Agreed will do that.
> >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > index 72ad992..e62fe82 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> > > > @@ -8,7 +8,7 @@ Required Properties:
> > > >  - compatible: Value should be "ovti,ov5645".
> > > >  - clocks: Reference to the xclk clock.
> > > >  - clock-names: Should be "xclk".
> > > > -- clock-frequency: Frequency of the xclk clock.
> > > > +- clock-frequency (deprecated): Frequency of the xclk clock.
> > >
> > > I would drop this completely. Drivers need to ensure backward compatibility,
> > > but DT bindings should only document the latest version, the history is
> > > available in git.
> > >
> > Sure will drop it.
> >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > While at it, can I enlist you to convert these bindings to yaml ? :-)
> > >
> > Sure will do the honours , will make sure yaml patch is ontop of this patch too.
>
Shall I enlist you as the maintainer  in the json-schema ?
dt_binding_check says  'maintainers' is a required property.

Cheers,
--Prabhakar Lad

> Thank you :-)
>
> > > >  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
> > > >    to the hardware pin PWDNB which is physically active low.
> > > >  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> > > > @@ -37,7 +37,8 @@ Example:
> > > >
> > > >  clocks = <&clks 200>;
> > > >  clock-names = "xclk";
> > > > -clock-frequency = <24000000>;
> > > > +assigned-clocks = <&clks 200>;
> > > > +assigned-clock-rates = <24000000>;
> > > >
> > > >  vdddo-supply = <&camera_dovdd_1v8>;
> > > >  vdda-supply = <&camera_avdd_2v8>;
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
