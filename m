Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C200252973
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 10:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgHZIrr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 04:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgHZIrr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 04:47:47 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF0CC061574;
        Wed, 26 Aug 2020 01:47:46 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id q16so533590ybk.6;
        Wed, 26 Aug 2020 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lruyw8GvL80kmI5nXyD7sO7yYu4G2/PuPm130bi0g7E=;
        b=qFquYDbeA3eFWMoPiq7/OM0jni2mq/il8idAV8WdurSrBfLcmieql2HjJDttIVO8C1
         XGIBlNi6qvekgBApEKXQfB48rryKYsKmBlHnndN14dMncUwtLlUyoEEUEaNBZXcN7m+z
         y7pCxFuc2Dtp0/zhZe52+VrudGPlxHU08e6gQ3Qguf5e1+gDwNeJ9HevdaY/7pKat77p
         co0xuwW4LXCktRbN2RsLWcQ1KwshcWBG3TQPzKrhpF3EpTUtU947GsBHn6C83jfrEP2I
         54z9iK6YstuA1mSjgLnMwBwJ/4zPQdez+MimqJ4dP9kokWxQSxKFVVYFlPozgFSbvzQB
         d55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lruyw8GvL80kmI5nXyD7sO7yYu4G2/PuPm130bi0g7E=;
        b=dmC+NKTxK6h9saknf84A99BygDzTAPRQ9AuG3tqi2eLQSE/TwQVzSRiEvancAUNWK7
         RJa/31sD3vhXBMAonLr5c0ahrbJ3btIr1yH5A8IaEsDykIkMcAzObSAZd3gq0fOu7ElA
         ArnsNaEwY1dym16ZzwV8HrLlDYvm5cLhNXtH6QpYv+fE+YEt4o2pJprAUENlzyZGxHFI
         nMMwL4ktL/5xaJDB9v20q4GwaK9rICL+iAFyEET7ObY7NG2AU+skTeC1vAGzpM0Txs9+
         ivg2QZt0zKkf8SQQRn8EBuF14hTU6xH/ZNC3WfQNkx6awiA+MyCjIGOgwI+X/CMhihNo
         Fp/g==
X-Gm-Message-State: AOAM530eMQisOFsBezzMRdXX37H4eB63z68S/7tsjgtZY5JihUGKRsUB
        2OSebOwvLlkPKF6lsOqjitzmb+fmvNRKJqvDnLs=
X-Google-Smtp-Source: ABdhPJwJ+OvS14hOzVUrhaD2PYGnZpLRTwqy0wUw/Tu+KA74UuQ12DAQLcFIP4ZW003GGGnkqMKIx6ZiYW6GVUIBtPM=
X-Received: by 2002:a25:e712:: with SMTP id e18mr19092197ybh.395.1598431666120;
 Wed, 26 Aug 2020 01:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-4-jacopo+renesas@jmondi.org> <20200819135423.GL6049@pendragon.ideasonboard.com>
 <CA+V-a8sxDJXrGM-MYEwNS=D-eyA6oTRvDU3YT7Uu5Ph5kFh15w@mail.gmail.com> <20200824083552.v7s5gggqcviigvzu@uno.localdomain>
In-Reply-To: <20200824083552.v7s5gggqcviigvzu@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 26 Aug 2020 09:47:20 +0100
Message-ID: <CA+V-a8vs1r7qH3KZx+U66mp7w-Z9H4fpH_i3ko+euqG6OpwVYw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
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

Hi Jacopo

On Mon, Aug 24, 2020 at 9:32 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Laurent, Prabhakar,
>
> On Fri, Aug 21, 2020 at 12:37:35PM +0100, Lad, Prabhakar wrote:
> > Hi Laurent and Jacopo
> >
> > On Wed, Aug 19, 2020 at 2:54 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
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
> > >
>
> I am not sure. They all have defaults, as reported here and as
> supported by the driver. There's nothing -strictly- required, as long
> as the here reported defaults are correct.
>
Agreed, ran dt_binding_check and looks good so,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> > Agreed, would be interesting to know how this can be handled (split
> > out bus-type and add required properties for each) ?
> >
>
> That already happens with
>
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 6
> +            then:
> +                properties:
> +                  hsync-active: false
> +                  vsync-active: false
>
> And could be expanded, if we want any of these to be required.
>
> Thanks
>   j
>
> > Cheers,
> > Prabhakar
> >
> > > >
> > > > @@ -82,6 +120,11 @@ examples:
> > > >              port {
> > > >                  ov772x_0: endpoint {
> > > >                      bus-type = <5>;
> > > > +                    vsync-active = <0>;
> > > > +                    hsync-active = <0>;
> > > > +                    pclk-sample = <0>;
> > > > +                    bus-width = <8>;
> > > > +                    data-shift = <0>;
> > > >                      remote-endpoint = <&vcap1_in0>;
> > > >                  };
> > > >              };
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
