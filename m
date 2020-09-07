Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F8025F6CB
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 11:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgIGJoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 05:44:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:63006 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbgIGJox (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 05:44:53 -0400
IronPort-SDR: NfV8bAzqUmFxHLhTa2RjSMqHW9ZKzZH7aQzKu3U7JRscsWvsfwL4Ts1gPobTuUcRopF7s34iu2
 dPDzr4a80SYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="138029841"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="138029841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 02:44:53 -0700
IronPort-SDR: 7zItED0iAsj5DaPtscIu7g4BqbCXycUO8tAPBv+jvXAjZWnjiubQzrBKFpgjDms44IwKl9CUCu
 pWNhY+nD8xhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; 
   d="scan'208";a="333114514"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 07 Sep 2020 02:44:50 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kFDhg-00EuZz-A3; Mon, 07 Sep 2020 12:44:48 +0300
Date:   Mon, 7 Sep 2020 12:44:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        heikki.krogerus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200907094448.GS1891694@smile.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Cc: Surface community people.

On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
> 
> Following on from this thread:
> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
> apologies, can't see a way to reply to it directly.

Use lore [5] and its feature of downloading mailbox (or just seeing Message-Id
which is enough for good MUA to attach reply properly to the thread).

[5]: https://lore.kernel.org/linux-media/12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org/

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

> [1] https://github.com/linux-surface/linux-surface/issues/91
> [2] https://stackoverflow.com/questions/63742967/what-is-causing-this-kernel-oops-when-parsing-firmware?
> [3] https://github.com/djrscally/miix-510-cameras/blob/master/surface_camera/surface_camera.c
> [4] https://github.com/jhand2/surface-camera/tree/master/patches

-- 
With Best Regards,
Andy Shevchenko


