Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7F151BD03
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 12:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354653AbiEEKUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350451AbiEEKUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 06:20:15 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B6C522C4
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651745796; x=1683281796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iHP3VxXCN/ZSi+SfmceHdkvEY/2FTX9vbZztflzmYoA=;
  b=d4UIOj9KUaJWYu/BPtAasyv8DYSxYie3v7y6kDj8i7ha9pfM/CQIIUyx
   eXFP5xSq3+b516jfvoOmWrM4h2Im80qCFC9ss8DbFCqpjKzydf4SQzJde
   KERVhWQb1VJAhVhdpevDigAOBzKZLZkx3cu9oMfTHEkHa+OJboGIaPsuv
   gmXGiFGdjtRlhNRIAOEcUxjwkofR3S6fyeFj53d0Vb0AfIOkgsTIZqFC6
   JUoXa6Disso1tZ6py/s7YY0z4pFBsZTKmZI4I5skU16xPfFRYY/y2GfDi
   eIS47N1K0jc8XCT8KO0QdlRVNdSbJ1uQySGOiQPuU6TzE/COWMspBdXwo
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="248601148"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="248601148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:16:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="734834582"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:16:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmYX9-00CErA-45;
        Thu, 05 May 2022 13:16:31 +0300
Date:   Thu, 5 May 2022 13:16:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3 04/15] media: i2c: Provide ov7251_check_hwcfg()
Message-ID: <YnOj/pFvHmPZEDa0@smile.fi.intel.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
 <20220504223027.3480287-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504223027.3480287-5-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 04, 2022 at 11:30:16PM +0100, Daniel Scally wrote:
> Move the endpoint checking from .probe() to a dedicated function,
> and additionally check that the firmware provided link frequencies
> are a match for those supported by the driver. Store the index to the
> matching link frequency so it can be easily identified later.

...

> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		ret = -EINVAL;
> +		dev_err_probe(ov7251->dev, ret,
> +			      "no link frequencies defined\n");

		ret = dev_err_probe(ov7251->dev, -EINVAL,
				    "no link frequencies defined\n");

?

> +		goto out_free_bus_cfg;
> +	}

...

> +	if (i == bus_cfg.nr_of_link_frequencies) {
> +		ret = -EINVAL;
> +		dev_err_probe(ov7251->dev, ret,
> +			      "no supported link freq found\n");

Ditto.

> +		goto out_free_bus_cfg;
> +	}

-- 
With Best Regards,
Andy Shevchenko


