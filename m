Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D734963D888
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 15:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiK3OxG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 09:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiK3OxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 09:53:04 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF21227CDF;
        Wed, 30 Nov 2022 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669819983; x=1701355983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qxa2V0avoZlf+PlxPWxwVEk/yEbFNAXnaZimtKZYiTo=;
  b=UzXSW6Ex+P9VGZK8KYWo6YlcIttEOz5hKT0TUH0WcIgRsSsF+QnHxXAK
   urRvAKeVoIvY0CSmNrH87+6AH+E0WY+l9M79FfP6qiLaag6sheSzYuxAH
   N5EjqHVK62x1U2gHX5lfSLKx4pqVncCxe+TJCejJZCgtbj9UiLXAxs4i8
   6ifQKd2eX09f2s33ZC0mRUYibwiow7dTz7ufteZDPby1dyobq1xXZutsp
   1/CVfyzf3MVpHcNe1PxWKoqJ22W7aFC72j2iqHuefWRhK63wodzyUe59i
   Y0ir6SSVfdDCfuVYTSTU1JCkqlXwvj+sc+i0JVPLQ+4i5Xn4g8M4DocEs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303013852"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="303013852"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 06:52:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707670009"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="707670009"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 06:52:52 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0AF85202B0;
        Wed, 30 Nov 2022 16:52:50 +0200 (EET)
Date:   Wed, 30 Nov 2022 14:52:50 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Message-ID: <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 11/30/22 14:41, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
> >> Add support for a privacy-led GPIO.
> >>
> >> Making the privacy LED to controlable from userspace, as using the LED
> >> class subsystem would do, would make it too easy for spy-ware to disable
> >> the LED.
> >>
> >> To avoid this have the sensor driver directly control the LED.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> Note an additional advantage of directly controlling the GPIO is that
> >> GPIOs are tied directly to consumer devices. Where as with a LED class
> >> device, there would need to be some mechanism to tie the right LED
> >> (e.g front or back) to the right sensor.
> > 
> > Thanks for the patch.
> > 
> > This approach has the drawback that support needs to be added for each
> > sensor separately. Any idea how many sensor drivers might need this?
> 
> Quite a few probably. But as discussed here I plan to write a generic
> sensor_power helper library since many sensor drivers have a lot of
> boilerplate code to get clks + regulators + enable/reset gpios. The plan
> is to add support for a "privacy-led" to this library so that all sensors
> which use this get support for free.

I'm not sure how well this could be generalised. While most sensors do
something similar there are subtle differences. If those can be taken into
account I guess it should be doable. But would it simplify things or reduce
the number of lines of code as a whole?

The privacy LED is separate from sensor, including its power on/off
sequences which suggests it could be at least as well be handled
separately.

> 
> Laurent pointed out that some sensors may have more complex power-up
> sequence demands, which is true. But looking at existing drivers
> then many follow a std simple pattern which can be supported in
> a helper-library.
> 
> > Most implementations have privacy LED hard-wired to the sensor's power
> > rails so it'll be lit whenever the sensor is powered on.
> > 
> > If there would be more than just a couple of these I'd instead create a LED
> > class device and hook it up to the sensor in V4L2.
> 
> 
> A LED cladd device will allow userspace to override the privacy-led
> value which is considered bad from a privacy point of view. This
> was actually already discussed here:
> 
> https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
> 
> See the part of the thread on the cover-letter with Dan, Laurent
> and me participating.
> 
> And a LED class device also will be a challenge to bind to the right
> sensor on devices with more then one sensor, where as mentioned
> above using GPIO-mappings give us the binding to the right sensor
> for free.

Whether the privacy LED is controlled via the LED framework or GPIO doesn't
really matter from this PoV, it could be controlled via the V4L2 framework
in both cases. It might not be very pretty but I think I'd prefer that than
putting this in either drivers or some sensor power sequence helper
library.

-- 
Kind regardsm

Sakari Ailus
