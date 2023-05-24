Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E1770F606
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjEXMQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEXMQJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:16:09 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086EA95
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684930568; x=1716466568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7K7DFtRJSM5A4Hic/ffTlUz4BT+WFUn7QXKKU4gpLkY=;
  b=KiSDs5aKMbzLoYLdLATW0bOEBgKCxsFo/PG27FrJszJEXEBpAzK40KzP
   KV6/I0A2CR5E6qrKUQL3GzVaggTqnnQqnx4b4bT0ES5Hr/8U2y5/q0xZl
   UpzB6JG5E0xECz59GrPKbBUhlSNxFkvd4/np2wOVLWbL3SmlWeXzY41aa
   SUwdnn7PvKbNqMiono2RTOqskRvyVZozwFK1U/bpN2ftgyIha0TO4G90K
   bUAKvyM82DPEFCLVqvpviIj/p7DuPwDxBxJ7p3ppVjn0Rz5gpe9iCmF2w
   dLGCmH6+msK8n0HQerJR2IiIKXiOBrYUpPqmXSBItQ7EpY907WOURika9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419256795"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="419256795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="704326011"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="704326011"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:16:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 014C91202A9;
        Wed, 24 May 2023 15:16:02 +0300 (EEST)
Date:   Wed, 24 May 2023 12:16:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios()
 helper function
Message-ID: <ZG4AAZrrcKKPftpL@kekkonen.localdomain>
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
 <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
 <ZGdWVATARAQlaEjC@kekkonen.localdomain>
 <d230dd21-9c2b-2dc4-0325-6ceb502c3ba0@redhat.com>
 <ZGdohJQSY3GiNLSy@kekkonen.localdomain>
 <1bd06502-d1f5-1ba2-600a-aec6cdf49a27@redhat.com>
 <ZGeBKePUH55wi9dI@kekkonen.localdomain>
 <e4b40a54-25e0-74d0-eb97-af36d7e78d2e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4b40a54-25e0-74d0-eb97-af36d7e78d2e@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, May 19, 2023 at 04:39:29PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/19/23 16:01, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, May 19, 2023 at 03:08:02PM +0200, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 5/19/23 14:16, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Fri, May 19, 2023 at 01:55:04PM +0200, Hans de Goede wrote:
> >>>> Hi Sakari,
> >>>>
> >>>> On 5/19/23 12:58, Sakari Ailus wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Fri, May 19, 2023 at 10:55:42AM +0200, Hans de Goede wrote:
> >>>>
> >>>> <snip>
> >>>>
> >>>>>>> Although if the number of those drivers would be small, this could be just
> >>>>>>> undesirable but still somehow acceptable. And I wouldn't expect new sensors
> >>>>>>> to be paired with the IPU2 anymore. How many drivers there would be
> >>>>>>> roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.
> >>>>>>
> >>>>>> About ten-ish drivers sounds right.
> >>>>>>
> >>>>>>> Isn't it possible to create a device for this purpose and use software
> >>>>>>> nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
> >>>>>>> have to initialise this via other route than driver probe.
> >>>>>>
> >>>>>> This creates unsolvable probe-ordering problems. At a minimum we would
> >>>>>> need some check inside sensor drivers for them to return -EPROBE_DEFER
> >>>>>> until the GPIO mappings are added through some other means. Note that
> >>>>>> without the mappings gpiod_get will return -ENOENT, so we cannot just
> >>>>>> use its return value.
> >>>>>
> >>>>> They probably will already need this in order to make sure the atomisp
> >>>>> bridge has been initialized.
> >>>>
> >>>> The instantiation of the sensor i2c_clients and of the atomisp PCI device
> >>>> is independent of each other. In my other patch series I'm moving sensor
> >>>> registration for atomisp over to the v4l2-async framework like all other
> >>>> bridge/ISP drivers use so that atomisp no longer needs special sensor
> >>>> drivers.
> >>>>
> >>>> And AFAIK one of the reasons for having the v4l2-async framework is
> >>>> to avoid needing to have a specific probe order between bridge vs
> >>>> sensor drivers.
> >>>>
> >>>>> Could this code live in the atomisp bridge instead?
> >>>>
> >>>> That does not solve the probe ordering problem the sensor drivers
> >>>> need the GPIOs to enable the sensor and they all enable the sensor
> >>>> in their probe() to check the hw-id. The sensor's probe() function
> >>>> runs without any ordering guarantees vs the ISP/brige's probe()
> >>>> function. This is not an issue because at least during probe()
> >>>> the sensor drivers don't have any interactions with the bridge
> >>>> and any further access to the sensor-drivers is delayed until
> >>>> the v4l2-async notifier completion callback has run.
> >>>>
> >>>> The only way to work around the probe-ordering problem would
> >>>> be to delay checking the hw-id until the sensor gets linked
> >>>> to the bridge. Which would mean registering an async notifier
> >>>> from the sensors to catch binding from the sensor drivers
> >>>> and allowing the binding to fail.
> >>>>
> >>>> Delaying the hw-id check like this would be much more involved
> >>>> then the currently proposed solution and will likely cause
> >>>> other issues like the wrong driver binding when hw-vendors
> >>>> get the ACPI hw-id wrong (this is a known issue with audio-codecs,
> >>>> so chances are we will see this with sensors too).
> >>>
> >>> A simple question: how do you solve the probe ordering issue when it comes
> >>> to the atomisp bridge creating the graph endpoints needed by sensor
> >>> drivers?
> >>>
> >>> Or do you assume the sensor drivers will always use some static
> >>> configuration?
> >>
> >> This is all modeled after the IPU3 work done by Dan Scally and
> >> ATM the involved sensor drivers assume a static configuration
> >> wrt number of lanes + link frequency.
> > 
> > In general the number of lanes used is dependent on a particular board, and
> > in many cases the same sensor is used on different systems with a different
> > lane configuration. This might not happen on sensors used with atomisp but
> > it probably already happens on those used by the CIO2 (ov8865).
> > 
> > What the drivers should do and in most cases do is that they check the lane
> > configuration is valid for the device.
> > 
> >>
> >> If / when we want to start supporting say both single + dual
> >> lane modes (with e.g. reduced framerate for high res in single lane)
> >> then AFAICT this will only influence things like e.g. subdev calls
> >> to get supported framerates and of course turning on streaming,
> >> all of which only ever happen after the async subdev registration
> >> of all involved subdevs is complete.
> > 
> > On sensors the number of lanes is practically never selected dynamically,
> > it's simply a property of the board (the CSI-2 receiver and how many wires
> > happen to be connected, whichever has fewer lanes).
> 
> Right, I understand / agree what I meant is that the driver does not
> really need to know the number of connected lanes during probe().
> 
> But yes if you want to check the number of lanes is valid in probe()
> then you do need to know it.
> 
> >> So (again AFAICT) unlike the GPIOs there is no need to need
> >> to know the endpoint configuration at probe() time. But since
> >> we do want to turn the sensor on to check it is actually there
> >> and if it is the type of sensor we expect during probe() we
> >> do need the GPIOs beforehand.
> > 
> > The other, somewhat cleaner in my opinion and clearly more future-proof,
> > would be to return -EPROBE_DEFER if there are no endpoints. Which is also
> > what the ov8865 driver does already.
> 
> Ok that is a good suggestion, which I think should work. I'll give this
> a try sometime during the coming days.

Thanks, looking forward to see v2!

-- 
Kind regards,

Sakari Ailus
