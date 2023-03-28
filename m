Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F156CC728
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 17:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbjC1PyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 11:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbjC1Pxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 11:53:51 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A21E07E;
        Tue, 28 Mar 2023 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680018814; x=1711554814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8XFKOae6uPzdUjobd8irY9Q2YB4mHOqUzbdqMlqGg0s=;
  b=n/T43Ee+M2yXtFiojcPewn/vFWU51GN3od1OiaYZN1qds2reoJeadT5h
   MKZQyG1e6BPHH7YrtxnLQgNoIkC1WDsNMK6jlbFQxkqCA7xD1YWvesTiv
   4Is2gPucq80Kklmi5VAfQuLE7NPpz5r/A2OMRqh1paUAXWOT+28Z6RFMY
   1cQ5ZWbmS/XuHPLNh5bRnZYj7m4Y35B9No0NX3wOfcUKsv45c4/+cQLc5
   JEagy6nnxH/8lAQEEMyW/FzVS3C6BKsl9NA167g3PzB1QDA5a3cSZWMIZ
   VP7jtfdwhH0iPwCm/6cqcPFfyOQW4nc6D9RJTHboO/K33GpdJtgT8OTve
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="339329964"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="339329964"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 08:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="858145982"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="858145982"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 28 Mar 2023 08:53:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1phBdL-009gOw-1R;
        Tue, 28 Mar 2023 18:53:15 +0300
Date:   Tue, 28 Mar 2023 18:53:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
        rafael@kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v7 03/10] ACPI: property: Parse _CRS CSI-2 descriptor
Message-ID: <ZCMNa0sGvu1Qmzgw@smile.fi.intel.com>
References: <20230328101303.1458570-1-sakari.ailus@linux.intel.com>
 <20230328101303.1458570-4-sakari.ailus@linux.intel.com>
 <ZCMDyVoFWizx+tOp@smile.fi.intel.com>
 <ZCMHTZgXnLCWjCje@kekkonen.localdomain>
 <ZCMLz4M37vrE5XJZ@smile.fi.intel.com>
 <ZCMMQp9iaB2Q+f26@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCMMQp9iaB2Q+f26@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 28, 2023 at 06:48:18PM +0300, Sakari Ailus wrote:
> On Tue, Mar 28, 2023 at 06:46:23PM +0300, Andy Shevchenko wrote:
> > On Tue, Mar 28, 2023 at 06:27:09PM +0300, Sakari Ailus wrote:
> > > On Tue, Mar 28, 2023 at 06:12:09PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Mar 28, 2023 at 01:12:56PM +0300, Sakari Ailus wrote:

...

> > > > > +	struct scan_check_crs_csi2_context inst_context = {
> > > > > +		.handle = handle,
> > > > > +		.res_head = LIST_HEAD_INIT(inst_context.res_head),
> > > > > +	};
> > > > > +	struct crs_csi2 *csi2;
> > > > > +
> > > > > +	acpi_walk_resources(handle, METHOD_NAME__CRS,
> > > > > +			    scan_check_crs_csi2_instance, &inst_context);
> > > > > +
> > > > > +	if (list_empty(&inst_context.res_head))
> > > > > +		return;
> > > > > +
> > > > > +	/*
> > > > > +	 * Found entry, so allocate memory for it, fill it and add it to the
> > > > > +	 * list.
> > > > > +	 */
> > > > > +	csi2 = kmalloc(sizeof(*csi2), GFP_KERNEL);
> > > > > +	if (!csi2)
> > > > 
> > > > Who is going to release resources allocated in the callback above?
> > > 
> > > This is done by crs_csi2_release(), called from acpi_bus_scan_crs_csi2().
> > 
> > Isn't it a bit counter intuitive?
> 
> Are you suggesting changing something?
> 
> Basically we're gathering the information during an ACPI namespace walk.
> Once the information has been processed and used, the memory can be
> released.

Release allocated memory in the function which allocates it. Since it's called
via callback, the closest one is the one that calls acpi_walk_resources().

Can't we free them here?

-- 
With Best Regards,
Andy Shevchenko


