Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F31B25B1C6
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIBQep convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 2 Sep 2020 12:34:45 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34516 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgIBQen (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 12:34:43 -0400
Received: by mail-ot1-f68.google.com with SMTP id k20so4841933otr.1;
        Wed, 02 Sep 2020 09:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k6sQ8NK5KtPThkaGEr90OvdrGo/rolJeRwG3Mehbjj4=;
        b=moXRdCI/ACkF5yQ9r6YJ75vFvXlmVadUUpeK7rzjfDVrXhfmM63HLIgz5I1fk878LG
         Ut7jS8T8weRbKiB42JLNYUxdLf8o2hnqI6TedTBb0KXO6DfDWqxG7eMqsncHhMkij9j6
         J9K3x27DXz90n4Jr8nVEa91yJTiA0KjDEQB9EeP6w9+z0TpGaaN12fuFc4BAY6aU5wOP
         uzWxLgxrnUj3vWFcRTJBK4baEh18ancyHcz7XdQVCgS56U0rSgG1aFtyETNa+3JhzeGO
         qkcrOSSFdsoOir+nubNNUNm0hbsE6ylK9/Ts6PkHhNXeHrFVZcLSYr2mAllBhoc0/J4C
         XOEA==
X-Gm-Message-State: AOAM532PYFM5ym7URGPPcBi+aDC0g+4z3OP3GX9Bheicc4+WvFLrbdRK
        A5pXegk5T93abKhQcSt5GHtRnbPStsyYi/Juwmc=
X-Google-Smtp-Source: ABdhPJxO817L5DuFtEmWzwSJ2CVzvkCcRa8d0G0kMpIOh0RLaIuBkb1BV6tUs952F8VswttZF3Ufrsqg3LJUJV2veSs=
X-Received: by 2002:a9d:5c06:: with SMTP id o6mr5832095otk.262.1599064481624;
 Wed, 02 Sep 2020 09:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200901210333.8462-1-sakari.ailus@linux.intel.com>
 <20200901210333.8462-7-sakari.ailus@linux.intel.com> <CAJZ5v0jFceTFRTD55cz3ZHRZpuNRK_z9=_DxWexc8ArsGU3cog@mail.gmail.com>
 <20200902163121.GE32646@paasikivi.fi.intel.com>
In-Reply-To: <20200902163121.GE32646@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 2 Sep 2020 18:34:30 +0200
Message-ID: <CAJZ5v0jmetD2N0-ZrNh8C8oOCFwdwwH9s6FqHOQApMdFa_AZ1A@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] Documentation: ACPI: Document allow-low-power-probe
 _DSD property
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 2, 2020 at 6:31 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> Thank you for the review.
>
> On Wed, Sep 02, 2020 at 05:57:01PM +0200, Rafael J. Wysocki wrote:
> > On Tue, Sep 1, 2020 at 11:03 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Document the probe-low-power _DSD property and how it is used with I²C
> > > drivers.
> >
> > I would reorder the series to make this go right after the [1/6] or
> > maybe even fold it into that patch.
> >
> > The point is that the changes in [1/6] clearly depend on the property
> > defined here.
>
> Ack.
>
> >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++++++++
> > >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > >
> > > diff --git a/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > new file mode 100644
> > > index 0000000000000..6fcc89162b898
> > > --- /dev/null
> > > +++ b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > @@ -0,0 +1,28 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +======================================
> > > +Probing I²C devices in low power state
> > > +======================================
> > > +
> > > +Introduction
> > > +============
> > > +
> > > +In some cases it may be preferred to leave certain devices powered off for the
> > > +entire system bootup if powering on these devices has adverse side effects,
> > > +beyond just powering on the said device. Linux recognizes the _DSD property
> > > +"allow-low-power-probe" that can be used for this purpose.
> >
> > It would be good to refer to the document defining the generic _DSD
> > properties mechanism and the GUID used for that from here.
>
> I'll add a reference to the device properties UUID for _DSD spec.
>
> >
> > The meaning of  "_DSD property" may not be entirely clear to the
> > reader as it stands.
> >
> > And maybe call the property "i2c-allow-low-power-probe" or similar, to
> > indicate that it is specific to i2c.
>
> The bus determines that already, and it's only defined for I²C here. Should
> we need this in the future for e.g. I3C, there would be no need to think of
> renaming it, just changing the documentation and implementation.
>
> I don't have a strong opinion on that though.

The point is that the property is not going to be recognized beyond i2c.

> > > +
> > > +How it works
> > > +============
> > > +
> > > +The property "allow-low-power-probe" boolean property may be used to tell Linux
> >
> > "boolean device property" ?
>
> Oops. The other "property" was supposed to be removed by now. But yes, I
> agree with the suggestion.
>
> >
> > > +that the I²C framework should instruct the kernel ACPI framework to leave the
> > > +device in the low power state. If the driver indicates its support for this by
> > > +setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags
> > > +field and the "allow-low-power-probe" property is present, the device will not
> > > +be powered on for probe.
> > > +
> > > +The downside is that as the device is not powered on, even if there's a problem
> > > +with the device, the driver likely probes just fine but the first user will
> > > +find out the device doesn't work, instead of a failure at probe time. This
> > > +feature should thus be used sparingly.
> >
> > It would be good to give an ASL example with this property provided.
>
> I'll add that for v8.
>
> >
> > > diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
> > > index ad3b5afdae77e..0070fcde9e669 100644
> > > --- a/Documentation/firmware-guide/acpi/index.rst
> > > +++ b/Documentation/firmware-guide/acpi/index.rst
> > > @@ -11,6 +11,7 @@ ACPI Support
> > >     dsd/graph
> > >     dsd/data-node-references
> > >     dsd/leds
> > > +   dsd/allow-low-power-probe
> > >     enumeration
> > >     osi
> > >     method-customizing
> > > --
>
> --
> Kind regards,
>
> Sakari Ailus
