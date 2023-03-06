Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBA76ABE1B
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 12:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCFL0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 06:26:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjCFL0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 06:26:48 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B2E25E05
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 03:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678102008; x=1709638008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Y1l6FircxrTYlgqqFJGUxeGZg1QOk9D+wBV9Atlu36k=;
  b=NPE6KkrIH6hYMF/njiVvylKJ8ZZ5/pDubk/EGxB33GoD2xuLy2rVqEVb
   3jU/XjJYajJKB9n2u3hcrfv3ubvltGyNbwrkkjaYW5kQBXFoDHwIUXuj1
   +hvCOcGG9VBOU5FekhxbWeBHBW86eLD9SdGeRAjVbcovx9/mRGYpmCwiC
   rer4DbjeFmh+1Hrtpz5tthSRlkDO80ZBHXJPUzuvGLMASVMjlvrcJ/uRJ
   U9ThPpiYGm0ZtgnGycJoqbnp1NhL0llNnnwps4luBXHXrgNxXQrxf6iNY
   o3iwNTLISxQAB7hLOIYJOwbZjaCmz5ayJojqKHb6aV6lclI7mRcNywp44
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="323838817"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="323838817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="706409480"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="706409480"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 03:26:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZ8zM-00GK4o-23;
        Mon, 06 Mar 2023 13:26:44 +0200
Date:   Mon, 6 Mar 2023 13:26:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        djrscally@gmail.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with
 HID name
Message-ID: <ZAXN9EszoxHt+F7w@smile.fi.intel.com>
References: <20230303144432.2108677-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303144432.2108677-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 03, 2023 at 10:44:32PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> In current cio2-bridge, it is using the hid as node name to register
> software node and swnode will create kobject and sysfs entry with
> the node name, if there are multiple sensors and VCMs which are sharing
> same HID name, it will cause the software nodes registration failure:
> 
> [ 7.142311] sysfs: cannot create duplicate filename '/kernel/software_nodes/dw9714'
> ...
> [ 7.142328] Call Trace:
> [ 7.142330]  <TASK>
> [ 7.142336]  dump_stack_lvl+0x49/0x63
> [ 7.142341]  dump_stack+0x10/0x16
> [ 7.142343]  sysfs_warn_dup.cold+0x17/0x2b
> [ 7.142346]  sysfs_create_dir_ns+0xbc/0xd0
> [ 7.142351]  kobject_add_internal+0xb1/0x2b0
> [ 7.142356]  kobject_init_and_add+0x71/0xa0
> [ 7.142360]  swnode_register+0x136/0x210
> [ 7.142363]  software_node_register+0xd2/0x120
> [ 7.142364]  software_node_register_nodes+0x83/0xf0
> [ 7.142366]  ? acpi_get_physical_device_location+0x65/0xc0
> [ 7.142371]  cio2_bridge_init+0x82a/0xb5e
> ...
> [ 7.142448] kobject_add_internal failed for dw9714 with -EEXIST,
> don't try to register things with the same name in the same directory.

Please cut unneeded context of the backtrace as it's explained in the
Submitting Patches documentation.

> One solution is appending the sensor link(Mipi Port) in SSDB as suffix
> of the node name to fix this problem.

...

> +	if (sensor->ssdb.vcmtype) {
> +		scnprintf(vcm_name, sizeof(vcm_name), "%s-%u",
> +			  cio2_vcm_types[sensor->ssdb.vcmtype - 1],
> +			  sensor->ssdb.link);

Is using 'c' variant a cargo cult? Otherwise explain, why dropping the last
part of the number is not a problem.

> +		nodes[SWNODE_VCM] = NODE_VCM(vcm_name);
> +	}

...

> +		scnprintf(sensor->name, sizeof(sensor->name), "%s-%u",
> +			  cfg->hid, sensor->ssdb.link);


Ditto.

...

> -	char name[ACPI_ID_LEN];
> +	char name[ACPI_ID_LEN + 4];

Why 4 is chosen? This needs an explanation.

-- 
With Best Regards,
Andy Shevchenko


