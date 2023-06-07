Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3228A727027
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 23:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbjFGVFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 17:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236111AbjFGVEb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 17:04:31 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E171C92
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 14:04:14 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="355965332"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="355965332"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 14:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="779605708"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="779605708"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2023 14:04:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1q70KA-0020FD-34;
        Thu, 08 Jun 2023 00:04:10 +0300
Date:   Thu, 8 Jun 2023 00:04:10 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 23/28] media: ov2680: Implement selection support
Message-ID: <ZIDwyhL+kNZim7gf@smile.fi.intel.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-24-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-24-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 06:47:07PM +0200, Hans de Goede wrote:
> Implement selection support. Modelled after ov5693 selection support,
> but allow setting sizes smaller than crop-size through set_fmt since
> that was already allowed.

...

> +	/* Limit set_fmt max size to crop width / height */
> +	width = clamp_t(unsigned int, ALIGN(format->format.width, 2),
> +			OV2680_MIN_CROP_WIDTH, crop->width);
> +	height = clamp_t(unsigned int, ALIGN(format->format.height, 2),
> +			 OV2680_MIN_CROP_HEIGHT, crop->height);

I'm wondering if clamp_val() would work here.

...

> +	rect.left = clamp(ALIGN(sel->r.left, 2), OV2680_NATIVE_START_LEFT,
> +			  OV2680_NATIVE_WIDTH);
> +	rect.top = clamp(ALIGN(sel->r.top, 2), OV2680_NATIVE_START_TOP,
> +			 OV2680_NATIVE_HEIGHT);
> +	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
> +			     OV2680_MIN_CROP_WIDTH, OV2680_NATIVE_WIDTH);
> +	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> +			      OV2680_MIN_CROP_HEIGHT, OV2680_NATIVE_HEIGHT);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


