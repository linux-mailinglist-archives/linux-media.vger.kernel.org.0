Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FC9453222
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 13:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236211AbhKPMaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 07:30:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:17515 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236171AbhKPMaB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 07:30:01 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="213716932"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="213716932"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:27:05 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="454436138"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:27:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mmxY7-007QDZ-1V;
        Tue, 16 Nov 2021 14:26:55 +0200
Date:   Tue, 16 Nov 2021 14:26:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YZOjjq2zvHG0MrE8@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <YYkwaY1C77BRmJat@smile.fi.intel.com>
 <66f4b901-830c-aab7-23c2-21158ce1d158@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66f4b901-830c-aab7-23c2-21158ce1d158@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 16, 2021 at 10:54:36AM +0100, Hans de Goede wrote:
> On 11/8/21 15:12, Andy Shevchenko wrote:
> > On Mon, Nov 08, 2021 at 02:12:38PM +0100, Hans de Goede wrote:
> >> On 11/2/21 00:43, Daniel Scally wrote:

...

> >> +int cio2_bridge_sensors_are_ready(void)
> >> +{
> >> +	struct acpi_device *adev;
> > 
> >> +	bool ready = true;
> > 
> > Redundant. See below.
> > 
> >> +	unsigned int i;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
> >> +		const struct cio2_sensor_config *cfg =
> >> +			&cio2_supported_sensors[i];
> >> +
> >> +		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> >> +			if (!adev->status.enabled)
> >> +				continue;
> > 
> >> +			if (!acpi_dev_ready_for_enumeration(adev))
> >> +				ready = false;
> > 
> > You may put the adev here and return false.
> > 
> >> +		}
> >> +	}
> > 
> >> +	return ready;
> > 
> > So return true.
> 
> I actually did it this way deliberately making use of
> for_each_acpi_dev_match() not "leaking" a ref when you let
> it run to the end.
> 
> I find this clearer because this way all the ref handling
> is abstracted away in for_each_acpi_dev_match(), where as with
> a put in the middle of the loop a causal reader of the code
> is going to wonder there the put ref is coming from.

Here are pros and cons, currently you abstracted it away, but in case of
extending this piece of code (I don't believe it will happen, though) it may
play a trick if one forgets about this nuance of for_each_acpi_dev_match().

But it's fine for me, so you decide.

> >> +}

-- 
With Best Regards,
Andy Shevchenko


