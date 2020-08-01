Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA6BD235166
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 11:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgHAJSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 05:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgHAJSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 05:18:03 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCB2C06174A
        for <linux-media@vger.kernel.org>; Sat,  1 Aug 2020 02:18:02 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so34789550ljm.1
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2020 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=juUuQ7M3S/35ajQnAoRJaogau1CgGc53/hKnK5UbCxQ=;
        b=h7C9tavfnUU6IHBu7CiD8DSDfxyQ8isDKIiOx2X74bX/jIg+M30bmR26fnC/ZeVbcC
         Q2P6CdVlX8YjW0QzDldb/Xz2504UMH/FH4ppHr5jmUJUW5tTOsF4gu6cek3NHATlTIP5
         +Gbzi6IJDCoIktiMOnkUM0OPyc4jYEZXmb/L0MC+yI5GRrdF5W4MDSTaAyXGyIZQZ5Dx
         SlnDyFuLEgguYxQH5HFYYUxqIgsQe19mSwKy0nAErAWc0uZBTumekk+fUa92qs5mwgwE
         iAcGzsqQoEdMy9Ct2De0uqpbAT2sVmQYYNmEKJZ2mefRAdDeu6Y3M6jeVnvmV49Ff6be
         UmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=juUuQ7M3S/35ajQnAoRJaogau1CgGc53/hKnK5UbCxQ=;
        b=hW1ncZOBBGcpMTw5KtvDysOcN57y1szF4YsdH5KdWIeNsqcvXzvIabwajeZMhY3w9d
         UZKqDowjjK5JlAaAjSJjpwg+i9CPbvLQQ5qSetzPpquXDBPG0GUl6EJ6AtLF8hmioILd
         6tYkc7K7UKzi62noB6nkp7EtXJ2z54IUSqYSpsSicbgP7N/hcs/Ssq30sfLU9z+VP9l0
         L1HOFTAJBo6bCLI9eEQB7WrSNE3uTBmRJf1QEUyFa0nMjs50xDdhCkn2I03jEY3DMqKt
         mo9eIq57iRP9R+fua+i6EMzXuQElt+3ZyuRawlAlZf8LAwXJOQ81XYG1sEZ3iKxilL7H
         EZFg==
X-Gm-Message-State: AOAM533ih2jnXW26N2CcoCIp/waLVNTp8La5EWf6NdQomahRCCyhg8jX
        bsIgVyijnvEKH7vn09GPhRWGtA==
X-Google-Smtp-Source: ABdhPJwKAdC9qxsmrgOmBOUPaoMBp/Kxq8FwNCK2GJuHLQnLFVywwAEZeSTDHkZGKzfPDaw67erOSA==
X-Received: by 2002:a2e:98d0:: with SMTP id s16mr3337344ljj.457.1596273481068;
        Sat, 01 Aug 2020 02:18:01 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e12sm2227533ljk.74.2020.08.01.02.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 02:18:00 -0700 (PDT)
Date:   Sat, 1 Aug 2020 11:17:59 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
Message-ID: <20200801091759.GC1379367@oden.dyn.berto.se>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200724193752.GE2729799@oden.dyn.berto.se>
 <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
 <20200725081146.GF2729799@oden.dyn.berto.se>
 <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 2020-07-25 23:23:13 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> On Sat, Jul 25, 2020 at 9:11 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Lad,
