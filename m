Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4F203292F
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 09:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbfFCHQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 03:16:08 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:37237 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726960AbfFCHQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 03:16:08 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XhCLhJITfsDWyXhCOhrdcj; Mon, 03 Jun 2019 09:16:05 +0200
Subject: Re: [PATCH v2 4/4] media: v4l: ctrls: Add debug messages
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>, kernel@collabora.com
References: <20190227170706.6258-1-ezequiel@collabora.com>
 <20190227170706.6258-5-ezequiel@collabora.com>
 <20b23d4d-1a8f-d957-73cd-1d8e7a3308a5@xs4all.nl>
 <1283d56201cb56110b247025939242c81f705024.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1f6d25ba-09dc-a5dc-ce30-8f81f76967aa@xs4all.nl>
Date:   Mon, 3 Jun 2019 09:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1283d56201cb56110b247025939242c81f705024.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI7kxSEZHGg+NBHyn9/+yCWJdivE0WC9rmWqtSLAtaWEior4eLPT9LM7/C/e1LRb3EOSIsQQS+N1OSY2ej+PSE0U6Ele4XeO6XfmP+ae4C7rxw69pHoC
 yQGpzD5U0boZzf3Xdga3kZQhIUfO30bpcyBQCiFwsx7i1ieKsd5zOEZ9hwQVsto53jSxmbSTZ9dgJ/ubFZrchXJylHJIiax6GJlPQaQ+TiJCpF3Bvu+bJCua
 McMmDC4DDUfP75PcemWlLd2lz1Otkf86osjgg3xYimk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/1/19 7:57 PM, Ezequiel Garcia wrote:
