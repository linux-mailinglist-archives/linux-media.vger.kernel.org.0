Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C236AC85D
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 17:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCFQky (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 11:40:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCFQkX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 11:40:23 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7F937F0B
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 08:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678120738; x=1709656738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlHXlK+OxQRliz0q6R5s/LJC2K4a66Pjf4QM0bOUvPY=;
  b=g2hI8HPxMN0kdGacNDh9JhB3JhiCQpqam8c5lqnufqMNEiu+lbQ57oNQ
   up55XcFPrpK6Y5L4NX7opi1qVdwwy1GQ0/70EH1t8fz8nXZW2WKtyd2Qm
   tXamADmXhmroZusY4gixLOANr3sAuYJBfljyucqKPLY10DdUB8Ts+I6+m
   x2rHJXWzReuLIKtN6Li1S3ikZ0Q8WVENBX1N6VgPGKschPxQKKJop4q0V
   7XiHWCw5sJBCrOG2B6ubs+TxmcVZbD3tPNo0rLH08pr93ooRAGb/QfOFt
   ZI2yHQJo2EJ1GJHUxw0eIfhm5p/J+IC2Yze0A+7jdwGQ2RCLIf+rJ4B8K
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335622677"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="335622677"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 08:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="850358222"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="850358222"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2023 08:35:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZDnr-00GWMX-0y;
        Mon, 06 Mar 2023 18:35:11 +0200
Date:   Mon, 6 Mar 2023 18:35:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with
 HID name
Message-ID: <ZAYWPpcjOghZ5L33@smile.fi.intel.com>
References: <20230303144432.2108677-1-bingbu.cao@intel.com>
 <ZAXN9EszoxHt+F7w@smile.fi.intel.com>
 <DM8PR11MB565375ACA9BECCB175EE931199B69@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB565375ACA9BECCB175EE931199B69@DM8PR11MB5653.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 06, 2023 at 01:33:30PM +0000, Cao, Bingbu wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, March 6, 2023 19:27
> > On Fri, Mar 03, 2023 at 10:44:32PM +0800, bingbu.cao@intel.com wrote:

...

> > > +	if (sensor->ssdb.vcmtype) {
> > > +		scnprintf(vcm_name, sizeof(vcm_name), "%s-%u",
> > > +			  cio2_vcm_types[sensor->ssdb.vcmtype - 1],
> > > +			  sensor->ssdb.link);
> > 
> > Is using 'c' variant a cargo cult? Otherwise explain, why dropping the
> > last part of the number is not a problem.
> 
> Sorry, I can't understand. What is cargo cult?

Use of sCnprintf(). I.o.w. can you explain the point of using it instead of
simply snprintf()?

> > > +		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
> > > +	}

...

> > > +		scnprintf(sensor->name, sizeof(sensor->name), "%s-%u",
> > > +			  cfg->hid, sensor->ssdb.link);

Ditto.

...

> > > -	char name[ACPI_ID_LEN];
> > > +	char name[ACPI_ID_LEN + 4];
> > 
> > Why 4 is chosen? This needs an explanation.
> 
> 'link' is u8, so it is supposed to be max 4 characters along with '-'.

It should be mentioned somewhere.

-- 
With Best Regards,
Andy Shevchenko


