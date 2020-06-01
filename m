Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E450F1EAC52
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 20:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbgFASS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 14:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729750AbgFASS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 14:18:27 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3E2C061A0E
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 11:18:26 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id k8so8016436edq.4
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
        b=krEtW7JMlTpPiCKTfkH45ggYkkj3H9lMw3FHZ+1Nxnk3MzT/QKbhGGtK42nirA8MFn
         8G8AE9vCtYO/pcHXfz0lHK5hnvODHlSFgnXWwVwztN5SNCHF6uSpFZSNBGwod3CN8UPc
         7Rxz2QyGs/IN647KyZ76Gh0/KSl4VBY2OXwuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ktf8hdQ0/bBZ1rrqyUokS+zLJv4wCtg8txRgNdj1RPs=;
        b=iQz9L7ZqJhEOh1nrU8yGQC25nDBy38uMww+JOLQunigJ8XpBR3EjCtam36vOhoexp+
         hYvz9cMIodPNFboZQeJQ3PDQyfSjILFTqUBFdRc4pvvwZ/mnM/jUBkZDJTO4I3KplasV
         6zgTSsX/1ro2LTcHloUKya3CAr+Kk4UjJdzdzVYpPHudIBLRE4Wk8Ac+OA0NsKPW1k8l
         1GF6DFDzkjNZY5sx58AnIONi3EdnswaH6rRy+bHdoR1XViS/IJwkw+Q5LLlCC4XkgdkU
         KPIOMBhaKZ2lfJVtwNeFGwmT4F7mxIlrTGiWSRbEvUTe89y7vA73TROqlwtt2nknCFyA
         ZlPg==
X-Gm-Message-State: AOAM531OkzKlIfV5x1liMrARlLcLfQ5MvdfVs7Eg5UAcAm77ykZgoXeL
        v9cBb6sp28ic7btF2hWzHzak7cvpPOk=
X-Google-Smtp-Source: ABdhPJz5FQIYu+6PqHLkJa+oF30G4rbgBkH4yYZolYFSig8gDgGgebqCTqLwH/0/tt/wim2k8RparA==
X-Received: by 2002:a50:8707:: with SMTP id i7mr22460895edb.180.1591035505068;
        Mon, 01 Jun 2020 11:18:25 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 64sm58554eda.85.2020.06.01.11.18.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 11:18:24 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id f185so476487wmf.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 11:18:23 -0700 (PDT)
X-Received: by 2002:a1c:b155:: with SMTP id a82mr509536wmf.46.1591035503038;
 Mon, 01 Jun 2020 11:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com> <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03> <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com> <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com> <1590653082.8804.517.camel@mhfsdcap03>
 <CAAFQd5AuHDpQN8xZsWgnAt6m2reAYJbs9nBp0+mBo7_FS81LbQ@mail.gmail.com> <1590978816.8804.523.camel@mhfsdcap03>
In-Reply-To: <1590978816.8804.523.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 1 Jun 2020 20:18:10 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Message-ID: <CAAFQd5AY9gejoiwxojvvG0FaVfEAf8gCqOddvo-dxemQWFksVw@mail.gmail.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 1, 2020 at 4:35 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Fri, 2020-05-29 at 15:43 +0200, Tomasz Figa wrote:
> > On Thu, May 28, 2020 at 10:06 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > >
> > > Hi Sakari,
> > >
> > > On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari, Rob,
> > > > >
> > > > > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > > > > Hi Rob, Dongchun,
> > > > > >
> > > > > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > > > > +    properties:
> > > > > > > > > > +      endpoint:
> > > > > > > > > > +        type: object
> > > > > > > > > > +        additionalProperties: false
> > > > > > > > > > +
> > > > > > > > > > +        properties:
> > > > > > > >
> > > > > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > > > >
> > > > > > > Yes, if you are using it.
> > > > > >
> > > > > > Dongchun, can you confirm the chip has a single data and a single clock
> > > > > > lane and that it does not support lane reordering?
> > > > > >
> > > > >
> > > > > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > > > > uni-directional clock lane and one bi-directional data lane solution for
> > > > > communication links between components inside a mobile device.
> > > > > The data lane has full support for HS(uni-directional) and
> > > > > LP(bi-directional) data transfer mode.'
> > > > >
> > > > > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > > > > would not be added in next release.
> > > > >
> > > > > > So if there's nothing to convey to the driver, also the data-lanes should
> > > > > > be removed IMO.
> > > > > >
> > > > >
> > > > > However, 'data-lanes' property may still be required.
> > > > > It is known that either data-lanes or clock-lanes is an array of
> > > > > physical data lane indexes. Position of an entry determines the logical
> > > > > lane number, while the value of an entry indicates physical lane, e.g.,
> > > > > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > > > > the clock lane is on hardware lane 0.
> > > > >
> > > > > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > > > > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > > > > there is only a clock lane for OV02A10.
> > > > >
> > > > > Reminder:
> > > > > If 'data-lanes' property is not present, the driver would assume
> > > > > four-lane operation. This means for one-lane or two-lane operation, this
> > > > > property must be present and set to the right physical lane indexes.
> > > > > If the hardware does not support lane reordering, monotonically
> > > > > incremented values shall be used from 0 or 1 onwards, depending on
> > > > > whether or not there is also a clock lane.
> > > >
> > > > How can the driver use four lanes, considering the device only supports a
> > > > single lane??
> > > >
> > >
> > > I understood your meaning.
> > > If we omit the property 'data-lanes', the sensor should work still.
> > > But then what's the meaning of the existence of 'data-lanes'?
> > > If this property 'data-lanes' is always optional, then why dt-bindings
> > > provide the interface?
> > >
> > > In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
> > > that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
> > > shall enable four-lane configuration, which may increase consumption of
> > > both power and resource in the process of IIC communication.
> >
> > Wouldn't the receiver still have the data-lanes property under its
> > endpoint node, telling it how many lanes and in which order should be
> > used?
> >
>
> The MIPI receiver(RX) shall use
> v4l2_async_notifier_add_fwnode_remote_subdev() API to parse the property
> "data-lanes" under sensor output port.

That's not true. The MIPI receiver driver parses its own port node
corresponding to the sensor. Also quoting the documentation [1]:

"An endpoint subnode of a device contains all properties needed for
_configuration of this device_ for data exchange with other device. In most
cases properties at the peer 'endpoint' nodes will be identical, however they
might need to be different when there is any signal modifications on the bus
between two devices, e.g. there are logic signal inverters on the lines."

In this case, there is such a signal modification if the sensor has a
1-lane bus and the receiver more lines, so the data-lanes properties
would be different on both sides.

[1] https://elixir.bootlin.com/linux/v5.7/source/Documentation/devicetree/bindings/media/video-interfaces.txt

Best regards,
Tomasz
