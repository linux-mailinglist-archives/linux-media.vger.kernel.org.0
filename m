Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838EA4FF5E1
	for <lists+linux-media@lfdr.de>; Wed, 13 Apr 2022 13:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbiDMLmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Apr 2022 07:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbiDMLmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Apr 2022 07:42:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAB013EA8
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 04:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649850024; x=1681386024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m7e8LT/aeBZbhCyGyrz4cDYaLGYzdevvSD7XY8NVm4c=;
  b=RvZqKkS1y5lkSALWII4tXXSXguUQ1jau9waam59UuC5M6NDE8DJcCiyP
   e5NMLTtsm6KkiZNyKefLTPyYPbGfSPu+e2qtFfNTymUH93Wl1ZBuiY9Ne
   sUoNpsf5vDOu13qQMGhoL32ITs6VyuDsgV695/uIJ5ISvnafd8aOeuS1Y
   7Azjr8/SARKQ/kr3KM4RNidEGCQmFJWVyV7rwomE27psO7fofuS9vuHjy
   a+vr2TCW8LHlX2Y02zthgUyEOOmZcFJz9qqVU6joyK+MmRe9U1+R+AJcs
   cTa85EWv2V29efK9aZY9pqQF9yGsrheuZEClr1PeF470TlUmt5o4w9u/b
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262084396"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="262084396"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:40:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; 
   d="scan'208";a="802655230"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 04:40:21 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id BD5132030F;
        Wed, 13 Apr 2022 14:40:19 +0300 (EEST)
Date:   Wed, 13 Apr 2022 14:40:19 +0300
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off device
Message-ID: <Yla2owgZ9sSBazDF@paasikivi.fi.intel.com>
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
 <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5B9hZNn4UuB8h0RLUwSxwTFGC219LFe8jGE1jDd+EfosA@mail.gmail.com>
 <CAAFQd5B_LTXa=ECg0wRzGLqGJaiz3HrY_C9BJgByj4QFTJzu-Q@mail.gmail.com>
 <64cf6ebd-03d4-3cc2-5eed-bc723eb3214a@linux.intel.com>
 <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5DnBTKKeY1Mr6np2Q6BUo=-RcZHHJ+GsSK-BDAtYLJ1Gg@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz, Bingbu,

On Tue, Apr 12, 2022 at 08:15:08PM +0900, Tomasz Figa wrote:
> On Tue, Apr 12, 2022 at 8:05 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> >
> >
> >
> > On 4/12/22 5:39 PM, Tomasz Figa wrote:
> > > On Tue, Nov 16, 2021 at 1:57 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >>
> > >> On Fri, Nov 5, 2021 at 9:52 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
> > >>>
> > >>>> -----Original Message-----
> > >>>> From: Tomasz Figa <tfiga@chromium.org>
> > >>>> Sent: Friday, November 5, 2021 2:55 PM
> > >>>> To: Cao, Bingbu <bingbu.cao@intel.com>
> > >>>> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> > >>>> dongchun.zhu@mediatek.com; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> > >>>> bingbu.cao@linux.intel.com
> > >>>> Subject: Re: [PATCH] media: dw9768: activate runtime PM and turn off
> > >>>> device
> > >>>>
> > >>>> On Fri, Oct 15, 2021 at 3:12 PM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > >>>>>
> > >>>>> When dw9768 working with ACPI systems, the dw9768 was turned by
> > >>>>> i2c-core during probe, driver need activate the PM runtime and ask
> > >>>>> runtime PM to turn off the device.
> > >>>>>
> > >>>>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > >>>>> ---
> > >>>>>  drivers/media/i2c/dw9768.c | 6 ++++++
> > >>>>>  1 file changed, 6 insertions(+)
> > >>>>>
> > >>>>> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > >>>>> index c086580efac7..65c6acf3ced9 100644
> > >>>>> --- a/drivers/media/i2c/dw9768.c
> > >>>>> +++ b/drivers/media/i2c/dw9768.c
> > >>>>> @@ -469,6 +469,11 @@ static int dw9768_probe(struct i2c_client
> > >>>>> *client)
> > >>>>>
> > >>>>>         dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> > >>>>>
> > >>>>> +       /*
> > >>>>> +        * Device is already turned on by i2c-core with ACPI domain PM.
> > >>>>> +        * Attempt to turn off the device to satisfy the privacy LED
> > >>>> concerns.
> > >>>>> +        */
> > >>>>> +       pm_runtime_set_active(dev);
> > >>>>
> > >>>> This driver is used by non-ACPI systems as well. This change will make
> > >>>> the PM core not call the runtime_resume() callback provided by the
> > >>>> driver and the power would never be turned on on such systems.
> > >>>>
> > >>>
> > >>>> Wasn't the intention of Sakari's ACPI patches to allow bypassing the
> > >>>> ACPI domain power on at boot up and eliminate the need for this change?
> > >>>
> > >>> Tomasz, thanks for your review.
> > >>>
> > >>> The comment here is invalid, it should not be strongly related to the privacy
> > >>> LED concern. Anyway, the device should be turned off on ACPI and non-ACPI
> > >>> systems even without Sakari's changes.
> > >>>
> > >>> I am wondering how the driver work with PM core on non-ACPI system.
> > >>>
> > >>
> > >> On non-ACPI systems it's the driver which handles the power sequencing
> > >> of the chip so the regulators wouldn't be implicitly enabled by the
> > >> subsystem before (unless they're shared with some other device and the
> > >> corresponding driver enabled them).
> > >
> > > It looks like this patch made into Linus' tree and broke the driver on
> > > ARM devices. Could we please revert it?
> >
> > If revert the patch, the device will not work on ACPI system, is there some
> > other solution? Have no details about the failure on ARM device.
> >
> 
> I believe it worked on ACPI systems, just runtime PM wasn't suspending
> the device.
> 
> That said, if my comment above was addressed instead of being ignored,
> this regression wouldn't have happened. The problem is described in my
> previous messages, please get back to them and address the issue I
> pointed out.

First of all, thanks for catching this.

What I believe happened was that the patch was merged to my tree before you
commented on it and then I missed the related follow-up discussion.

Looking at the patch itself, it seems fine as such but there's a problem
with the driver to begin with: the device isn't powered on in probe on DT
systems but still its runtime suspend callback is called through
pm_runtime_idle().

Normally calling the RT suspend callback is what we want, but in this case
disabling a regulator that wasn't enabled is a problem.

There also seems to be a problem in error handling... and the driver does
not support probing while powered off on ACPI. Oh well.

Let's revert the patch now but it seems there's something to fix
afterwards.

-- 
Regards,

Sakari Ailus
