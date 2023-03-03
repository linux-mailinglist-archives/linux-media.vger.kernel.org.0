Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83CCF6A95CE
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 12:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjCCLId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 06:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjCCLIb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 06:08:31 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8988F17165
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677841710; x=1709377710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R95yxDG8TozO4XpFjnSqr5I2sBnib06Lxfrj3njNPFI=;
  b=LnClkRi60n4hLg6bKtQlMqQzkKr/ZPkBJ8iGVlcuG+Lf66tDB/AO7Hl9
   gFLOZa6hA07mLHT7TVGQMcjp5yjomLFRBWENIEiS+Y9NFXr5w6a/s3Dpf
   3ll/sD4juvtM37uTt9wjB0fCuGKYnnzJauVRgWfEKmMJkuEKBfE8UIYOP
   LP5Yr7lH26Eel8/3V3/P2jpG2ugrh3ECx1q4/SPbsRBgX3S1GiIGKObsI
   S/q1JK7JpT6Q5iqyDaXGCFiL4Z2J1YevP235xaW9Lq5I7oKGj7D8szwDT
   OKynPlKTIPO4YgUSk3bteTM4XLcepuMLFop3v4CjW4FND4FhOZ50S3pgY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421291121"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="421291121"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:08:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="785232173"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="785232173"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:08:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D1DC7122D3A;
        Fri,  3 Mar 2023 13:08:26 +0200 (EET)
Date:   Fri, 3 Mar 2023 13:08:26 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Message-ID: <ZAHVKu3OPyd7iLhH@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-26-sakari.ailus@linux.intel.com>
 <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
 <768335ad-d5ba-d0a7-828a-80c0ec44e41b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <768335ad-d5ba-d0a7-828a-80c0ec44e41b@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 03, 2023 at 09:54:40AM +0100, Hans Verkuil wrote:
> On 03/03/2023 09:39, Hans Verkuil wrote:
> > On 01/02/2023 22:45, Sakari Ailus wrote:
> >> Add a new helper data structure media_devnode_compat_ref, which is used to
> >> prevent user space from calling IOCTLs or other system calls to the media
> >> device that has been already unregistered.
> >>
> >> The media device's memory may of course still be released during the call
> >> but there is only so much that can be done to this without the driver
> >> managing the lifetime of the resources it needs somehow.
> >>
> >> This patch should be reverted once all drivers have been converted to manage
> >> their resources' lifetime.
> >>
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> ---
> >>  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
> >>  drivers/media/mc/mc-devnode.c | 21 ++++++++----
> >>  include/media/media-devnode.h | 29 +++++++++++++++++
> >>  3 files changed, 96 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> >> index 3a1db5fdbba7..22fdaa6370ea 100644
> >> --- a/drivers/media/mc/mc-device.c
> >> +++ b/drivers/media/mc/mc-device.c
> >> @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
> >>  	return (void __user *)(uintptr_t)arg;
> >>  }
> >>  
> >> +static void compat_ref_release(struct kref *kref)
> >> +{
> >> +	struct media_devnode_compat_ref *ref =
> >> +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> >> +
> >> +	kfree(ref);
> >> +}
> >> +
> >>  static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >>  {
> >>  	struct media_device *mdev = to_media_device(devnode);
> >>  	struct media_device_fh *fh;
> >>  	unsigned long flags;
> >>  
> >> +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> >> +			     !kref_get_unless_zero(&devnode->ref->kref)))
> >> +		return -ENXIO;
> >> +
> > 
> > This seems pointless: if the media device is unregistered, then the device
> > node disappears and it can't be opened anymore.
> > 
> > I'm confused by this patch in general: when media_device_unregister() is called,
> > it is no longer possible to call ioctls and basically do anything except close
> > the open fh.
> > 
> > So what am I missing here? It all looks odd.
> 
> I read up on this a bit more, and I think this patch is bogus: drivers not
> converted to the release() callback will indeed just crash, but that's no
> different than many existing drivers, media or otherwise, when you forcibly
> unbind them. It's broken today, and since you have to be root to unbind, I
> would say that we can just leave it as-is rather than introducing a rather
> ugly workaround. I don't think it will help anyway, since most likely
> such drivers will also fails if the application has a video device open
> when the device is unbound.

The main difference is whether accessing such a file handle will access
released memory always or whether that is possible only during a very brief
amount of time.

-- 
Sakari Ailus
