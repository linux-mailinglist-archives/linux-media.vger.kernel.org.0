Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F7E2E881E
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 18:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbhABRXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 12:23:37 -0500
Received: from mga02.intel.com ([134.134.136.20]:22783 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbhABRXg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 12:23:36 -0500
IronPort-SDR: pRH8RLejw1rxv/mbPUkEHO4PH0BW62zrNW5hAvHR/bWf0qxXNakReJ3h7TYdJadyUADvL9EdL1
 ZXMexGvhiAPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9852"; a="163895332"
X-IronPort-AV: E=Sophos;i="5.78,470,1599548400"; 
   d="scan'208";a="163895332"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 09:21:50 -0800
IronPort-SDR: EPjvPP5vEZ0hdOwXHXakBXOGtZvsyYJQmeVfzjNQ0xP3EGcDuZWRN8g8RDov7eybLzsjb9Y1Sx
 nd2j+N6LAosg==
X-IronPort-AV: E=Sophos;i="5.78,470,1599548400"; 
   d="scan'208";a="401492940"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 09:21:43 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CF8CB207BF; Sat,  2 Jan 2021 19:21:41 +0200 (EET)
Date:   Sat, 2 Jan 2021 19:21:41 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        niklas.soderlund+renesas@ragnatech.se,
        Steve Longerbeam <slongerbeam@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jordan Hand <jorhand@linux.microsoft.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 14/14] ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver
Message-ID: <20210102172141.GE11878@paasikivi.fi.intel.com>
References: <20201224010907.263125-1-djrscally@gmail.com>
 <20201224010907.263125-15-djrscally@gmail.com>
 <CAHp75VeXN6PnV7Mzz6UMpD+m-yjPi6XK0kx1=+-M5mci=Vb=YQ@mail.gmail.com>
 <20201228170521.GZ26370@paasikivi.fi.intel.com>
 <2d37df3d-f04c-6679-6e27-6c7f82e9b158@gmail.com>
 <20210102170731.GD11878@paasikivi.fi.intel.com>
 <f0d6751d-b395-49f4-2411-0ed13e4dabc0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0d6751d-b395-49f4-2411-0ed13e4dabc0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 02, 2021 at 05:12:47PM +0000, Daniel Scally wrote:
> Hi Sakari
> 
> On 02/01/2021 17:07, Sakari Ailus wrote:
> > Hi Daniel,
> >
> > On Mon, Dec 28, 2020 at 10:37:38PM +0000, Daniel Scally wrote:
> >>>>> +#define CIO2_NUM_PORTS                         4
> >>> This is already defined in ipu3-cio2.h. Could you include that instead?
> >> Yes; but I'd need to also include media/v4l2-device.h and
> >> media/videobuf2-dma-sg.h (they're included in ipu3-cio2-main.c at the
> >> moment). It didn't seem worth it; but I can move those two includes from
> >> the .c to the .h and then include ipu3-cio2.h in cio2-bridge.h
> >>
> >> Which do you prefer?
> > Seems you got answers already... :-) splitting the header in two seems good
> > to me. But IMO it doesn't have to be a part of this set.
> >
> Yeah I've been hesitating over this; if we chose not to do it in this
> set though, how would you want me to deal with the double definition of
> CIO2_NUM_PORTS

How about prepending Andy's patch to the set and including the header?

-- 
Sakari Ailus
