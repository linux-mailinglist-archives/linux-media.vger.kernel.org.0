Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22DC21C01CF
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 18:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgD3QL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 12:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726688AbgD3QL1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 12:11:27 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8D1C035495
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 09:11:26 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id b13so5380861oti.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJJ2h/RywV36voKthnSah9RB9XIE3vlA2oANqch/TM8=;
        b=CYltEK4lC6uNdm1mZD87iAO3gl4/SEpFxwxAVQriTh0uwE0bwfs7T4If8r4qzRFUut
         7IdUYmj/x2ICjOeMUbaYNeSSXqPNUqJVYYXpcaRLSAFQTLmZrMjTnV1tfi0Tf3Le51BT
         fnw4RULB5jHBAOJYEjxqmzhlwrKAtNE1V28c2UBw53QpFhPzOfTcxfXZwBGGOnA1Vwu+
         y6nGq2YIx5qbnEoyz7wgr+bLsBZ+LdEd7DjAFR6azx2r7uylWSU37XbQ0boP7RSMx5TI
         n/nsLqXgERcuFpp0+gG67xFFEliHMoxB1booz8Jm7sQHobePp+4cGPl9DGrIK4KJeMc6
         slZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJJ2h/RywV36voKthnSah9RB9XIE3vlA2oANqch/TM8=;
        b=gHmefYIKiYfu25BvscnB/98YCrHD1TCAud923QZ/r+NZS+XMe7e/s9K4Mnurbmnr/x
         RdzMwv9f/uMqLa29xlrfbWO5+b7K+MHkbqYigthUWw4zos9qgr9dhE6BqEd92ckqQmN/
         qVDrdbHAZ71V2UBeMZE9I41xhnmIrQJyXjwQKI1wLi5MJcCuEN0mIVe2g0Tgmvnj/3OT
         IMRuCS0G0QUQnRQvCGYrgQuFHNKmbsD8jx7JkohJqCePxPxtDVM6fzpzciWCHFPgiAyP
         F4E2+fi1QW6IlLBScG5bSJAjNCvN5yc1JtA0a5UJ7fu5WIgENw4GDoXf+iccAbh8xmI6
         ZA0w==
X-Gm-Message-State: AGi0PubdyJ1r7T9jL08yMDqFlYshTRUQ635AX7V0RP5WTS1V5mo7j4uW
        LPp2J4eZ85La7n43N4XkH0qbVM1Ap+WnnABy7Mf6Qw==
X-Google-Smtp-Source: APiQypImvZrbPbUvob8q7lUT988oyJugoOnuZpnTvOCTRRSEV39r/EJBJ5kkKQTYtVWYsNXk8krIMSPhXpH7Dv5VP5A=
X-Received: by 2002:a05:6830:1d7:: with SMTP id r23mr3174295ota.68.1588263085714;
 Thu, 30 Apr 2020 09:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200429162437.2025699-1-robert.foss@linaro.org>
 <20200429162437.2025699-3-robert.foss@linaro.org> <20200430093524.GB2188@pengutronix.de>
 <20200430094549.GF867@valkosipuli.retiisi.org.uk> <20200430095332.GC2188@pengutronix.de>
 <20200430095907.GG867@valkosipuli.retiisi.org.uk> <20200430101157.GD2188@pengutronix.de>
 <20200430102018.GI867@valkosipuli.retiisi.org.uk> <20200430120740.GG2188@pengutronix.de>
In-Reply-To: <20200430120740.GG2188@pengutronix.de>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 30 Apr 2020 18:11:14 +0200
Message-ID: <CAG3jFytP9=pL=9Qh64BKqQchs7J7E45USfirK_SnGn3NMeCdcg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] media: ov8856: Add devicetree support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Marco,

On Thu, 30 Apr 2020 at 14:07, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> On 20-04-30 13:20, Sakari Ailus wrote:
> > On Thu, Apr 30, 2020 at 12:11:57PM +0200, Marco Felsch wrote:
> > > On 20-04-30 12:59, Sakari Ailus wrote:
> > > > Hi Marco,
> > > >
> > > > On Thu, Apr 30, 2020 at 11:53:32AM +0200, Marco Felsch wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > On 20-04-30 12:45, Sakari Ailus wrote:
> > > > > > Hi Marco,
> > > > > >
> > > > > > On Thu, Apr 30, 2020 at 11:35:24AM +0200, Marco Felsch wrote:
> > >
> > > ...
> > >
> > > > > > > > - if (mclk != OV8856_MCLK) {
> > > > > > > > -         dev_err(dev, "external clock %d is not supported", mclk);
> > > > > > > > -         return -EINVAL;
> > > > > > > > + if (!is_acpi_node(fwnode)) {
> > > > > > > > +         ov8856->xvclk = devm_clk_get(dev, "xvclk");
> > > > > > > > +         if (IS_ERR(ov8856->xvclk)) {
> > > > > > > > +                 dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > > > > > > +                                 ov8856->xvclk);
> > > > > > > > +                 return PTR_ERR(ov8856->xvclk);
> > > > > > > > +         }
> > > > > > > > +
> > > > > > > > +         clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > > > > > > +         xvclk_rate = clk_get_rate(ov8856->xvclk);
> > > > > > > >   }
> > > > > > >
> > > > > > > Why do we handle the clock only in DT case? Is there a problem with the
> > > > > > > clock handling and ACPI?
> > > > > >
> > > > > > Not really, it's just that ACPI does not provide an interface to the clocks
> > > > > > as such.
> > > > >
> > > > > But you will get a clk by devm_clk_get()?
> > > >
> > > > No, because ACPI does not expose one to drivers. Effectively the entire
> > > > power sequences are implemented in ACPI, not in the driver.
> > > >
> > >
> > > Ah okay, thanks for the explanation. I'm really not into the ACPI
> > > stuff.. So this means the __power_off / power_on should only be done if
> > > we are using DT's?
> >
> > Correct. That's why it bails out early. It could be yet earlier though,
> > without doing anything.
>
> Yes I see. For easier and error less prone handling I would prefer:
>
> if (is_acpi_node())
>         return 0;
>
> as first instruction for __power_off/on().

__ov8856_power_on() does make a check like that, albeit only after
having run clk_prepare_enable() which won't do anything due to
ov8856->xvclk==NULL. So this should be fixed and be moved to after the
ACPI check.

__ov8856_power_off() has no ACPI check, but all of the calls it makes
are going to do nothing due to v8856->reset_gpio / v8856->reset_gpio /
ov8856->xvclk all being NULL or dummies. For the sake of clarity an
early ACPI check+return could be added, but if clarity is the goal a
comment would work too.

>
> Also I would refactor the ov8856_check_hwcfg() so the common part can be
> used by this function and by a ov8856_parse_of() function. But thats
> only my opinion.

I'm trying to grok the above paragraph. You'd like to see something in
the style of tc358743_probe_of()?

>
> Regards,
>   Marco
