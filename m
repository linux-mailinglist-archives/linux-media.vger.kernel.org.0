Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DDA260CEE
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729726AbgIHID6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:03:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:22179 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729691AbgIHIDm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 04:03:42 -0400
IronPort-SDR: rSf0i4/7ZGHCS/lONA5J5bfSyJO5RyNkBmXmDOdoqddXKcBSLKUA3OKenkXmy0lfLU0hZhGjIq
 rwT+P04XQL2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="158115612"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="158115612"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 01:03:30 -0700
IronPort-SDR: byQuocDCZPHtAjJooHi54p7uKhzBYqsNDdpxeBxBBsl5OAP15CJ9B3Ictg0LTFXsGCYiiMlLDe
 rAr1kTf64u/Q==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="343454910"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 01:03:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 27A5320765; Tue,  8 Sep 2020 11:03:26 +0300 (EEST)
Date:   Tue, 8 Sep 2020 11:03:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, andriy.shevchenko@linux.intel.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200908080326.GB27352@paasikivi.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
> Hello
> 
> 
> Following on from this thread:
> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
> apologies, can't see a way to reply to it directly.
> 
> 
> Myself and others [1] have been trying to get cameras working on
> Microsoft Surface and similar platforms, currently I'm working on
> expanding Jordan's module connecting cameras to the cio2
> infrastructure (which works - we can use it to take images), aiming to
> discover connection information from SSDB in the DSDT, as well as
> connect as many supported sensors as are found on the device. I'm just
> struggling with a problem I've encountered using the swnode patch that
> Heikki linked in that thread; the module's working ok when I only
> attempt to connect a single one of my sensors (by preventing the
> driver for the other sensor from loading, in which case this new
> module ignores the sensor), but when I attempt to connect both cameras
> at the same time I get a kernel oops as part of
> software_node_get_next_child. The module is creating software_nodes
> like this...
> 
> /sys/kernel/software_node/INT343E/port0/endpoint0
> /sys/kernel/software_node/INT343E/port1/endpoint0
> /sys/kernel/software_node/OVTI2680/port0/endpoint0
> /sys/kernel/software_node/OVTI5648/port0/endpoint0
> 
> And that's the structure that I expect to see, but it seems like the
> call to list_next_entry in that function is returning something that
> isn't quite a valid swnode. Printing the address of c->fwnode after
> that point returns "3", which isn't a valid address of course, and
> that's causing the oops when it's either returned (in the version of
> the function without the patches) or when the program flow tries to
> call the "get" op against that fwnode (in the patched version). I've
> been trying to track it down for a while now without success, so I
> posted the problem on SO[2] and it was suggested that I mail these
> addressees for advice - hope that that is ok.
> 
> 
> My copy of Jordan's module is parked in my git repo [3] for now, and
> requires a batch of patches from Jordan's repo [4] (one made by Heikki
> to fill in the missing swnode graph pieces, and some further tweaks) -
> I've been applying those against 5.8.0-rc7. Any other criticism more
> than welcome - I'm new to both c and kernel programming so I'm happy
> to take all the advice people have the time to give.
> 
> 
> On a more general note; Kieran from the libcamera project suggested we
> ought to be talking to you guys anyway to get some guidance on design,
> and some more expert eye on the things we don't really understand. In
> particular; we haven't been able to figure out how sensors that are
> intended to work with the cio2 ipu3 stuff have their clock/regulators
> supplied - in fact I can strip all the "usual" clock/regulator
> functionality out of my camera's driver and it still functions fine,
> which seems a bit weird. So far all we're doing as "power management"
> of the camera's is turning on the GPIO pins that DSDT tables assign to
> the tps68470 PMICs the cameras are theoretically hooked up to...but
> given the drivers continue to work without using the PMICs regulator
> and clk drivers (which we found in the intel-lts tree on Github),
> we're a bit confused exactly how these are connected. Given the
> potential for actual hardware damage if we mess something up there
> it'd be great if anyone can shed some light on those elements.

On ACPI systems regulators and clocks as well as GPIOs to some extent are
controlled by AML code in the DSDT and SSDT. There are different ways this
can be implemented though. It may be that the PMIC in this case is
controlled entirely from the AML code without the need for a driver.

This might be the case here. It should be possible to figure this out from
the DSDT and SSDT tables.

If you do not change how the regulators in the PMIC are controlled I'd
think it's very, very unlikely you'd be able to fry the sensors.

The GPIOs there I'd expect to be reset GPIOs, one for each sensor.
Interesting that they are not handled by ACPI in this case. FWIW, the
tps68470 driver is present also in the upstream kernel.

-- 
Kind regards,

Sakari Ailus
