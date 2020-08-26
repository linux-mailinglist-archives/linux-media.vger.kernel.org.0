Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE667252965
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 10:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgHZIml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 04:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgHZImk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 04:42:40 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D25C061574;
        Wed, 26 Aug 2020 01:42:39 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id e187so527678ybc.5;
        Wed, 26 Aug 2020 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ViRH3laE2QbcXmDZtwWF8vjYiOD2tb9bGM2bDxMEN8=;
        b=X0VVbmuUJHi6o5GDPu5Rii7Jn/Fo8SgPsvLw/ez1EoYyPNAEMbIhIqEtb8L3eUXbEB
         v3OyK5N9Z4r9C6Coen1ap1iN1J8pP81oVIAiZ1zCS/VIRPVXdZigVv3sl0r8s1XpxRJF
         lgtV1tDHzgDwUw62d/V2vMUwvHw4qEVL7cDZmxsH5bgiwnocbPCE6kw2fQaodfOlPuiD
         ATF3K/hFS27Pnh1Hcq80exFSgA0s44mjOnAGufxdwYvodR+ptOg6qe7BO+rH0CLpHlh0
         0ivEWiu+cMDdRCV59zzJsam8m831izTlLsPTAPgXlafjuMx/w2l5ZQWfhtv2Ib2jJHHs
         cUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ViRH3laE2QbcXmDZtwWF8vjYiOD2tb9bGM2bDxMEN8=;
        b=uToHZRSiulkRnREmbc0zKOOx4zq6mwbsf56LIzvrTPM8yMhe58KGe5r9l1CpZNdasi
         1ZtlZpAz3bGATLtLzEzaGhQj8IaRmGkKMhnhgjLg0G3w6LfseC7sVSjQFL2rakfVgxch
         7FffL0/3UtnXPgVm4aSGMHXaXga1sCpYP+6cskrhBe4CoKZMOBZDIpeu86HsrLiRJmPc
         xJZvg+Ct7jywygTNgpvJBzlJtfFoP8x2LKja8ki8kTpX2T0ULezj2j0x3TnbmBP/iaoy
         /zeTo2XKpw25I5uFOArrs+OMsdvo9ZVzWy7GYqdWbo7tIXbZNSuVLWCzjI3KMjh6ew+H
         W69g==
X-Gm-Message-State: AOAM530sqRsRKh9gR+MlvF0eUxT9UwB5SIOTsvpCHYuJmEFrKEGX9HHd
        ACmrOnvM9RtWcZnmBXGvJB+2BdN+OGgN/HNpcC9eRVez4ww=
X-Google-Smtp-Source: ABdhPJydZXzgmPSm5JZRguhED1DhJVJC8Twsauvyt4K0uczjLU0+k0YjqfEeXomhfbtwgHveaq2Z2SnvbsMz60CworU=
X-Received: by 2002:a25:8149:: with SMTP id j9mr20646722ybm.214.1598431358936;
 Wed, 26 Aug 2020 01:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-4-jacopo+renesas@jmondi.org> <20200819135423.GL6049@pendragon.ideasonboard.com>
 <CA+V-a8sxDJXrGM-MYEwNS=D-eyA6oTRvDU3YT7Uu5Ph5kFh15w@mail.gmail.com> <20200822013558.GN5967@pendragon.ideasonboard.com>
In-Reply-To: <20200822013558.GN5967@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 26 Aug 2020 09:42:12 +0100
Message-ID: <CA+V-a8uUp1XLEo_w=5vaVgXfCeepCg6SdXz_27RX6=gYR4bM8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
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

Hi Laurent,

On Sat, Aug 22, 2020 at 2:36 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Aug 21, 2020 at 12:37:35PM +0100, Lad, Prabhakar wrote:
> > On Wed, Aug 19, 2020 at 2:54 PM Laurent Pinchart wrote:
> > > On Tue, Aug 18, 2020 at 02:20:12PM +0200, Jacopo Mondi wrote:
> > > > Document endpoint properties for the parallel bus type and
> > > > add them to the example.
> > > >
> > > > Specify a few constraints:
> > > > - If the bus type is BT.656 no hsync or vsycn polarities can be
> > > >   specified.
> > > > - If the bus width is 10 bits, not data-shift can be applied.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
> > > >  1 file changed, 43 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > index 75dad40f70cc..3fad5dffd19a 100644
> > > > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> > > > @@ -50,9 +50,47 @@ properties:
> > > >            bus-type:
> > > >              enum: [5, 6]
> > > >
> > > > +          bus-width:
> > > > +            enum: [8, 10]
> > > > +            default: 10
> > > > +
> > > > +          data-shift:
> > > > +            enum: [0, 2]
> > > > +            default: 0
> > > > +
> > > > +          hsync-active:
> > > > +            enum: [0, 1]
> > > > +            default: 1
> > > > +
> > > > +          vsync-active:
> > > > +            enum: [0, 1]
> > > > +            default: 1
> > > > +
> > > > +          pclk-sample:
> > > > +            enum: [0, 1]
> > > > +            default: 1
> > > > +
> > > >            remote-endpoint:
> > > >              description: A phandle to the bus receiver's endpoint node.
> > > >
> > > > +        allOf:
> > > > +          - if:
> > > > +              properties:
> > > > +                bus-type:
> > > > +                  const: 6
> > > > +            then:
> > > > +                properties:
> > > > +                  hsync-active: false
> > > > +                  vsync-active: false
> > > > +
> > > > +          - if:
> > > > +              properties:
> > > > +                bus-width:
> > > > +                  const: 10
> > > > +            then:
> > > > +                properties:
> > > > +                  data-shift:
> > > > +                    const: 0
> > >
> > > I'd add a blank line here.
> > >
> > > >          required:
> > > >            - bus-type
> > >
> > > Should some of the properties be required ? Possibly conditioned on
> > > bus-type ?
> >
> > Agreed, would be interesting to know how this can be handled (split
> > out bus-type and add required properties for each) ?
>
> We can add required: statements to the above if/then/else.
>
Aha thanks for pointing out. (I hadn't come across such cases)

Cheers,
Prabhakar
