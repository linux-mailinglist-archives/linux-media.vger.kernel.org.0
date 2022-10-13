Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE4D5FD5D5
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 10:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiJMIAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 04:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJMIAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 04:00:37 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DEA9A9CC
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665648034; x=1697184034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7+x4KrmWM+D3wlLVPtWUGxaZsMc6SBEXpWM9S9SftWs=;
  b=RRbLWKKhR95xRx9Q2lardKZ/kdWSROKKabXOUCrCpfID2unYmTD5QHHb
   3piicYnXQx2TkPt54Y8gZzdbWm+IraZCtqm4+LsIpwxirq1L3h1mRxAcX
   j1fWPuvFMF8x/EFBEBrJvFViEvtGzhvQ8s+ygjHT/UvyA2I5VDZ7TrPry
   3/RWYeBxN7toZjLygoxysv3FqKbGlQ3y+6YNmKS2k2u+3SZqeC3raQ7L9
   YxQBeF1/G2YyHrdggL18CVm22g0gFQg5qDqawVJ7nr/VYTxzxP9esUDcT
   6nFihb7ZRMzdlFLMdaeezFWDh5nN6FFXD8eD29OE1ISdW9wQT34ouup1L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="306646912"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="306646912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 01:00:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="769520831"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="769520831"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 01:00:27 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D0A1A203F0;
        Thu, 13 Oct 2022 11:00:24 +0300 (EEST)
Date:   Thu, 13 Oct 2022 08:00:24 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0fFmJj6Ytjb8+VY@paasikivi.fi.intel.com>
References: <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
 <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
 <Y0Pm0WhZpWgKxDbD@paasikivi.fi.intel.com>
 <62b268df-3c9d-79b2-31a6-61770843ee66@foss.st.com>
 <Y0QITlCsMe0wdPam@paasikivi.fi.intel.com>
 <b5175106-cab0-4a6a-6ba5-20070940ccff@foss.st.com>
 <Y0QVhUIPZYJYZ1Sm@paasikivi.fi.intel.com>
 <1a4825dd-25ff-e556-63a2-fc9cacdb32cc@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a4825dd-25ff-e556-63a2-fc9cacdb32cc@foss.st.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Oct 10, 2022 at 03:12:30PM +0200, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> On 10/10/22 14:52, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Mon, Oct 10, 2022 at 02:11:46PM +0200, Benjamin MUGNIER wrote:
> > 
> > ...
> > 
> >>>>>>>>> I thought we did discuss dropping support for sensor synchronisation in
> >>>>>>>>> this version?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> This properties affects strobing lights gpios polarities as you can see
> >>>>>>>> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
> >>>>>>>> are inverted. This has nothing to do with the sensor synchronization.
> >>>>>>>
> >>>>>>> So this is for strobing a LED flash? It would be good to mention this in
> >>>>>>> DT bindings.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Now I realize this is poorly named, and I even forgot to document it in
> >>>>>>>> the device tree bindings file. I apologize.
> >>>>>>>
> >>>>>>> No problem.
> >>>>>>>
> >>>>>>>>
> >>>>>>>> I would like to rename it to 'st,strobe-polarity' since this is vendor
> >>>>>>>> specific and to better reflect that it affects strobing gpios. I'll make
> >>>>>>>> this change for v7 and document this in the bindings file too. Tell me if
> >>>>>>>> there is any issues with that.
> >>>>>>>
> >>>>>>> That name seems reasonable to me. Although, *if* this is actually usable as
> >>>>>>> a GPIO as the bindings suggest, then the GPIO flags would probably be a
> >>>>>>> better alternative.
> >>>>>>>
> >>>>>>
> >>>>>> If by GPIO flag you mean adding 'gpios' to the property, We could go with 'st,strobe-gpios-polarity', which in the end this leads to the same property name as it was in the dt bindings :)
> >>>>>> I'll add a bit of comments on the bindings. It seems to be the best choice.
> >>>>>
> >>>>> Is this a GPIO or is it not (e.g. strobe signal only)?
> >>>>>
> >>>>> For the latter the this should be fine. And "flash-leds" property should be
> >>>>> there as well I guess?
> >>>>>
> >>>>
> >>>
> >>> Please wrap the lines at around 74. Rewrapped now...
> >>>
> >>
> >> Done. Thank you.
> >>
> >>>> This property controls the polarity of and output GPIO connected to the
> >>>> sensor. This output GPIO is driven by the sensor firmware in order to
> >>>> illuminate the scene whenever necessary. I'm not sure this goes under the
> >>>> "flash-leds" category, as it only provides a signal with either "0"
> >>>> (don't illuminate) or a 1 (illuminate) ? The sensor controls the signal
> >>>
> >>> This is what sensors generally do.
> >>>
> >>>> following the programmed "strobe-mode" as you can see in
> >>>> vgxy61_strobe_mode according to the HDR mode. It does not have a
> >>>> max-microamp or timeout values as a flash I suppose, it is really a
> >>>> simple signal.
> >>>
> >>> Those are usually configured for the flash driver, not on the sensor.
> >>>
> >>
> >> Ok, I guess in this case there is no flash driver. Should I keep the
> >> 'st,strobe-gpios-polarity' property or are you aware of an already
> >> defined property for this behavior?
> > 
> > So the LED is directly connected to this pin (perhaps in series with a
> > resistor)? That is an unusual solution.
> > 
> 
> Yes, the pin is connected to a transistor responsible of powering on and
> off the LEDs according to the pin value, so that they have correct
> voltage from another power supply. But yes that's basically it.
> 
> Thanks a lot.

I think it's fine as-is. Maybe the property could be called
"st,strobe-polarity" as this isn't a GPIO from software point of view?

Virtually all other users have a flash driver chip. But the flash LED isn't
part of the module in those cases either.

-- 
Kind regards,

Sakari Ailus
