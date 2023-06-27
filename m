Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B627401BB
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 18:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjF0Q4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 12:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjF0Qzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 12:55:54 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58BC10A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 09:55:53 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351408563"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="351408563"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 09:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861202831"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="861202831"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2023 09:55:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qEBym-000NiW-2V;
        Tue, 27 Jun 2023 19:55:48 +0300
Date:   Tue, 27 Jun 2023 19:55:48 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 07/29] media: ov2680: Fix ov2680_set_fmt() which ==
 V4L2_SUBDEV_FORMAT_TRY not working
Message-ID: <ZJsUlErfzcpBNljz@smile.fi.intel.com>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-8-hdegoede@redhat.com>
 <abnylacvx7hhhvpu7bmcuyf7cwm2g7snmbngwi3ckaowfakuqe@yvk7ghilhru5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abnylacvx7hhhvpu7bmcuyf7cwm2g7snmbngwi3ckaowfakuqe@yvk7ghilhru5>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 27, 2023 at 05:08:39PM +0200, Jacopo Mondi wrote:
> On Tue, Jun 27, 2023 at 03:18:08PM +0200, Hans de Goede wrote:

...

> >  	mode = v4l2_find_nearest_size(ov2680_mode_data,
> > -				      ARRAY_SIZE(ov2680_mode_data), width,
> > -				      height, fmt->width, fmt->height);
> > +				      ARRAY_SIZE(ov2680_mode_data),
> > +				      width, height,
> > +				      format->format.width,
> > +				      format->format.height);
> >  	if (!mode)
> >  		return -EINVAL;
> 
> Nit: only if you have to resend, could this be dropped? mode will be NULL
> only if ov2680_mode_data[] has no entries.

We shouldn't rely on the implementation details of some API if it's not
advertised that way. Even if it is, the robustness of the code is better with
this check.

-- 
With Best Regards,
Andy Shevchenko


