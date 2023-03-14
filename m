Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE41F6B90D6
	for <lists+linux-media@lfdr.de>; Tue, 14 Mar 2023 12:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbjCNLAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Mar 2023 07:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCNK77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Mar 2023 06:59:59 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D605A910
        for <linux-media@vger.kernel.org>; Tue, 14 Mar 2023 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678791588; x=1710327588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JnrusbP0+Fa7ns1ApWBuR00GTHRncDY6ylQzbK6Jon4=;
  b=iLnjEbT3L6dnsn0pbem2dsO8D7aH7+Va2Hl3HUEnTczSYi4num8g3cES
   tyLEesorXiSq++mWOhg9twIPzTJeOuILdHzhI9G2f5NTSPp5UAk/XqGKK
   d9ENd1l0vuOlL6d0xX3yGpHPH10n+nFo5ddrJS7Whep+B7M6DozeQ4MTP
   vZLoKIOjIiVKjlqq/bVe3Gn1KQreva2BdJjermHMG1hprc74gps+ix9yi
   9cfiT27+aIDkP53XTJDhdfVxMPML5JBcnbSGI9JKtxQ68uUITkNkKnMTx
   CqOlBEajxLZpMofcfjjovh3Y4b6DaWOJuMv47Oviq6YEEPb8C9onxcPHn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423663107"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="423663107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 03:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924871809"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="924871809"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 03:59:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 55FBA120D16;
        Tue, 14 Mar 2023 12:59:44 +0200 (EET)
Date:   Tue, 14 Mar 2023 12:59:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Message-ID: <ZBBToC9L8gBSd3Yt@kekkonen.localdomain>
References: <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
 <768335ad-d5ba-d0a7-828a-80c0ec44e41b@xs4all.nl>
 <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
 <132b4fdf-7ec1-33a4-566a-8e10e6094230@xs4all.nl>
 <ZA8s8MjRw8UmuzX7@kekkonen.localdomain>
 <9ce7563a-13b1-c1d5-177f-8492aae49792@xs4all.nl>
 <ZA9VE7CUYe+tzqxC@kekkonen.localdomain>
 <581da6ee-ae04-acfc-ec11-2f2b33becb4e@xs4all.nl>
 <ZBAzlQGYC6lbK5gL@valkosipuli.retiisi.eu>
 <00bb95e7-77ab-1567-13f8-70966b33677f@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00bb95e7-77ab-1567-13f8-70966b33677f@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Mar 14, 2023 at 09:58:43AM +0100, Hans Verkuil wrote:
