Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5022B74050C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 22:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjF0Ujv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 16:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjF0Uju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 16:39:50 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D050198A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 13:39:49 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427682242"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="427682242"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 13:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="786787983"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="786787983"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2023 13:39:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qEFTD-000Q4e-0N;
        Tue, 27 Jun 2023 23:39:27 +0300
Date:   Tue, 27 Jun 2023 23:39:26 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 06/12] media: ipu3-cio2: Add a
 cio2_bridge_parse_sensor_fwnode() helper function
Message-ID: <ZJtI/j9RUp3Nv8s3@smile.fi.intel.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627175643.114778-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 27, 2023 at 07:56:36PM +0200, Hans de Goede wrote:
> The code to go from ACPI sensor info to a fwnode-tree with connector
> nodes and endpoint properties is 99% the same for the atomisp2 and
> the IPU3.
> 
> The main difference is that atomisp2 devices do not have a SSDB table
> with various info.
> 
> Abstract out the parsing of the sensor's ACPI fwnode into a helper
> function and store the parsed results, rather then the raw SSDB
> in struct cio2_sensor.
> 
> This is a preparation patch for making the cio2-bridge code more generic
> so that it can be shared with the atomisp driver.

...

> +	if (ssdb.vcmtype > ARRAY_SIZE(cio2_vcm_types)) {
> +		dev_warn(&adev->dev, "Unknown VCM type %d\n", ssdb.vcmtype);
> +		ssdb.vcmtype = 0;
> +	}

I'm wondering if we actually can add the first entry in the types as UNKNOWN or
so, and hence

	if (ssdb.vcmtype >= ARRAY_SIZE(cio2_vcm_types)) {
		...
	}


> +	if (ssdb.vcmtype)
> +		sensor->vcm_type = cio2_vcm_types[ssdb.vcmtype - 1];

...and here the conditional can be dropped.

	sensor->vcm_type = cio2_vcm_types[ssdb.vcmtype];

Maybe it's a material for a separate change... Dunno.

-- 
With Best Regards,
Andy Shevchenko


