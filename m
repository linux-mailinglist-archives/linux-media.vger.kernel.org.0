Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096696D1F82
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 13:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjCaLyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 07:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjCaLyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 07:54:21 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A3512CD2
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680263659; x=1711799659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrayZynBdZioCeYKqvZRqMxfTeKi/RfHEBp35paUauY=;
  b=F6NIopgpjROwghY/3LlmT0vcl4fRUU4NC6V74NUJjBBeWJK5rkOc693d
   i4hx7/mEYgRY8lt/0qYNILJPV9sJLxWjPqKL8bFvM8iy1rQgMS8mJhxKD
   ixyu+L9WwqPtD8VmYfe+eEEw8TwT7FIkFSy6VdcGbzAOwIOyVAHQfXbqG
   2hUM1OPYl8XUTk5IK9B0ngOyc0670Plb5cqryxNn92Ls4rNZr+ExsMx5l
   KS0xaBLxuLwwudX4wWEQFXuPbWFXQHDmPSXrGmViUAQam9ndqriP/MKij
   bCRJmlJO/Gy+O7jQiXClNc8sn3XCqHHcKQdpFBDcwwdaJrtO2wUDx3hdp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321085848"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="321085848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859304692"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859304692"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:54:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0A23911F931;
        Fri, 31 Mar 2023 14:54:00 +0300 (EEST)
Date:   Fri, 31 Mar 2023 14:54:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Message-ID: <ZCbJ2BX3ke3NhxWX@kekkonen.localdomain>
References: <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
 <132b4fdf-7ec1-33a4-566a-8e10e6094230@xs4all.nl>
 <ZA8s8MjRw8UmuzX7@kekkonen.localdomain>
 <9ce7563a-13b1-c1d5-177f-8492aae49792@xs4all.nl>
 <ZA9VE7CUYe+tzqxC@kekkonen.localdomain>
 <581da6ee-ae04-acfc-ec11-2f2b33becb4e@xs4all.nl>
 <ZBAzlQGYC6lbK5gL@valkosipuli.retiisi.eu>
 <00bb95e7-77ab-1567-13f8-70966b33677f@xs4all.nl>
 <ZBBToC9L8gBSd3Yt@kekkonen.localdomain>
 <da7c93bc-7970-f966-4b55-ec0f1dffa181@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7c93bc-7970-f966-4b55-ec0f1dffa181@xs4all.nl>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for returning to the topic.

