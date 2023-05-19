Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42913709585
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 12:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjESK6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 06:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbjESK6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 06:58:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A35E6E
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684493914; x=1716029914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWixZ4MT90UI9L7ETzZa110ghC7q7ws50AU4tI0e66A=;
  b=OZzBmMzEwdNkUGuW4ul0XE8hWaoDoo9VD0BU+FHxOZ+AHEY1Wi/Ty3xJ
   XTNSdZ7f038mxMLADV/qYA/1oqR3edkf8LzGW7ptmwxRKTMuIj9EumlWq
   /kzWMJ9JJNyYS6ZvYDnBhdVQNDmRezRk4qX7KZ/0q79WD0Q8mn75VqNnv
   VyUqO1ZfDI2DOg+rMFYrxOxp3UWZDiEOyVfGQZ9vgRxPDgUZkmnemxPDI
   khqHMv8swmDXCvzHhBldxSTZOG4mc2Os/NGGPYoOdb7SDR5AHMHVO2Qdn
   RWqBPYJCfHUFkn5V/rTjB1ZLcFg4MEWUC3CAVZ8oglVVujx+jL11R4M7b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="352362007"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="352362007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 03:58:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792332096"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="792332096"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 03:58:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 44F88120279;
        Fri, 19 May 2023 13:58:28 +0300 (EEST)
Date:   Fri, 19 May 2023 10:58:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios()
 helper function
Message-ID: <ZGdWVATARAQlaEjC@kekkonen.localdomain>
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
 <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 5/19/23 09:31, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, May 18, 2023 at 05:32:06PM +0200, Hans de Goede wrote:
> >> On x86/ACPI platforms the GPIO resources do not provide information
> >> about which GPIO resource maps to which connection-id. So e.g.
> >> gpiod_get(devg, "reset") does not work.
> >>
> >> On devices with an Intel IPU3 or newer ISP there is a special ACPI
> >> INT3472 device describing the GPIOs and instantiating of the i2c_client
> >> for a sensor is deferred until the INT3472 driver has been bound based
> >> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
> >>
> >> This allows the INT3472 driver to add the necessary GPIO lookups
> >> without needing any special ACPI handling in the sensor driver.
> >>
> >> Unfortunately this does not work on devices with an atomisp2 ISP,
> >> there the _DSM describing the GPIOs is part of the sensor ACPI device
> >> itself, rather then being part of a separate ACPI device.
> >>
> >> IOW there is no separate firmware-node to which we can bind to register
> >> the GPIO lookups (and also no way to defer creating the sensor i2c_client).
> >>
> >> This unfortunately means that all sensor drivers which may be used on
> >> BYT or CHT hw need some code to deal with ACPI integration.
> >>
> >> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
> >> for this, which does all the necessary work. This minimizes the
> >> (unavoidable) change to sensor drivers for ACPI integration to just
> >> adding a single line calling this void function to probe().
> > 
> > I'd rather avoid making changes to sensor drivers due to this hack. At the
> > very least it must be labelled so: this has no more to do with ACPI
> > standard than that this information happens to be located in an ACPI table.
> 
> IMHO this is definitely a problem with a mismatch between how the ACPI spec.
> describes GPIOs vs the linux GPIO APIs which are based on the DT model
> 
> Almost all drivers which deal with ACPI enumerated devices also have to
> deal with this mismatch. Most drivers come with their own acpi_gpio_mapping
> table and call devm_acpi_dev_add_driver_gpios() before doing any gpiod_get()
> calls because of this. This is in no way unique to sensor drivers.
> 
> The only way around this is embedding DT bits inside ACPI and if anything
> the embedding DT bits inside ACPI is the hack here.
> 
> Anyways whether this is a hack or not is bikeshedding. But your calling
> it a hack seems to come from a somewhat devicetree centric view; at least
> doing the DT embedding thing is certainly the exception and not the rule
> in the ACPI world since most ACPI tables are written for Windows which
> does not use the embedded DT bits.
> 
> The Intel ISP/IPU sensor GPIO handling is a bit special because instead
> of having a simple index -> connection-id mapping it involves a _DSM,
> but that part is all abstracted away inside the new helper and actually
> avoids the need to have an acpi_gpio_mapping per sensor-driver, which would
> be the normal way to deal with this and which would actually mean a lot
> more code per driver.

I'm not referring referring to differences in GPIOs between ACPI and Linux,
but the rest, and why drivers need to call the newly added function.

> 
> > Although if the number of those drivers would be small, this could be just
> > undesirable but still somehow acceptable. And I wouldn't expect new sensors
> > to be paired with the IPU2 anymore. How many drivers there would be
> > roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
> 
> About ten-ish drivers sounds right.
> 
> > Isn't it possible to create a device for this purpose and use software
> > nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
> > have to initialise this via other route than driver probe.
> 
> This creates unsolvable probe-ordering problems. At a minimum we would
> need some check inside sensor drivers for them to return -EPROBE_DEFER
> until the GPIO mappings are added through some other means. Note that
> without the mappings gpiod_get will return -ENOENT, so we cannot just
> use its return value.

They probably will already need this in order to make sure the atomisp
bridge has been initialised.

Could this code live in the atomisp bridge instead?

> 
> And if we need some changes anyways just adding the single line call
> to the new helper seems both the least invasive and the easiest.

Simplest given the current patches, surely. But nothing to do with the
sensor drivers. I'd at least like to see relatively trivial ways to avoid
this researched first.

-- 
Kind regards,

Sakari Ailus
