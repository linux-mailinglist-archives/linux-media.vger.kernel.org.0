Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D45A69E41B
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbjBUQBU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbjBUQBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:01:19 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDB723D82
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:01:18 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334033110"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334033110"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="649235173"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="649235173"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2023 08:00:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUV4V-00A1jr-1W;
        Tue, 21 Feb 2023 18:00:51 +0200
Date:   Tue, 21 Feb 2023 18:00:51 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 04/10] media: atomisp: Remove crop_needs_override from
 atomisp_set_fmt()
Message-ID: <Y/Tqs3hEYzeZ9Om4@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 03:59:00PM +0100, Hans de Goede wrote:
> Remove the crop_needs_override local helper variable from
> atomisp_set_fmt(), as it always is true now.

...

> +			sink_crop.width = DIV_NEAREST_STEP(
> +					      sink_crop.height *
> +					      f->fmt.pix.width,
> +					      f->fmt.pix.height,
> +					      ATOM_ISP_STEP_WIDTH);

Not sure how long this code stays, I would indent it as

			sink_crop.width =
				DIV_NEAREST_STEP(sink_crop.height *
						 f->fmt.pix.width,
						 f->fmt.pix.height,
						 ATOM_ISP_STEP_WIDTH);

...

> +			sink_crop.height = DIV_NEAREST_STEP(
> +					       sink_crop.width *
> +					       f->fmt.pix.height,
> +					       f->fmt.pix.width,
> +					       ATOM_ISP_STEP_HEIGHT);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


