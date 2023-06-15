Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4A43731C2D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 17:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344075AbjFOPK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 11:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345259AbjFOPKO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 11:10:14 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A238273C
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 08:10:14 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="361440163"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="361440163"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 07:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712483782"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="712483782"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 15 Jun 2023 07:43:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q9oCN-003xsg-1U;
        Thu, 15 Jun 2023 17:43:43 +0300
Date:   Thu, 15 Jun 2023 17:43:43 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 27/28] media: ov2680: Read and log sensor revision
 during probe
Message-ID: <ZIsjn8AqpDNWeIpA@smile.fi.intel.com>
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <20230615141349.172363-28-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615141349.172363-28-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 15, 2023 at 04:13:48PM +0200, Hans de Goede wrote:
> Read and log sensor revision during probe.
> 
> Since this means that the driver will now already log a message on
> successful probe drop the "ov2680 init correctly" log message.

...

> -	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
> +	cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, &ret);
> +	cci_read(sensor->regmap, OV2680_REG_SC_CMMN_SUB_ID, &rev, &ret);
>  	if (ret < 0) {
>  		dev_err(sensor->dev, "failed to read chip id\n");
>  		return -ENODEV;

Even in the original code I don't see justification why the error code should
be shadowed.

-- 
With Best Regards,
Andy Shevchenko


