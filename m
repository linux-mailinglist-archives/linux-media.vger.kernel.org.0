Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E83E292E5A
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 21:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgJSTUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 15:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730820AbgJSTUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 15:20:32 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC8BC0613CE
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 12:20:31 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id v19so460144edx.9
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 12:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MbpPIoPzTpMpNm1nC5xfdtc0dU2BeKn/AYB4IBKnH4g=;
        b=ayFfmURnpiUCCBhURRXNsWakezv/PyUrpMyAVQ4638TzOxFw8XxEhjedRoM+UanEEH
         GL+mqAHg53prCECXVrHNs69s00f3k6eXPOLsfNBbpIPH2V/V7p5BoJVKInrUd0gf84mh
         AudndqJCfYHFqVLkiOZ6FU0m3wQsVAZawLToQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MbpPIoPzTpMpNm1nC5xfdtc0dU2BeKn/AYB4IBKnH4g=;
        b=PdObVEBvSGbPvQNjTl4VWoIBz9JgdOJ2NXiYkIo65aWzCY31gPeGLUwKWODq8iVmFn
         3C45uHg0v3BLJmsonJBQIa3kaQFalJ8y5rGPldScEUstSlMPDrRvaH9qPpYp2YuEWsGq
         vJybC5r2rotjespGViQkOLXQXvpwGveqbnRZHTeo/MM76ZUtBEbXjPWMklXBMv1+1clu
         M7iJVzu5V+0SABiPOcYi+oqhZYam50dYGi4ZMb5QRfTXmbIKLuwz1OHr/l4bCsFc4HkA
         9mO2Y+2hTpDIUJUqBQNmCzpkpwpzdtyRuCnTyI/abIGiqExcJ4KpUTpDghHHjqRLuNyv
         Yseg==
X-Gm-Message-State: AOAM532SMVbDGht3mMTTduGxCwbd2ngcVaZdr1YSeGYrgIb5pvBDJqBM
        MD50c32LECQ/DSsYdPrMc98wQpP9gtjPD5Am
X-Google-Smtp-Source: ABdhPJxW4xlysRS5TT6zL8iaJE0/DZbTYcat7Yr/2nkWNURAY7aEmOjeN4N93QB1uvSzFCyCd8MdSg==
X-Received: by 2002:a50:e447:: with SMTP id e7mr1350341edm.263.1603135229337;
        Mon, 19 Oct 2020 12:20:29 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id i14sm755195edu.40.2020.10.19.12.20.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 12:20:27 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id y12so975431wrp.6
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2020 12:20:26 -0700 (PDT)
X-Received: by 2002:adf:ab05:: with SMTP id q5mr829770wrc.32.1603135226373;
 Mon, 19 Oct 2020 12:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com> <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03> <20201014083139.GG13341@paasikivi.fi.intel.com>
 <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com> <20201019082759.GL13341@paasikivi.fi.intel.com>
In-Reply-To: <20201019082759.GL13341@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 19 Oct 2020 21:20:15 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
Message-ID: <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
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

On Mon, Oct 19, 2020 at 10:28 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Oct 14, 2020 at 01:48:00PM +0200, Tomasz Figa wrote:
> > On Wed, Oct 14, 2020 at 10:31 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> > > > Hello Sakari,
> > > >
> > > > Thanks for your timely review.
> > > >
> > > > On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > > > > Hi Dongchun,
> > > > >
> > > > > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > > > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > > > > relevant MAINTAINERS entries.
> > > > > >
> > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > ---
> > > > > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > > > > >  MAINTAINERS                                        |   7 +
> > > > > >  2 files changed, 169 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > > > >
> > > >
> > > > [snip]...
> > > >
> > > > > > +  ovti,mipi-clock-voltage:
> > > > > > +    description:
> > > > > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > > > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > > > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > > > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > > > > +      the clock driver capability.
> > > > > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > > > > +    minItems: 2
> > > > > > +    default: [390000, 4]
> > > > >
> > > > > Why do you have the link frequency here as well?
> > > > >
> > > > > In principle this does belong to the endpoint as link frequencies are
> > > > > specific to that, but I don't mind; there's just a single port anyway.
> > > > >
> > > >
> > > > This is an optional property which we model as an array of <link speed,
> > > > clock voltage> pairs. An example to have all link speeds up to 390MHz
> > > > use the value 4 for current driver. If one wants to select different
> > > > voltage for different link, they could do so as well.
> > >
> > > If you think you'd need that, then you need to put this to the endpoint.
> >
> > The mipi-clock-voltage property is not a property of the endpoint. The
> > link frequency there does not set the link frequency - it only
> > specifies which link frequency the given voltage should be used for.
>
> If it is not bound to the endpoint --- that specifies the properties of the
> link --- then you could just put it to the driver, couldn't you?
>
> But earlier on, we established that this is specific to a given board, or a
> given link. Endpoints are used to describe connections that a device may
> have to other devices. Therefore their properties are different.
>
> The graph bindings allow for several endpoints on a single physical port,
> some may be disabled in that case. This is admittedly mostly done with
> CSI-2 receivers.
>
> Either way, putting this property to the device may affect how DT source is
> arranged for boards that have this device. Any similar configuration on
> other devices with multiple transmitters or receivers would be in endpoints
> anyway --- because they have to, so I don't see why bindings for this
> device should be different.
>
> If you put it to endpoint, the driver also doesn't need to match the link
> frequencies in kHz and Hz between the two properties, but just use the same
> index for both.

I agree in general, but I think in this case this is a device-specific
property and the sensor only has 1 CSI-2 interface, so maybe it
doesn't really matter?

Specifying frequency, voltage pairs is a common practice in other
bindings, such as the OPP bindings, by the way.

That said, if you insist, I'm fine with this being moved to the
endpoint node too.

Best regards,
Tomasz