> On 14/03/2023 09:43, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Mar 14, 2023 at 09:30:52AM +0100, Hans Verkuil wrote:
> >> On 13/03/2023 17:53, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Mon, Mar 13, 2023 at 03:39:25PM +0100, Hans Verkuil wrote:
> >>>> On 13/03/2023 15:02, Sakari Ailus wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Mon, Mar 13, 2023 at 02:46:27PM +0100, Hans Verkuil wrote:
> >>>>>> On 03/03/2023 12:08, Sakari Ailus wrote:
> >>>>>>> Hi Hans,
> >>>>>>>
> >>>>>>> On Fri, Mar 03, 2023 at 09:54:40AM +0100, Hans Verkuil wrote:
> >>>>>>>> On 03/03/2023 09:39, Hans Verkuil wrote:
> >>>>>>>>> On 01/02/2023 22:45, Sakari Ailus wrote:
> >>>>>>>>>> Add a new helper data structure media_devnode_compat_ref, which is used to
> >>>>>>>>>> prevent user space from calling IOCTLs or other system calls to the media
> >>>>>>>>>> device that has been already unregistered.
> >>>>>>>>>>
> >>>>>>>>>> The media device's memory may of course still be released during the call
> >>>>>>>>>> but there is only so much that can be done to this without the driver
> >>>>>>>>>> managing the lifetime of the resources it needs somehow.
> >>>>>>>>>>
> >>>>>>>>>> This patch should be reverted once all drivers have been converted to manage
> >>>>>>>>>> their resources' lifetime.
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
> >>>>>>>>>>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
> >>>>>>>>>>  include/media/media-devnode.h | 29 +++++++++++++++++
> >>>>>>>>>>  3 files changed, 96 insertions(+), 14 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> >>>>>>>>>> index 3a1db5fdbba7..22fdaa6370ea 100644
> >>>>>>>>>> --- a/drivers/media/mc/mc-device.c
> >>>>>>>>>> +++ b/drivers/media/mc/mc-device.c
> >>>>>>>>>> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
> >>>>>>>>>>  	return (void __user *)(uintptr_t)arg;
> >>>>>>>>>>  }
> >>>>>>>>>>  
> >>>>>>>>>> +static void compat_ref_release(struct kref *kref)
> >>>>>>>>>> +{
> >>>>>>>>>> +	struct media_devnode_compat_ref *ref =
> >>>>>>>>>> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> >>>>>>>>>> +
> >>>>>>>>>> +	kfree(ref);
> >>>>>>>>>> +}
> >>>>>>>>>> +
> >>>>>>>>>>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >>>>>>>>>>  {
> >>>>>>>>>>  	struct media_device *mdev = to_media_device(devnode);
> >>>>>>>>>>  	struct media_device_fh *fh;
> >>>>>>>>>>  	unsigned long flags;
> >>>>>>>>>>  
> >>>>>>>>>> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> >>>>>>>>>> +			     !kref_get_unless_zero(&devnode->ref->kref)))
> >>>>>>>>>> +		return -ENXIO;
> >>>>>>>>>> +
> >>>>>>>>>
> >>>>>>>>> This seems pointless: if the media device is unregistered, then the device
> >>>>>>>>> node disappears and it can't be opened anymore.
> >>>>>>>>>
> >>>>>>>>> I'm confused by this patch in general: when media_device_unregister() is called,
> >>>>>>>>> it is no longer possible to call ioctls and basically do anything except close
> >>>>>>>>> the open fh.
> >>>>>>>>>
> >>>>>>>>> So what am I missing here? It all looks odd.
> >>>>>>>>
> >>>>>>>> I read up on this a bit more, and I think this patch is bogus: drivers not
> >>>>>>>> converted to the release() callback will indeed just crash, but that's no
> >>>>>>>> different than many existing drivers, media or otherwise, when you forcibly
> >>>>>>>> unbind them. It's broken today, and since you have to be root to unbind, I
> >>>>>>>> would say that we can just leave it as-is rather than introducing a rather
> >>>>>>>> ugly workaround. I don't think it will help anyway, since most likely
> >>>>>>>> such drivers will also fails if the application has a video device open
> >>>>>>>> when the device is unbound.
> >>>>>>>
> >>>>>>> The main difference is whether accessing such a file handle will access
> >>>>>>> released memory always or whether that is possible only during a very brief
> >>>>>>> amount of time.
> >>>>>>>
> >>>>>>
> >>>>>> I still don't like this. It was broken before, and it is broken now (perhaps a
> >>>>>> bit less broken, but still...).
> >>>>>>
> >>>>>> There is a right fix now, and drivers that are likely to be removed forcibly
> >>>>>> should be converted. This patch just makes it more likely that such drivers
> >>>>>> won't be converted since it is less likely to hit this, so people will just
> >>>>>> think that this is 'good enough'. And it makes the code a lot uglier.
> >>>>>
> >>>>> I agree, although converting the drivers is easier said than done. Note
> >>>>> that also DVB is affected by this, not just V4L2. There are quite a few DVB
> >>>>> USB devices.
> >>>>>
> >>>>> The behaviour before this set (since ~ 2017) is restored by the last few
> >>>>> patches, without these we're on pre-2017 behaviour which basically means
> >>>>> that all media IOCTLs on file handles the device of which is gone, will
> >>>>> always access released memory. That was quite bad, too.
> >>>>
> >>>> Why?
> >>>>
> >>>> I have a filehandle open on /dev/mediaX. Now I unbind the device. That will
> >>>> unregister the media device, which will cause all file ops on the filehandle
> >>>> to return immediately, except for close().
> >>>>
> >>>> And close() just frees the devnode from what I can see.
> >>>>
> >>>> There is a race if the device is unbound while in an ioctl, then all bets are
> >>>> off without proper life-time management.
> >>>>
> >>>> If it crashes after an unbind in the close() call, then something else is
> >>>> wrong, it shouldn't do that.
> >>>>
> >>>> What happens if you do 'sleep 20 </dev/mediaX', then unbind the device?
> >>>>
> >>>> I feel that I am missing something here.
> >>>
> >>> Actually these seems to be a bug in the 25th patch --- testing the devnode
> >>> registration needs to take place before checking for fops.
> >>>
> >>> After fixing that, the difference of issuing read(2) after unregistering
> >>> the device is between (probably) crashing and graciously failing. The
> >>> underlying problem is that without the 25th patch there pretty much is a
> >>> guarantee devnode has been released by the time it is accessed.
> >>
> >> Ah, it's a result of patch 06/26. Now devnode is embedded in struct media_device,
> >> which in turn is embedded in a device's state structure. And when that is freed,
> >> the devnode is also freed.
> >>
> >> This is wrong IMHO: either struct media_devnode or struct media_device has to
> >> be dynamically allocated. Embedding devices in a larger state structure causes
> >> exactly these types of problems.
> >>
> >> In this case I would just keep dynamically allocating the devnode. What is the reason
> >> for reverting that patch? The commit log doesn't say.
> > 
> > I'll add that to the cover page of the next version.
> > 
> > The struct media_device and media_devnode are different structs as it was
> > thought that V4L2 and other kernel subsystems would start using MC for what
> > did not materialise in the end, and therefore infrastructure was added to
> > enable that. We do not need that today, as we did not need it six years
> > ago. Thus there is no longer a reason to keep media_device and
> > media_devnode separate.
> > 
> > By separately allocating these, as was done back in 2017, you can reduce
> > the window of possible access of released memory but you cannot eliminate
> > it. For that you need refcounting so that an open file handle will maintain
> > the in-memory data structures to carry out its IOCTL-related functions.
> > 
> > So this set does not yet merge struct media_device and struct media_devnode
> > but makes it much easier to do as they are allocated together. It's just
> > about moving a little bit code around.
> > 
> > The end goal (and partially the result already) is a cleaner codebase
> > without object lifetime issues.
> > 
> 
> So you revert a patch to make it cleaner, then have to add a really ugly
> patch back to fix what you broke?

It's all broken to begin with.

The alternative to this is either fix all drivers (a lot of work, largely
untestable) or considering MC terminally broken. I'd prefer the former as
we don't have an alternative for MC at the moment.

If you really dislike the new hack (I don't think it's worse than the old
hack, it's much more localised at easier to understand it's broken), we
could keep it a few kernel releases, move the unconverted drivers to
staging and remove them with the hack, again after a few releases.

> 
> It's not just 'moving code around', you break functionality (imperfect as
> it is), and then have to fix it in another way.

That is the intention. Repairing the state before this set without
reverting patches would make the intermediate patches very, very ugly and
difficult to review. Of course you could compare the result with the end
result of this patchset.

> 
> I would just drop this revert patch. And when all drivers are converted
> to 'do the right thing', then you can revert it.
> 
> Unless there is another reason for reverting it?

The reverts enable fixing the root problem, they are a pre-condition for
doing that. I'd prefer to enable writing drivers that are not broken (well,
at least this way). The 2017 fixes always were a dead end and we knew that
perfectly well.

-- 
Kind regards,

Sakari Ailus
