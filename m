Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B772F733E
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 08:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbhAOG6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 01:58:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47508 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730008AbhAOG6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 01:58:51 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F5DA527;
        Fri, 15 Jan 2021 07:58:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610693888;
        bh=7P6hOYPhQqADD6L0VY/NxoWZPEWzOCQozrIxzBXUSso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SqEQnnI2MD97HomLeBFlfz53k04m5KWeQSAcmRE6NUTKottUT6K2eP7EKvQd5+MxX
         VC/PuS+JD//7O2gm2umOJaSxCo60w4+yl1yK6v4m6oFftgxPBLgLCzYa1KKFCjKnFD
         ZbzebOlrLhYoUmm2fiBDam7A1Je3jdokSvt+m138=
Date:   Fri, 15 Jan 2021 08:57:51 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 13/13] media: v4l2-async: Discourage use of
 v4l2_async_notifier_add_subdev
Message-ID: <YAE877QJH+9qTeQC@pendragon.ideasonboard.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-14-ezequiel@collabora.com>
 <X/+r9y7++G1LoOre@pendragon.ideasonboard.com>
 <7a33faf403b640dd9958ba6d976e03eaaf3d778b.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a33faf403b640dd9958ba6d976e03eaaf3d778b.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Jan 14, 2021 at 10:47:08AM -0300, Ezequiel Garcia wrote:
> On Thu, 2021-01-14 at 04:27 +0200, Laurent Pinchart wrote:
> > On Tue, Jan 12, 2021 at 10:23:39AM -0300, Ezequiel Garcia wrote:
> > > Most -if not all- use-cases are expected to be covered by one of:
> > > v4l2_async_notifier_add_fwnode_subdev,
> > > v4l2_async_notifier_add_fwnode_remote_subdev,
> > > v4l2_async_notifier_add_i2c_subdev or
> > > v4l2_async_notifier_add_devname_subdev.
> > > 
> > > We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
> > > so rename it as __v4l2_async_notifier_add_subdev. This is
> > > typically a good hint for drivers to avoid using the function.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c  | 10 +++++-----
> > >  drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
> > >  include/media/v4l2-async.h            | 10 ++++++++--
> > >  3 files changed, 14 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index b325bacddff4..e8e690280922 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -630,7 +630,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
> > >  }
> > >  EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
> > >  
> > > -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > > +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > >                                    struct v4l2_async_subdev *asd)
> > >  {
> > >         int ret;
> > > @@ -647,7 +647,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > >         mutex_unlock(&list_lock);
> > >         return ret;
> > >  }
> > > -EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
> > > +EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
> > >  
> > >  struct v4l2_async_subdev *
> > >  v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > > @@ -664,7 +664,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
> > >         asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> > >         asd->match.fwnode = fwnode_handle_get(fwnode);
> > >  
> > > -       ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > +       ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> > >         if (ret) {
> > >                 fwnode_handle_put(fwnode);
> > >                 kfree(asd);
> > > @@ -714,7 +714,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
> > >         asd->match.i2c.adapter_id = adapter_id;
> > >         asd->match.i2c.address = address;
> > >  
> > > -       ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > +       ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> > >         if (ret) {
> > >                 kfree(asd);
> > >                 return ERR_PTR(ret);
> > > @@ -739,7 +739,7 @@ v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
> > >         asd->match_type = V4L2_ASYNC_MATCH_DEVNAME;
> > >         asd->match.device_name = device_name;
> > >  
> > > -       ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > +       ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> > >         if (ret) {
> > >                 kfree(asd);
> > >                 return ERR_PTR(ret);
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index 5353e37eb950..919fde20032e 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -833,7 +833,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
> > >         if (ret < 0)
> > >                 goto out_err;
> > >  
> > > -       ret = v4l2_async_notifier_add_subdev(notifier, asd);
> > > +       ret = __v4l2_async_notifier_add_subdev(notifier, asd);
> > >         if (ret < 0) {
> > >                 /* not an error if asd already exists */
> > >                 if (ret == -EEXIST)
> > 
> > I wonder if v4l2-fwnode should be moved to videodev-objs in the
> > Makefile, we could then avoid exporting
> > __v4l2_async_notifier_add_subdev(). This doesn't need to be fixed here,
> > 
> 
> Yeah, I thought about that, precisely to avoid the export and disallow
> any future users of v4l2_async_notifier_add_subdev.
> 
> The impact of that is that we'd kill V4L2_FWNODE, increasing the
> size of videodev.ko, by a small fraction.

We don't have to drop V4L2_FWNODE, we can still make v4l2-async.o
conditional, even if it's included in videodev.ko.

> Perhaps this is justified? I'm sure all the use-cases for this type
> of hardware won't care for 20 KiB more or less in the kernel payload.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 1278f98355a7..9cf83f1ecca6 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -161,17 +161,23 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
> > >  void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
> > >  
> > >  /**
> > > - * v4l2_async_notifier_add_subdev - Add an async subdev to the
> > > + * __v4l2_async_notifier_add_subdev - Add an async subdev to the
> > >   *                             notifier's master asd list.
> > >   *
> > >   * @notifier: pointer to &struct v4l2_async_notifier
> > >   * @asd: pointer to &struct v4l2_async_subdev
> > >   *
> > > + * \warning: Drivers should avoid using this function and instead use one of:
> > > + * @v4l2_async_notifier_add_fwnode_subdev,
> > > + * @v4l2_async_notifier_add_fwnode_remote_subdev,
> > > + * @v4l2_async_notifier_add_i2c_subdev or
> > > + * @v4l2_async_notifier_add_devname_subdev.
> > > + *
> > >   * Call this function before registering a notifier to link the provided @asd to
> > >   * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
> > >   * it will be freed by the framework when the notifier is destroyed.
> > >   */
> > > -int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > > +int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > >                                    struct v4l2_async_subdev *asd);
> > >  
> > >  /**

-- 
Regards,

Laurent Pinchart
