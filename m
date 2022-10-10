Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30DA35F9EDF
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 14:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbiJJMwd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 08:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiJJMwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 08:52:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8E052FC8
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 05:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665406347; x=1696942347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GR8VcM+hmDKeowWsbQ/bzo8HDoxVAziTCLnOUgECZ8M=;
  b=W9xyFV+x4u7e8123mx1+AUsGhHu2T4pd7oEg1jdcayhc59PDjpnx+umL
   863k1S6XnwqewahhQCqag5l7airsayzZfNj+vmq/FWdudiBupukDlvUqK
   cYU6777UjCgq6yvWDFk6KjkN6nmp2IVfk0p/f5zXy0O+Amc+mYy1Fhj14
   zvSanZF874RX81AFFUUvc/+BwKpivgZy5rQzJYvnJBpAMchQlDIwcD8u7
   6/anwFJv4QnPtrRzmiKs+xjhBaVz+i6CI7hpetMK+zo1GfNo6yO1O+ZJu
   z8ch9kFCHspWcJPQ+3i1uIibNR0g7drhqtfrNDOi7SH935Q2WIELEtnYB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="390523685"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="390523685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 05:52:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="659137199"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="659137199"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 05:52:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id A0D082022B;
        Mon, 10 Oct 2022 15:52:21 +0300 (EEST)
Date:   Mon, 10 Oct 2022 12:52:21 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0QVhUIPZYJYZ1Sm@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
 <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
 <Y0Pm0WhZpWgKxDbD@paasikivi.fi.intel.com>
 <62b268df-3c9d-79b2-31a6-61770843ee66@foss.st.com>
 <Y0QITlCsMe0wdPam@paasikivi.fi.intel.com>
 <b5175106-cab0-4a6a-6ba5-20070940ccff@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5175106-cab0-4a6a-6ba5-20070940ccff@foss.st.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Oct 10, 2022 at 02:11:46PM +0200, Benjamin MUGNIER wrote:

...

> >>>>>>> I thought we did discuss dropping support for sensor synchronisation in
> >>>>>>> this version?
> >>>>>>>
> >>>>>>
> >>>>>> This properties affects strobing lights gpios polarities as you can see
> >>>>>> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
> >>>>>> are inverted. This has nothing to do with the sensor synchronization.
> >>>>>
> >>>>> So this is for strobing a LED flash? It would be good to mention this in
> >>>>> DT bindings.
> >>>>>
> >>>>>>
> >>>>>> Now I realize this is poorly named, and I even forgot to document it in
> >>>>>> the device tree bindings file. I apologize.
> >>>>>
> >>>>> No problem.
> >>>>>
> >>>>>>
> >>>>>> I would like to rename it to 'st,strobe-polarity' since this is vendor
> >>>>>> specific and to better reflect that it affects strobing gpios. I'll make
> >>>>>> this change for v7 and document this in the bindings file too. Tell me if
> >>>>>> there is any issues with that.
> >>>>>
> >>>>> That name seems reasonable to me. Although, *if* this is actually usable as
> >>>>> a GPIO as the bindings suggest, then the GPIO flags would probably be a
> >>>>> better alternative.
> >>>>>
> >>>>
> >>>> If by GPIO flag you mean adding 'gpios' to the property, We could go with 'st,strobe-gpios-polarity', which in the end this leads to the same property name as it was in the dt bindings :)
> >>>> I'll add a bit of comments on the bindings. It seems to be the best choice.
> >>>
> >>> Is this a GPIO or is it not (e.g. strobe signal only)?
> >>>
> >>> For the latter the this should be fine. And "flash-leds" property should be
> >>> there as well I guess?
> >>>
> >>
> > 
> > Please wrap the lines at around 74. Rewrapped now...
> > 
> 
> Done. Thank you.
> 
> >> This property controls the polarity of and output GPIO connected to the
> >> sensor. This output GPIO is driven by the sensor firmware in order to
> >> illuminate the scene whenever necessary. I'm not sure this goes under the
> >> "flash-leds" category, as it only provides a signal with either "0"
> >> (don't illuminate) or a 1 (illuminate) ? The sensor controls the signal
> > 
> > This is what sensors generally do.
> > 
> >> following the programmed "strobe-mode" as you can see in
> >> vgxy61_strobe_mode according to the HDR mode. It does not have a
> >> max-microamp or timeout values as a flash I suppose, it is really a
> >> simple signal.
> > 
> > Those are usually configured for the flash driver, not on the sensor.
> > 
> 
> Ok, I guess in this case there is no flash driver. Should I keep the
> 'st,strobe-gpios-polarity' property or are you aware of an already
> defined property for this behavior?

So the LED is directly connected to this pin (perhaps in series with a
resistor)? That is an unusual solution.

-- 
Sakari Ailus
