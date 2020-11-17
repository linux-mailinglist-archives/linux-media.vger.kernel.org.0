Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311F62B6A7C
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 17:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgKQQlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 11:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgKQQlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 11:41:42 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10727C0613CF;
        Tue, 17 Nov 2020 08:41:42 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id r6so748846pjd.1;
        Tue, 17 Nov 2020 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j1TAcUrjKEy76wjAXBIQJ3GzJO9z5YIxOVB1u0l3J6I=;
        b=KKTdQcD0tivBmYTD36cbR9vwsRVZPz4q4psrR37L+8pcwRjwhg7rYd1CNZe8fAArUx
         8oGD0BrBRlr2ZCAlRAEPG4TfB6TPCloKdseQqw2MavcOJ3a8eISzEohhxJWi6L0Qn9pU
         ve7CZAJOGL9QrILE8U93DACcv6wHl66+sdsTPxb1M0Fjhli8KSu6iRryM13JGLoqCtZX
         AVJwGu2I4a3Rq2p4JxvV2cL6qn0v5kEsEqgSezZLPirMqKNMg20AaxbUxZ/G/D8sluba
         uQBSnvk/5JM2xFi11W2a3YkmMRsFEK7yMb4i9MW131G0+BWo6G5bcEBNqVFdgK51xpE5
         BhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j1TAcUrjKEy76wjAXBIQJ3GzJO9z5YIxOVB1u0l3J6I=;
        b=p3eOnP2j66Yp11qpFeGvUJHRK79eLHkluWuAb0gKFKn+uHwGIwt+Lk3ptMX/rquktL
         psWzZNQL5JQXHMRTPNWT6kbCaXAQzOtEsJN0DXEnUTzNP0ijNhqZSqKZfylT1R8NnxX+
         BgJ6PyGg8KoR3+RZJRhAkwhOKaUgA2erjAq6oFYPahW3W6jv0l5sf8pRMXFij6P8iV6l
         poZOb4ZyZu8IXWukrprVF2/3ixLBzPM2RiB2oXc5xSeBAJml1M54xPgfI3d6ChrGha2Z
         sMxM3NQ8HDdD5ol7fr2VOvJ8pvPXSYY6njTHwyCYnDyJgKD3gyVPSrDGomhyCntVIW6k
         xvRQ==
X-Gm-Message-State: AOAM532Do6ctgzwrRmkxD+oPXf6T4xq7qfZHMixDx2Yt0j8hKYSmBuWY
        9pYCK6ISU3roUom9pK3j+GHEwr+BEol7R2StNCxh31cv3tE=
X-Google-Smtp-Source: ABdhPJzE+v2+gzZ5roJQEj2Wtryi83SQdLC1HaGh8J+FRXDZxmDBW6QRmnv6XWsT2LT16l8WN6PifgKXCIokmNvQsUg=
X-Received: by 2002:a17:902:ac93:b029:d8:d2c5:e5b1 with SMTP id
 h19-20020a170902ac93b02900d8d2c5e5b1mr4886plr.17.1605631301522; Tue, 17 Nov
 2020 08:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20201029212930.GE15024@pendragon.ideasonboard.com>
 <20201029222215.GI4077@smile.fi.intel.com> <20201029225124.GI15024@pendragon.ideasonboard.com>
 <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com> <20201113162231.GO7524@pendragon.ideasonboard.com>
 <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
 <20201116085349.GA6540@pendragon.ideasonboard.com> <CAHp75Ve-O4u1B=dvC+HT-sg=YnoWSuV6kUkPmBSOx4w9OgoOoA@mail.gmail.com>
 <20201116141038.GJ6540@pendragon.ideasonboard.com> <3646e11c-a101-74e3-2eb4-7abf29937e9d@gmail.com>
 <20201116161636.GC4077@smile.fi.intel.com> <3976eac8-2a21-a619-1dba-85212ac4b4b1@gmail.com>
In-Reply-To: <3976eac8-2a21-a619-1dba-85212ac4b4b1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Nov 2020 18:42:29 +0200
Message-ID: <CAHp75VcEb373m=WjP5nPtEUMiiKga2_5w1YPB-T=VtvjaFh7Ww@mail.gmail.com>
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Dan Scally <djrscally@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Tue, Nov 17, 2020 at 2:02 PM Dan Scally <djrscally@gmail.com> wrote:
>
> On 16/11/2020 16:16, Andy Shevchenko wrote:
> > On Mon, Nov 16, 2020 at 02:15:01PM +0000, Dan Scally wrote:
> >> On 16/11/2020 14:10, Laurent Pinchart wrote:
> >>> I thought we were looking for ACPI devices, not companion devices, in
> >>> order to extract information from the DSDT and store it in a software
> >>> node. I could very well be wrong though.
> >> This is correct - the code to fetch the various resources we're lookin=
g
> >> at all uses acpi_device. Whether using Andy's iterator suggestions or
> >> previous bus_for_each_dev(&acpi_bus_type...) I'm just getting the
> >> acpi_device via to_acpi_dev() and using that.
> > If you try to get an I=C2=B2C ore SPI device out of pure ACPI device (w=
ith given
> > APCI _HID) you will fail. So, it's not correct. You are retrieving comp=
anion
> > devices, while they are still in the struct acpi_device.
> >
> > And don't ask me, why it's so. I wasn't designed that and didn't affect=
 any
> > decision made there.
>
> Well, in terms of the actual device we're getting, I don't think we're
> fundamentally doing anything different between the methods...unless I'm
> really mistaken.
>
>
> Originally implementation was like:
>
>
> const char *supported_devices[] =3D {
>
>         "OVTI2680",
>
> };
>
>
> static int cio2_bridge_connect_supported_devices(void)
>
> {
>
>         struct acpi_device *adev;
>
>         int i;
>
>         for (i =3D 0; i < ARRAY_SIZE(supported_devices); i++) {
>
>                 adev =3D
> acpi_dev_get_first_match_dev(supported_devices[i], NULL, -1);
>
> ...
>
> }
>
>
> and acpi_dev_get_first_match_dev() likewise just returns adev via
> to_acpi_device(dev).
>
>
> So, maybe we don't need to do the iterating over all devices with
> matching _HID at all, in which case it can be dropped, but if we're
> doing it then I can't see that it's different to the original
> implementation in terms of the struct acpi_device we're working with or
> the route taken to get it.
>
>
> Either way; ACPI maintainers asked to be CC'd on the next patchset
> anyway, so they'll see what we're doing and be able to weigh in.

Implementation wise the two approaches are quite similar for now, indeed.
I would rather go with an iterator approach for a simple reason, EFI
code already has something which may utilize iterators rather than
using their home grown solution.

--=20
With Best Regards,
Andy Shevchenko
