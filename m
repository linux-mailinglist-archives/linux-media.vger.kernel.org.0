Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA001830E7
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 14:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCLNKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 09:10:55 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40707 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgCLNKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 09:10:55 -0400
Received: by mail-qk1-f196.google.com with SMTP id m2so5983297qka.7
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Fw7HC8zfyv7xlZ8Y772nkRRedqdvBOfOWFl3YVWCR/U=;
        b=AdZtKeCPQg9PgXC0gviIyq+JosFZw/cAj9pq91dp7zf89VIQDfzUxGcjz8E8TkavhT
         RXxwgeNdTPjfEsKrFyHeXoXs7WFrhj9ob0zHAdnhajSny3M5b/maHxghCUkR8VcOIgg8
         s7uOi1wR/QJzem+7e/rCx/FDiXmep2ZF3NmBzvwQXQZTX9kvfEW9Fl1Zpgba+BubQ0EU
         sFyIF4FLnctOXb1QrFeHZe455H9ZlDTzReH8Cha5blAUVyxNOr4DMlDMzccRxpGsxaLg
         4+l1Ydhy9ahwwDJucHO68yg8M6y40megUBqte2rt2btM9CIDfaqWnmrbvt3Burx5y9Lg
         mD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Fw7HC8zfyv7xlZ8Y772nkRRedqdvBOfOWFl3YVWCR/U=;
        b=X/HjSBgO10VDBNnKdhKtL7Mjb/8WKDCUPJooPW8AvIDYbv89oDlKQTJ6NqSoQQiDKr
         tCFcHCiM7M+sewIal4Kd8tsJoZUt71lC8FwCth3K26fU5dj7XDzkA3VtBqZ7Oynjs1Tr
         5fbXUZxPwT5LeNbSpj1Si+GSks1WfElwR9kXEXcCXGdBaGxuLo/YogOoMkR7o3j1hux7
         H62rYS974fbfrpmitc9hYFND5HDGR2WpMvuA49dR4Dwj32tv6rMfpjl7+pNcSLRMh77s
         zoCQCuuelCooj2tNj2GxcgLgoNTDZrBJ8kbfoD1t6AdJmNqAxMUEy/uINQBKKjGiwr2p
         AA7w==
X-Gm-Message-State: ANhLgQ28tc5uXXmuiNzEEcG6RhMis2CUSSUylJlChrxmGEs4vPI5kd3c
        u9MFva/2xpyqBURrBbAftL9h7s4+KwdtAg/fuGgexQ==
X-Google-Smtp-Source: ADFU+vsmLosOjuDP68r5eZPgol6dnmqRd+ZILVuI3Tk+l4vBb9/VptFkuJxMubd5z3NSwovTdmfxm5comn6Ihs5O5vc=
X-Received: by 2002:a05:620a:1362:: with SMTP id d2mr7822512qkl.120.1584018652254;
 Thu, 12 Mar 2020 06:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com> <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com>
In-Reply-To: <20200311085555.GH5379@paasikivi.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 14:10:32 +0100
Message-ID: <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=C5=9Br., 11 mar 2020 o 09:56 Sakari Ailus <sakari.ailus@linux.intel.com> n=
apisa=C5=82(a):
>
> Hi Bartosz,
>
> Thanks for the reply.
>
> On Wed, Jan 29, 2020 at 02:36:17PM +0100, Bartosz Golaszewski wrote:
> > wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> na=
pisa=C5=82(a):
> > >
> > > In certain use cases (where the chip is part of a camera module, and =
the
> > > camera module is wired together with a camera privacy LED), powering =
on
> > > the device during probe is undesirable. Add support for the at24 to
> > > execute probe while being powered off. For this to happen, a hint in =
form
> > > of a device property is required from the firmware.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------

[snip!]

> > >
> > >  static int at24_remove(struct i2c_client *client)
> > >  {
> > > +       bool low_power;
> > > +
> > >         pm_runtime_disable(&client->dev);
> > > -       pm_runtime_set_suspended(&client->dev);
> > > +       low_power =3D acpi_dev_state_low_power(&client->dev);
> >
> > This is inconsistent. You define the low_power field in the context
> > structure (BTW the name low_power is a bit vague here - without
> > looking at its assignment it would make me think it's about something
> > battery-related, how about 'off_at_probe'?) and instead of reusing
>
> The field was called probe_powered_off in v1, but I changed it to
> probe_low_power (and renamed related functions etc.) based on review
> comments --- for the device may not be powered off actually.
>

But is it actually ever low-power? What are the possible logical
states of the device? If I understood correctly: it's either off or on
at probe - not actually low-power. Am I missing something? In your
cover letter you're writing: "These patches enable calling (and
finishing) a driver's probe function without powering on the
respective device on busses where the practice is to power on the
device for probe." To me there's no mention of a low-power state,
which makes the name 'probe_low_power' seem completely unrelated.

> > this field here, you call acpi_dev_state_low_power() again. Either
> > don't store the context for the life-time of the device if not
> > necessary or don't call acpi_dev_state_low_power() at remove, although
> > the commit message doesn't describe whether the latter is done on
> > purpose.
>
> Right. probe-low-power property has the same effect on remove for
> consistency, i.e. the device can remain in low power state during remove.
> This is documented in probe_low_power field documentation in the first
> patch.
>

Just please don't store any state if you're not using it outside of
the probe() function.

Bartosz
