Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C4C4904B7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 10:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235597AbiAQJXc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 04:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbiAQJXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 04:23:31 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BC8FC06173E
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 01:23:31 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id br17so55191884lfb.6
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 01:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=k0cfcD39y/3sDNQaa30NikkTggeMzy9AFVo7QaPEGY8=;
        b=zN7iolHQDgeWpC9OIhg9O5pif9q1PmcrogDzuDQPCXnVG8Aj6+uZVBD4Ck85XTIVYd
         A+nUdoA8YUqvC2d7ZqrfWUi1GW7agod+xmVhGP69PKaH+sWNyV2qeE+mIzAy4uZ7bM1G
         otdQdee9jUucSngD9djwupvyYuDvU0gRjf3k0LN6keNSXzSIXXEZTjb+LNCe0Yc+ZmOt
         /PZvRMDqUgTJBkWKTnGBw5xRPfDrT0srdkFJhvGiVofwcDtYlIww9icseWmMbk9cUTLu
         F3AWGAYoU0yP09U2Yc+cx4WeA+fYS7YPpAySHhccK5rzpuzX5aifcIwXfHyo4YZ538vm
         Xtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=k0cfcD39y/3sDNQaa30NikkTggeMzy9AFVo7QaPEGY8=;
        b=LsvMzhvVOAmBWporOq5ZfWC0MDNr9IRCZF3jlB0FNR5IrQdIo8EHrgvEhBgEjDp1LT
         Yp8TTU3YhA9bY3zan1W0vd/aojNxpreSwVJguAK1vfhL19eJohSwyZeuqTFgGyFRvwSa
         f7lG5NopPChAHeg4PqEHTCL9Ha/2n96DvyygTFqRaplcdKx/dsu7xmzRoNFu25Vlg/kv
         23mlNIGVBjQrJsYNZlTMNi04gludesXtVvuHE03MKy+nsVqZYo4+i6aBNT8EJaLHrxHJ
         X/LPNanootv4Lq7fmXdKz9BCTm2vBkqzCvf+humSJh2m+ZsST8Cj2IOowrDgnbwkyfWR
         Dpdg==
X-Gm-Message-State: AOAM530V+58Op4KeMuZu2W7VZLFwg3e+6oHWmT6AfQLMl4z+ZkvhQyEt
        7WXtobK1m+QGdahm6vx8goReIg==
X-Google-Smtp-Source: ABdhPJzP68J0q8Zi3yeJQsgD0w1S5UKKr27gp4K3ZswRT06lTANaZdjqeTtT1emEMZIU1BPEle/Nrg==
X-Received: by 2002:a05:6512:1597:: with SMTP id bp23mr15225015lfb.572.1642411409521;
        Mon, 17 Jan 2022 01:23:29 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id i36sm1334556lfv.201.2022.01.17.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 01:23:29 -0800 (PST)
Date:   Mon, 17 Jan 2022 10:23:28 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,csi2: Update
 data-lanes property
Message-ID: <YeU1kDee7L26QJ86@oden.dyn.berto.se>
References: <20220113103215.27080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220117081110.bkwr3ttoexgr2wjt@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220117081110.bkwr3ttoexgr2wjt@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jacopo,

On 2022-01-17 09:11:10 +0100, Jacopo Mondi wrote:
> Hello Prabhakar,
> 
> On Thu, Jan 13, 2022 at 10:32:14AM +0000, Lad Prabhakar wrote:
> > CSI-2 (CSI4LNK0) on R-Car and RZ/G2 supports 4-lane mode which is already
> > handled by rcar-csi2.c driver. This patch updates the data-lanes property
> > to describe the same.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/renesas,csi2.yaml          | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > index e6a036721082..064a0a4c5737 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
> > @@ -67,7 +67,14 @@ properties:
> >                  maxItems: 1
> >
> >                data-lanes:
> > -                maxItems: 1
> > +                items:
> > +                  minItems: 1
> > +                  maxItems: 4
> > +                  items:
> > +                    - const: 1
> > +                    - const: 2
> > +                    - const: 3
> > +                    - const: 4
> 
> Seeing "maxItems: 1" there confuses me too, as the property is an
> array of data-lanes, but I'm afraid your change does not what you
> intend as it would allow you to specify the number of data lanes as an
> integer rather than as an array.
> 
> I think it would probably be correct to set
> 
>                 data-lanes: true
> 
> (maybe maxItems: 1 is correct already)
> 
> And restrict the number of valid combinations in the board DTS file
> with a construct like:
> 
>     data-lanes:
>       oneOf:
>         - items:
>             - const: 1
>             - const: 2
>             - const: 3
>             - const: 4
>         - items:
>             - const: 1
>             - const: 2

I don't think this is correct, what if data lanes 2 and 3 are used?

> 
> Thanks
>    j
> 
> >
> >              required:
> >                - clock-lanes
> > --
> > 2.17.1
> >

-- 
Kind Regards,
Niklas Söderlund
