Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A634C3153C5
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 17:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232825AbhBIQZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 11:25:45 -0500
Received: from mga02.intel.com ([134.134.136.20]:17253 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232814AbhBIQZg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Feb 2021 11:25:36 -0500
IronPort-SDR: ym0iuQY2FX9LiyE2ZsxsNhxXRoap+8iVZcFoy4IZT0FxVb0zsDRghdfVyq+ygpbDiKJ4v7/Iga
 UNWVi4Ig7X8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="169032185"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="169032185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:23:49 -0800
IronPort-SDR: xHdI5y8rC6KV+cXeXn6S8HlQ+eoX0wTgOEDIuAns3YtTuNrvpwktjbmW8v11u4v6gGJjhV4CHc
 GyY7JGwAf3Qw==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="436239479"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:23:46 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 068EC206D0; Tue,  9 Feb 2021 18:23:44 +0200 (EET)
Date:   Tue, 9 Feb 2021 18:23:43 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
Message-ID: <20210209162343.GF32460@paasikivi.fi.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com>
 <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
 <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
 <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bartosz, Rafael,

On Tue, Feb 09, 2021 at 04:49:37PM +0100, Bartosz Golaszewski wrote:
> On Mon, Feb 8, 2021 at 5:54 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
> > <bgolaszewski@baylibre.com> wrote:
> > >
> > > On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > In certain use cases (where the chip is part of a camera module, and the
> > > > camera module is wired together with a camera privacy LED), powering on
> > > > the device during probe is undesirable. Add support for the at24 to
> > > > execute probe while being powered off. For this to happen, a hint in form
> > > > of a device property is required from the firmware.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > > ---
> > >
> > > I'll ack this but I still claim that the name
> > > acpi_dev_state_low_power() is super misleading for this use-case and
> > > I've been saying that for 10 versions now with everyone just ignoring
> > > my remarks. :/
> >
> > Well, the function in question simply checks if the current ACPI power
> > state of the device is different from "full power", so its name
> > appears to be quite adequate to me.
> >
> > If the way in which it is used is confusing, though, I guess
> > explaining what's going on would be welcome.
> >
> 
> Yes, I have explained it multiple time already - last time at v9 of this series:
> 
>     https://www.spinics.net/lists/kernel/msg3816807.html

How about adding this to the description of acpi_dev_state_low_power():

-----------8<--------------
 * This function is intended to be used by drivers to tell whether the device
 * is in low power state (D1--D3cold) in driver's probe or remove function. See
 * Documentation/firmware-guide/acpi/low-power-probe.rst for more information.
-----------8<--------------

-- 
Kind regards,

Sakari Ailus
