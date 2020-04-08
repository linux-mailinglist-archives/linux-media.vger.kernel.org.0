Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09AF61A221A
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgDHMfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:35:44 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36056 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgDHMfn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:35:43 -0400
Received: by mail-ed1-f67.google.com with SMTP id i7so8379788edq.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xa0jsgSZvhAu9qLIAzgdV/p9IbYtIZxjPtuYfg0RgUo=;
        b=gRUviviqC24Bj2U3Aq5OtUVPx4mO/jN9xEiRvX1d8xksOHMUV5rC78+7W/a4siaB10
         077PCLjkA2BvcXkMnv4yQvhjlOYbiN4mpyA4F1gKZ4B/HwRcWwVNoU7bRMc54IgrN6M7
         v1vcBIktG7POpd86IWze0cJXJSEABoW2/Ykb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xa0jsgSZvhAu9qLIAzgdV/p9IbYtIZxjPtuYfg0RgUo=;
        b=fhG5ieJ+k45ejiSSs5uGw43Yn8UVKvKt9jwg5EA8DqM1mOtwzQT04hFUOVyjNmxBVw
         LWXfr+Z7edvSx4cpOv5f45Gicru7xTbflyWuC0zI2JB/+MeZ6sTTuyfISB8vR0Qq3X9u
         iuwuXA7yfkl2jcvFsGYb7Y4GcZyAmJyWr15tsr750eJptdDh/MqfTf9UCVmYuVdeybSe
         icSlFGRdbcrm81r3hkzYasE5+VhycgMyFVQ2m4p0s+JdOGVRSjsRjTSp6Isd33YqgeMx
         5aBNFNHty5yJCi654M0LAHo1p+MOH3btkNIV8HmRzT/Db2TBZMk3sDVfMTp2LfWvtAKg
         UtJQ==
X-Gm-Message-State: AGi0PuaRsrDI053EftjhSj7dlj5fRlFA14U8VpPKLh4Hp5MUTvrIYdEi
        uiTuZK9veIJFW+ZNYtrNncKnfYYVIEB0Fw==
X-Google-Smtp-Source: APiQypK4FAyFz/mFbxhrjntW/bB3653wUhsvg8JJ9IRcOBv5ATPi6YcU8Qgg4cHT43CjjCFGhNg5yA==
X-Received: by 2002:a17:906:1603:: with SMTP id m3mr6611891ejd.205.1586349340724;
        Wed, 08 Apr 2020 05:35:40 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id k33sm2892424edc.18.2020.04.08.05.35.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 05:35:40 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id f20so5257306wmh.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 05:35:40 -0700 (PDT)
X-Received: by 2002:a1c:9e08:: with SMTP id h8mr4273596wme.183.1586349339478;
 Wed, 08 Apr 2020 05:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200403232736.GA6127@valkosipuli.retiisi.org.uk>
 <20200404093446.vuvwrhn5436h4d3s@gilmour.lan> <20200406083506.GE6127@valkosipuli.retiisi.org.uk>
 <20200407083647.4mocdl7aqa3x737q@gilmour.lan> <CAG3jFyvd32pWppubMoOoyH9eO2XLjwUXMC7p4xtv8m+JkPv6vw@mail.gmail.com>
 <20200407123232.ktvaifhqntgzvkap@gilmour.lan> <CAG3jFysSrZJRE2TvL0bWoRFNnscgDGj8yGr-iwWBm4=1wMbJ9A@mail.gmail.com>
 <20200407163916.GL6127@valkosipuli.retiisi.org.uk> <CAAFQd5BGFB5znb9QyyPVL47kc809Ktu33bssvqg5eA-WwvMgOw@mail.gmail.com>
 <20200407172035.GM6127@valkosipuli.retiisi.org.uk> <20200408122127.i27hrmjh3pbjeulk@gilmour.lan>
