Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882A624D421
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 13:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgHULiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 07:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728284AbgHULiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 07:38:03 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA2CC061385;
        Fri, 21 Aug 2020 04:38:03 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id p191so887278ybg.0;
        Fri, 21 Aug 2020 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OkIK/dZ2Mgt//fkmDHOJQ3SHXplluJWee1ZVxzLQD9E=;
        b=cT/984PPUunLzXowyppHLeT4YU0JjTauMQNZzsugiYeMiLoHw6rZKaH3TbbmKAdJi1
         ej91Eaq+KcwmvIFhjjFj4SMKoQNE1s0d5eZVF+EoXpUkm+AU+Tjk2zm8d2mmDk3jjAbm
         fI0wgP8Q4lZBtFhs3lQz0d6WMyvbPoNnQ/n2R1NSxETDX2z2/cxZCmfIgzRxk9PCeAmI
         i1HeRmJTKG6H9eYCW9y4/9rEuEgOFFjH7CvVofgGcshy6szHurdQ9hn046p/J+ROD9y2
         A5LBZfLFYhFNxGcYg7N/FTNTW7y8D29myCFN+LU3tD28MPiKKqE9zp8DI26V4kqeO1w+
         MCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OkIK/dZ2Mgt//fkmDHOJQ3SHXplluJWee1ZVxzLQD9E=;
        b=HuBJEzO4rqQaXfLD2WcTX4fibp8j3/W4XvZGQPgPs9U5gj5PfLGZnSG4Z7rlcSANOW
         RlUIL6B+Ez+J193LSmsGiBcHLulDUSee7iUbf00lD6eL0dYHxKhMh4SIVGG2ZoX0/3PD
         43LCyl+fjK+g6xE2UTpILvtQzEAgPqXI47HhuEdvoRL7yWjqdXzd4vBidsjB/PiT+6C4
         YC61T9SM85lO+sXobjV+4jRXS5mU/y1HOKpg4Mj5pYsFSkhD5RApulbrNFjwVJJWZLkY
         vleFHvYcoUlPEMAH/ZYvVcb6nS8OdekKWMe2Ard977B6ONX9wbwEs6T68lxcw3XSUJoH
         eE9g==
X-Gm-Message-State: AOAM532YDb0DmrLRDUKTFjASCm2g+fxl+qDAUm865GwvSFRFxl4wWbOG
        xBwGXDbUCDWQmKC8MWw+j10GBMSdP5M0WLlTYaY=
X-Google-Smtp-Source: ABdhPJzOUQ7z+wYHExuvCZTZfc4BvrCPM5gPv8JOYJe952Ot0fbk9SzYIqjPi/4vrcYDl96EqC1S8XBMBg26dzJtdNw=
X-Received: by 2002:a25:2f4d:: with SMTP id v74mr2868323ybv.401.1598009881871;
 Fri, 21 Aug 2020 04:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-4-jacopo+renesas@jmondi.org> <20200819135423.GL6049@pendragon.ideasonboard.com>
In-Reply-To: <20200819135423.GL6049@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 21 Aug 2020 12:37:35 +0100
Message-ID: <CA+V-a8sxDJXrGM-MYEwNS=D-eyA6oTRvDU3YT7Uu5Ph5kFh15w@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent and Jacopo

On Wed, Aug 19, 2020 at 2:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Aug 18, 2020 at 02:20:12PM +0200, Jacopo Mondi wrote:
> > Document endpoint properties for the parallel bus type and
> > add them to the example.
> >
> > Specify a few constraints:
> > - If the bus type is BT.656 no hsync or vsycn polarities can be
> >   specified.
> > - If the bus width is 10 bits, not data-shift can be applied.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > index 75dad40f70cc..3fad5dffd19a 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > @@ -50,9 +50,47 @@ properties:
> >            bus-type:
> >              enum: [5, 6]
> >
> > +          bus-width:
> > +            enum: [8, 10]
> > +            default: 10
> > +
> > +          data-shift:
> > +            enum: [0, 2]
> > +            default: 0
> > +
> > +          hsync-active:
> > +            enum: [0, 1]
> > +            default: 1
> > +
> > +          vsync-active:
> > +            enum: [0, 1]
> > +            default: 1
> > +
> > +          pclk-sample:
> > +            enum: [0, 1]
> > +            default: 1
> > +
> >            remote-endpoint:
> >              description: A phandle to the bus receiver's endpoint node.
> >
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                bus-type:
> > +                  const: 6
> > +            then:
> > +                properties:
> > +                  hsync-active: false
> > +                  vsync-active: false
> > +
> > +          - if:
> > +              properties:
> > +                bus-width:
> > +                  const: 10
> > +            then:
> > +                properties:
> > +                  data-shift:
> > +                    const: 0
>
> I'd add a blank line here.
>
> >          required:
> >            - bus-type
>
> Should some of the properties be required ? Possibly conditioned on
> bus-type ?
>
Agreed, would be interesting to know how this can be handled (split
out bus-type and add required properties for each) ?

Cheers,
Prabhakar

> >
> > @@ -82,6 +120,11 @@ examples:
> >              port {
> >                  ov772x_0: endpoint {
> >                      bus-type = <5>;
> > +                    vsync-active = <0>;
> > +                    hsync-active = <0>;
> > +                    pclk-sample = <0>;
> > +                    bus-width = <8>;
> > +                    data-shift = <0>;
> >                      remote-endpoint = <&vcap1_in0>;
> >                  };
> >              };
>
> --
> Regards,
>
> Laurent Pinchart
