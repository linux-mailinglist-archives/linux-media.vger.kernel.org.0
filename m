Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323A65F9E1D
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 13:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiJJL4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 07:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbiJJL4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 07:56:36 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8134D5D0F4
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 04:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665402964; x=1696938964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/NkJq3Tqd5uPFKBn8GZ1D3cqTXW3INNUrpamsBX5Ya0=;
  b=jz99svJLvqJMyTa6YNV4WtavgGGb8BJxeZ1ImUg3Hr737wMmjeiHnQXD
   7+XpMRKvyh4xQj14kzCQ0OdSC+oaPvQKhJHDYAhTLEPhonsd/lYLIgd8/
   /tpcr9hXKfJU8+GCO8zCRTkxX1CFtyXBX7UOLVVkoV3tNXANQ1sO1msrk
   yVTpu/gdDEl+AxbTy+xi+dZoyme7Gt5WLsG5DC41h9bMAGJSZoMR7lKxE
   28uYuZX9e92z6CRb24wCVtFrx9TNUbNRajvgqehZoxR/EEApB5wfAxry1
   1COGUrgYAAtIfkgj12inNSsJH2Efi1eN35Y/J5K5ZsvLev0qsL8Wa5NKu
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="304193885"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="304193885"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 04:56:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="730509740"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="730509740"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 04:56:00 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9209320387;
        Mon, 10 Oct 2022 14:55:58 +0300 (EEST)
Date:   Mon, 10 Oct 2022 11:55:58 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0QITlCsMe0wdPam@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
 <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
 <Y0Pm0WhZpWgKxDbD@paasikivi.fi.intel.com>
 <62b268df-3c9d-79b2-31a6-61770843ee66@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b268df-3c9d-79b2-31a6-61770843ee66@foss.st.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Oct 10, 2022 at 11:50:25AM +0200, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> On 10/10/22 11:33, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Mon, Oct 10, 2022 at 11:19:01AM +0200, Benjamin MUGNIER wrote:
> >> Hi Sakari,
> >>
> >> On 10/10/22 10:29, Sakari Ailus wrote:
> >>> Hi Benjamin,
> >>>
> >>> On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
> >>>> Hi Sakari,
> >>>>
> >>>> Thank you for your review.
> >>>> Please consider everything not commented as queued for v7.
> >>>>
> >>>> On 10/6/22 21:14, Sakari Ailus wrote:
> >>>>> Hi Benjamin,
> >>>>>
> >>>>> Thanks for the update. A few more comments below...
> >>>>>
> >>>>> On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
> >>>>>> +static const char * const vgxy61_hdr_mode_menu[] = {
> >>>>>> +	"HDR linearize",
> >>>>>> +	"HDR substraction",
> >>>>>> +	"No HDR",
> >>>>>> +};
> >>>>>
> >>>>> I think more documentation is needed on the HDR modes. What do these mean?
> >>>>> For instance, are they something that requires further processing or is the
> >>>>> result e.g. a ready HDR image?
> >>>>>
> >>>>> This should probably make it to driver specific documentation.
> >>>>>
> >>>>
> >>>> Sure, in fact I did something like this in v3:
> >>>> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
> >>>>
> >>>> Since I standardized the control I was unsure what to do with this documentation, and dropped it.
> >>>> I will add back the Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this commit to the patchset, while changing the control name to the new one.
> >>>
> >>> Yes, please. That seems reasonably good.
> >>>
> >>> I think Laurent's proposal on a HDR control for sensor-implemented HDR is a
> >>> good one. Further controls can be added later on.
> >>>
> >>>>>> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
> >>>>>> +						       "invert-gpios-polarity");
> >>>
> >>> How about:
> >>>
> >>> 	device_property_read_bool(dev, ...);
> >>>
> >>
> >> Sounds great.
> >>
> >>>>>
> >>>>> I thought we did discuss dropping support for sensor synchronisation in
> >>>>> this version?
> >>>>>
> >>>>
> >>>> This properties affects strobing lights gpios polarities as you can see
> >>>> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
> >>>> are inverted. This has nothing to do with the sensor synchronization.
> >>>
> >>> So this is for strobing a LED flash? It would be good to mention this in
> >>> DT bindings.
> >>>
> >>>>
> >>>> Now I realize this is poorly named, and I even forgot to document it in
> >>>> the device tree bindings file. I apologize.
> >>>
> >>> No problem.
> >>>
> >>>>
> >>>> I would like to rename it to 'st,strobe-polarity' since this is vendor
> >>>> specific and to better reflect that it affects strobing gpios. I'll make
> >>>> this change for v7 and document this in the bindings file too. Tell me if
> >>>> there is any issues with that.
> >>>
> >>> That name seems reasonable to me. Although, *if* this is actually usable as
> >>> a GPIO as the bindings suggest, then the GPIO flags would probably be a
> >>> better alternative.
> >>>
> >>
> >> If by GPIO flag you mean adding 'gpios' to the property, We could go with 'st,strobe-gpios-polarity', which in the end this leads to the same property name as it was in the dt bindings :)
> >> I'll add a bit of comments on the bindings. It seems to be the best choice.
> > 
> > Is this a GPIO or is it not (e.g. strobe signal only)?
> > 
> > For the latter the this should be fine. And "flash-leds" property should be
> > there as well I guess?
> > 
> 

Please wrap the lines at around 74. Rewrapped now...

> This property controls the polarity of and output GPIO connected to the
> sensor. This output GPIO is driven by the sensor firmware in order to
> illuminate the scene whenever necessary. I'm not sure this goes under the
> "flash-leds" category, as it only provides a signal with either "0"
> (don't illuminate) or a 1 (illuminate) ? The sensor controls the signal

This is what sensors generally do.

> following the programmed "strobe-mode" as you can see in
> vgxy61_strobe_mode according to the HDR mode. It does not have a
> max-microamp or timeout values as a flash I suppose, it is really a
> simple signal.

Those are usually configured for the flash driver, not on the sensor.

> 
> Practically we have what we call "illuminators" that are either built in
> the sensor'smodule, are externally connected to the sensor's module.
> 
> Hope this is clearer.

-- 
Regards,

Sakari Ailus
