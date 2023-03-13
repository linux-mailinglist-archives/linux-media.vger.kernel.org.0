Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614D66B7E2E
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 17:54:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjCMQyR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 12:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjCMQyP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 12:54:15 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B41DDBE0
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678726454; x=1710262454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWeZdMvv9MMCv9zw2R8bzaUlZto2291kCdaXPJZPRsk=;
  b=UsCyP2KXecjP3mnY2a79n+sr33SlOaIyD6U0BVQSQ1bAywkATXuPZVL4
   hDyk3Ae8c1uyLngJJCSLlfTVdQUyC3eMj1Q9w73x4Jp7fWqrufXPBfZFR
   Lcg4y5OIEDagBm3x7WBhJw55Xwx6LIYNfWqiVC5Z0t/FLJTk7YUeSRNCH
   npTXDJLkSSLjwL1+RVmgptPbVWsb6cRg3GkRdkQjx/JJzAKrLFZQ6Xn5Q
   /xkL1x3SgE0MLRSY7N2Y1Fk5dojeCbEPLrrNp+IKjOTf4lHHj6P1qrTj4
   uDY16FaTyiDWw40kcqItpL4YsCaMkHJbYEQM21tPoTicOmXEc9wFclls+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423470602"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="423470602"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 09:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681113964"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="681113964"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 09:53:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 008AE120C21;
        Mon, 13 Mar 2023 18:53:39 +0200 (EET)
Date:   Mon, 13 Mar 2023 18:53:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Message-ID: <ZA9VE7CUYe+tzqxC@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-26-sakari.ailus@linux.intel.com>
 <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
 <768335ad-d5ba-d0a7-828a-80c0ec44e41b@xs4all.nl>
 <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
 <132b4fdf-7ec1-33a4-566a-8e10e6094230@xs4all.nl>
 <ZA8s8MjRw8UmuzX7@kekkonen.localdomain>
 <9ce7563a-13b1-c1d5-177f-8492aae49792@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ce7563a-13b1-c1d5-177f-8492aae49792@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Mar 13, 2023 at 03:39:25PM +0100, Hans Verkuil wrote:
> On 13/03/2023 15:02, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Mon, Mar 13, 2023 at 02:46:27PM +0100, Hans Verkuil wrote:
> >> On 03/03/2023 12:08, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Fri, Mar 03, 2023 at 09:54:40AM +0100, Hans Verkuil wrote:
> >>>> On 03/03/2023 09:39, Hans Verkuil wrote:
> >>>>> On 01/02/2023 22:45, Sakari Ailus wrote:
> >>>>>> Add a new helper data structure media_devnode_compat_ref, which is used to
> >>>>>> prevent user space from calling IOCTLs or other system calls to the media
> >>>>>> device that has been already unregistered.
> >>>>>>
> >>>>>> The media device's memory may of course still be released during the call
> >>>>>> but there is only so much that can be done to this without the driver
> >>>>>> managing the lifetime of the resources it needs somehow.
> >>>>>>
> >>>>>> This patch should be reverted once all drivers have been converted to manage
> >>>>>> their resources' lifetime.
> >>>>>>
> >>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>>> ---
> >>>>>>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
> >>>>>>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
> >>>>>>  include/media/media-devnode.h | 29 +++++++++++++++++
> >>>>>>  3 files changed, 96 insertions(+), 14 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> >>>>>> index 3a1db5fdbba7..22fdaa6370ea 100644
> >>>>>> --- a/drivers/media/mc/mc-device.c
> >>>>>> +++ b/drivers/media/mc/mc-device.c
> >>>>>> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
> >>>>>>  	return (void __user *)(uintptr_t)arg;
> >>>>>>  }
> >>>>>>  
> >>>>>> +static void compat_ref_release(struct kref *kref)
> >>>>>> +{
> >>>>>> +	struct media_devnode_compat_ref *ref =
> >>>>>> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> >>>>>> +
> >>>>>> +	kfree(ref);
> >>>>>> +}
> >>>>>> +
> >>>>>>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >>>>>>  {
> >>>>>>  	struct media_device *mdev = to_media_device(devnode);
> >>>>>>  	struct media_device_fh *fh;
> >>>>>>  	unsigned long flags;
> >>>>>>  
> >>>>>> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> >>>>>> +			     !kref_get_unless_zero(&devnode->ref->kref)))
> >>>>>> +		return -ENXIO;
> >>>>>> +
> >>>>>
> >>>>> This seems pointless: if the media device is unregistered, then the device
> >>>>> node disappears and it can't be opened anymore.
> >>>>>
> >>>>> I'm confused by this patch in general: when media_device_unregister() is called,
> >>>>> it is no longer possible to call ioctls and basically do anything except close
> >>>>> the open fh.
> >>>>>
> >>>>> So what am I missing here? It all looks odd.
> >>>>
> >>>> I read up on this a bit more, and I think this patch is bogus: drivers not
> >>>> converted to the release() callback will indeed just crash, but that's no
> >>>> different than many existing drivers, media or otherwise, when you forcibly
> >>>> unbind them. It's broken today, and since you have to be root to unbind, I
> >>>> would say that we can just leave it as-is rather than introducing a rather
> >>>> ugly workaround. I don't think it will help anyway, since most likely
> >>>> such drivers will also fails if the application has a video device open
> >>>> when the device is unbound.
> >>>
> >>> The main difference is whether accessing such a file handle will access
> >>> released memory always or whether that is possible only during a very brief
> >>> amount of time.
> >>>
> >>
> >> I still don't like this. It was broken before, and it is broken now (perhaps a
> >> bit less broken, but still...).
> >>
> >> There is a right fix now, and drivers that are likely to be removed forcibly
> >> should be converted. This patch just makes it more likely that such drivers
> >> won't be converted since it is less likely to hit this, so people will just
> >> think that this is 'good enough'. And it makes the code a lot uglier.
> > 
> > I agree, although converting the drivers is easier said than done. Note
> > that also DVB is affected by this, not just V4L2. There are quite a few DVB
> > USB devices.
> > 
> > The behaviour before this set (since ~ 2017) is restored by the last few
> > patches, without these we're on pre-2017 behaviour which basically means
> > that all media IOCTLs on file handles the device of which is gone, will
> > always access released memory. That was quite bad, too.
> 
> Why?
> 
> I have a filehandle open on /dev/mediaX. Now I unbind the device. That will
> unregister the media device, which will cause all file ops on the filehandle
> to return immediately, except for close().
> 
> And close() just frees the devnode from what I can see.
> 
> There is a race if the device is unbound while in an ioctl, then all bets are
> off without proper life-time management.
> 
> If it crashes after an unbind in the close() call, then something else is
> wrong, it shouldn't do that.
> 
> What happens if you do 'sleep 20 </dev/mediaX', then unbind the device?
> 
> I feel that I am missing something here.

Actually these seems to be a bug in the 25th patch --- testing the devnode
registration needs to take place before checking for fops.

After fixing that, the difference of issuing read(2) after unregistering
the device is between (probably) crashing and graciously failing. The
underlying problem is that without the 25th patch there pretty much is a
guarantee devnode has been released by the time it is accessed.

-- 
Kind regards,

Sakari Ailus