> On Mon, 2019-03-11 at 12:36 +0100, Hans Verkuil wrote:
>> On 2/27/19 6:07 PM, Ezequiel Garcia wrote:
>>> Currently, the v4l2 control code is a bit silent on errors.
>>> Now that we have a debug parameter, it's possible to enable
>>> debugging messages here.
>>>
>>> Add debug messages on (hopefully) most of the error paths.
>>> Since it's really hard to associate all these errors
>>> to video device instance, we are forced to use the global
>>> debug parameter only.
>>>
>>> Add a warning in case the user enables control debugging
>>> at the per-device dev_debug level.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ctrls.c  | 93 +++++++++++++++++++++------
>>>  drivers/media/v4l2-core/v4l2-dev.c    |  2 +
>>>  drivers/media/v4l2-core/v4l2-ioctl.c  |  8 +--
>>>  drivers/media/v4l2-core/v4l2-subdev.c |  4 +-
>>>  include/media/v4l2-ctrls.h            |  9 ++-
>>>  include/media/v4l2-ioctl.h            |  2 +
>>>  6 files changed, 91 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> index b79d3bbd8350..af8ad83d1e08 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
>>> @@ -18,6 +18,8 @@
>>>      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>>>   */
>>>  
>>> +#define pr_fmt(fmt) "v4l2-ctrls: " fmt
>>> +
>>>  #include <linux/ctype.h>
>>>  #include <linux/mm.h>
>>>  #include <linux/slab.h>
>>> @@ -28,6 +30,14 @@
>>>  #include <media/v4l2-event.h>
>>>  #include <media/v4l2-dev.h>
>>>  
>>> +extern unsigned int videodev_debug;
>>> +
>>> +#define dprintk(fmt, arg...) do {					\
>>> +	if (videodev_debug & V4L2_DEV_DEBUG_CTRL)			\
>>> +		printk(KERN_DEBUG pr_fmt("%s: " fmt),			\
>>> +		       __func__, ##arg);				\
>>> +} while (0)
>>> +
>>>  #define has_op(master, op) \
>>>  	(master->ops && master->ops->op)
>>>  #define call_op(master, op) \
>>> @@ -1952,8 +1962,11 @@ static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
>>>  	unsigned idx;
>>>  	int err = 0;
>>>  
>>> -	for (idx = 0; !err && idx < ctrl->elems; idx++)
>>> +	for (idx = 0; !err && idx < ctrl->elems; idx++) {
>>>  		err = ctrl->type_ops->validate(ctrl, idx, p_new);
>>> +		if (err)
>>> +			dprintk("failed to validate control id 0x%x (%d)\n", ctrl->id, err);
>>> +	}
>>>  	return err;
>>>  }
>>>  
>>> @@ -3136,20 +3149,28 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>>>  		if (cs->which &&
>>>  		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
>>>  		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
>>> -		    V4L2_CTRL_ID2WHICH(id) != cs->which)
>>> +		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
>>> +			dprintk("invalid which 0x%x or control id 0x%x\n", cs->which, id);
>>>  			return -EINVAL;
>>> +		}
>>>  
>>>  		/* Old-style private controls are not allowed for
>>>  		   extended controls */
>>> -		if (id >= V4L2_CID_PRIVATE_BASE)
>>> +		if (id >= V4L2_CID_PRIVATE_BASE) {
>>> +			dprintk("old-style private controls not allowed for extended controls\n");
>>>  			return -EINVAL;
>>> +		}
>>>  		ref = find_ref_lock(hdl, id);
>>> -		if (ref == NULL)
>>> +		if (ref == NULL) {
>>> +			dprintk("cannot find control id 0x%x\n", id);
>>>  			return -EINVAL;
>>> +		}
>>>  		h->ref = ref;
>>>  		ctrl = ref->ctrl;
>>> -		if (ctrl->flags & V4L2_CTRL_FLAG_DISABLED)
>>> +		if (ctrl->flags & V4L2_CTRL_FLAG_DISABLED) {
>>> +			dprintk("control id 0x%x is disabled\n", id);
>>>  			return -EINVAL;
>>> +		}
>>>  
>>>  		if (ctrl->cluster[0]->ncontrols > 1)
>>>  			have_clusters = true;
>>> @@ -3159,10 +3180,16 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
>>>  			unsigned tot_size = ctrl->elems * ctrl->elem_size;
>>>  
>>>  			if (c->size < tot_size) {
>>> +				/*
>>> +				 * In the get case the application first queries
>>> +				 * to obtain the size of the control.
>>> +				 */
>>>  				if (get) {
>>>  					c->size = tot_size;
>>>  					return -ENOSPC;
>>>  				}
>>> +				dprintk("pointer control id 0x%x size too small, %d bytes but %d bytes needed\n",
>>> +					id, c->size, tot_size);
>>>  				return -EFAULT;
>>>  			}
>>>  			c->size = tot_size;
>>> @@ -3534,16 +3561,20 @@ static int validate_ctrls(struct v4l2_ext_controls *cs,
>>>  
>>>  		cs->error_idx = i;
>>>  
>>> -		if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
>>> +		if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY) {
>>> +			dprintk("control id 0x%x is read-only\n", ctrl->id);
>>>  			return -EACCES;
>>> +		}
>>>  		/* This test is also done in try_set_control_cluster() which
>>>  		   is called in atomic context, so that has the final say,
>>>  		   but it makes sense to do an up-front check as well. Once
>>>  		   an error occurs in try_set_control_cluster() some other
>>>  		   controls may have been set already and we want to do a
>>>  		   best-effort to avoid that. */
>>> -		if (set && (ctrl->flags & V4L2_CTRL_FLAG_GRABBED))
>>> +		if (set && (ctrl->flags & V4L2_CTRL_FLAG_GRABBED)) {
>>> +			dprintk("control id 0x%x is grabbed, cannot set\n", ctrl->id);
>>>  			return -EBUSY;
>>> +		}
>>>  		/*
>>>  		 * Skip validation for now if the payload needs to be copied
>>>  		 * from userspace into kernelspace. We'll validate those later.
>>> @@ -3576,7 +3607,8 @@ static void update_from_auto_cluster(struct v4l2_ctrl *master)
>>>  }
>>>  
>>>  /* Try or try-and-set controls */
>>> -static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
>>> +static int try_set_ext_ctrls_common(struct video_device *vdev,
>>> +				    struct v4l2_fh *fh,
>>>  				    struct v4l2_ctrl_handler *hdl,
>>>  				    struct v4l2_ext_controls *cs, bool set)
>>>  {
>>> @@ -3588,13 +3620,17 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
>>>  	cs->error_idx = cs->count;
>>>  
>>>  	/* Default value cannot be changed */
>>> -	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL)
>>> +	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
>>> +		dprintk("%s: cannot change default value\n", video_device_node_name(vdev));
>>>  		return -EINVAL;
>>> +	}
>>>  
>>>  	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
>>>  
>>> -	if (hdl == NULL)
>>> +	if (hdl == NULL) {
>>> +		dprintk("%s: invalid null control handler\n", video_device_node_name(vdev));
>>>  		return -EINVAL;
>>> +	}
>>>  
>>>  	if (cs->count == 0)
>>>  		return class_check(hdl, cs->which);
>>> @@ -3691,7 +3727,8 @@ static int try_set_ext_ctrls_common(struct v4l2_fh *fh,
>>>  	return ret;
>>>  }
>>>  
>>> -static int try_set_ext_ctrls(struct v4l2_fh *fh,
>>> +static int try_set_ext_ctrls(struct video_device *vdev,
>>> +			     struct v4l2_fh *fh,
>>>  			     struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
>>>  			     struct v4l2_ext_controls *cs, bool set)
>>>  {
>>> @@ -3700,21 +3737,32 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
>>>  	int ret;
>>>  
>>>  	if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL) {
>>> -		if (!mdev || cs->request_fd < 0)
>>> +		if (!mdev) {
>>> +			dprintk("%s: missing media device\n", video_device_node_name(vdev));
>>> +			return -EINVAL;
>>> +		}
>>> +
>>> +		if (cs->request_fd < 0) {
>>> +			dprintk("%s: invalid request fd %d\n", video_device_node_name(vdev), cs->request_fd);
>>>  			return -EINVAL;
>>> +		}
>>>  
>>>  		req = media_request_get_by_fd(mdev, cs->request_fd);
>>> -		if (IS_ERR(req))
>>> +		if (IS_ERR(req)) {
>>> +			dprintk("%s: cannot find request fd %d\n", video_device_node_name(vdev), cs->request_fd);
>>>  			return PTR_ERR(req);
>>> +		}
>>>  
>>>  		ret = media_request_lock_for_update(req);
>>>  		if (ret) {
>>> +			dprintk("%s: cannot lock request fd %d\n", video_device_node_name(vdev), cs->request_fd);
>>>  			media_request_put(req);
>>>  			return ret;
>>>  		}
>>>  
>>>  		obj = v4l2_ctrls_find_req_obj(hdl, req, set);
>>>  		if (IS_ERR(obj)) {
>>> +			dprintk("%s: cannot find request object for request fd %d\n", video_device_node_name(vdev), cs->request_fd);
>>
>> These lines are way too long. Just add a newline after the first comma.
>>
>> Same elsewhere.
>>
>>>  			media_request_unlock_for_update(req);
>>>  			media_request_put(req);
>>>  			return PTR_ERR(obj);
>>> @@ -3723,7 +3771,9 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
>>>  				   req_obj);
>>>  	}
>>>  
>>> -	ret = try_set_ext_ctrls_common(fh, hdl, cs, set);
>>> +	ret = try_set_ext_ctrls_common(vdev, fh, hdl, cs, set);
>>> +	if (ret)
>>> +		dprintk("%s: try_set_ext_ctrls_common failed (%d)\n", video_device_node_name(vdev), ret);
>>>  
>>>  	if (obj) {
>>>  		media_request_unlock_for_update(req);
>>> @@ -3734,17 +3784,22 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
>>>  	return ret;
>>>  }
>>>  
>>> -int v4l2_try_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct media_device *mdev,
>>> +int v4l2_try_ext_ctrls(struct video_device *vdev,
>>> +		       struct v4l2_ctrl_handler *hdl,
>>> +		       struct media_device *mdev,
>>>  		       struct v4l2_ext_controls *cs)
>>>  {
>>> -	return try_set_ext_ctrls(NULL, hdl, mdev, cs, false);
>>> +	return try_set_ext_ctrls(vdev, NULL, hdl, mdev, cs, false);
>>>  }
>>>  EXPORT_SYMBOL(v4l2_try_ext_ctrls);
>>>  
>>> -int v4l2_s_ext_ctrls(struct v4l2_fh *fh, struct v4l2_ctrl_handler *hdl,
>>> -		     struct media_device *mdev, struct v4l2_ext_controls *cs)
>>> +int v4l2_s_ext_ctrls(struct video_device *vdev,
>>> +		     struct v4l2_fh *fh,
>>> +		     struct v4l2_ctrl_handler *hdl,
>>> +		     struct media_device *mdev,
>>> +		     struct v4l2_ext_controls *cs)
>>>  {
>>> -	return try_set_ext_ctrls(fh, hdl, mdev, cs, true);
>>> +	return try_set_ext_ctrls(vdev, fh, hdl, mdev, cs, true);
>>>  }
>>>  EXPORT_SYMBOL(v4l2_s_ext_ctrls);
>>>  
>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>> index 39d22bfbe420..c6bcc9ea1122 100644
>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>> @@ -83,6 +83,8 @@ static ssize_t dev_debug_store(struct device *cd, struct device_attribute *attr,
>>>  	if (res)
>>>  		return res;
>>>  
>>> +	if (value & V4L2_DEV_DEBUG_CTRL)
>>> +		pr_warn_once("Warning: V4L2_DEV_DEBUG_CTRL cannot be enabled via the dev_debug attribute.\n");

BTW, you should clear the V4L2_DEV_DEBUG_CTRL bit before setting vdev->dev_debug.

>>
>> Actually, you can for those functions that have the vdev pointer.
>> And I think you can pass vdev on to more functions. Certainly validate_ctrls()
>> and possibly all of them.
>>
> 
> Before sending this patch, I tried different options,
> but failed to find a proper way of associating all error paths
> with a struct video_device.
> 
> For instance, __v4l2_ctrl_s_ctrl eventually calls validate_new,
> and it seems really nasty to change its prototype, as it's called
> by so many drivers.
> 
> I think it's a too invasive change, and not worth it just to
> add one debug print.
> 
> So one option would be to drop the validate_new print.

Yeah, that's probably best.

> 
> Another option would be have a slightly inconsistent behavior between
> setting the module debug parameter and the per-device debug attribute.
> 
> I think for debugging, consistency is very important, and that's
> why I prefered keeping the debug parameter and produce this warning.

OK, post a v3 and I'll take it.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 