On Fri, Mar 31, 2023 at 12:53:49PM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 14/03/2023 11:59, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Mar 14, 2023 at 09:58:43AM +0100, Hans Verkuil wrote:
> >> On 14/03/2023 09:43, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Tue, Mar 14, 2023 at 09:30:52AM +0100, Hans Verkuil wrote:
> >>>> On 13/03/2023 17:53, Sakari Ailus wrote:
> >>>>> Hi Hans,
> >>>>>
> >>>>> On Mon, Mar 13, 2023 at 03:39:25PM +0100, Hans Verkuil wrote:
> >>>>>> On 13/03/2023 15:02, Sakari Ailus wrote:
> >>>>>>> Hi Hans,
> >>>>>>>
> >>>>>>> On Mon, Mar 13, 2023 at 02:46:27PM +0100, Hans Verkuil wrote:
> >>>>>>>> On 03/03/2023 12:08, Sakari Ailus wrote:
> >>>>>>>>> Hi Hans,
> >>>>>>>>>
> >>>>>>>>> On Fri, Mar 03, 2023 at 09:54:40AM +0100, Hans Verkuil wrote:
> >>>>>>>>>> On 03/03/2023 09:39, Hans Verkuil wrote:
> >>>>>>>>>>> On 01/02/2023 22:45, Sakari Ailus wrote:
> >>>>>>>>>>>> Add a new helper data structure media_devnode_compat_ref, which is used to
> >>>>>>>>>>>> prevent user space from calling IOCTLs or other system calls to the media
> >>>>>>>>>>>> device that has been already unregistered.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The media device's memory may of course still be released during the call
> >>>>>>>>>>>> but there is only so much that can be done to this without the driver
> >>>>>>>>>>>> managing the lifetime of the resources it needs somehow.
> >>>>>>>>>>>>
> >>>>>>>>>>>> This patch should be reverted once all drivers have been converted to manage
> >>>>>>>>>>>> their resources' lifetime.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
> >>>>>>>>>>>>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
> >>>>>>>>>>>>  include/media/media-devnode.h | 29 +++++++++++++++++
> >>>>>>>>>>>>  3 files changed, 96 insertions(+), 14 deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> >>>>>>>>>>>> index 3a1db5fdbba7..22fdaa6370ea 100644
> >>>>>>>>>>>> --- a/drivers/media/mc/mc-device.c
> >>>>>>>>>>>> +++ b/drivers/media/mc/mc-device.c
> >>>>>>>>>>>> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
> >>>>>>>>>>>>  	return (void __user *)(uintptr_t)arg;
> >>>>>>>>>>>>  }
> >>>>>>>>>>>>  
> >>>>>>>>>>>> +static void compat_ref_release(struct kref *kref)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +	struct media_devnode_compat_ref *ref =
> >>>>>>>>>>>> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +	kfree(ref);
> >>>>>>>>>>>> +}
> >>>>>>>>>>>> +
> >>>>>>>>>>>>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >>>>>>>>>>>>  {
> >>>>>>>>>>>>  	struct media_device *mdev = to_media_device(devnode);
> >>>>>>>>>>>>  	struct media_device_fh *fh;
> >>>>>>>>>>>>  	unsigned long flags;
> >>>>>>>>>>>>  
> >>>>>>>>>>>> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> >>>>>>>>>>>> +			     !kref_get_unless_zero(&devnode->ref->kref)))
> >>>>>>>>>>>> +		return -ENXIO;
> >>>>>>>>>>>> +
> >>>>>>>>>>>
> >>>>>>>>>>> This seems pointless: if the media device is unregistered, then the device
> >>>>>>>>>>> node disappears and it can't be opened anymore.
> >>>>>>>>>>>
> >>>>>>>>>>> I'm confused by this patch in general: when media_device_unregister() is called,
> >>>>>>>>>>> it is no longer possible to call ioctls and basically do anything except close
> >>>>>>>>>>> the open fh.
> >>>>>>>>>>>
> >>>>>>>>>>> So what am I missing here? It all looks odd.
> >>>>>>>>>>
> >>>>>>>>>> I read up on this a bit more, and I think this patch is bogus: drivers not
> >>>>>>>>>> converted to the release() callback will indeed just crash, but that's no
> >>>>>>>>>> different than many existing drivers, media or otherwise, when you forcibly
> >>>>>>>>>> unbind them. It's broken today, and since you have to be root to unbind, I
> >>>>>>>>>> would say that we can just leave it as-is rather than introducing a rather
> >>>>>>>>>> ugly workaround. I don't think it will help anyway, since most likely
> >>>>>>>>>> such drivers will also fails if the application has a video device open
> >>>>>>>>>> when the device is unbound.
> >>>>>>>>>
> >>>>>>>>> The main difference is whether accessing such a file handle will access
> >>>>>>>>> released memory always or whether that is possible only during a very brief
> >>>>>>>>> amount of time.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> I still don't like this. It was broken before, and it is broken now (perhaps a
> >>>>>>>> bit less broken, but still...).
> >>>>>>>>
> >>>>>>>> There is a right fix now, and drivers that are likely to be removed forcibly
> >>>>>>>> should be converted. This patch just makes it more likely that such drivers
> >>>>>>>> won't be converted since it is less likely to hit this, so people will just
> >>>>>>>> think that this is 'good enough'. And it makes the code a lot uglier.
> >>>>>>>
> >>>>>>> I agree, although converting the drivers is easier said than done. Note
> >>>>>>> that also DVB is affected by this, not just V4L2. There are quite a few DVB
> >>>>>>> USB devices.
> >>>>>>>
> >>>>>>> The behaviour before this set (since ~ 2017) is restored by the last few
> >>>>>>> patches, without these we're on pre-2017 behaviour which basically means
> >>>>>>> that all media IOCTLs on file handles the device of which is gone, will
> >>>>>>> always access released memory. That was quite bad, too.
> >>>>>>
> >>>>>> Why?
> >>>>>>
> >>>>>> I have a filehandle open on /dev/mediaX. Now I unbind the device. That will
> >>>>>> unregister the media device, which will cause all file ops on the filehandle
> >>>>>> to return immediately, except for close().
> >>>>>>
> >>>>>> And close() just frees the devnode from what I can see.
> >>>>>>
> >>>>>> There is a race if the device is unbound while in an ioctl, then all bets are
> >>>>>> off without proper life-time management.
> >>>>>>
> >>>>>> If it crashes after an unbind in the close() call, then something else is
> >>>>>> wrong, it shouldn't do that.
> >>>>>>
> >>>>>> What happens if you do 'sleep 20 </dev/mediaX', then unbind the device?
> >>>>>>
> >>>>>> I feel that I am missing something here.
> >>>>>
> >>>>> Actually these seems to be a bug in the 25th patch --- testing the devnode
> >>>>> registration needs to take place before checking for fops.
> >>>>>
> >>>>> After fixing that, the difference of issuing read(2) after unregistering
> >>>>> the device is between (probably) crashing and graciously failing. The
> >>>>> underlying problem is that without the 25th patch there pretty much is a
> >>>>> guarantee devnode has been released by the time it is accessed.
> >>>>
> >>>> Ah, it's a result of patch 06/26. Now devnode is embedded in struct media_device,
> >>>> which in turn is embedded in a device's state structure. And when that is freed,
> >>>> the devnode is also freed.
> >>>>
> >>>> This is wrong IMHO: either struct media_devnode or struct media_device has to
> >>>> be dynamically allocated. Embedding devices in a larger state structure causes
> >>>> exactly these types of problems.
> >>>>
> >>>> In this case I would just keep dynamically allocating the devnode. What is the reason
> >>>> for reverting that patch? The commit log doesn't say.
> >>>
> >>> I'll add that to the cover page of the next version.
> >>>
> >>> The struct media_device and media_devnode are different structs as it was
> >>> thought that V4L2 and other kernel subsystems would start using MC for what
> >>> did not materialise in the end, and therefore infrastructure was added to
> >>> enable that. We do not need that today, as we did not need it six years
> >>> ago. Thus there is no longer a reason to keep media_device and
> >>> media_devnode separate.
> >>>
> >>> By separately allocating these, as was done back in 2017, you can reduce
> >>> the window of possible access of released memory but you cannot eliminate
> >>> it. For that you need refcounting so that an open file handle will maintain
> >>> the in-memory data structures to carry out its IOCTL-related functions.
> >>>
> >>> So this set does not yet merge struct media_device and struct media_devnode
> >>> but makes it much easier to do as they are allocated together. It's just
> >>> about moving a little bit code around.
> >>>
> >>> The end goal (and partially the result already) is a cleaner codebase
> >>> without object lifetime issues.
> >>>
> >>
> >> So you revert a patch to make it cleaner, then have to add a really ugly
> >> patch back to fix what you broke?
> > 
> > It's all broken to begin with.
> > 
> > The alternative to this is either fix all drivers (a lot of work, largely
> > untestable) or considering MC terminally broken. I'd prefer the former as
> > we don't have an alternative for MC at the moment.
> > 
> > If you really dislike the new hack (I don't think it's worse than the old
> > hack, it's much more localised at easier to understand it's broken), we
> > could keep it a few kernel releases, move the unconverted drivers to
> > staging and remove them with the hack, again after a few releases.
> > 
> >>
> >> It's not just 'moving code around', you break functionality (imperfect as
> >> it is), and then have to fix it in another way.
> > 
> > That is the intention. Repairing the state before this set without
> > reverting patches would make the intermediate patches very, very ugly and
> > difficult to review. Of course you could compare the result with the end
> > result of this patchset.
> > 
> >>
> >> I would just drop this revert patch. And when all drivers are converted
> >> to 'do the right thing', then you can revert it.
> >>
> >> Unless there is another reason for reverting it?
> > 
> > The reverts enable fixing the root problem, they are a pre-condition for
> > doing that. I'd prefer to enable writing drivers that are not broken (well,
> > at least this way). The 2017 fixes always were a dead end and we knew that
> > perfectly well.
> > 
> 
> I won't block this patch, but I think it is really ugly. And I am afraid that
> we might be stuck with this hack for a long time.

