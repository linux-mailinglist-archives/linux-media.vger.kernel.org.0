Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B56A6B4867
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 16:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbjCJPCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 10:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233634AbjCJPBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 10:01:47 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F66125D99
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678460113; x=1709996113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H0Zn9Dwq+Rd2eS9wn3i+qu90aS2RfJNXIpPLQ0995Do=;
  b=IA2UZbncNWIlw9im9cPiHZIcPrqtuWy2kpldImAQhTAFaiYQhrKvBGTc
   1CaZdsWPBuNDtZ+M0ejGpf8d2y8nJa7STPouP36o/nd3x3HrZwmW0fpih
   X/9fHH2LiUqFQRoUit4nQ/UelLH/fN8VAI8EX4YOid5vqWG3YI/PIEk7l
   Bkvabp3W27gVZ1Qg185mbNW5Zdt5ptSS+CXdzx72aAaB3ivN6AHcbgm/L
   BE0/ivaSTfIBdaLlSB9tSNbra00FTOkFQE+SutPbWQrxpZ6Xa3lJAgMoM
   lFcj6nzDPaUH/w1QQtJCYUI17ZDpLhNdtZJ+85R14p2ff/egmWBfupxBF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="339103654"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="339103654"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 06:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="671101334"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="671101334"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 10 Mar 2023 06:49:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pae42-000y0G-05;
        Fri, 10 Mar 2023 16:49:46 +0200
Date:   Fri, 10 Mar 2023 16:49:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        djrscally@gmail.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: ipu3-cio2: support multiple sensors and VCMs
 with HID name
Message-ID: <ZAtDiUXvzKzsoKDX@smile.fi.intel.com>
References: <20230307063110.1459508-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307063110.1459508-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 07, 2023 at 02:31:10PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> In current cio2-bridge, it is using the hid name to register software
> node and software node will create kobject and sysfs entry according to
> the node name, if there are multiple sensors and VCMs which are sharing
> same HID name, it will cause the software nodes registration failure:
> 
> sysfs: cannot create duplicate filename '/kernel/software_nodes/dw9714'
> ...

> Call Trace:
> sysfs_create_dir_ns+0xbc/0xd0
> kobject_add_internal
> kobject_init_and_add
> swnode_register
> software_node_register

The above lines are not so valuable. You can remove them.

> software_node_register_nodes
> cio2_bridge_init
> ...
> kobject_add_internal failed for dw9714 with -EEXIST,
> don't try to register things with the same name in the same directory.
> 
> One solution is appending the sensor link(Mipi Port) in SSDB as suffix
> of the node name to fix this problem.

-- 
With Best Regards,
Andy Shevchenko


