Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA42B454E
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgKPN4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728705AbgKPN43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:56:29 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159CAC0613CF;
        Mon, 16 Nov 2020 05:56:29 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id v21so570755pgi.2;
        Mon, 16 Nov 2020 05:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MXF0EBYvG5fT4YBRzFoSPae5jFIo7vWBbpd8hrhTyzk=;
        b=g5vxtHx4xOV5mKzEUMBlsOpkFH0i8jzxZfL1/zIJ+q19ezrpdEfFsShrNlSfAp9Ran
         FM5WWDC0uEeGhzHQUw9YpTVYlJ0NvJvJIlt9gZIi1Cxsv5hDSV61xi3+Akcbwi4g8QUb
         Wnj54fXe3J4lGV1CmPH3xBMoFJZ8lurRERrVtXsDnD66MsJBgv1AGmz6JmgR+ICLBxAp
         cztbBa7gLa4KLIY6UeblAt8E8kvKMXwCT9tgNXaOP4+iV8RCOAn/a5Jj4WpdhDrIybI7
         0P4FFwBiRCcwK6+xhPmlWPPQfQhz2OrC6hhXCD3fJWF8xx9pVjnOR3pvZX5gpkww177C
         vvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MXF0EBYvG5fT4YBRzFoSPae5jFIo7vWBbpd8hrhTyzk=;
        b=CCWoaAyCxuNwnpCKN0zou5tDGJgZ0o87ddKxbdZGWcqUP/UJ5lKahWeYBJQsg4/N/F
         EtsoWFkAutsrUNI4U/SH8OK1RCJjN39oUQFgF0nZhhuRvzqLNKNAuuEPN7y8hMKC7pUl
         3TbNcIT0CxIWJA4MRO74ABxZjGOl1Yva9xCWJezVkk/J6lpgHzmsxkIc6S1t/N36Anqh
         RK9OSG3ZyOYVE9fBp9xgAvTbKtUT8hu1ef1W6sT8MtDBCHTEQhvApYGUwenih/dCRvnq
         3AuUgozODm03NvnoyxQck0kNYs/BAfubK2IbIIRM9e5DN3ESYICwP+GOBpfBpe7laIBR
         PT2A==
X-Gm-Message-State: AOAM530guvYl3hpcoKK2kp+k4nWL2RPsqwJ8s61s8i0UYO84GFpCAZKF
        lRtllChOj2mwGMjvZOJH3lIIQ1Ow7rinfkB6PCnAD+tFE58=
X-Google-Smtp-Source: ABdhPJwhUXNBGvC5oY7ZwEFf9361fmAw3WXxSDeY5s1mhQ51O/zQJ8sJO1SSOguQMCuFccGFyOYS/4+Mis/L4GQcD2Q=
X-Received: by 2002:a62:7c95:0:b029:18c:5002:a1ab with SMTP id
 x143-20020a627c950000b029018c5002a1abmr13602355pfc.40.1605534988548; Mon, 16
 Nov 2020 05:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20201024093702.GA3939@pendragon.ideasonboard.com>
 <20201026161050.GQ4077@smile.fi.intel.com> <20201029201918.GD15024@pendragon.ideasonboard.com>
 <CAHp75Vc9uYVvhBe3OyCJzCsU0EY9yi62hsxt3pAwppSfjB+jDg@mail.gmail.com>
 <20201029212930.GE15024@pendragon.ideasonboard.com> <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com> <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
 <20201113162231.GO7524@pendragon.ideasonboard.com> <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
 <20201116085349.GA6540@pendragon.ideasonboard.com>
