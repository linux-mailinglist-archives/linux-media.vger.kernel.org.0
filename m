Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910C063DA34
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 17:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiK3QH7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 11:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiK3QH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 11:07:57 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D7CCD6;
        Wed, 30 Nov 2022 08:07:56 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314130053"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314130053"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 08:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="733035167"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="733035167"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2022 08:07:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p0Pcl-002LEu-1X;
        Wed, 30 Nov 2022 18:07:51 +0200
Date:   Wed, 30 Nov 2022 18:07:51 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4d/1xhtwrqgQzvi@smile.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4d0q08KXoUBD+t6@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 05:20:11PM +0200, Laurent Pinchart wrote:
> On Wed, Nov 30, 2022 at 02:52:50PM +0000, Sakari Ailus wrote:
> > On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:

...

> > The privacy LED is separate from sensor, including its power on/off
> > sequences which suggests it could be at least as well be handled
> > separately.
> 
> And if the privacy LED is controllable through a GPIO, I think it should
> be turned on at stream on time, not at power on time. That would allow
> things like reading the OTP data from the sensor without flashing the
> privacy LED.

The malicious software may power up camera and drive it via user space /
separate code flow in the kernel, no?

I would stick with power on as it's the most secure side. Even if we 100% know
we are _not_ streaming this LED should indicate that it may be turned on at any
time, no?

-- 
With Best Regards,
Andy Shevchenko