> >
> > On 2020-07-24 22:11:31 +0100, Lad, Prabhakar wrote:
> > > Hi Niklas,
> > >
> > > Thank you for the review.
> > >
> > > On Fri, Jul 24, 2020 at 8:37 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > > >
> > > > Hi Lad,
> > > >
> > > > Thanks for your patch.
> > > >
> > > > On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> > > > > Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
> > > > > input pins.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > index 53c0a72..7dfb781 100644
> > > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > > @@ -106,6 +106,12 @@ properties:
> > > > >
> > > > >            remote-endpoint: true
> > > > >
> > > > > +          renesas-vin-ycbcr-8b-g:
> > > >
> > > > I think the preferred format for vendor specific properties are
> > > > "<vendor>,<property>".
> > > >
> > > Indeed and I had it as renesas,vin-ycbcr-8b-g but dt_bindings_check
> > > complained about it.
> >
> > I see, what was the error?
> >
>   CHKDT   Documentation/devicetree/bindings/media/renesas,vin.yaml
> /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
> properties:port:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
> {'type': 'boolean', 'description': 'If present this property specifies
> to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.',
> 'default': False} is not valid under any of the given schemas
> (Possible causes of the failure):
>     /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
> properties:port:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
> 'not' is a required property
> 
> /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
> properties:ports:properties:port@0:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
> {'type': 'boolean', 'description': 'If present this property specifies
> to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.',
> 'default': False} is not valid under any of the given schemas
> (Possible causes of the failure):
>     /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
> properties:ports:properties:port@0:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
> 'not' is a required property
> 
> Documentation/devicetree/bindings/Makefile:20: recipe for target
> 'Documentation/devicetree/bindings/media/renesas,vin.example.dts'
> failed
> make[1]: *** [Documentation/devicetree/bindings/media/renesas,vin.example.dts]
> Error 1
> Makefile:1334: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> 
> > >
> > > > This nit apart I'm not sure a property is the right way here. Could it
> > > > not be possible on some designs to have two different sensors one wired
> > > > to DATA[7:0] and the other to DATA[15:8] and by controlling the
> > > > VNDRM2_YDS register at runtime switch between the two? If so adding a DT
> > > > property to hard-code one of the two options would prevent this. I fear
> > > > we need to think of a runtime way to deal with this.
> > > >
> > > Aha Gen2 and Gen3 hardware manuals have a bit different description
> > > about the YDS field. (I was working R8a7742 SoC so I referred Gen2
> > > manual)
> >
> > Ahh, I think we should use the Gen3 names as I find them overall an
> > improvement over the Gen2 ones.
> >
> Agreed.
> 
> > >
> > > > The best way to do that I think is to extend the port@0 node to allow
> > > > for two endpoints, one for each of the two possible parallel sensors.
> > > > This would then have to be expressed in the media graph and selection if
> > > > YDS should be set or not depend on which media links are enabled.
> > > >
> > > In that case how do we handle endpoint matching each would have two
> > > subdevs to be matched.
> >
> > It would be handle in the same was as the multiple endpoints in port@1.
> >
> > > And in case non media-ctl cases we cannot
> > > switch between subdevs.
> >
> > For the Gen2 none media graph enabled mode this could be handled with
> > the S_INPUT ioctl. For this feature to be merged however I it needs to
> > be possible to select input both in Gen2 and Gen3 I'm afraid.
> Ohh yes S_INPUT could be used to switch inputs. But  how do we decide
> YDS needs to be enabled, for example with the below dts say vin3 is
> parallel bus split into 2x 8-bit bus one connected to a ov5640 sensor
> and other connected to ov7725 sensor. Should we use data-shift
> property for the second vin endpoint (vin3ep1) to enable YDS ?

Using data-shift is a great idea! If I understand your use-case you 
currently only have one sensor attached on the parallel bus right? If so 
we can postpone the multi sensor part until it's needed and just learn 
the VIN driver about data-shift. From the documentation,

  - data-shift: on the parallel data busses, if bus-width is used to 
    specify the number of data lines, data-shift can be used to specify 
    which data lines are used, e.g. "bus-width=<8>; data-shift=<2>;" 
    means, that lines 9:2 are used.

So in this case would not specifying data-shift=<8> solve the DT 
description problem? The VIN driver still needs to learn about this tho.

> 
> &i2c3 {
>     pinctrl-0 = <&i2c3_pins>;
>     pinctrl-names = "default";
> 
>     status = "okay";
>     clock-frequency = <400000>;
> 
>     ov7725@21 {
>         status = "disabled";
>         compatible = "ovti,ov7725";
>         reg = <0x21>;
>         clocks = <&mclk_cam4>;
> 
>         port {
>             ov7725_3: endpoint {
>                 bus-width = <8>;
>                 bus-type = <6>;
>                 remote-endpoint = <&vin3ep0>;
>             };
>         };
>     };
> 
>     ov5640@3c {
>         status = "okay";
>         compatible = "ovti,ov5640";
>         reg = <0x3c>;
>         clocks = <&mclk_cam4>;
>         clock-names = "xclk";
> 
>         port {
>             ov5640_3: endpoint {
>                 bus-width = <8>;
>                 bus-type = <6>;
>                 remote-endpoint = <&vin3ep1>;
>             };
>         };
>     };
> };
> 
> &vin3 {
>     status = "okay";
>     pinctrl-0 = <&vin3_pins>;
>     pinctrl-names = "default";
> 
>     port {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         vin3ep0: endpoint {
>             remote-endpoint = <&ov7725_3>;
>             bus-width = <8>;
>         };
> 
>         vin3ep1: endpoint {
>             remote-endpoint = <&ov5640_3>;
>             bus-width = <8>;
>         };
> 
>     };
> };
> 
> 
> >I'm hoping to one day breakout the non MC part of this driver into a new one and
> > mark it as deprecated and switch to the MC code paths for Gen2.
> >
> That sounds like a good idea.
> 
> Cheers,
> --Prabhakar

-- 
Regards,
Niklas Söderlund