In-Reply-To: <20201116085349.GA6540@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Nov 2020 15:57:17 +0200
Message-ID: <CAHp75Ve-O4u1B=dvC+HT-sg=YnoWSuV6kUkPmBSOx4w9OgoOoA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 10:53 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Nov 13, 2020 at 09:45:00PM +0200, Andy Shevchenko wrote:
> > On Fri, Nov 13, 2020 at 6:22 PM Laurent Pinchart wrote:
> > > On Fri, Nov 13, 2020 at 10:02:30AM +0000, Dan Scally wrote:
> > > > On 29/10/2020 22:51, Laurent Pinchart wrote:
> > > > > On Fri, Oct 30, 2020 at 12:22:15AM +0200, Andy Shevchenko wrote:
> > > > >> On Thu, Oct 29, 2020 at 11:29:30PM +0200, Laurent Pinchart wrote=
:
> >
> > ...
> >
> > > > >> In this case we probably need something like
> > > > >>
> > > > >> struct acpi_device *
> > > > >> acpi_dev_get_next_match_dev(struct acpi_device *adev,
> > > > >>                        const char *hid, const char *uid, s64 hrv=
)
> > > > >> {
> > > > >>    struct device *start =3D adev ? &adev->dev : NULL;
> > > > >>    ...
> > > > >>    dev =3D bus_find_device(&acpi_bus_type, start, &match, acpi_d=
ev_match_cb);
> > > > >>    ...
> > > > >> }
> > > > >>
> > > > >> in drivers/acpi/utils.c and
> > > > >>
> > > > >> static inline struct acpi_device *
> > > > >> acpi_dev_get_first_match_dev(const char *hid, const char *uid, s=
64 hrv)
> > > > >> {
> > > > >>    return acpi_dev_get_next_match_dev(NULL, hid, uid, hrv);
> > > > >> }
> > > > >>
> > > > >> in include/linux/acpi.h.
> > > > >>
> > > > >> Then we may add
> > > > >>
> > > > >> #define for_each_acpi_dev_match(adev, hid, uid, hrv)            =
           \
> > > > >>    for (adev =3D acpi_dev_get_first_match_dev(hid, uid, hrv);   =
     \
> > > > >>         adev;                                                   =
   \
> > > > >>         adev =3D acpi_dev_get_next_match_dev(adev, hid, uid, hrv=
))
> > > > >
> > > > > What the cio2-bridge code needs is indeed
> > > > >
> > > > >     for each hid in supported hids:
> > > > >             for each acpi device that is compatible with hid:
> > > > >                     ...
> > > > >
> > > > > which could also be expressed as
> > > > >
> > > > >     for each acpi device:
> > > > >             if acpi device hid is in supported hids:
> > > > >                     ...
> > > > >
> > > > > I don't mind either option, I'll happily follow the preference of=
 the
> > > > > ACPI maintainers.
> > > >
> > > > Does this need raising elsewhere then? The original idea of just
> > > > bus_for_each_dev(&acpi_bus_type...) I have now tested and it works =
fine,
> > > > but it does mean that I need to export acpi_bus_type (currently tha=
t
> > > > symbol's not available)...that seems much simpler to me but I'm not=
 sure
> > > > whether that's something to avoid, and if so whether Andy's approac=
h is
> > > > better.
> > > >
> > > > Thoughts?
> > >
> > > I like simple options :-) A patch to export acpi_bus_type, with enoug=
h
> > > context in the commit message (and in the cover latter of the series)=
,
> > > should be enough to provide all the information the ACPI maintainers
> > > need to decide which option is best. With a bit of luck that patch wi=
ll
> > > be considered the best option and no extra work will be needed.
> >
> > The problem with ACPI bus is that it is not as simple as other buses,
> > i.e. it may have purely ACPI devices along with *companion* devices,
> > which are usually represented by platform bus. On top of that for
> > several ACPI devices there can be one physical node and it will be not
> > so clear what you are exactly looking for by traversing acpi_bus_type.
> > I believe it's hidden on purpose.
>
> Maybe there's something I don't get, as I'm not very familiar with the
> ACPI implementation in the kernel, but the code in the cio2-bridge,
> unless I'm mistaken, is really interested in ACPI devices on the ACPI
> bus, not companions or other devices related to the ACPI devices.

AFAICS cio2-bridge wants to find ACPI companion devices which are
enumerated as platform ones (or I=C2=B2C or SPI).

> The
> iterators you have proposed above use bus_find_device() on
> acpi_bus_type, so I don't really see how they make a difference from a
> cio2-bridge point of view.

This seems to be true. The iterators have no means to distinguish
between companion devices and pure ACPI, for example.
For this one needs to call something like 'get first physical node'
followed by 'let's check that it has a companion and that the one we
have already got from ACPI bus iterator'.

> Is your point that acpi_bus_type shouldn't be
> exported because it could then be misused by *other* drivers ? Couldn't
> those drivers then equally misuse the iterators ?

My point is that the ACPI bus type here is not homogenous.
And thus I think it was the reason behind hiding it. I might be
mistaken and you may ask ACPI maintainers for the clarification.

In summary I think we are trying to solve a problem that has not yet
existed (devices with several same sensors). Do we have a DSDT of such
to look into?

--=20
With Best Regards,
Andy Shevchenko
