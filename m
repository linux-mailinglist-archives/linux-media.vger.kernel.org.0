Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3664722DA2E
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 00:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgGYWXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 18:23:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgGYWXk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 18:23:40 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6B1C08C5C0;
        Sat, 25 Jul 2020 15:23:40 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id n21so1613796ooj.5;
        Sat, 25 Jul 2020 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/L7HC9FCeyzYgMT+IxlUaZRqGkCYxLCIXJDAn9y6pzk=;
        b=q8phE1PUHXfc9MPXwKtkz/wNzWY+gC+ljFmEC97n19svm2EgLpKj5MxwAIesmjkOfc
         /lMQPG/M3nTHIomW5tV8dEQ376Et1sb6NV5LozASZuAuJ1b4n48Xc3JIqbjlIQVK5nsl
         hNJQhc3929KyZB63InOThHI34sONdPEPo9Zgnsuy1g3Y3SN2/RR8cICDagyYyECymzAf
         a3FBYGB+cXdDpx3ES/mlAgV2jwZG5XN/7kp36GEEPRV+9Mi2Bbm6fpqX1/pxoojge57P
         Y8VNBttYsCL9g9Mmjs93IZD3rF6pvBbae+O4yUOuOrJADw1nrIdWUoZYuhaAf8/weFug
         HbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/L7HC9FCeyzYgMT+IxlUaZRqGkCYxLCIXJDAn9y6pzk=;
        b=Gk5Q3/zAuOLE5vzkyMDYgnewunxetQh0cO71AN1weIHAH/QYmc2FKUtp6/W9TqKBr6
         XBnRqNDSVMUTQSrGxhrxcD7DgP5a6FcctNb+QXu2e147HuV8MfbV8tXuxC4BfiscNdNp
         gtWWr+p0bDg/YDhM8+4WzFfY2A3bhMLeAvclRIxC3l7uwWTsT6TUYlC3sSJNA/APm3Jh
         nWlzrBe1p8XO/O/+9bZHW65eoQAiG3TQiZmK/Pm91LACeTvEI6sZPczHe0OPxrdCJjs2
         0bDFp0DZsDbK3hNJO0X2Zk9t/c17U3kyMpF19vAjo3jHKMIGZ4oKuaY4gkFR0o7HSSjZ
         aRAA==
X-Gm-Message-State: AOAM533ukV75/WCAlFtW9ibwy/0yITxqcjSEe8xFMpe+u2DIF7k2TA8/
        +pAQye21r7f4VvKwhN0XsPcWnTVneD9//m33Pnk=
X-Google-Smtp-Source: ABdhPJw/6fivGtFF/BWxc0DPQbgy5oQjIh8SwuP0/uDlgxqe78F3d1C0BGEZl+JUoIj+xbDgt9mv8RcUuYGHT6/cDHc=
X-Received: by 2002:a4a:1d83:: with SMTP id 125mr15363801oog.18.1595715819572;
 Sat, 25 Jul 2020 15:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200724193752.GE2729799@oden.dyn.berto.se> <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
 <20200725081146.GF2729799@oden.dyn.berto.se>
In-Reply-To: <20200725081146.GF2729799@oden.dyn.berto.se>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 25 Jul 2020 23:23:13 +0100
Message-ID: <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
To:     Niklas <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sat, Jul 25, 2020 at 9:11 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
>
> Hi Lad,
>
> On 2020-07-24 22:11:31 +0100, Lad, Prabhakar wrote:
> > Hi Niklas,
> >
> > Thank you for the review.
> >
> > On Fri, Jul 24, 2020 at 8:37 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> > >
> > > Hi Lad,
> > >
> > > Thanks for your patch.
> > >
> > > On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> > > > Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
> > > > input pins.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > index 53c0a72..7dfb781 100644
> > > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > > @@ -106,6 +106,12 @@ properties:
> > > >
> > > >            remote-endpoint: true
> > > >
> > > > +          renesas-vin-ycbcr-8b-g:
> > >
> > > I think the preferred format for vendor specific properties are
> > > "<vendor>,<property>".
> > >
> > Indeed and I had it as renesas,vin-ycbcr-8b-g but dt_bindings_check
> > complained about it.
>
> I see, what was the error?
>
  CHKDT   Documentation/devicetree/bindings/media/renesas,vin.yaml
