Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3A12B24D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 20:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgKMTpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 14:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbgKMTpS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 14:45:18 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3552EC0613D1;
        Fri, 13 Nov 2020 11:45:17 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 10so8502367pfp.5;
        Fri, 13 Nov 2020 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkEByu5NaYXbpu/E/2DlifVZ1EfrvqJGLXUDnNk39PE=;
        b=Rz2XI7G1+m0ld1eHrQzMuvdwM7JVktfgJBRZssdlP431IvCpwop0fPtidv4cA16zG1
         YW8m70eOTbY+DnBRInp5zDhMcPh78P6fjTVUXz/oktLPqDuRRs9FGhmwPyGVf68HiLgi
         PQN3dSIQ4IkboU607MzK7nyKEi26RJCB1p2Fp0Ye4Ai3AgI3kqYVlYNEfDh5hbIYXTHH
         2CCCaRW9ch9IAubYq5WMe29Lw8AFt3/QNQz75EvL2WQD+a8JyPahW/0DwNL0nktJsc+t
         aQ2MdflYcYDCWAVPa6o/N0SmaBRPo4L+L8K/kwQBCiI6/RmnK5BQasNCO3ELEhwNUhCX
         fKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkEByu5NaYXbpu/E/2DlifVZ1EfrvqJGLXUDnNk39PE=;
        b=Hjc5CYtLUr8nLc6s5UEjR4wyLrKKLT7MvVyB5buku5wH3I/tOnQhxUI93SaO5nSFQN
         B5+vbuBkJ8gxv4TrNh3ocs63oQfFliXgQTl3E/qtjfNvQH/q7Egydjw6pkBN2Ky0bnH5
         uTOkgfooz8/IwokDqvL2wuU7WwIR4ASNYS1Y8cRfi/X3OW+5kaZrJ2IExkJLGXliGNIa
         AyHmfeqstyDOBDFPMW4vvD4tlrcVV210cPhA2Q3Hd2Cz3dY/5p/0OgeHfqJNson2ZY52
         VsgRgve6l+5tgtsymCZFYOcNSmOeDe4LSSBXXOaT7vWSw1X6R1boPXTKcWJlUX8mnQyq
         KnOA==
X-Gm-Message-State: AOAM530+mG69lSxDphjpLZF1kcIm2Hzr52FdDYY76FBX0Tp6CRyj/6wK
        pZTOdZqpH2JCctwEo1PjprgBA8PgaeIcSEEqXgk=
X-Google-Smtp-Source: ABdhPJxJMB475AzgJKmkxrj9hbti9Hm2ImgxJYxsQnBlDjERd6f7NR4NyARgrTSN+GjQAPKiOlye2zfCxR0Tb6QHJB4=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr3160904pga.74.1605296716678;
 Fri, 13 Nov 2020 11:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com> <20201024093702.GA3939@pendragon.ideasonboard.com>
 <20201026161050.GQ4077@smile.fi.intel.com> <20201029201918.GD15024@pendragon.ideasonboard.com>
 <CAHp75Vc9uYVvhBe3OyCJzCsU0EY9yi62hsxt3pAwppSfjB+jDg@mail.gmail.com>
 <20201029212930.GE15024@pendragon.ideasonboard.com> <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com> <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
 <20201113162231.GO7524@pendragon.ideasonboard.com>
In-Reply-To: <20201113162231.GO7524@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 13 Nov 2020 21:45:00 +0200
Message-ID: <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>,
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

On Fri, Nov 13, 2020 at 6:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Nov 13, 2020 at 10:02:30AM +0000, Dan Scally wrote:
> > On 29/10/2020 22:51, Laurent Pinchart wrote:
> > > On Fri, Oct 30, 2020 at 12:22:15AM +0200, Andy Shevchenko wrote:
> > >> On Thu, Oct 29, 2020 at 11:29:30PM +0200, Laurent Pinchart wrote:

...

> > >> In this case we probably need something like
> > >>
> > >> struct acpi_device *
> > >> acpi_dev_get_next_match_dev(struct acpi_device *adev,
> > >>                        const char *hid, const char *uid, s64 hrv)
> > >> {
> > >>    struct device *start = adev ? &adev->dev : NULL;
> > >>    ...
> > >>    dev = bus_find_device(&acpi_bus_type, start, &match, acpi_dev_match_cb);
> > >>    ...
> > >> }
> > >>
> > >> in drivers/acpi/utils.c and
> > >>
> > >> static inline struct acpi_device *
> > >> acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
> > >> {
> > >>    return acpi_dev_get_next_match_dev(NULL, hid, uid, hrv);
> > >> }
> > >>
> > >> in include/linux/acpi.h.
> > >>
> > >> Then we may add
> > >>
> > >> #define for_each_acpi_dev_match(adev, hid, uid, hrv)                       \
> > >>    for (adev = acpi_dev_get_first_match_dev(hid, uid, hrv);        \
> > >>         adev;                                                      \
> > >>         adev = acpi_dev_get_next_match_dev(adev, hid, uid, hrv))
> > >
> > > What the cio2-bridge code needs is indeed
> > >
> > >     for each hid in supported hids:
> > >             for each acpi device that is compatible with hid:
> > >                     ...
> > >
> > > which could also be expressed as
> > >
> > >     for each acpi device:
> > >             if acpi device hid is in supported hids:
> > >                     ...
> > >
> > > I don't mind either option, I'll happily follow the preference of the
> > > ACPI maintainers.
> >
> > Does this need raising elsewhere then? The original idea of just
> > bus_for_each_dev(&acpi_bus_type...) I have now tested and it works fine,
> > but it does mean that I need to export acpi_bus_type (currently that
> > symbol's not available)...that seems much simpler to me but I'm not sure
> > whether that's something to avoid, and if so whether Andy's approach is
> > better.
> >
> > Thoughts?
>
> I like simple options :-) A patch to export acpi_bus_type, with enough
> context in the commit message (and in the cover latter of the series),
> should be enough to provide all the information the ACPI maintainers
> need to decide which option is best. With a bit of luck that patch will
> be considered the best option and no extra work will be needed.

The problem with ACPI bus is that it is not as simple as other buses,
i.e. it may have purely ACPI devices along with *companion* devices,
which are usually represented by platform bus. On top of that for
several ACPI devices there can be one physical node and it will be not
so clear what you are exactly looking for by traversing acpi_bus_type.
I believe it's hidden on purpose.


-- 
With Best Regards,
Andy Shevchenko
