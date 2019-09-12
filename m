Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D76C0B0FC0
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2019 15:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731879AbfILNY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Sep 2019 09:24:57 -0400
Received: from mga06.intel.com ([134.134.136.31]:54220 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731654AbfILNY4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Sep 2019 09:24:56 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 06:24:56 -0700
X-IronPort-AV: E=Sophos;i="5.64,497,1559545200"; 
   d="scan'208";a="200740372"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 06:24:55 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 03E15208A0; Thu, 12 Sep 2019 16:24:52 +0300 (EEST)
Date:   Thu, 12 Sep 2019 16:24:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/6] v4l: subdev: Provide a locking scheme for subdev
 operations
Message-ID: <20190912132452.GJ5781@paasikivi.fi.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
 <20190819124728.10511-3-sakari.ailus@linux.intel.com>
 <cec240cb-daf7-fc68-6578-44be011720ba@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec240cb-daf7-fc68-6578-44be011720ba@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Sep 12, 2019 at 03:11:27PM +0200, Hans Verkuil wrote:
> On 8/19/19 2:47 PM, Sakari Ailus wrote:
> > The V4L2 sub-device's operations are called both from other drivers as
> > well as through the IOCTL uAPI. Previously the sub-device drivers were
> > responsible for managing their own serialisation. This patch adds an
> > optional mutex the drivers may set, and it will be used to serialise
> > access to driver's data related to a device across the driver's ops.
> > 
> > Access to the driver's controls through the control framework works as
> > usual, i.e. using a different mutex.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-subdev.h | 25 +++++++++++++++++--------
> >  1 file changed, 17 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 71f1f2f0da53..dc6e11019df6 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -9,6 +9,7 @@
> >  #define _V4L2_SUBDEV_H
> >  
> >  #include <linux/types.h>
> > +#include <linux/mutex.h>
> >  #include <linux/v4l2-subdev.h>
> >  #include <media/media-entity.h>
> >  #include <media/v4l2-async.h>
> > @@ -828,6 +829,7 @@ struct v4l2_subdev_platform_data {
> >   * @host_priv: pointer to private data used by the device where the subdev
> >   *	is attached.
> >   * @devnode: subdev device node
> > + * @lock: A mutex for serialising access to the subdev's operations. Optional.
> 
> A pointer to a mutex...

Yes.

> 
> >   * @dev: pointer to the physical device, if any
> >   * @fwnode: The fwnode_handle of the subdev, usually the same as
> >   *	    either dev->of_node->fwnode or dev->fwnode (whichever is non-NULL).
> > @@ -862,6 +864,7 @@ struct v4l2_subdev {
> >  	void *dev_priv;
> >  	void *host_priv;
> >  	struct video_device *devnode;
> > +	struct mutex *lock;
> >  	struct device *dev;
> >  	struct fwnode_handle *fwnode;
> >  	struct list_head async_list;
> > @@ -1101,16 +1104,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
> >  	({								\
> >  		struct v4l2_subdev *__sd = (sd);			\
> >  		int __result;						\
> > -		if (!__sd)						\
> > +		if (!__sd) {						\
> >  			__result = -ENODEV;				\
> > -		else if (!(__sd->ops->o && __sd->ops->o->f))		\
> > +		} else if (!(__sd->ops->o && __sd->ops->o->f)) {	\
> >  			__result = -ENOIOCTLCMD;			\
> > -		else if (v4l2_subdev_call_wrappers.o &&			\
> > -			 v4l2_subdev_call_wrappers.o->f)		\
> > -			__result = v4l2_subdev_call_wrappers.o->f(	\
> > -							__sd, ##args);	\
> > -		else							\
> > -			__result = __sd->ops->o->f(__sd, ##args);	\
> > +		} else {						\
> > +			if (__sd->lock)					\
> > +				mutex_lock(__sd->lock);			\
> > +			if (v4l2_subdev_call_wrappers.o &&		\
> > +				 v4l2_subdev_call_wrappers.o->f)	\
> > +				__result = v4l2_subdev_call_wrappers.o->f( \
> > +					__sd, ##args);			\
> > +			else						\
> > +				__result = __sd->ops->o->f(__sd, ##args); \
> > +			if (__sd->lock)					\
> > +				mutex_unlock(__sd->lock);			\
> > +		}							\
> >  		__result;						\
> >  	})
> >  
> > 
> 
> I'm not sure this is the right place to lock. Locking is only needed if the
> subdev device can be called directly from userspace. So I would put the
> locking in subdev_do_ioctl() and use mutex_lock_interruptible.
> 
> If there are subdev ops that in this scenario (i.e. userspace is responsible
> for configuring the subdev) are still called from another driver, then I would
> create a v4l2_subdev_call_lock() function that takes the lock.
> 
> Adding a lock in the v4l2_subdev_call macro feels too invasive.

This is still the very purpose of the patch: provide drivers with a way to
have their operations serialised using a mutex. As the v4l2_subdev_call()
is the macro used to call sub-devices' operations, there's no other single
point to acquire (and release) the mutex.

If another name is chosen, then all (or almost all) current users would
need to switch to use the new macro in order for the change to be
effective.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
