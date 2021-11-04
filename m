Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860AE445970
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 19:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234053AbhKDSRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 14:17:15 -0400
Received: from mga11.intel.com ([192.55.52.93]:61138 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232079AbhKDSRP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Nov 2021 14:17:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="229228439"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="229228439"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 11:14:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; 
   d="scan'208";a="600363835"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 11:14:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mihFj-003aGa-G3;
        Thu, 04 Nov 2021 20:14:19 +0200
Date:   Thu, 4 Nov 2021 20:14:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Message-ID: <YYQi+zpAxPDvdCHx@smile.fi.intel.com>
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d0470d3-7356-b476-6807-5c8606ee3545@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 04, 2021 at 03:49:48PM +0100, Hans de Goede wrote:
> On 11/2/21 00:43, Daniel Scally wrote:

...

> Ok, I've figured this out now, with the attached patch (which also
> explains what is going on) as well as an updated tps68470_board_data.c
> with updated regulator_init_data for the VCM (also attached), the driver
> can now successfully talk to the VCM in probe() while we are NOT
> streaming from the ov8865.

Thanks, Hans.

...

> const struct int3472_tps68470_board_data *int3472_tps68470_get_board_data(const char *dev_name)
> {
> 	const struct int3472_tps68470_board_data *board_data;
> 	const struct dmi_system_id *match;
> 
> 	match = dmi_first_match(int3472_tps68470_board_data_table);
> 	while (match) {
> 		board_data = match->driver_data;
> 		if (strcmp(board_data->dev_name, dev_name) == 0)
> 			return board_data;

> 		dmi_first_match(++match);

Not sure I understood the purpose of the call.

> 	}
> 	return NULL;
> }


-- 
With Best Regards,
Andy Shevchenko


