Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D89A76E9CD
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 15:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbjHCNQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 09:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbjHCNQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 09:16:29 -0400
Received: from mgamail.intel.com (unknown [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CED4493
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 06:15:23 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="354786314"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="354786314"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 06:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759113963"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="759113963"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 03 Aug 2023 06:15:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qRYAP-00Dm4i-25;
        Thu, 03 Aug 2023 16:15:01 +0300
Date:   Thu, 3 Aug 2023 16:15:01 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 17/32] media: ov2680: Add support for ACPI enumeration
Message-ID: <ZMuoVeni2dSSM9xb@smile.fi.intel.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
 <20230803093348.15679-18-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803093348.15679-18-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 03, 2023 at 11:33:32AM +0200, Hans de Goede wrote:
> Add an acpi_match_table now that all the other bits necessary for
> ACPI support are in place.

> The OVTI prefix used for the ACPI-HID is used for various OmniVision
> sensors on many generations x86 tablets and laptops.

"OVTI is the official ACPI vendor ID for OmniVision Technologies, Inc."

> The OVTI2680 HID specifically is used on multiple models spanning at
> least 4 different Intel CPU models (2 ISP2, 2 IPU3).

With or without above (as it's still the official vendor ID :-)
Reviewed-by: Andy Shevchenko <andy@kernel.org>
from ACPI ID rules perspective.

But add that in case you need to send a new version.

-- 
With Best Regards,
Andy Shevchenko


