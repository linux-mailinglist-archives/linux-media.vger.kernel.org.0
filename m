Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34FC726F70
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbjFGU6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 16:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbjFGU6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 16:58:12 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33EB270B
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 13:57:47 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354596254"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="354596254"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 13:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="854046828"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="854046828"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2023 13:57:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q70Dv-0020AO-2u;
        Wed, 07 Jun 2023 23:57:43 +0300
Date:   Wed, 7 Jun 2023 23:57:43 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 17/28] media: ov2680: Add support for ACPI enumeration
Message-ID: <ZIDvR5j0Xvqkdp6x@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-18-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:47:01PM +0200, Hans de Goede wrote:
> Add an acpi_match_table now that all the other bits necessary for
> ACPI support are in place.

...

>  		.name  = "ov2680",
>  		.pm = pm_sleep_ptr(&ov2680_pm_ops),

>  		.of_match_table	= of_match_ptr(ov2680_dt_ids),

Side note. If we don't have OF dependency, this may provoke defined but not
used. That's why I eagerly remove of_match_ptr() from the ID tables.

Besides that, however might not be applicable right now, this will allow
to use PRP0001 ACPI HID.

> +		.acpi_match_table = ov2680_acpi_ids,
>  	},
>  	.probe_new	= ov2680_probe,
>  	.remove		= ov2680_remove,

-- 
With Best Regards,
Andy Shevchenko


