Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BADAAEC4
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 00:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbfIEW6R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 18:58:17 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42225 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730065AbfIEW6R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 18:58:17 -0400
Received: by mail-qt1-f194.google.com with SMTP id c9so4879442qth.9
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2019 15:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQJ+zFOVB6K6WcAR5pcUdxaScO8yDgBnUHh3PD1RXoI=;
        b=DRLNWLd8+ETk0QluxLV9XbJORwoyXqRnnMYnVOBDD3zYwbylkOWFJ9gnaLgf67l6lx
         nXrg/tuOjFYwZIV0I+VrcVrJkKhHNQpBWin4HyZMDKQBhKhYx5WvbWrP0f46reaSkrFx
         E+fkGTnUHj+R9/vYM863tugJRlR8AfObMEQe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQJ+zFOVB6K6WcAR5pcUdxaScO8yDgBnUHh3PD1RXoI=;
        b=bLmDC7SuWyMtug/aeBf+9i49VPqLXUq4vKkgq5MPvDA/sT8UL26kmNmB+7j3aNNYB3
         eZ3tgJjjaXKJWu3Fa8sfUStd4XqTV6bRpYEFhj2tOmgb0MkJPV07A8ivyYPWN0qgh0iC
         5I2x0i+GSx2x76QgMASvlQZVlksVXu2LhvU+Nw2jcKL8fUN/Ne9FgJHS0d7Apf84VCoU
         SXKbnPsb4vJiVBEkYU5p85VRD3KUkcHilDoLo0fBQD9npebY6x+1/NqQnEPuMxJm3RP2
         PQL6Vhe/F3XQ4SoDQcN3+aglYBe/FYYOXpIIqV/znenr/uIEKuciMismlgZ7ODJvP6uD
         3mow==
X-Gm-Message-State: APjAAAXZPinPe5NqBAgbXAiGtvkkKeRZ8DrpHSEepsH/5lO2gKWiPEkN
        V8MQxyEomoTmhAYvx0xuVKEFOn166ED/4Mu2aG1mSg==
X-Google-Smtp-Source: APXvYqzxEctUy2fVNhmlBa2d060jbs6jhMPm3vNuZR/XdvJM98rLVHL7XY+TYTWbR9KnwSaB7/U5fV5KOs5bQUPWGMg=
X-Received: by 2002:ad4:540c:: with SMTP id f12mr3741489qvt.104.1567724296065;
 Thu, 05 Sep 2019 15:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com> <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03> <20190905104546.GA5475@paasikivi.fi.intel.com>
 <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com> <20190905160512.GG5475@paasikivi.fi.intel.com>
In-Reply-To: <20190905160512.GG5475@paasikivi.fi.intel.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 6 Sep 2019 06:58:05 +0800
Message-ID: <CANMq1KDVMGkeBvu1nO5WHopWwec9mxHfhmLmX2BzvaYVLzxoXw@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 6, 2019 at 12:05 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> > On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dongchun,
> > >
> > > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> > >
> > > ...
> > >
> > > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > > + if (ret < 0) {
> > > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > > +         goto disable_clk;
> > > > > > + }
> > > > > > + msleep_range(7);
> > > > >
> > > > > This has some potential of clashing with more generic functions in the
> > > > > future. Please use usleep_range directly, or msleep.
> > > > >
> > > >
> > > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > > https://patchwork.kernel.org/patch/10957225/
> > >
> > > Yes, please.
> >
> > Why not just msleep()?
>
> msleep() is usually less accurate. I'm not sure it makes a big different in
> this case. Perhaps, if someone wants that the sensor is powered on and
> streaming as soon as possible.

https://elixir.bootlin.com/linux/latest/source/Documentation/timers/timers-howto.txt#L70

Use usleep_range for delays up to 20ms (at least that's what the
documentation (still) says?)

> --
> Sakari Ailus
> sakari.ailus@linux.intel.com
