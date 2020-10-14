Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3456828DFFB
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 13:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388364AbgJNLsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 07:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388303AbgJNLsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 07:48:24 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AAAC0613D2
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 04:48:16 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p5so1589440ejj.2
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gJmE+QzQPKhmVzRh7Mt/ZkUz7d1ef3q7Sc2eKrUP1ek=;
        b=D5mF2XYQNP+94me/VxKUFpADGfBIU3L6stuWHfhcFjpvl8cFllEzVr2R8gPiy6Y7H5
         7Jn3E05QFxVTs6FWqON6/czE5exVhvHc+PXVrpU6cNV+QSHwvK363vZMM69bEwZ7xq1k
         1wMTxa2lATKEQ127Aj9A7/xrT5lOpm18mHUOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gJmE+QzQPKhmVzRh7Mt/ZkUz7d1ef3q7Sc2eKrUP1ek=;
        b=nS0x9hjRfHSXToHjOz/CtdDUi1Lvu4qI/oQ4uAfNFDYrd1jzm2jQsMFltbN/oomzSN
         149jntgjMWkm2UZKe8JvWKNjf0Hhw/3X4ucxd9eJRYy5Lti3PvFQ6kH/ubfum6qsqX6S
         tuH9sQsikMpJbp3LpjSFnQ6cWS9mN4J1GHnQ5ss7keOx3IdcBSwYYj46ypCmAIku6+st
         m/97VmM8qJAd0HqiU9jtrFc2tQMOA8URFP1loFG741+Ru/U5AXVbu3kwnjr2/+LDDawY
         ehDnnyOQHDmBn9zzh8m95I5/qDzlRaKmd+X9ZSyxAhW4c4mYen/GoSOKQuIazTI/1vjG
         PVlA==
X-Gm-Message-State: AOAM532Psa1fb9Sfm83TRahVeKTsk42fcLdGe2Irnzs8oNzoQLLjA7yN
        fpM5+sfwzhNIfQqq/ObYUnoDjk1dAgUfYg==
X-Google-Smtp-Source: ABdhPJya2fTGV9PZKTThQ8syGaBMz3wBSVlcGBgzif8xNcE3mJAjpkCt+AtMy+ChUEI9DE2L/8WhkA==
X-Received: by 2002:a17:906:c111:: with SMTP id do17mr4719853ejc.452.1602676095149;
        Wed, 14 Oct 2020 04:48:15 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id p15sm1600275eji.40.2020.10.14.04.48.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 04:48:13 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id e17so3399462wru.12
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 04:48:12 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr4966749wrc.32.1602676092220;
 Wed, 14 Oct 2020 04:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com> <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03> <20201014083139.GG13341@paasikivi.fi.intel.com>
In-Reply-To: <20201014083139.GG13341@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 14 Oct 2020 13:48:00 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
Message-ID: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > Hello Sakari,
> >
> > Thanks for your timely review.
> >
> > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > Hi Dongchun,
> > >
> > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > relevant MAINTAINERS entries.
> > > >
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > >  MAINTAINERS                                        |   7 +
> > > >  2 files changed, 169 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > >
> >
> > [snip]...
> >
> > > > +  ovti,mipi-clock-voltage:
> > > > +    description:
> > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > +      the clock driver capability.
> > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > +    minItems: 2
> > > > +    default: [390000, 4]
> > >
> > > Why do you have the link frequency here as well?
> > >
> > > In principle this does belong to the endpoint as link frequencies are
> > > specific to that, but I don't mind; there's just a single port anyway.
> > >
> >
> > This is an optional property which we model as an array of <link speed,
> > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > use the value 4 for current driver. If one wants to select different
> > voltage for different link, they could do so as well.
>
> If you think you'd need that, then you need to put this to the endpoint.

The mipi-clock-voltage property is not a property of the endpoint. The
link frequency there does not set the link frequency - it only
specifies which link frequency the given voltage should be used for.

Best regards,
Tomasz