In-Reply-To: <20200408122127.i27hrmjh3pbjeulk@gilmour.lan>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 8 Apr 2020 14:35:28 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
Message-ID: <CAAFQd5DNyQra-XksVaSfT_FCkOHTzm9mbn+tMd1vACV=pb9_8g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 8, 2020 at 2:21 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Apr 07, 2020 at 08:20:35PM +0300, Sakari Ailus wrote:
> > On Tue, Apr 07, 2020 at 06:46:06PM +0200, Tomasz Figa wrote:
> > > On Tue, Apr 7, 2020 at 6:40 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > >
> > > > On Tue, Apr 07, 2020 at 05:47:41PM +0200, Robert Foss wrote:
> > > > > On Tue, 7 Apr 2020 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > >
> > > > > > Hi Robert,
> > > > > >
> > > > > > On Tue, Apr 07, 2020 at 01:29:05PM +0200, Robert Foss wrote:
> > > > > > > On Tue, 7 Apr 2020 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > On Mon, Apr 06, 2020 at 11:35:07AM +0300, Sakari Ailus wrote:
> > > > > > > > > > But that 19.2MHz is not a limitation of the device itself, it's a
> > > > > > > > > > limitation of our implementation, so we can instead implement
> > > > > > > > > > something equivalent in Linux using a clk_set_rate to 19.2MHz (to make
> > > > > > > > > > sure that our parent clock is configured at the right rate) and the
> > > > > > > > > > clk_get_rate and compare that to 19.2MHz (to make sure that it's not
> > > > > > > > > > been rounded too far apart from the frequency we expect).
> > > > > > > > > >
> > > > > > > > > > This is doing exactly the same thing, except that we don't encode our
> > > > > > > > > > implementation limitations in the DT, but in the driver instead.
> > > > > > > > >
> > > > > > > > > What I really wanted to say that a driver that doesn't get the clock
> > > > > > > > > frequency from DT but still sets that frequency is broken.
> > > > > > > > >
> > > > > > > > > This frequency is highly system specific, and in many cases only a certain
> > > > > > > > > frequency is usable, for a few reasons: On many SoCs, not all common
> > > > > > > > > frequencies can be used (e.g. 9,6 MHz, 19,2 MHz and 24 MHz; while others
> > > > > > > > > are being used as well), and then that frequency affects the usable CSI-2
> > > > > > > > > bus frequencies directly --- and of those, only safe, known-good ones
> > > > > > > > > should be used. IOW, getting the external clock frequency wrong typically
> > > > > > > > > has an effect that that none of the known-good CSI-2 bus clock frequencies
> > > > > > > > > are available.
> > > > > > > >
> > > > > > > > So clock-frequency is not about the "Frequency of the xvclk clock in
> > > > > > > > Hertz", but the frequency at which that clock must run on this
> > > > > > > > particular SoC / board to be functional?
> > > > > > > >
> > > > > > > > If so, then yeah, we should definitely keep it, but the documentation
> > > > > > > > of the binding should be made clearer as well.
> > > > > > >
> > > > > > > Alright so, let me summarise the desired approach then.
> > > > > >
> > > > > > There's a separate discussion on the same topic here:
> > > > > > https://lore.kernel.org/linux-media/20200407122106.GD4751@pendragon.ideasonboard.com/
> > > > >
> > > > > Thanks for the link.
> > > > >
> > > > > >
> > > > > > > ACPI:
> > > > > > >   - Fetch the "clock-frequency" property
> > > > > > >   - Verify it to be 19.2Mhz
> > > > > > >
> > > > > > > DT:
> > > > > > >   - Fetch the "clock-frequency" property
> > > > > > >   - Verify it to be 19.2Mhz
> > > > > > >   - Get xvclk clock
> > > > > > >   - Get xvclk clock rate
> > > > > > >   - Verify xvclk clock rate to be 19.2Mhz
> > > > > >
> > > > > > The current status is that you should
> > > > > > 's/clock-frequency/link-frequencies/', and in order to replace
> > > > > > assigned-clock-rates, you'll want to have a clk_set_rate to 19.2MHz
> > > > > > between steps 3 and 4
> > > > >
> > > > > Would we want to 's/clock-frequency/link-frequencies/' for ACPI too?
> > > > > I imagine that would cause some breakage.
> > > >
> > > > It would, yes, and it would be no more correct on DT either.
> > > >
> > > > There are basically two possibilities here; either use the clock-frequency
> > > > property and set the frequency, or rely on assigned-clock-rates, and get
> > > > the frequency instead.
> > > >
> > > > The latter, while I understand it is generally preferred, comes with having
> > > > to figure out the register list set that closest matches the frequency
> > > > obtained. The former generally gets around this silently by the clock
> > > > driver setting the closest frequency it can support.
> > >
> > > Wouldn't the former actually cause problems, because the closest
> > > frequency the clock driver can support could be pretty far from the
> > > one requested? (E.g. 19.2 MHz vs 24 MHz) The driver needs to check the
> > > resulting frequency anyway.
> >
> > That's possible, yes; in this case there wouldn't be a guarantee the
> > frequency wouldn't be far off.
>
> assigned-clock-rates is really fragile... There's zero guarantee on
> how far the actual rate is going to be from the asked one, but more
> importantly you have zero guarantee on the time frame that rate is
> going to be enforced for.
>

Is there such a guarantee if clk_set_rate() is called?

> It's simply going to change the rate as a one-off thing, and if
> there's the next millisecond someone else is going to change its rate
> one way or another, it's going to do so and you won't have any
> notification.
>
> And even semantically, they do not share the same meaning at all, so
> we should really stop using assigned-clock-rates if we can, instead of
> pushing it.
>
> Maxime
