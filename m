Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203775F9C01
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 11:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbiJJJeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 05:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiJJJdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 05:33:46 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1E869F4B
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665394404; x=1696930404;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NLmcEQh9xKw/0SueitazHufCXEu/oPiqeq3QYE7tqLY=;
  b=IZ3qLWoxpPMo7RcUK9k1XLSyxdm1lqihM79rGEpfIzl+i4lXBHj5bD2S
   j+WzFfPnjqadop8+/v3VCNjBMKqxtxj32aW0bGMLoJMvSpZMxLcP/aY7S
   5Oi/+84k3tqi5jlTluWlRHIsjfl8Om0640IU7Fx4dG6SJ0dILLo0XP8cr
   NYf+X+7C26dRps99L+WD6IGsXhIpXAcIXgDQ1DAc73z4Uf/jORdvljOkR
   ayBMUp4pFEw3cTe04VSlBzLJsf6ivju28QHDx4zi32QY2TlTnMqmGknAr
   pdWB5dTmrg1VAKGRI2sWRrqh+RsrfCjFVh+T4bpTWsfz/GSJqhD+NF1oh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="291469956"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="291469956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 02:33:10 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="656871549"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="656871549"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 02:33:07 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 602C52022B;
        Mon, 10 Oct 2022 12:33:05 +0300 (EEST)
Date:   Mon, 10 Oct 2022 09:33:05 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0Pm0WhZpWgKxDbD@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
 <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Mon, Oct 10, 2022 at 11:19:01AM +0200, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> On 10/10/22 10:29, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
> >> Hi Sakari,
> >>
> >> Thank you for your review.
> >> Please consider everything not commented as queued for v7.
> >>
> >> On 10/6/22 21:14, Sakari Ailus wrote:
> >>> Hi Benjamin,
> >>>
> >>> Thanks for the update. A few more comments below...
> >>>
> >>> On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
> >>>> +static const char * const vgxy61_hdr_mode_menu[] = {
> >>>> +	"HDR linearize",
> >>>> +	"HDR substraction",
> >>>> +	"No HDR",
> >>>> +};
> >>>
> >>> I think more documentation is needed on the HDR modes. What do these mean?
> >>> For instance, are they something that requires further processing or is the
> >>> result e.g. a ready HDR image?
> >>>
> >>> This should probably make it to driver specific documentation.
> >>>
> >>
> >> Sure, in fact I did something like this in v3:
> >> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
> >>
> >> Since I standardized the control I was unsure what to do with this documentation, and dropped it.
> >> I will add back the Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this commit to the patchset, while changing the control name to the new one.
> > 
> > Yes, please. That seems reasonably good.
> > 
> > I think Laurent's proposal on a HDR control for sensor-implemented HDR is a
> > good one. Further controls can be added later on.
> > 
> >>>> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
> >>>> +						       "invert-gpios-polarity");
> > 
> > How about:
> > 
> > 	device_property_read_bool(dev, ...);
> > 
> 
> Sounds great.
> 
> >>>
> >>> I thought we did discuss dropping support for sensor synchronisation in
> >>> this version?
> >>>
> >>
> >> This properties affects strobing lights gpios polarities as you can see
> >> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
> >> are inverted. This has nothing to do with the sensor synchronization.
> > 
> > So this is for strobing a LED flash? It would be good to mention this in
> > DT bindings.
> > 
> >>
> >> Now I realize this is poorly named, and I even forgot to document it in
> >> the device tree bindings file. I apologize.
> > 
> > No problem.
> > 
> >>
> >> I would like to rename it to 'st,strobe-polarity' since this is vendor
> >> specific and to better reflect that it affects strobing gpios. I'll make
> >> this change for v7 and document this in the bindings file too. Tell me if
> >> there is any issues with that.
> > 
> > That name seems reasonable to me. Although, *if* this is actually usable as
> > a GPIO as the bindings suggest, then the GPIO flags would probably be a
> > better alternative.
> > 
> 
> If by GPIO flag you mean adding 'gpios' to the property, We could go with 'st,strobe-gpios-polarity', which in the end this leads to the same property name as it was in the dt bindings :)
> I'll add a bit of comments on the bindings. It seems to be the best choice.

Is this a GPIO or is it not (e.g. strobe signal only)?

For the latter the this should be fine. And "flash-leds" property should be
there as well I guess?

-- 
Sakari Ailus
