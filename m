Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0944E6A95E3
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 12:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCCLRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 06:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbjCCLRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 06:17:23 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0EA60ABA
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 03:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677842241; x=1709378241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2VU430YKPdceRYx+V9nw1BVwnVmkLrcevD+inBQK8A=;
  b=LiAeS08YryUcRWvdsJgEvG9V48PmrSdMD8K0aT4gnxT9ZEw3HPvb5IeH
   1Bxk/93SY3sZcfAmFF5kLhiEJYSoU6nGUtkPMA2FuXXtx/oXngJ7A+138
   Y9fBzVutwMNg3JStcIt3tute5UZutUKzqGwTob/tR790aHugAQX6K9mGz
   VwZd4hwBwuYyOc+9GaP278bfZFTI4GvI3ssqg0Z4qkGczdHcgqBqSAlsD
   w4GDCJ2BToKLyp5Ltajpq4rXFV3RnyEd0gSq+xaEhKnBvnj/GIYEFg2Hi
   /YI+JGq740peXdqXYEI0pn0k179NMcEh/K2Y6zt84dxcecQEKFrq8so/O
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314676858"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="314676858"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849430383"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="849430383"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:17:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id D69EE1207E1;
        Fri,  3 Mar 2023 13:06:47 +0200 (EET)
Date:   Fri, 3 Mar 2023 13:06:47 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 25/26] media: Implement best effort media device removal
 safety sans refcounting
Message-ID: <ZAHUx/kn/hCVW1k4@kekkonen.localdomain>
References: <20230201214535.347075-1-sakari.ailus@linux.intel.com>
 <20230201214535.347075-26-sakari.ailus@linux.intel.com>
 <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a8c0ec-f13e-2473-78d6-f454790467be@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Mar 03, 2023 at 09:39:46AM +0100, Hans Verkuil wrote:
> On 01/02/2023 22:45, Sakari Ailus wrote:
> > Add a new helper data structure media_devnode_compat_ref, which is used to
> > prevent user space from calling IOCTLs or other system calls to the media
> > device that has been already unregistered.
> > 
> > The media device's memory may of course still be released during the call
> > but there is only so much that can be done to this without the driver
> > managing the lifetime of the resources it needs somehow.
> > 
> > This patch should be reverted once all drivers have been converted to manage
> > their resources' lifetime.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/mc/mc-device.c  | 60 ++++++++++++++++++++++++++++++-----
> >  drivers/media/mc/mc-devnode.c | 21 ++++++++----
> >  include/media/media-devnode.h | 29 +++++++++++++++++
> >  3 files changed, 96 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> > index 3a1db5fdbba7..22fdaa6370ea 100644
> > --- a/drivers/media/mc/mc-device.c
> > +++ b/drivers/media/mc/mc-device.c
> > @@ -45,18 +45,34 @@ static inline void __user *media_get_uptr(__u64 arg)
> >  	return (void __user *)(uintptr_t)arg;
> >  }
> >  
> > +static void compat_ref_release(struct kref *kref)
> > +{
> > +	struct media_devnode_compat_ref *ref =
> > +		container_of_const(kref, struct media_devnode_compat_ref, kref);
> > +
> > +	kfree(ref);
> > +}
> > +
> >  static int media_device_open(struct media_devnode *devnode, struct file *filp)
> >  {
> >  	struct media_device *mdev = to_media_device(devnode);
> >  	struct media_device_fh *fh;
> >  	unsigned long flags;
> >  
> > +	if (devnode->ref && (!atomic_read(&devnode->ref->registered) ||
> > +			     !kref_get_unless_zero(&devnode->ref->kref)))
> > +		return -ENXIO;
> > +
> 
> This seems pointless: if the media device is unregistered, then the device
> node disappears and it can't be opened anymore.
> 
> I'm confused by this patch in general: when media_device_unregister() is
> called, it is no longer possible to call ioctls and basically do anything
> except close the open fh.

That is true.

However for drivers that don't manage media device lifetime, the devnode
is released right at the time the driver's remove callback is called. This
means that for all the open file handles the private_data is pointing to
released memory.

With this patch, the devnode compat ref will remain as long as any file
handle is open, and the devnode registered status is maintained there.

This certainly is risky but it reduces the time of danger to a very small
moment. Just as it was before this patchset.

-- 
Kind regards,

Sakari Ailus
