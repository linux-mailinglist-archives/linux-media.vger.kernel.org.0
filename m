Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5A516EF3F
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbfGTLnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 07:43:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728092AbfGTLnp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 07:43:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4AFF928BC20
Message-ID: <83dc10a52ffad26fb5a1e7f5068658fff46175e7.camel@collabora.com>
Subject: Re: [PATCH v3] media: v4l: ctrls: Add debug messages
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
Date:   Sat, 20 Jul 2019 08:43:33 -0300
In-Reply-To: <88ac9b6d-7758-52b5-32c4-cf87027f20db@xs4all.nl>
References: <20190622102855.7932-1-ezequiel@collabora.com>
         <000e9a2d-3a46-3075-20ba-11cb955d9757@xs4all.nl>
         <389dae64ca74b11f88bc6ef71dad40a553a1bf1f.camel@collabora.com>
         <88ac9b6d-7758-52b5-32c4-cf87027f20db@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2019-07-20 at 11:36 +0200, Hans Verkuil wrote:
> On 7/19/19 11:53 PM, Ezequiel Garcia wrote:
> > On Thu, 2019-06-27 at 09:38 +0200, Hans Verkuil wrote:
> > > Hi Ezequiel,
> > > 
> > > 'checkpatch.pl --strict' finds way too many issues.
> > > 
> > > I'm pretty certain you didn't run it.
> > > 
> > 
> > Shame on me, I did run it and skipped fixing the long lines :-(
> > 
> > > Please fix the issues and post a v4.
> > > 
> > > A lot (but not all) of the warnings report lines that are too long
> > > and from what I can see most are easily fixed without reducing
> > > readability.
> > > 
> > 
> > I have fixed all the long lines. IMHO, the remaining warnings
> > are not worth fixing:
> > 
> > CHECK: Macro argument reuse 'vdev' - possible side-effects?
> > #77: FILE: drivers/media/v4l2-core/v4l2-ctrls.c:21:
> > +#define dprintk(vdev, fmt, arg...) do {					\
> > +	if (!WARN_ON(!vdev) && ((vdev)->dev_debug & V4L2_DEV_DEBUG_CTRL)) \
> > +		printk(KERN_DEBUG pr_fmt("%s: %s: " fmt),		\
> > +		       __func__, video_device_node_name(vdev), ##arg);	\
> > +} while (0)
> 
> You really need to use 'if (!WARN_ON(!(vdev)) &&' here. It is a little thing that
> simply makes the code more robust.
> 
> > CHECK: Macro argument 'vdev' may be better as '(vdev)' to avoid precedence issues
> > #77: FILE: drivers/media/v4l2-core/v4l2-ctrls.c:21:
> > +#define dprintk(vdev, fmt, arg...) do {					\
> > +	if (!WARN_ON(!vdev) && ((vdev)->dev_debug & V4L2_DEV_DEBUG_CTRL)) \
> > +		printk(KERN_DEBUG pr_fmt("%s: %s: " fmt),		\
> > +		       __func__, video_device_node_name(vdev), ##arg);	\
> > +} while (0)
> > 
> > WARNING: Prefer [subsystem eg: netdev]_dbg([subsystem]dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG ...
> > #79: FILE: drivers/media/v4l2-core/v4l2-ctrls.c:23:
> > +		printk(KERN_DEBUG pr_fmt("%s: %s: " fmt),		\
> > 
> > CHECK: Comparison to NULL could be written "!ref"
> > #116: FILE: drivers/media/v4l2-core/v4l2-ctrls.c:3255:
> > +		if (ref == NULL) {
> > 
> > CHECK: Comparison to NULL could be written "!hdl"
> > #249: FILE: drivers/media/v4l2-core/v4l2-ctrls.c:3730:
> > +	if (hdl == NULL) {
> > 
> > I believe the dprintk macro is OK as-is. We use printk KERN_DEBUG because
> > we already have a parameter guarding it. This is consistent
> > with the v4l2 way.
> > 
> > The NULL comparison warning is valid, but it was already
> > like this before. I'd rather not change existing code.
> > 
> > I'll post a v4.
> 
> Skipping the other warnings is OK, but the first really needs to be addressed.
> So we need a v5, I'm afraid.
> 

No worries!

> Regards,
> 
> 	Hans
> 
> > Ezequiel
> > 
> > > Regards,
> > > 
> > > 	Hans
> > > 
> > > On 6/22/19 12:28 PM, Ezequiel Garcia wrote:
> > > > Currently, the v4l2 control code is a bit silent on errors.
> > > > Add debug messages on (hopefully) most of the error paths.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > > Changes from v2:
> > > > * Check and noisy-warn if vdev is NULL.
> > > > 
> > > > Changes from v1:
> > > > * Drop changes in the debug parameter semantics.
> > > > * Drop new module debug parameter.
> > > > * Add documentation.
> > > > * Add a debug error in all places where control can fail.
> > > > * Reorder the vdev parameter, to make the patch less invasive.
> > > > ---
> > > >  Documentation/media/kapi/v4l2-dev.rst      |   1 +
> > > >  drivers/media/platform/omap3isp/ispvideo.c |   2 +-
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c       | 106 ++++++++++++++++-----
> > > >  drivers/media/v4l2-core/v4l2-ioctl.c       |  12 +--
> > > >  drivers/media/v4l2-core/v4l2-subdev.c      |   6 +-
> > > >  include/media/v4l2-ctrls.h                 |   9 +-
> > > >  include/media/v4l2-ioctl.h                 |   2 +
> > > >  7 files changed, 100 insertions(+), 38 deletions(-)
> > > > 
> > > > diff --git a/Documentation/media/kapi/v4l2-dev.rst b/Documentation/media/kapi/v4l2-dev.rst
> > > > index b359f1804bbe..4c5a15c53dbf 100644
> > > > --- a/Documentation/media/kapi/v4l2-dev.rst
> > > > +++ b/Documentation/media/kapi/v4l2-dev.rst
> > > > @@ -288,6 +288,7 @@ Mask  Description
> > > >  0x08  Log the read and write file operations and the VIDIOC_QBUF and
> > > >        VIDIOC_DQBUF ioctls.
> > > >  0x10  Log the poll file operation.
> > > > +0x20  Log error and messages in the control operations.
> > > >  ===== ================================================================
> > > >  
> > > >  Video device cleanup
> > > > diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
> > > > index 175bbed9a235..abc945cc05c9 100644
> > > > --- a/drivers/media/platform/omap3isp/ispvideo.c
> > > > +++ b/drivers/media/platform/omap3isp/ispvideo.c
> > > > @@ -1028,7 +1028,7 @@ static int isp_video_check_external_subdevs(struct isp_video *video,
> > > >  	ctrls.count = 1;
> > > >  	ctrls.controls = &ctrl;
> > > >  
> > > > -	ret = v4l2_g_ext_ctrls(pipe->external->ctrl_handler, NULL, &ctrls);
> > > > +	ret = v4l2_g_ext_ctrls(pipe->external->ctrl_handler, &video->video, NULL, &ctrls);
> > > >  	if (ret < 0) {
> > > >  		dev_warn(isp->dev, "no pixel rate control in subdev %s\n",
> > > >  			 pipe->external->name);
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > index 2d7525e2d9eb..1c8ae4501870 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > @@ -6,6 +6,8 @@
> > > >  
> > > >   */
> > > >  
> > > > +#define pr_fmt(fmt) "v4l2-ctrls: " fmt
> > > > +
> > > >  #include <linux/ctype.h>
> > > >  #include <linux/mm.h>
> > > >  #include <linux/slab.h>
> > > > @@ -16,6 +18,12 @@
> > > >  #include <media/v4l2-event.h>
> > > >  #include <media/v4l2-dev.h>
> > > >  
> > > > +#define dprintk(vdev, fmt, arg...) do {					\
> > > > +	if (!WARN_ON(!vdev) && ((vdev)->dev_debug & V4L2_DEV_DEBUG_CTRL)) \
> > > > +		printk(KERN_DEBUG pr_fmt("%s: %s: " fmt),		\
> > > > +		       __func__, video_device_node_name(vdev), ##arg);	\
> > > > +} while (0)
> > > > +
> > > >  #define has_op(master, op) \
> > > >  	(master->ops && master->ops->op)
> > > >  #define call_op(master, op) \
> > > > @@ -3211,6 +3219,7 @@ static int v4l2_ctrl_request_bind(struct media_request *req,
> > > >  static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > >  			     struct v4l2_ext_controls *cs,
> > > >  			     struct v4l2_ctrl_helper *helpers,
> > > > +			     struct video_device *vdev,
> > > >  			     bool get)
> > > >  {
> > > >  	struct v4l2_ctrl_helper *h;
> > > > @@ -3228,20 +3237,28 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > >  		if (cs->which &&
> > > >  		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
> > > >  		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
> > > > -		    V4L2_CTRL_ID2WHICH(id) != cs->which)
> > > > +		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
> > > > +			dprintk(vdev, "invalid which 0x%x or control id 0x%x\n", cs->which, id);
> > > >  			return -EINVAL;
> > > > +		}
> > > >  
> > > >  		/* Old-style private controls are not allowed for
> > > >  		   extended controls */
> > > > -		if (id >= V4L2_CID_PRIVATE_BASE)
> > > > +		if (id >= V4L2_CID_PRIVATE_BASE) {
> > > > +			dprintk(vdev, "old-style private controls not allowed for extended controls\n");
> > > >  			return -EINVAL;
> > > > +		}
> > > >  		ref = find_ref_lock(hdl, id);
> > > > -		if (ref == NULL)
> > > > +		if (ref == NULL) {
> > > > +			dprintk(vdev, "cannot find control id 0x%x\n", id);
> > > >  			return -EINVAL;
> > > > +		}
> > > >  		h->ref = ref;
> > > >  		ctrl = ref->ctrl;
> > > > -		if (ctrl->flags & V4L2_CTRL_FLAG_DISABLED)
> > > > +		if (ctrl->flags & V4L2_CTRL_FLAG_DISABLED) {
> > > > +			dprintk(vdev, "control id 0x%x is disabled\n", id);
> > > >  			return -EINVAL;
> > > > +		}
> > > >  
> > > >  		if (ctrl->cluster[0]->ncontrols > 1)
> > > >  			have_clusters = true;
> > > > @@ -3251,10 +3268,16 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > >  			unsigned tot_size = ctrl->elems * ctrl->elem_size;
> > > >  
> > > >  			if (c->size < tot_size) {
> > > > +				/*
> > > > +				 * In the get case the application first queries
> > > > +				 * to obtain the size of the control.
> > > > +				 */
> > > >  				if (get) {
> > > >  					c->size = tot_size;
> > > >  					return -ENOSPC;
> > > >  				}
> > > > +				dprintk(vdev, "pointer control id 0x%x size too small, %d bytes but %d bytes needed\n",
> > > > +					id, c->size, tot_size);
> > > >  				return -EFAULT;
> > > >  			}
> > > >  			c->size = tot_size;
> > > > @@ -3315,7 +3338,8 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
> > > >  
> > > >  /* Get extended controls. Allocates the helpers array if needed. */
> > > >  static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> > > > -				   struct v4l2_ext_controls *cs)
> > > > +				   struct v4l2_ext_controls *cs,
> > > > +				   struct video_device *vdev)
> > > >  {
> > > >  	struct v4l2_ctrl_helper helper[4];
> > > >  	struct v4l2_ctrl_helper *helpers = helper;
> > > > @@ -3341,7 +3365,7 @@ static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
> > > >  			return -ENOMEM;
> > > >  	}
> > > >  
> > > > -	ret = prepare_ext_ctrls(hdl, cs, helpers, true);
> > > > +	ret = prepare_ext_ctrls(hdl, cs, helpers, vdev, true);
> > > >  	cs->error_idx = cs->count;
> > > >  
> > > >  	for (i = 0; !ret && i < cs->count; i++)
> > > > @@ -3434,8 +3458,8 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler *hdl,
> > > >  	return obj;
> > > >  }
> > > >  
> > > > -int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
> > > > -		     struct v4l2_ext_controls *cs)
> > > > +int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
> > > > +		     struct media_device *mdev, struct v4l2_ext_controls *cs)
> > > >  {
> > > >  	struct media_request_object *obj = NULL;
> > > >  	struct media_request *req = NULL;
> > > > @@ -3471,7 +3495,7 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
> > > >  				   req_obj);
> > > >  	}
> > > >  
> > > > -	ret = v4l2_g_ext_ctrls_common(hdl, cs);
> > > > +	ret = v4l2_g_ext_ctrls_common(hdl, cs, vdev);
> > > >  
> > > >  	if (obj) {
> > > >  		media_request_unlock_for_access(req);
> > > > @@ -3614,7 +3638,9 @@ static int try_or_set_cluster(struct v4l2_fh *fh, struct v4l2_ctrl *master,
> > > >  
> > > >  /* Validate controls. */
> > > >  static int validate_ctrls(struct v4l2_ext_controls *cs,
> > > > -			  struct v4l2_ctrl_helper *helpers, bool set)
> > > > +			  struct v4l2_ctrl_helper *helpers,
> > > > +			  struct video_device *vdev,
> > > > +			  bool set)
> > > >  {
> > > >  	unsigned i;
> > > >  	int ret = 0;
> > > > @@ -3626,16 +3652,20 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
> > > >  
> > > >  		cs->error_idx = i;
> > > >  
> > > > -		if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> > > > +		if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY) {
> > > > +			dprintk(vdev, "control id 0x%x is read-only\n", ctrl->id);
> > > >  			return -EACCES;
> > > > +		}
> > > >  		/* This test is also done in try_set_control_cluster() which
> > > >  		   is called in atomic context, so that has the final say,
> > > >  		   but it makes sense to do an up-front check as well. Once
> > > >  		   an error occurs in try_set_control_cluster() some other
> > > >  		   controls may have been set already and we want to do a
> > > >  		   best-effort to avoid that. */
> > > > -		if (set && (ctrl->flags & V4L2_CTRL_FLAG_GRABBED))
> > > > +		if (set && (ctrl->flags & V4L2_CTRL_FLAG_GRABBED)) {
> > > > +			dprintk(vdev, "control id 0x%x is grabbed, cannot set\n", ctrl->id);
> > > >  			return -EBUSY;
> > > > +		}
> > > >  		/*
> > > >  		 * Skip validation for now if the payload needs to be copied
> > > >  		 * from userspace into kernelspace. We'll validate those later.
> > > > @@ -3670,7 +3700,8 @@ static void update_from_auto_cluster(struct v4l2_ctrl *master)
> > > >  /* Try or try-and-set controls */
> > > >  static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> > > >  				    struct v4l2_ctrl_handler *hdl,
> > > > -				    struct v4l2_ext_controls *cs, bool set)
> > > > +				    struct v4l2_ext_controls *cs,
> > > > +				    struct video_device *vdev, bool set)
> > > >  {
> > > >  	struct v4l2_ctrl_helper helper[4];
> > > >  	struct v4l2_ctrl_helper *helpers = helper;
> > > > @@ -3680,13 +3711,17 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> > > >  	cs->error_idx = cs->count;
> > > >  
> > > >  	/* Default value cannot be changed */
> > > > -	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL)
> > > > +	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
> > > > +		dprintk(vdev, "%s: cannot change default value\n", video_device_node_name(vdev));
> > > >  		return -EINVAL;
> > > > +	}
> > > >  
> > > >  	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> > > >  
> > > > -	if (hdl == NULL)
> > > > +	if (hdl == NULL) {
> > > > +		dprintk(vdev, "%s: invalid null control handler\n", video_device_node_name(vdev));
> > > >  		return -EINVAL;
> > > > +	}
> > > >  
> > > >  	if (cs->count == 0)
> > > >  		return class_check(hdl, cs->which);
> > > > @@ -3697,9 +3732,9 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> > > >  		if (!helpers)
> > > >  			return -ENOMEM;
> > > >  	}
> > > > -	ret = prepare_ext_ctrls(hdl, cs, helpers, false);
> > > > +	ret = prepare_ext_ctrls(hdl, cs, helpers, vdev, false);
> > > >  	if (!ret)
> > > > -		ret = validate_ctrls(cs, helpers, set);
> > > > +		ret = validate_ctrls(cs, helpers, vdev, set);
> > > >  	if (ret && set)
> > > >  		cs->error_idx = cs->count;
> > > >  	for (i = 0; !ret && i < cs->count; i++) {
> > > > @@ -3784,7 +3819,8 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
> > > >  }
> > > >  
> > > >  static int try_set_ext_ctrls(struct v4l2_fh *fh,
> > > > -			     struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
> > > > +			     struct v4l2_ctrl_handler *hdl,
> > > > +			     struct video_device *vdev, struct media_device *mdev,
> > > >  			     struct v4l2_ext_controls *cs, bool set)
> > > >  {
> > > >  	struct media_request_object *obj = NULL;
> > > > @@ -3792,21 +3828,32 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
> > > >  	int ret;
> > > >  
> > > >  	if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL) {
> > > > -		if (!mdev || cs->request_fd < 0)
> > > > +		if (!mdev) {
> > > > +			dprintk(vdev, "%s: missing media device\n", video_device_node_name(vdev));
> > > > +			return -EINVAL;
> > > > +		}
> > > > +
> > > > +		if (cs->request_fd < 0) {
> > > > +			dprintk(vdev, "%s: invalid request fd %d\n", video_device_node_name(vdev), cs->request_fd);
> > > >  			return -EINVAL;
> > > > +		}
> > > >  
> > > >  		req = media_request_get_by_fd(mdev, cs->request_fd);
> > > > -		if (IS_ERR(req))
> > > > +		if (IS_ERR(req)) {
> > > > +			dprintk(vdev, "%s: cannot find request fd %d\n", video_device_node_name(vdev), cs->request_fd);
> > > >  			return PTR_ERR(req);
> > > > +		}
> > > >  
> > > >  		ret = media_request_lock_for_update(req);
> > > >  		if (ret) {
> > > > +			dprintk(vdev, "%s: cannot lock request fd %d\n", video_device_node_name(vdev), cs->request_fd);
> > > >  			media_request_put(req);
> > > >  			return ret;
> > > >  		}
> > > >  
> > > >  		obj = v4l2_ctrls_find_req_obj(hdl, req, set);
> > > >  		if (IS_ERR(obj)) {
> > > > +			dprintk(vdev, "%s: cannot find request object for request fd %d\n", video_device_node_name(vdev), cs->request_fd);
> > > >  			media_request_unlock_for_update(req);
> > > >  			media_request_put(req);
> > > >  			return PTR_ERR(obj);
> > > > @@ -3815,7 +3862,9 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
> > > >  				   req_obj);
> > > >  	}
> > > >  
> > > > -	ret = try_set_ext_ctrls_common(fh, hdl, cs, set);
> > > > +	ret = try_set_ext_ctrls_common(fh, hdl, cs, vdev, set);
> > > > +	if (ret)
> > > > +		dprintk(vdev, "%s: try_set_ext_ctrls_common failed (%d)\n", video_device_node_name(vdev), ret);
> > > >  
> > > >  	if (obj) {
> > > >  		media_request_unlock_for_update(req);
> > > > @@ -3826,17 +3875,22 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
> > > >  	return ret;
> > > >  }
> > > >  
> > > > -int v4l2_try_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
> > > > +int v4l2_try_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > > +		       struct video_device *vdev,
> > > > +		       struct media_device *mdev,
> > > >  		       struct v4l2_ext_controls *cs)
> > > >  {
> > > > -	return try_set_ext_ctrls(NULL, hdl, mdev, cs, false);
> > > > +	return try_set_ext_ctrls(NULL, hdl, vdev, mdev, cs, false);
> > > >  }
> > > >  EXPORT_SYMBOL(v4l2_try_ext_ctrls);
> > > >  
> > > > -int v4l2_s_ext_ctrls(struct v4l2_fh *fh, struct v4l2_ctrl_handler *hdl,
> > > > -		     struct media_device *mdev, struct v4l2_ext_controls *cs)
> > > > +int v4l2_s_ext_ctrls(struct v4l2_fh *fh,
> > > > +		     struct v4l2_ctrl_handler *hdl,
> > > > +		     struct video_device *vdev,
> > > > +		     struct media_device *mdev,
> > > > +		     struct v4l2_ext_controls *cs)
> > > >  {
> > > > -	return try_set_ext_ctrls(fh, hdl, mdev, cs, true);
> > > > +	return try_set_ext_ctrls(fh, hdl, vdev, mdev, cs, true);
> > > >  }
> > > >  EXPORT_SYMBOL(v4l2_s_ext_ctrls);
> > > >  
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > index b1f4b991dba6..e95efea1a9ca 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > @@ -2165,9 +2165,9 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > > >  
> > > >  	p->error_idx = p->count;
> > > >  	if (vfh && vfh->ctrl_handler)
> > > > -		return v4l2_g_ext_ctrls(vfh->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_g_ext_ctrls(vfh->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (vfd->ctrl_handler)
> > > > -		return v4l2_g_ext_ctrls(vfd->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_g_ext_ctrls(vfd->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (ops->vidioc_g_ext_ctrls == NULL)
> > > >  		return -ENOTTY;
> > > >  	return check_ext_ctrls(p, 0) ? ops->vidioc_g_ext_ctrls(file, fh, p) :
> > > > @@ -2184,9 +2184,9 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > > >  
> > > >  	p->error_idx = p->count;
> > > >  	if (vfh && vfh->ctrl_handler)
> > > > -		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (vfd->ctrl_handler)
> > > > -		return v4l2_s_ext_ctrls(NULL, vfd->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_s_ext_ctrls(NULL, vfd->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (ops->vidioc_s_ext_ctrls == NULL)
> > > >  		return -ENOTTY;
> > > >  	return check_ext_ctrls(p, 0) ? ops->vidioc_s_ext_ctrls(file, fh, p) :
> > > > @@ -2203,9 +2203,9 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
> > > >  
> > > >  	p->error_idx = p->count;
> > > >  	if (vfh && vfh->ctrl_handler)
> > > > -		return v4l2_try_ext_ctrls(vfh->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_try_ext_ctrls(vfh->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (vfd->ctrl_handler)
> > > > -		return v4l2_try_ext_ctrls(vfd->ctrl_handler, vfd->v4l2_dev->mdev, p);
> > > > +		return v4l2_try_ext_ctrls(vfd->ctrl_handler, vfd, vfd->v4l2_dev->mdev, p);
> > > >  	if (ops->vidioc_try_ext_ctrls == NULL)
> > > >  		return -ENOTTY;
> > > >  	return check_ext_ctrls(p, 0) ? ops->vidioc_try_ext_ctrls(file, fh, p) :
> > > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > index f24978b80440..1b5edd3b1e6c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > > @@ -211,19 +211,19 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> > > >  		if (!vfh->ctrl_handler)
> > > >  			return -ENOTTY;
> > > >  		return v4l2_g_ext_ctrls(vfh->ctrl_handler,
> > > > -					sd->v4l2_dev->mdev, arg);
> > > > +					vdev, sd->v4l2_dev->mdev, arg);
> > > >  
> > > >  	case VIDIOC_S_EXT_CTRLS:
> > > >  		if (!vfh->ctrl_handler)
> > > >  			return -ENOTTY;
> > > >  		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler,
> > > > -					sd->v4l2_dev->mdev, arg);
> > > > +					vdev, sd->v4l2_dev->mdev, arg);
> > > >  
> > > >  	case VIDIOC_TRY_EXT_CTRLS:
> > > >  		if (!vfh->ctrl_handler)
> > > >  			return -ENOTTY;
> > > >  		return v4l2_try_ext_ctrls(vfh->ctrl_handler,
> > > > -					  sd->v4l2_dev->mdev, arg);
> > > > +					  vdev, sd->v4l2_dev->mdev, arg);
> > > >  
> > > >  	case VIDIOC_DQEVENT:
> > > >  		if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
> > > > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > > > index b4433483af23..c08d6cc56743 100644
> > > > --- a/include/media/v4l2-ctrls.h
> > > > +++ b/include/media/v4l2-ctrls.h
> > > > @@ -1265,25 +1265,28 @@ int v4l2_s_ctrl(struct v4l2_fh *fh, struct v4l2_ctrl_handler *hdl,
> > > >   *	:ref:`VIDIOC_G_EXT_CTRLS <vidioc_g_ext_ctrls>` ioctl
> > > >   *
> > > >   * @hdl: pointer to &struct v4l2_ctrl_handler
> > > > + * @vdev: pointer to &struct video_device
> > > >   * @mdev: pointer to &struct media_device
> > > >   * @c: pointer to &struct v4l2_ext_controls
> > > >   *
> > > >   * If hdl == NULL then they will all return -EINVAL.
> > > >   */
> > > > -int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
> > > > -		     struct v4l2_ext_controls *c);
> > > > +int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
> > > > +		     struct media_device *mdev, struct v4l2_ext_controls *c);
> > > >  
> > > >  /**
> > > >   * v4l2_try_ext_ctrls - Helper function to implement
> > > >   *	:ref:`VIDIOC_TRY_EXT_CTRLS <vidioc_g_ext_ctrls>` ioctl
> > > >   *
> > > >   * @hdl: pointer to &struct v4l2_ctrl_handler
> > > > + * @vdev: pointer to &struct video_device
> > > >   * @mdev: pointer to &struct media_device
> > > >   * @c: pointer to &struct v4l2_ext_controls
> > > >   *
> > > >   * If hdl == NULL then they will all return -EINVAL.
> > > >   */
> > > >  int v4l2_try_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > > +		       struct video_device *vdev,
> > > >  		       struct media_device *mdev,
> > > >  		       struct v4l2_ext_controls *c);
> > > >  
> > > > @@ -1293,12 +1296,14 @@ int v4l2_try_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> > > >   *
> > > >   * @fh: pointer to &struct v4l2_fh
> > > >   * @hdl: pointer to &struct v4l2_ctrl_handler
> > > > + * @vdev: pointer to &struct video_device
> > > >   * @mdev: pointer to &struct media_device
> > > >   * @c: pointer to &struct v4l2_ext_controls
> > > >   *
> > > >   * If hdl == NULL then they will all return -EINVAL.
> > > >   */
> > > >  int v4l2_s_ext_ctrls(struct v4l2_fh *fh, struct v4l2_ctrl_handler *hdl,
> > > > +		     struct video_device *vdev,
> > > >  		     struct media_device *mdev,
> > > >  		     struct v4l2_ext_controls *c);
> > > >  
> > > > diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> > > > index 400f2e46c108..4bba65a59d46 100644
> > > > --- a/include/media/v4l2-ioctl.h
> > > > +++ b/include/media/v4l2-ioctl.h
> > > > @@ -602,6 +602,8 @@ struct v4l2_ioctl_ops {
> > > >  #define V4L2_DEV_DEBUG_STREAMING	0x08
> > > >  /* Log poll() */
> > > >  #define V4L2_DEV_DEBUG_POLL		0x10
> > > > +/* Log controls */
> > > > +#define V4L2_DEV_DEBUG_CTRL		0x20
> > > >  
> > > >  /*  Video standard functions  */
> > > >  
> > > > 


