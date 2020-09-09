Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178CA26326F
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 18:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730821AbgIIQm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 12:42:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:60955 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgIIQQ3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 12:16:29 -0400
IronPort-SDR: I9SZmEcW88/1hZIi+2R22aSJaanAxQ2Gtbiq1HJgxuwVdHy3zWT99az4l2X1db5vwz3XuQhf0+
 lnUZqgbmOcdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222530460"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="222530460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 06:40:57 -0700
IronPort-SDR: DvtnZxN+ZtRYRQbdWiuebAL5LQfb7IXP855ii1nwp+UuRz3hN0eI0F6IjxiVhIW7ts6Wcvn43X
 0BR4MKoUtHAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="407451726"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Sep 2020 06:40:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 09 Sep 2020 16:40:53 +0300
Date:   Wed, 9 Sep 2020 16:40:53 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        jorhand@linux.microsoft.com, andriy.shevchenko@linux.intel.com
Subject: Re: cio2 ipu3 module to automatically connect sensors via swnodes
Message-ID: <20200909134053.GA3699980@kuha.fi.intel.com>
References: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLoDVFmeKcgXBe7kORqx0Q=H_wCWze=6G8qZRRXZT3Uqgkx8w@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sat, Sep 05, 2020 at 09:19:51AM +0100, Daniel Scally wrote:
> Hello
> 
> Following on from this thread:
> https://www.spinics.net/lists/linux-driver-devel/msg135122.html -
> apologies, can't see a way to reply to it directly.
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
> My copy of Jordan's module is parked in my git repo [3] for now, and
> requires a batch of patches from Jordan's repo [4] (one made by Heikki
> to fill in the missing swnode graph pieces, and some further tweaks) -
> I've been applying those against 5.8.0-rc7. Any other criticism more
> than welcome - I'm new to both c and kernel programming so I'm happy
> to take all the advice people have the time to give.

I'm almost certain that my graph patch is broken. My tests did not
cover nearly as much that is needed to properly test the patch. I
think at least the refcount handling is totally broken in
software_node_graph_get_next_endpoint(), so that function at least
needs to be rewritten.

Unfortunately I do not have time to work on that patch right now.

thanks,

-- 
heikki
