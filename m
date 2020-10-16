Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1A1290A87
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 19:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390836AbgJPRVf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 13:21:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41532 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390433AbgJPRVd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 13:21:33 -0400
Received: by mail-ot1-f65.google.com with SMTP id n15so3062940otl.8;
        Fri, 16 Oct 2020 10:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cuu3XyjKtEmeq+Akh/2IqEbAQRGMvswQSSuIN5iYFL8=;
        b=Nz0iteIVo7NmHLqE7B3Zz5W5Uvs4qxX5jfMo3BhPpQX5f5KifGvuSFQW8zPYdRdTHt
         t0QOlMnphHawQrs8+zTv4eDKvJrGl6gf1YgvFHmynx2oFMvMl83unYFbBGss+xMx/+Jl
         DK9n4WgIXYNgi0xUtinV0+FQkEZEiNZH5C3S+lEgcoG0l1ttGz/JLgyW3elKaBT/LQW6
         Sm9PSZ4X758I890XmQS5OWXG8aIAcOVFYd45yRxldTZFFtl+WmaEY0RtoIJdyQ4t0+42
         MkMiVAKPpuQBpHEHBsZAtI/dPWe6N8bv+pVz8KR0gewU2UwfDn1Vy/c/QKlUKVnIkNQu
         rTyg==
X-Gm-Message-State: AOAM532mn5cVgJHj6RE5OtsqOfAt8G9wy9P58yF166xk6Md3Epb+tmJp
        cXi4Tuuol+6C+EfIgBL+Ow==
X-Google-Smtp-Source: ABdhPJxp6hO1e2GFF+46cRfsByTXMzBlFBNBzxrIs7A5OIEpQioC0M9ZdrZj4e5mZiyAKdN2X7X3Fg==
X-Received: by 2002:a9d:73c6:: with SMTP id m6mr3381977otk.105.1602868891876;
        Fri, 16 Oct 2020 10:21:31 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c18sm1226145oib.34.2020.10.16.10.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 10:21:31 -0700 (PDT)
Received: (nullmailer pid 1602664 invoked by uid 1000);
        Fri, 16 Oct 2020 17:21:29 -0000
Date:   Fri, 16 Oct 2020 12:21:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201016172129.GA1598042@bogus>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
 <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > Hello Sakari,
> > >
> > > Thanks for your timely review.
> > >
> > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > relevant MAINTAINERS entries.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > >  MAINTAINERS                                        |   7 +
> > > > >  2 files changed, 169 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > >
> > >
> > > [snip]...
> > >
> > > > > +  ovti,mipi-clock-voltage:
> > > > > +    description:
> > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > +      the clock driver capability.
> > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > +    minItems: 2
> > > > > +    default: [390000, 4]
> > > >
> > > > Why do you have the link frequency here as well?
> > > >
> > > > In principle this does belong to the endpoint as link frequencies are
> > > > specific to that, but I don't mind; there's just a single port anyway.
> > > >
> > >
> > > This is an optional property which we model as an array of <link speed,
> > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > use the value 4 for current driver. If one wants to select different
> > > voltage for different link, they could do so as well.
> >
> > If you think you'd need that, then you need to put this to the endpoint.
> 
> The mipi-clock-voltage property is not a property of the endpoint. The
> link frequency there does not set the link frequency - it only
> specifies which link frequency the given voltage should be used for.

Seems to me it's in the right place.

Rob
