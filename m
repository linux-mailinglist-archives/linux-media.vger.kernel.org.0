Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF9DD2DFAFC
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 11:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgLUKXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 05:23:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:11752 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgLUKXm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 05:23:42 -0500
IronPort-SDR: fq4WAh9/8GzWh5LiMCr33F+oPJDvsno9QMZu6G0z3FPnncavWE1034LdXDDOIv/o/dq5dqnlya
 EmdhfjzN3tFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="260435755"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="260435755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 02:21:56 -0800
IronPort-SDR: VfLDvac3fdFGdpCf23qdjQpfyWmKH3bg+KqqFuFCDCXXjnSj0R9/JiHSqwvM80aDuFoCn1gkGs
 DqKKQtVal4Xw==
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="491515405"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2020 02:21:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D2725205F7; Mon, 21 Dec 2020 12:21:47 +0200 (EET)
Date:   Mon, 21 Dec 2020 12:21:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Linus Walleij <linus.walleij@linaro.org>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>, jorhand@linux.microsoft.com
Subject: Re: [PATCH v2 12/12] ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver
Message-ID: <20201221102147.GJ26370@paasikivi.fi.intel.com>
References: <20201217234337.1983732-1-djrscally@gmail.com>
 <20201217234337.1983732-13-djrscally@gmail.com>
 <20201218211732.GE4077@smile.fi.intel.com>
 <e2b4c35f-5020-c332-d97a-8ba25be0e55e@gmail.com>
 <CAHp75VcebKas4j-vByodicHxRMrO4jkaJToSUW3iLJC2+vY_iA@mail.gmail.com>
 <e86fc26d-8c2f-c8a6-fc2e-ec612fd5d158@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e86fc26d-8c2f-c8a6-fc2e-ec612fd5d158@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel, Andy,

On Sat, Dec 19, 2020 at 11:48:51PM +0000, Daniel Scally wrote:
> On 19/12/2020 18:52, Andy Shevchenko wrote:
> > On Sat, Dec 19, 2020 at 2:25 AM Daniel Scally <djrscally@gmail.com> wrote:
> >> On 18/12/2020 21:17, Andy Shevchenko wrote:
> >>> On Thu, Dec 17, 2020 at 11:43:37PM +0000, Daniel Scally wrote:
> > 
> > ...
> > 
> >>>> +    sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type, 4);
> >>>
> >>> Does 4 has any meaning that can be described by #define ?
> >>
> >> It's V4L2_FWNODE_BUS_TYPE_CSI2_DPHY:
> >>
> >> https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-fwnode.c#L36
> >>
> >> That enum's not in an accessible header, but I can define it in this
> >> module's header
> > 
> > Maybe you can do a preparatory patch to make it visible to v4l2
> > drivers? (Like moving to one of v4l2 headers)
> 
> Sure ok, guess media/v4l2-fwnode.h makes the most sense.

Yes, please.

> 
> > ...
> > 
> >>>> +                    if (bridge->n_sensors >= CIO2_NUM_PORTS) {
> >>>> +                            dev_warn(&cio2->dev, "Exceeded available CIO2 ports\n");
> >>>
> >>>> +                            /* overflow i so outer loop ceases */
> >>>> +                            i = ARRAY_SIZE(cio2_supported_sensors);
> >>>> +                            break;
> >>>
> >>> Why not to create a new label below and assign ret here with probably comment
> >>> why it's not an error?
> >>
> >> Sure, I can do that, but since it wouldn't need any cleanup I could also
> >> just return 0 here as Laurent suggest (but with a comment explaining why
> >> that's ok as you say) - do you have a preference?
> > 
> > While it's a good suggestion it will bring a bit of inconsistency into
> > approach. Everywhere else in the function you are using the goto
> > approach.
> > So yes, I have a preference.
> 
> No problem

Laurent also commented on the return code.

I might just handle this as an error. The earlier ports are fine, but
there's also a problem with the data here. It'd be easier to spot that this
way, and we can change this in the future if need be.

-- 
Kind regards,

Sakari Ailus
