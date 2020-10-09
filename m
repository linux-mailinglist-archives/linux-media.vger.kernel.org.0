Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D12288912
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 14:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387617AbgJIMn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 08:43:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:4692 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731982AbgJIMn0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 08:43:26 -0400
IronPort-SDR: uAUTu4JvBmwkX87Q9Go5fk93vwJAzeTX2Z1XCH0tLJLVaT2tM1wNK9aK9QIxMw02AIyeb05J7k
 1sORQm1RruqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="153311983"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="153311983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 05:43:25 -0700
IronPort-SDR: vv7PWxxAXDcwijSPkCqhcbg40THEl1zKTXYz1IkaNqc7WpbHouu6iinqwU0gRbvlfhJS+FYh7x
 g8wzDhLZQlrA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="518649774"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 05:43:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQrl2-002bax-GL; Fri, 09 Oct 2020 15:44:24 +0300
Date:   Fri, 9 Oct 2020 15:44:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        davem@davemloft.net, robh@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        kieran.bingham@ideasonboard.com, dan.carpenter@oracle.com
Subject: Re: [RFC PATCH v2] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <20201009124424.GD4077@smile.fi.intel.com>
References: <20201001093326.6208-1-djrscally@gmail.com>
 <20201001173745.GJ3956970@smile.fi.intel.com>
 <b27bc66c-4cb7-0dcc-a828-3aca4f0738db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b27bc66c-4cb7-0dcc-a828-3aca4f0738db@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 08, 2020 at 10:51:46PM +0100, Dan Scally wrote:
> On 01/10/2020 18:37, Andy Shevchenko wrote:
> > On Thu, Oct 01, 2020 at 10:33:26AM +0100, Daniel Scally wrote:

> > Awesome work!
> > My, almost minor, comments below.
> Thanks as always for your help - great comments. I'll work through and
> make the changes you suggest to this code and also...
> >> * Built against media_tree instead of linus's tree - there's no T: entry in
> >> maintainers for the ipu3-cio2 driver but I see there're recent changes in 
> >> media_tree so thought this was the better option.
> > Make sense to include T: entry as well (maybe as a separate patch).
> 
> ...I agree with your other email re. turning this into a series and
> making the additional changes you suggested, so I'll do that too for the v3.

I forgot to mention module rename as a separate patch. So, something like 6
(or more) in a series I would expect.

...

> >> +// SPDX-License-Identifier: GPL-2.0
> > Author line perhaps?
> 
> You mean literally just like /* Authored By: Dan Scally */ or something?
> OK, no problem.

* Author: Dan Scally <foo@bar.com>

...

> >> +static const struct ipu3_sensor supported_devices[] = {
> >> +	IPU3_SENSOR("INT33BE", "INT33BE:00"),
> >> +	IPU3_SENSOR("OVTI2680", "OVTI2680:00"),
> >> +	IPU3_SENSOR("OVTI5648", "OVTI5648:00")
> > In such cases please leave comma at the last item as well. Easier to extend w/o
> > an additional churn.
> >
> > On top of that, please avoid putting *instance* names, i.e. the second
> > parameters in your macro call. What code should do is to take _HID (first
> > parameter) and call acpi_dev_match_first_dev() or so.
> Yeah I was originally using the i2c_client's name field (this comes into
> play during cio2_bridge_reprobe_sensor()) but the matching refused to
> work using anything but a string literal. Let me take another look at
> this then.

I meant that you get an instance name from the first found device, like

	char instance_name[I2C...];

	adev = first_match_dev();
	if (adev) {
		snprintf(instance_name, ..., acpi_dev_name(adev));
		...
	} else {
		...
	}

...

> >> +static struct software_node cio2_hid_node = { CIO2_HID, };
> > Here, nevertheless, comma can be removed, since update will need to change
> > entire line anyway.
> Trailing commas where lists can be extended, otherwise none - got it.

Just use a common sense. Simple extrapolate it to the next change, if any,
among the same lines.

...

> >> +		for (j = 4; j >= 0; j--)
> >> +			software_node_unregister(&sensor->swnodes[j]);
> > Seems we may need a simple helper for this (test_printf.c has similar case),
> > so, what about do it here for now and probably then move to somewhere like
> > swnode.h or whatever holds it.
> >
> > static inline software_node_unregister_nodes_reverse(const struct software_node *nodes)
> > {
> > 	unsigned int i = 0;
> >
> > 	while (nodes[i].name)
> > 		i++;
> > 	while (i--)
> > 		software_node_unregister(&nodes[i]);
> > }
> Yeah this is a good idea; I see you suggest a new patch for it in your
> other email; I'll do a series in the future and add this to the swnode
> source file at the same time as doing the changes that you, Heikki and
> Sakari suggested for the other patch.

Yes, thanks!

...

> >> +	struct software_node swnodes[6];
> >> +	struct property_entry dev_props[3];
> >> +	struct property_entry ep_props[4];
> >> +	struct property_entry cio2_props[3];
> > I'm now wondering why you can't simply put properties directly to here and do
> > that kcalloc / memcpy() in few functions? I mean to drop those calls and assign
> > properties directly. You even won't need to memset() and stack for them!
> I thought you were hinting that I should use kcalloc in the comments
> from the last patch to get an array of zero valued entries but I guess I
> misunderstood - I can just memset these arrays to 0 and assign all but
> the last entry directly and that seems to work fine, so I'll switch to that.

The idea behind that any kcalloc() or kzalloc() against a container (whatever
data structure that has those property arrays) will do it for you. So, I think
neither kcalloc() nor stack is needed. Instantiate properties directly in the
arrays of sensor data structure.

...

> >> +	endpoint = fwnode_graph_get_next_endpoint(pci_dev->dev.fwnode, NULL);
> > dev_fwnode()
> I avoided that thinking there might be a case where a CIO2 device has a
> fwnode but not endpoints defined for some reason, but I'm not familiar
> enough to judge whether that situation will ever occur - if it's safe to
> do it that way then I'll switch it over.

I meant
	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&pci_dev->dev), NULL);


-- 
With Best Regards,
Andy Shevchenko