/home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
properties:port:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
{'type': 'boolean', 'description': 'If present this property specifies
to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.',
'default': False} is not valid under any of the given schemas
(Possible causes of the failure):
    /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
properties:port:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
'not' is a required property

/home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
properties:ports:properties:port@0:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
{'type': 'boolean', 'description': 'If present this property specifies
to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.',
'default': False} is not valid under any of the given schemas
(Possible causes of the failure):
    /home/prasmi/work/renasas/g2n/renesas-devel/Documentation/devicetree/bindings/media/renesas,vin.yaml:
properties:ports:properties:port@0:properties:endpoint:properties:renesas,vin-ycbcr-8b-g:
'not' is a required property

Documentation/devicetree/bindings/Makefile:20: recipe for target
'Documentation/devicetree/bindings/media/renesas,vin.example.dts'
failed
make[1]: *** [Documentation/devicetree/bindings/media/renesas,vin.example.dts]
Error 1
Makefile:1334: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


> >
> > > This nit apart I'm not sure a property is the right way here. Could it
> > > not be possible on some designs to have two different sensors one wired
> > > to DATA[7:0] and the other to DATA[15:8] and by controlling the
> > > VNDRM2_YDS register at runtime switch between the two? If so adding a DT
> > > property to hard-code one of the two options would prevent this. I fear
> > > we need to think of a runtime way to deal with this.
> > >
> > Aha Gen2 and Gen3 hardware manuals have a bit different description
> > about the YDS field. (I was working R8a7742 SoC so I referred Gen2
> > manual)
>
> Ahh, I think we should use the Gen3 names as I find them overall an
> improvement over the Gen2 ones.
>
Agreed.

> >
> > > The best way to do that I think is to extend the port@0 node to allow
> > > for two endpoints, one for each of the two possible parallel sensors.
> > > This would then have to be expressed in the media graph and selection if
> > > YDS should be set or not depend on which media links are enabled.
> > >
> > In that case how do we handle endpoint matching each would have two
> > subdevs to be matched.
>
> It would be handle in the same was as the multiple endpoints in port@1.
>
> > And in case non media-ctl cases we cannot
> > switch between subdevs.
>
> For the Gen2 none media graph enabled mode this could be handled with
> the S_INPUT ioctl. For this feature to be merged however I it needs to
> be possible to select input both in Gen2 and Gen3 I'm afraid.
Ohh yes S_INPUT could be used to switch inputs. But  how do we decide
YDS needs to be enabled, for example with the below dts say vin3 is
parallel bus split into 2x 8-bit bus one connected to a ov5640 sensor
and other connected to ov7725 sensor. Should we use data-shift
property for the second vin endpoint (vin3ep1) to enable YDS ?

&i2c3 {
    pinctrl-0 = <&i2c3_pins>;
    pinctrl-names = "default";

    status = "okay";
    clock-frequency = <400000>;

    ov7725@21 {
        status = "disabled";
        compatible = "ovti,ov7725";
        reg = <0x21>;
        clocks = <&mclk_cam4>;

        port {
            ov7725_3: endpoint {
                bus-width = <8>;
                bus-type = <6>;
                remote-endpoint = <&vin3ep0>;
            };
        };
    };

    ov5640@3c {
        status = "okay";
        compatible = "ovti,ov5640";
        reg = <0x3c>;
        clocks = <&mclk_cam4>;
        clock-names = "xclk";

        port {
            ov5640_3: endpoint {
                bus-width = <8>;
                bus-type = <6>;
                remote-endpoint = <&vin3ep1>;
            };
        };
    };
};

&vin3 {
    status = "okay";
    pinctrl-0 = <&vin3_pins>;
    pinctrl-names = "default";

    port {
        #address-cells = <1>;
        #size-cells = <0>;

        vin3ep0: endpoint {
            remote-endpoint = <&ov7725_3>;
            bus-width = <8>;
        };

        vin3ep1: endpoint {
            remote-endpoint = <&ov5640_3>;
            bus-width = <8>;
        };

    };
};


>I'm hoping to one day breakout the non MC part of this driver into a new one and
> mark it as deprecated and switch to the MC code paths for Gen2.
>
That sounds like a good idea.

Cheers,
--Prabhakar
