Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9506A9608
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 12:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjCCLYO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 06:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjCCLYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 06:24:10 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277325D44C
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677842637; x=1709378637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kKlUXx65HKHeoa7h/3XgD+vrOGKEIbawOyw7wpJjbUM=;
  b=HqUkmGXLwFHIrtZhDkw3s+un1RmooC/vyTEazRg/lOfIR91fD+UxX+H5
   zlCIBgtsaweCndR0H9Gcf1l3yGZ/JLmnJxAr3OpeMPAUa2MU6hGcFjWAK
   q2nZhLCPeArdTSEk1IVJszVjdQJ4fWp8Up3p0MiGb/vS9VuqgKXv06Yst
   rGSy5lg9ciB7bYdE3RuJoxB9yqWV8bpVtOjZvaT81HA4cpOlDkup9e6pu
   I8pLo1bGXkd2h3OIXzc82guhuhXOfhgrIOcLHfRMqxNLJGtTPm0neHXSp
   yzed3jQ3atimasyAE0rgw1ye5QvjPtBOvMbtlZlE4pPPkOGfd6bWeDOap
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399828961"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="399828961"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="677618498"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="677618498"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:23:55 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E6BB1122D15;
        Fri,  3 Mar 2023 13:23:52 +0200 (EET)
Date:   Fri, 3 Mar 2023 13:23:52 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 00/26] Media device lifetime management
Message-ID: <ZAHYyGs5kTxRhmdJ@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <85f6411a-bce7-5b22-34b8-e7e1a36ec18c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85f6411a-bce7-5b22-34b8-e7e1a36ec18c@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Many thanks for the review.

On Fri, Mar 03, 2023 at 10:07:38AM +0100, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 01/02/2023 22:45, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This is a refresh of my 2016 RFC patchset to start addressing object
> > lifetime issues in Media controller. It further allows continuing work to
> > address lifetime management of media entities.
> > 
> > The underlying problem is described in detail in v4 of the previous RFC:
> > <URL:https://lore.kernel.org/linux-media/20161108135438.GO3217@valkosipuli.retiisi.org.uk/>.
> > In brief, there is currently no connection between releasing media device
> > (and related) memory and IOCTL calls, meaning that there is a time window
> > during which released kernel memory can be accessed, and that access can be
> > triggered from the user space. The only reason why this is not a grave
> > security issue is that it is not triggerable by the user alone but requires
> > unbinding a device. That is still not an excuse for not fixing it.
> > 
> > This set differs from the earlier RFC to address the issue in the
> > following respects:
> > 
> > - Make changes for ipu3-cio2 driver, too.
> > 
> > - Continue to provide best effort attempt to keep the window between device
> >   removal and user space being able to access released memory as small as
> >   possible. This means the problem won't become worse for drivers for which
> >   Media device lifetime management has not been implemented.
> > 
> > The latter is achieved by adding a new object, Media devnode compat
> > reference, which is allocated, refcounted and eventually released by the
> > Media controller framework itself, and where the information on registration
> > and open filehandles is maintained. This is only done if the driver does not
> > manage the lifetime of the media device itself, i.e. its release operation
> > is NULL.
> > 
> > Due to this, Media device file handles will also be introduced by this
> > patchset. I thought the first user of this would be Media device events but
> > it seems we already need them here.
> > 
> > Both ipu3-cio2 and omap3isp drivers are relieved of devm_request_irq() use,
> > as device_release() releases the resources before calling the driver's
> > remove function. While further work will be required also on these drivers
> > to safely stop he hardware at unbind time, I don't see a reason not to merge
> > these patches now.
> > 
> > Some patches are temporarily reverted in order to make reworks easier, then
> > applied later on.
> > 
> > I've tested this on ipu3-cio2 with and without the refcounting patch (media:
> > ipu3-cio2: Release the cio2 device context by media device callback),
> > including failures in a few parts of the driver initialisation process in
> > the MC framework.
> > 
> > Questions and comments are welcome.
> 
> Most of this series looks good.
> 
> You can add my:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> for patches 1-17, 19, 20 and 22.

Thank you!

> 
> As I mentioned in my review of patch 21, I don't think 18 and 21 belong to
> this series.

Yes, some patches I wrote as part of this should be merged earlier. I think
I'll just pick them to my master branch once we have rc1.

> 
> I am also not keen on patch 25 (and thus 23 and 24 that it needs). Perhaps
> take that out for now for more discussion later?
> 
> I would like to see some more drivers to be converted: specifically uvc
> and the test drivers (vidtv, vim2m, vimc, visl, vivid). uvc because it is
> widely used, the test drivers because they function as reference code.

Sounds reasonable. Uvc especially should benefit from this. The conversion
isn't even difficult at all, but still requires testing.

> 
> Finally, I don't think this series addresses another life-cycle problem:
> unbinding subdevices when they are still being used, either by userspace
> or a bridge driver.

That is correct. I wanted to address this for the media device first and
tackle other problems once we have these patches in.

> 
> I have patches for that here:
> 
> https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=subdev-kref
> 
> I think these are pretty much independent from this patch series, but
> I'll wait with posting them until this is merged.

Interesting. I thought in practice addressing the problem for sub-devices
would require addressing media device lifetime management first. In
practice most drivers have one big allocation for everything and that can
be released only once all users are gone.

> 
> Background: we have an fpga that implements subdevices and also
> (depending on the configuration) complete v4l2 platform drivers.
> 
> When the fpga is unloaded when going to standby, subdevices and/or
> platform drivers just disappear, and without correct life-time management
> you get crashes. Basically exactly the same problem as you have with the
> media device.

Yes.

Have you posted the subdev-kref patches to the list yet?

-- 
Kind regards,

Sakari Ailus
