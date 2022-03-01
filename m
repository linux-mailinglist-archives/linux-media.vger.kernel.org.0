Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D5B4C8DD8
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 15:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbiCAOfd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 09:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbiCAOfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 09:35:31 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52556A1BCC
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646145290; x=1677681290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mbu2f135S9K3WN4bFCdW0bCxFkIUa6IgY0L4ihfh+cM=;
  b=LYe65B/jz66aklIug5lhwNzF5BuNzrHhkVqg6AYbGcqViUWcY2EQT1T0
   TqCdS91LHrZdrK20fAJq6cbtr+MnMtl6PPHnFhWHBsHq5bx5CusHG/W8K
   W5FeFa0iKvkDiAiB6tV/UqCP+FtbM5Z3vD6Uk8vtW9EgwIKRigIfv2Pof
   raJLfHy8poV6yRg4/qa3Ml7hDa6+iGA7uFFyzii0594N2aosO20aouOEm
   c4+2ssLFLUH4BR/5kok2JrS6Uyy/b2EkVIg4v1d5IVOqBDxmw0DSbqDi5
   qk0C772n2MKZEn9pzmDFQOgP1jXk+8P1GmN9WVlR+Wie1XsuzGh8jELv0
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240553833"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="240553833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 06:34:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="593612134"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 06:34:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nP3Zg-009r4X-5w;
        Tue, 01 Mar 2022 16:34:00 +0200
Date:   Tue, 1 Mar 2022 16:33:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2 07/11] media: i2c: Add support for new frequencies to
 ov7251
Message-ID: <Yh4u1x0XNV89jm4v@smile.fi.intel.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
 <20220225000753.511996-8-djrscally@gmail.com>
 <YhkNR7BhRAG2MjNm@smile.fi.intel.com>
 <03c68a99-c9ff-7cdf-e5d7-2c52657e5d9f@gmail.com>
 <Yhy4MwU320D3mxeO@smile.fi.intel.com>
 <6def6eb4-d246-ce6c-016c-f2f48c736668@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6def6eb4-d246-ce6c-016c-f2f48c736668@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 28, 2022 at 11:11:27PM +0000, Daniel Scally wrote:
> On 28/02/2022 11:55, Andy Shevchenko wrote:
> > On Fri, Feb 25, 2022 at 10:04:29PM +0000, Daniel Scally wrote:
> > > On 25/02/2022 17:09, Andy Shevchenko wrote:

...

> Basically it seems better to me to just let it match by device rather than
> have the names. The only advantage I can see for the names is if a device
> has multiple clocks assigned to it...but there are no instances of that in
> media/i2c.

I have heard you, but leave for the judgement done by maintainers.

...

> > > Broken ACPI compensated for by the cio2-bridge - it creates the
> > > clock-frequency property which ordinarily wouldn't be there on ACPI systems
> > > AIUI.
> > In the current practice we have CLK priority over property, this means we may do:
> > 1) unconditional reading of the property;
> > 2) trying CLK.
> > 
> > Can it be done here?
> 
> Er, can you point me to an example?

Something like

	device_read_property_u32("clock-frequency", &rate);

	clk = devm_clk_get_optional(...);
	if (IS_ERR(clk))
		return PTR_ERR(clk);

	clk_rate = clk_get_rate(...);
	if (clk_rate == 0)
		clk_rate = rate;
	if (clk_rate == 0)
		return dev_err_probe(...);


-- 
With Best Regards,
Andy Shevchenko


