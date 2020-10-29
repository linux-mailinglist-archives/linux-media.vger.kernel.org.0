Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92E229F629
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 21:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgJ2U1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 16:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgJ2U1P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 16:27:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB0FC0613CF;
        Thu, 29 Oct 2020 13:27:13 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x23so1855085plr.6;
        Thu, 29 Oct 2020 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7gSXy+/YdsyTTMJ4JMwRd6QL5EZCwpdt3U8nsfTF/kY=;
        b=Epoxfx6O4huKGHhEJCDg5sCainemHARttz/m2uqB8j2mUcMbBesKp62CJKNMQZFwUs
         YX5Cb9CkSNAgbJFQPm4baQEJm4VpVZBgg1YhgCqfRGWkYUaBB79E+AC6ffH2raADhRnJ
         d5SC/a7HWLCTfMdd5JgxziMNtvzyYgzPudTJJG7XWKXw5DJkvXa7XXhzcXygbQIa7Cdr
         E5fRwGXk/+dvB7k/hFWqoaAjJQywGiltcCKkNnrXQKsTnc+uNJvwQOpT69bpKaHDt5Lk
         EdTxMF+sWpGWi+VKJb13m+sgs67/UdSmQGeamrK+IioJJjvq+UzYKmGIh5gsD3Nhnc4b
         oMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7gSXy+/YdsyTTMJ4JMwRd6QL5EZCwpdt3U8nsfTF/kY=;
        b=DVJebl1MEmcP8UQQO3hur3LVJbSRdLlagKT3jbSeuL2J5rCB/J4nMba66xUsbv2Rq2
         7Ro+ITkw2RcCHfBTu9/FIEK6gjr8qm7ZhCLVjR1FGT+lA5LJC16oB6dlaiiGErjWn2Hr
         5IncgB0RUwILQcnlMrnRunbZfwuFmWRKBWAMTHNOpkEOBeuv9/Sbz6WMOWmU5s6TTLDa
         CabD0KRSPdnvj/nOl6Z3/AE7G0GySQliz7YMNsrTcyQ7vKnXBQpaa2g7kZVvDG1cJHOo
         Oo6qV1LAuvgS6GH9YwqjKCtzABAKke2T+LbPBWyaAYsj12xDHmgMCY621lSfWkUjqjST
         EMpA==
X-Gm-Message-State: AOAM533Znyc5X3mEBbLezLkn1qTHQkNnQ3ceymSBnvR0vWWjcYT4g+Q9
        ewuEiv2d4qdzV/qNP9aoMkscS+Xc4tFae9d4RSQ=
X-Google-Smtp-Source: ABdhPJy0Po6i08c7jM4UtEXbxEQ5UuO2H1L8pPD5jcMbHsuSFoCrZuUaFhkGqGg/KsD0yXzU4Ue2eAU0WWKqrpeL+Wg=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr5784873plz.21.1604003233286; Thu, 29
 Oct 2020 13:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201019225903.14276-1-djrscally@gmail.com> <20201019225903.14276-10-djrscally@gmail.com>
 <20201024012411.GT5979@pendragon.ideasonboard.com> <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com> <20201026161050.GQ4077@smile.fi.intel.com>
 <20201029201918.GD15024@pendragon.ideasonboard.com>
In-Reply-To: <20201029201918.GD15024@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 29 Oct 2020 22:26:56 +0200
Message-ID: <CAHp75Vc9uYVvhBe3OyCJzCsU0EY9yi62hsxt3pAwppSfjB+jDg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 10:21 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2020 at 06:10:50PM +0200, Andy Shevchenko wrote:
> > On Sat, Oct 24, 2020 at 12:37:02PM +0300, Laurent Pinchart wrote:
> > > On Sat, Oct 24, 2020 at 09:50:07AM +0100, Dan Scally wrote:
> > > > On 24/10/2020 02:24, Laurent Pinchart wrote:
> > > > > On Mon, Oct 19, 2020 at 11:59:03PM +0100, Daniel Scally wrote:
> >
> > > > >> +              adev = acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
> > > > >
> > > > > What if there are multiple sensor of the same model ?
> > > >
> > > > Hmm, yeah, that would be a bit of a pickle. I guess the newer
> > > > smartphones have multiple sensors on the back, which I presume are the
> > > > same model. So that will probably crop up at some point. How about
> > > > instead I use bus_for_each_dev() and in the applied function check if
> > > > the _HID is in the supported list?
> > >
> > > Sounds good to me.
> > >
> > > > >> +              if (!adev)
> > > > >> +                      continue;
> >
> > Please, don't.
> >
> > If we have so weird ACPI tables it must be w/a differently. The all, even badly
> > formed, ACPI tables I have seen so far are using _UID to distinguish instance
> > of the device (see second parameter to the above function).
> >
> > If we meet the very broken table I would like rather to know about, then
> > silently think ahead what could be best.
> >
> > I.o.w. don't change this until we will have a real example of the problematic
> > firmware.
>
> I'm not sure to follow you. Daniel's current code loops over all the
> supported HID (as stored in the supported_devices table), and then gets
> the first ACPI device for each of them. If multiple ACPI devices exist
> with the same HID, we need to handle them all, so enumerating all ACPI
> devices and checking whether their HID is one we handle seems to be the
> right option to me.

Devices with the same HID should be still different by another
parameter in ACPI. The above mentioned call just uses the rough
estimation for relaxed conditions. If you expect more than one device
with the same HID how do you expect to distinguish them? The correct
way is to use _UID. It may be absent, or set to a value. And this
value should be unique (as per U letter in UID abbreviation). That
said, the above is good enough till we find the firmware with the
above true (several devices with the same HID). Until then the code is
fine.


-- 
With Best Regards,
Andy Shevchenko
