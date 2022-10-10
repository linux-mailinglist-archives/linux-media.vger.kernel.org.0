Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 985BD5F9B01
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 10:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbiJJI3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 04:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiJJI3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 04:29:45 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551D912778
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665390583; x=1696926583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CBtkSc/24vlTEyCEd7QeKPDRbaM7JWkz7Sne/kxo7J4=;
  b=kHX6bzQ92qwquviA0nr7ST0i+2h2wN5qIVhTjBemrZbCOqQXTHtONIrY
   q2LQqsqSPkDiWQdQw/xXXIGrq+LqiBpaFl0Ouck8g2wjkp/TpIZUQseV7
   iDpYuyKD0ZYwur2Nda9b+2kTKMe1l1RzxNG0P2EtkkjoAcxZmX9Ka8QUq
   2/0X1pykOJvZN6tNB8ucd05u2ANBCkrYM7AJAL9WYf86bZirkr4QUhh6m
   fhNULF2PdlmGj99z3eE7T/xWK6iw3oIS1tl4yjY8MdQSmSUrgDhG5mYUA
   X14b9PQihxo+k8ZtoV0s4ZpjwEA13zEHze065asn7rNcLL/j0WXDDGPIF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="330637594"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="330637594"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 01:29:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="576969671"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="576969671"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 01:29:40 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 778BF2022B;
        Mon, 10 Oct 2022 11:29:37 +0300 (EEST)
Date:   Mon, 10 Oct 2022 08:29:37 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> Thank you for your review.
> Please consider everything not commented as queued for v7.
> 
> On 10/6/22 21:14, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > Thanks for the update. A few more comments below...
> > 
> > On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
> >> +static const char * const vgxy61_hdr_mode_menu[] = {
> >> +	"HDR linearize",
> >> +	"HDR substraction",
> >> +	"No HDR",
> >> +};
> > 
> > I think more documentation is needed on the HDR modes. What do these mean?
> > For instance, are they something that requires further processing or is the
> > result e.g. a ready HDR image?
> > 
> > This should probably make it to driver specific documentation.
> > 
> 
> Sure, in fact I did something like this in v3:
> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
> 
> Since I standardized the control I was unsure what to do with this documentation, and dropped it.
> I will add back the Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this commit to the patchset, while changing the control name to the new one.

Yes, please. That seems reasonably good.

I think Laurent's proposal on a HDR control for sensor-implemented HDR is a
good one. Further controls can be added later on.

> >> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
> >> +						       "invert-gpios-polarity");

How about:

	device_property_read_bool(dev, ...);

> > 
> > I thought we did discuss dropping support for sensor synchronisation in
> > this version?
> > 
> 
> This properties affects strobing lights gpios polarities as you can see
> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
> are inverted. This has nothing to do with the sensor synchronization.

So this is for strobing a LED flash? It would be good to mention this in
DT bindings.

> 
> Now I realize this is poorly named, and I even forgot to document it in
> the device tree bindings file. I apologize.

No problem.

> 
> I would like to rename it to 'st,strobe-polarity' since this is vendor
> specific and to better reflect that it affects strobing gpios. I'll make
> this change for v7 and document this in the bindings file too. Tell me if
> there is any issues with that.

That name seems reasonable to me. Although, *if* this is actually usable as
a GPIO as the bindings suggest, then the GPIO flags would probably be a
better alternative.

-- 
Kind regards,

Sakari Ailus
