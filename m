Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8396822D5F8
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 10:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgGYILv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 04:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgGYILv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 04:11:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF17C0619E5
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 01:11:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v4so2552132ljd.0
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2020 01:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=H1oRPc94SlBLh/nCq9oLvsXSUeG1h45qDvtu9A09LzU=;
        b=Pml4Fn1rbe+NY6aDBeO2XkMCH1uwWSY6dkPo+dYo3SNwDCRAGmiMCiJfL/AaXjNj5y
         WsK+eRFnpsseI8T9x6R8eCpGdNMNSaybOCeKEAjbCoERVeqYOdqK3igq8dVDyNsV0pUH
         X7Ct1Nm729/ccJ2ZQvQ69bf7/Ech/7SuX70w33LezFsPlJ4XLpmUDNkqT/gT97gYOMQ8
         TI3Nb7+9AxynlZTCdob0POXzLnbw6lLhcGHtnD0oRfD3XcpMQjoaVTo5HwAnheSqH7JL
         OWaS0n7hZWfnnjnwpNfvDUcc8bmjTBLDe8T2WUEUrVlptcqgad4VDEYcyeNbFlgr2nLF
         vjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=H1oRPc94SlBLh/nCq9oLvsXSUeG1h45qDvtu9A09LzU=;
        b=W4dJAoeVl7bASmi6THDsZea0rUmlI1+5cLfTjOTpv2pszo43Fo00SiFiC2HA/F1sfe
         nUnnqyq4f+ky3ZUw8b3ynEtDsY/04XspYhyHK3N7BaJJAft+P/gIDP1vloeON0qKDOlW
         YiPdSTNtTegbHB+yNl8SuS8NgaYM+ygGyuW6DhHoaRTwa6Og8AvDiJg2I3MY/hzx3EUh
         lsg8HIzWhEiLvthPP4VS5E/CXQfN3VaPb+bcHdSwH1cMGyLJYQ3khN1s34GB6SSqshNk
         /2JSPX9t/LBPSF3tw1MqlENe8ybVjUCmzAn5/LPMuzCdfiaRO+FN1+iYsqrbTAcfZuEJ
         rahw==
X-Gm-Message-State: AOAM5312Li49zBHk4LxrqdPtT0ULReTJ0Xj7dF/IZP+avZlQ+q25fUdR
        gV7GNj3dZLCRHcIT39HjFamfTQ==
X-Google-Smtp-Source: ABdhPJxlyuztz4E1UazWiGbWbc4W5MiCiP3ofzw/n0pAh3yjmiwKeag06HmWeq1i5xDL5N/VimMbUQ==
X-Received: by 2002:a05:651c:319:: with SMTP id a25mr6191668ljp.272.1595664707967;
        Sat, 25 Jul 2020 01:11:47 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id x5sm827077ljm.132.2020.07.25.01.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 01:11:47 -0700 (PDT)
Date:   Sat, 25 Jul 2020 10:11:46 +0200
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
Message-ID: <20200725081146.GF2729799@oden.dyn.berto.se>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200724193752.GE2729799@oden.dyn.berto.se>
 <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8s7UkhCGcP8eiiH_jd8hhnpLJA6QqfL7jXo_sAgRMfy8g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 2020-07-24 22:11:31 +0100, Lad, Prabhakar wrote:
> Hi Niklas,
> 
> Thank you for the review.
> 
> On Fri, Jul 24, 2020 at 8:37 PM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >
> > Hi Lad,
> >
> > Thanks for your patch.
> >
> > On 2020-07-24 15:58:51 +0100, Lad Prabhakar wrote:
> > > Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
> > > input pins.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > index 53c0a72..7dfb781 100644
> > > --- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
> > > @@ -106,6 +106,12 @@ properties:
> > >
> > >            remote-endpoint: true
> > >
> > > +          renesas-vin-ycbcr-8b-g:
> >
> > I think the preferred format for vendor specific properties are
> > "<vendor>,<property>".
> >
> Indeed and I had it as renesas,vin-ycbcr-8b-g but dt_bindings_check
> complained about it.

I see, what was the error?

> 
> > This nit apart I'm not sure a property is the right way here. Could it
> > not be possible on some designs to have two different sensors one wired
> > to DATA[7:0] and the other to DATA[15:8] and by controlling the
> > VNDRM2_YDS register at runtime switch between the two? If so adding a DT
> > property to hard-code one of the two options would prevent this. I fear
> > we need to think of a runtime way to deal with this.
> >
> Aha Gen2 and Gen3 hardware manuals have a bit different description
> about the YDS field. (I was working R8a7742 SoC so I referred Gen2
> manual)

Ahh, I think we should use the Gen3 names as I find them overall an 
improvement over the Gen2 ones.

> 
> > The best way to do that I think is to extend the port@0 node to allow
> > for two endpoints, one for each of the two possible parallel sensors.
> > This would then have to be expressed in the media graph and selection if
> > YDS should be set or not depend on which media links are enabled.
> >
> In that case how do we handle endpoint matching each would have two
> subdevs to be matched.

It would be handle in the same was as the multiple endpoints in port@1.

> And in case non media-ctl cases we cannot
> switch between subdevs.

For the Gen2 none media graph enabled mode this could be handled with 
the S_INPUT ioctl. For this feature to be merged however I it needs to 
be possible to select input both in Gen2 and Gen3 I'm afraid. I'm hoping 
to one day breakout the non MC part of this driver into a new one and 
mark it as deprecated and switch to the MC code paths for Gen2.

> 
> Cheers,
> --Prabhakar
> 
> > > +            type: boolean
> > > +            description:
> > > +              If present this property specifies to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.
> > > +            default: false
> > > +
> > >          required:
> > >            - remote-endpoint
> > >
> > > @@ -168,6 +174,13 @@ properties:
> > >
> > >                remote-endpoint: true
> > >
> > > +              renesas-vin-ycbcr-8b-g:
> > > +                type: boolean
> > > +                description:
> > > +                  If present this property specifies to selects VIN_G[7:0] as data pins for
> > > +                  YCbCr422 8-bit data.
> > > +                default: false
> > > +
> > >              required:
> > >                - remote-endpoint
> > >
> > > --
> > > 2.7.4
> > >
> >
> > --
> > Regards,
> > Niklas Söderlund

-- 
Regards,
Niklas Söderlund