For some time, definitely yes. We should encourage driver developers to
convert the drivers. I can convert some, too, it's not very difficult. But
testing will be an issue, the changes aren't entirely trivial. Perhaps
something to do early in the cycle, right after rc1 a few drivers at a
time?

Do also note that such a hack is present without these patches, it's just
spread across a larger codebase and not very visible. I'd argue that a
localised and visible hack is better than that.

> 
> How many drivers would need to be converted for this hack to go away?

Closer to 40, including the DVB framework. Basically this includes anything
that registers a media device need to be changed.

> 
> Note that this series needs to be rebased, I had a compile error in omap3isp,
> visl and in a mediatek driver.
> 
> However, I also tested this series with a kernel that has CONFIG_DEBUG_KOBJECT_RELEASE
> on, and if I run the test-media script in v4l-utils:
> 
> cd contrib/test
> sudo ./test-media mc
> 
> then this crashes at the 'unbind vivid' stage:
> 
> [  292.900982] CPU: 2 PID: 108 Comm: kworker/2:3 Tainted: G    B D W          6.3.0-rc2-debug #29
> [  292.900986] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
> [  292.900990] Workqueue: events kobject_delayed_cleanup
> [  292.900999] RIP: 0010:kobject_put+0x16/0x90
> [  292.901004] Code: 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 85 ff 74 7c 55 53 48 89 fb 48 8d bf e8 00 00 00 e8 7a c2 88 fe <f6> 83 e8 00 00 00 01 74 2b 48 8d 6b 38 be 04 00 00
> 00 48 89 ef e8
> [  292.901008] RSP: 0018:ffffc900016cfcf0 EFLAGS: 00010286
> [  292.901012] RAX: 0000000000000000 RBX: ffff8881b1e200d0 RCX: ffffffff82cd91c6
> [  292.901015] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8881b1e201b8
> [  292.901018] RBP: ffff88814f576400 R08: 0000000000000000 R09: ffffffff84879fd7
> [  292.901020] R10: fffffbfff090f3fa R11: 0000000000000006 R12: ffff8881b1e22e98
> [  292.901023] R13: ffff8881445853e8 R14: 0000000000000000 R15: ffff8881f6338200
> [  292.901026] FS:  0000000000000000(0000) GS:ffff8881f6300000(0000) knlGS:0000000000000000
> [  292.901037] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  292.901040] CR2: ffff8881b1e201b8 CR3: 0000000149c63000 CR4: 0000000000750ee0
> [  292.901048] PKRU: 55555554
> [  292.901051] Call Trace:
> [  292.901054]  <TASK>
> [  292.901056]  device_release+0x5a/0x100
> [  292.901063]  kobject_delayed_cleanup+0x5e/0xa0
> [  292.901066]  process_one_work+0x535/0xa50
> [  292.901073]  ? __pfx_process_one_work+0x10/0x10
> [  292.901077]  ? __pfx_do_raw_spin_lock+0x10/0x10
> [  292.901082]  ? __list_add_valid+0x33/0xd0
> [  292.901087]  worker_thread+0x8a/0x620
> [  292.901091]  ? __kthread_parkme+0xd3/0xf0
> [  292.901095]  ? __pfx_worker_thread+0x10/0x10
> [  292.901099]  kthread+0x173/0x1b0
> [  292.901102]  ? __pfx_kthread+0x10/0x10
> [  292.901105]  ret_from_fork+0x2c/0x50
> [  292.901110]  </TASK>
> [  292.901112] Modules linked in: vivid v4l2_tpg videobuf2_dma_contig v4l2_dv_timings videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videodev videobuf2_common mc
> [  292.901126] CR2: ffff8881b1e201b8
> [  292.901130] ---[ end trace 0000000000000000 ]---
> [  292.901133] RIP: 0010:__mutex_lock+0xdb/0xcc0
> [  292.901138] Code: c0 e8 f9 4f 57 fe 2e 2e 2e 31 c0 48 c7 c7 60 d2 31 86 e8 98 07 84 fe 8b 05 d2 83 5f 03 85 c0 75 13 48 8d 7b 60 e8 b5 08 84 fe <48> 3b 5b 60 0f 85 e9 05 00 00 bf 01 00 00 00 e8 41
> 60 57 fe 48 8d
> [  292.901141] RSP: 0018:ffffc90002727a40 EFLAGS: 00010282
> [  292.901145] RAX: 0000000000000000 RBX: 0493011a00000f42 RCX: ffffffff82d24e9b
> [  292.901148] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0493011a00000fa2
> [  292.901151] RBP: ffffc90002727b90 R08: ffffffff81e74db3 R09: ffffffff84879fd7
> [  292.901154] R10: ffffc90002727ba8 R11: 0000000000000000 R12: 0000000000000000
> [  292.901157] R13: 0000000000000000 R14: ffff8881582b3078 R15: 1ffff920004e4f54
> [  292.901160] FS:  0000000000000000(0000) GS:ffff8881f6300000(0000) knlGS:0000000000000000
> [  292.901169] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  292.901172] CR2: ffff8881b1e201b8 CR3: 0000000149c63000 CR4: 0000000000750ee0
> [  292.901185] PKRU: 55555554
> 
> The test-media regression test is really good at testing unbind scenarios for the virtual
> drivers that we have. Together with the CONFIG_DEBUG_KOBJECT_RELEASE option it is a
> good test to run.

Thanks for the hint. I'll look into this and address it for v2.

-- 
Kind regards,

Sakari Ailus
