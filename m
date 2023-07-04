Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A560874754A
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjGDP2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjGDP1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:27:44 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C73B1A4
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:27:43 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360622514"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360622514"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 08:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="669127104"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="669127104"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 04 Jul 2023 08:27:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qGhwI-0003bx-0H;
        Tue, 04 Jul 2023 18:27:38 +0300
Date:   Tue, 4 Jul 2023 18:27:37 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 14/15] media: ipu-bridge: Add a runtime-pm device-link
 between VCM and sensor
Message-ID: <ZKQ6aVxZupe61i9T@smile.fi.intel.com>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-15-hdegoede@redhat.com>
 <24dc6ebe-0dd7-4f71-50af-c51ccb3714d5@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24dc6ebe-0dd7-4f71-50af-c51ccb3714d5@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 04, 2023 at 04:07:43PM +0100, Dan Scally wrote:
> On 30/06/2023 13:06, Hans de Goede wrote:

...

> > +	strscpy(work->board_info.type, fwnode_get_name(vcm_fwnode),
> > +		I2C_NAME_SIZE);
> > +	/* Strip "-<link>" postfix */
> > +	sep = strchrnul(work->board_info.type, '-');
> > +	*sep = 0;
> 
> I think strreplace(work->board_info.type, '-', '\0') here would be cleaner,
> and either way probably we need #include <linux/string.h> for the str* funcs
> here

What we need is something like strcut(str, '<$CHAR>').

But related to the above code we can (besides using sizeof() instead
of I2C_NAME_SIZE):

	snprintf(work->board_info.type, sizeof(work->board_info.type),
		 "%pfwP", vcm_fwnode);

-- 
With Best Regards,
Andy Shevchenko


