Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65674234C1A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgGaUTE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 16:19:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43354 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgGaUTD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 16:19:03 -0400
Received: by mail-io1-f65.google.com with SMTP id k23so32826095iom.10;
        Fri, 31 Jul 2020 13:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kRn98kmX+GxBTOj20IyuIt5F7vNs5kI3rOwmf5gJlXo=;
        b=my4tHzba/cskiaKYtb865T94mHGBQ2/523OPxs2+vhF3jmlJB+k+94AO8K289BNqOT
         gl4cRQvHLXFlHs5JUu6AFLHcZ2qrJrCIlcl9UNj+q22D9cdvOYBGoyvVaA2zBgi3dHGA
         izQXcczynRA8wLbUBoQjsvmLQu4u5q2Rnw/zPScxAeCXktiVVP/Z/pJwl1Fw2KSDCTi+
         EEiKHrISTnE/YIJSeqKaKkUCR/gtHAYCg3SfeCAaH8R4+Z2fP7kStq8/1q1wDbjZ37v9
         vS4o/JWzcV2ufEunGyhjM5k/gqQ1MW19QmltH2LPtBo3VXEeyn6xu/I8RocimgLXxhd7
         hw1w==
X-Gm-Message-State: AOAM530eC1AMkuzAWJWtC9EWvgh2huXQxKn1C/2jmTIMN5AgL9N9LjZy
        NPgEWjJpbrZK7Oz12EvgmBLY6dVvEQ==
X-Google-Smtp-Source: ABdhPJzr8uZ3Qr6GyTYZhEhFqGlrmvl/TYAVEn9xE4hVBsU1/rNOHODs4KB2luEuWtnujV/FBhN5hw==
X-Received: by 2002:a05:6602:2409:: with SMTP id s9mr4870384ioa.98.1596226742314;
        Fri, 31 Jul 2020 13:19:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g1sm5489132iov.38.2020.07.31.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:19:01 -0700 (PDT)
Received: (nullmailer pid 711472 invoked by uid 1000);
        Fri, 31 Jul 2020 20:19:00 -0000
Date:   Fri, 31 Jul 2020 14:19:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Document
 renesas-vin-ycbcr-8b-g property
Message-ID: <20200731201900.GA704336@bogus>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200724193752.GE2729799@oden.dyn.berto.se>
 <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
 <20200725081146.GF2729799@oden.dyn.berto.se>
 <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8sNxUaj88DDcWyc4zrmsAAGndjoQX=OmJ3u1GRJCT6TBQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 25, 2020 at 11:23:13PM +0100, Lad, Prabhakar wrote:
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

The errors here aren't that helpful. The problem is 'default: false' 
doesn't make sense for a boolean type as false is always not present for 
DT.

Rob
