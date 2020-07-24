Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C449622C3FB
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 13:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgGXLCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 07:02:45 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:45221 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726114AbgGXLCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 07:02:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id yvTIj7VTsuuXOyvTJjBXv9; Fri, 24 Jul 2020 13:02:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595588561; bh=ki5v7+I+6jloqXfI5Thk81/U4TMduoZfISqT0v1jPmk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Dmz68TnKpksXmFALj2ErMeQBoiXZtjxUjyObHL0BdRNlpgD1dAEfXyoikeyBCnd9S
         T0EyOKH9HvPq3G/eBFk9KfFNMDzCCAaDLBBEuxNmARpQ7cSBC+Ww2jv7+MjeDrGfjf
         ouEggb7UQyMQuxhER/CkG3xIFDWS9MOnMS5V9285rAygA7w8x5R9UadqguJxY6zCwm
         w4YUc3knVnXQEpiES2wcYmKGBvY+njypVf/tZ7Hv2sU2qgrkGUd06VHKf/F3nDQGr1
         gLrlBYHtJvanYKpVpVeQudOyijoppAnZmvI2zQeLGAFQ5L/6ENAK7y9wa/PfK5xh/J
         KNHoUCHDkw6Hw==
Subject: Re: [PATCH v3,2/2] media: v4l: Add Ro request api for capture queue
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20200701093522.8521-1-yunfei.dong@mediatek.com>
 <20200701093522.8521-3-yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <862efe26-5f39-fde9-c2b4-ea36bab25b75@xs4all.nl>
Date:   Fri, 24 Jul 2020 13:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200701093522.8521-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHVZ9j26uLDLtCG1T9Y843H64hrSQ7lVMrQSNpEJ2tiLBuV370VwDGDFrpJ8KiXShV03QMC1/z6YFgfXp3wPui91gnHggtTUIVi6ESngNcQchNUpqyXb
 CwsQ0pxS6wEbcDFXFD759AEzDeR0uBdxZgChV2OdNgsdgu11WfoyjGmnOlMzOPY++uJ8m4gGRPaPNvcS5BBPo8MwTL9NFvJJrtMKQqZUcMNRnniAVtkSyLzi
 MRLfyQWRR97jE9831BgptfMBIxoToVOAQ+d7l7KmhlL5v1Gq9C2TI9vEOUEDuNlUSCl30/QeQ6wXdRchB5OplsKDzh/2YxYa8WP3qFRC0G6MWbPBEU3D5fOK
 DPOMobD0bAw1EPHvqI7sF3oQLb51iBoF05vAxTW2M3FqQhAorRC2U+lRp19QaeFrmsWbulxdT7AX3qcMJZyVYIcy6Q7qM1BFnC3Zc/e5CDxeaIYgXJ+sBcIl
 MEIUipLjbrDR5Nvj0X9aDcQxax77cHu0zNO8JBpa3Mq4TlklGDlnC0o+kgaEvz2NR/TpkdjNXNLBk0iVlLQspSFZGGtJHku9PIIVCLslW+1XzC/WogXe6moh
 PphwYcO+x49AhnM5JnfyX/KO/0vOaxcc4+aTQ34lbRUbE7uk57+PHS12FFUbznJYaRpze1+cBTOEl8mKN0fWqE9+oXKjUUrPqW4UnM8/+J5MHseiNMUinmjj
 nhHwW/apsBc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei,

On 01/07/2020 11:35, Yunfei Dong wrote:
> Add Read-only(Ro) request for capture queue. Ro request mean that
> user driver can get ext ctrls, buf set ext ctrls is not allowed.
> 
> Add param ro_requests in struct v4l2_ctrl_handler mean that all CID ctrls
> belong to this ctrl handler is read only. Add param ro_ctrl_handler in
> struct v4l2_fh used for ro request.
> 
> Add param supports_ro_requests in struct vb2_queue present that capture or
> output queue use ro request.
> 
> When set/get ext ctrls, will check whether current CID ctrls is ro ctrls
> or not using function v4l2_check_ro_ext_ctrls().

I've been looking at this patch, but I don't like it, esp. the v4l2-ctls changes.

I plan to look into this in more detail next week and see if I can come up
with a better way of doing this.

The core problem from what I can see is not actually RO requests (that's just
a regular request, except userspace can't set controls in the request), but
instead it is that there is some code missing to have a driver add a new control
to an existing request. That's a problem even with 'regular' requests, and this
requires some work.

Hopefully I will have something by the end of next week.

Regards,

	Hans

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   |   3 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
>  drivers/media/mc/mc-request.c                 |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
>  include/media/v4l2-ctrls.h                    |  22 +++-
>  include/media/v4l2-fh.h                       |   2 +
>  include/media/videobuf2-core.h                |   2 +
>  include/uapi/linux/videodev2.h                |   1 +
>  10 files changed, 157 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 44d65f5be845..230b4909fe35 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -2275,6 +2275,9 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	if (WARN_ON(q->requires_requests && !q->supports_requests))
>  		return -EINVAL;
>  
> +	if (WARN_ON(q->supports_ro_requests && !q->supports_requests))
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&q->queued_list);
>  	INIT_LIST_HEAD(&q->done_list);
>  	spin_lock_init(&q->done_lock);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..91a6f3a0c208 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -402,6 +402,11 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  			return -EBUSY;
>  		}
>  		return 0;
> +	} else if (!V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		if (!q->supports_ro_requests || q->supports_requests) {
> +			dprintk(1, "%s: cap queue use ro requests\n", opname);
> +			return -EBADR;
> +		}
>  	} else if (!q->supports_requests) {
>  		dprintk(1, "%s: queue does not support requests\n", opname);
>  		return -EBADR;
> @@ -665,6 +670,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->supports_ro_requests)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
>  #endif
>  }
>  
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index e3fca436c75b..e50ae259c1ff 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -404,16 +404,12 @@ int media_request_object_bind(struct media_request *req,
>  			      struct media_request_object *obj)
>  {
>  	unsigned long flags;
> -	int ret = -EBUSY;
>  
>  	if (WARN_ON(!ops->release))
>  		return -EBADR;
>  
>  	spin_lock_irqsave(&req->lock, flags);
>  
> -	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
> -		goto unlock;
> -
>  	obj->req = req;
>  	obj->ops = ops;
>  	obj->priv = priv;
> @@ -423,11 +419,9 @@ int media_request_object_bind(struct media_request *req,
>  	else
>  		list_add(&obj->list, &req->objects);
>  	req->num_incomplete_objects++;
> -	ret = 0;
> -
> -unlock:
>  	spin_unlock_irqrestore(&req->lock, flags);
> -	return ret;
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(media_request_object_bind);
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..effc26f733de 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -3386,22 +3386,6 @@ static const struct media_request_object_ops req_ops = {
>  	.release = v4l2_ctrl_request_release,
>  };
>  
> -struct v4l2_ctrl_handler *v4l2_ctrl_request_hdl_find(struct media_request *req,
> -					struct v4l2_ctrl_handler *parent)
> -{
> -	struct media_request_object *obj;
> -
> -	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_VALIDATING &&
> -		    req->state != MEDIA_REQUEST_STATE_QUEUED))
> -		return NULL;
> -
> -	obj = media_request_object_find(req, &req_ops, parent);
> -	if (obj)
> -		return container_of(obj, struct v4l2_ctrl_handler, req_obj);
> -	return NULL;
> -}
> -EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_find);
> -
>  struct v4l2_ctrl *
>  v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
>  {
> @@ -3420,6 +3404,10 @@ static int v4l2_ctrl_request_bind(struct media_request *req,
>  	ret = v4l2_ctrl_request_clone(hdl, from);
>  
>  	if (!ret) {
> +		if (!hdl->ro_requests &&
> +			WARN_ON(req->state != MEDIA_REQUEST_STATE_UPDATING))
> +			return -EBUSY;
> +
>  		ret = media_request_object_bind(req, &req_ops,
>  						from, false, &hdl->req_obj);
>  		if (!ret)
> @@ -3593,6 +3581,62 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
>  	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
>  }
>  
> +int v4l2_check_ro_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> +		   struct video_device *vdev, struct media_device *mdev,
> +		   struct v4l2_ext_controls *cs)
> +{
> +	struct v4l2_ctrl_ref *ref;
> +	u32 i;
> +
> +	if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL) {
> +		if (!mdev || cs->request_fd < 0)
> +			return -EINVAL;
> +	}
> +
> +	cs->error_idx = cs->count;
> +	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
> +
> +	if (hdl == NULL)
> +		return -EINVAL;
> +
> +	if (cs->count == 0)
> +		return class_check(hdl, cs->which);
> +
> +	for (i = 0; i < cs->count; i++) {
> +		struct v4l2_ext_control *c = &cs->controls[i];
> +		u32 id = c->id & V4L2_CTRL_ID_MASK;
> +
> +		cs->error_idx = i;
> +
> +		if (cs->which &&
> +			cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
> +			cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
> +			V4L2_CTRL_ID2WHICH(id) != cs->which) {
> +			dprintk(vdev,
> +					"invalid which 0x%x or control id 0x%x\n",
> +					cs->which, id);
> +			return -EINVAL;
> +		}
> +
> +		/* Old-style private controls are not allowed for
> +		 *extended controls
> +		 */
> +		if (id >= V4L2_CID_PRIVATE_BASE) {
> +			dprintk(vdev,
> +					"old-style private controls not allowed\n");
> +			return -EINVAL;
> +		}
> +
> +		ref = find_ref_lock(hdl, id);
> +		if (ref == NULL) {
> +			dprintk(vdev, "cannot find control id 0x%x\n", id);
> +			return -EINVAL;
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(v4l2_check_ro_ext_ctrls);
> +
>  /* Get extended controls. Allocates the helpers array if needed. */
>  static int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
>  				   struct v4l2_ext_controls *cs,
> @@ -3694,7 +3738,7 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler *hdl,
>  	obj = media_request_object_find(req, &req_ops, hdl);
>  	if (obj)
>  		return obj;
> -	if (!set)
> +	if (!set && !hdl->ro_requests)
>  		return ERR_PTR(-ENOENT);
>  
>  	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
> @@ -3702,6 +3746,7 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler *hdl,
>  		return ERR_PTR(-ENOMEM);
>  
>  	obj = &new_hdl->req_obj;
> +	new_hdl->ro_requests = hdl->ro_requests;
>  	ret = v4l2_ctrl_handler_init(new_hdl, (hdl->nr_of_buckets - 1) * 8);
>  	if (!ret)
>  		ret = v4l2_ctrl_request_bind(req, new_hdl, hdl);
> @@ -3763,6 +3808,28 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
>  }
>  EXPORT_SYMBOL(v4l2_g_ext_ctrls);
>  
> +struct v4l2_ctrl_handler *v4l2_ctrl_request_hdl_find(struct media_request *req,
> +					struct v4l2_ctrl_handler *parent)
> +{
> +	struct media_request_object *obj;
> +
> +	if (WARN_ON(req->state != MEDIA_REQUEST_STATE_VALIDATING &&
> +		    req->state != MEDIA_REQUEST_STATE_QUEUED))
> +		return NULL;
> +
> +	obj = media_request_object_find(req, &req_ops, parent);
> +	if (!obj) {
> +		if (parent->ro_requests) {
> +			obj = v4l2_ctrls_find_req_obj(parent, req, false);
> +			if (IS_ERR(obj))
> +				return NULL;
> +		} else
> +			return NULL;
> +	}
> +	return container_of(obj, struct v4l2_ctrl_handler, req_obj);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_find);
> +
>  /* Helper function to get a single control */
>  static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control *c)
>  {
> @@ -4094,6 +4161,12 @@ static int try_set_ext_ctrls(struct v4l2_fh *fh,
>  	int ret;
>  
>  	if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL) {
> +		if (hdl->ro_requests) {
> +			dprintk(vdev, "%s: ro requests can`t set ext ctrls\n",
> +				video_device_node_name(vdev));
> +			return -EINVAL;
> +		}
> +
>  		if (!mdev) {
>  			dprintk(vdev, "%s: missing media device\n",
>  				video_device_node_name(vdev));
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2322f08a98be..b9e1058a5067 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2270,6 +2270,13 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
>  
>  	p->error_idx = p->count;
> +	if (vfh && vfh->ro_ctrl_handler) {
> +		if (!v4l2_check_ro_ext_ctrls(vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p)) {
> +			return v4l2_g_ext_ctrls(vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p);
> +		}
> +	}
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_g_ext_ctrls(vfh->ctrl_handler,
>  					vfd, vfd->v4l2_dev->mdev, p);
> @@ -2291,6 +2298,14 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
>  
>  	p->error_idx = p->count;
> +	if (vfh && vfh->ro_ctrl_handler) {
> +		if (!v4l2_check_ro_ext_ctrls(vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p)) {
> +			return v4l2_s_ext_ctrls(vfh, vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p);
> +		}
> +	}
> +
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_s_ext_ctrls(vfh, vfh->ctrl_handler,
>  					vfd, vfd->v4l2_dev->mdev, p);
> @@ -2312,6 +2327,13 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
>  		test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags) ? fh : NULL;
>  
>  	p->error_idx = p->count;
> +	if (vfh && vfh->ro_ctrl_handler) {
> +		if (!v4l2_check_ro_ext_ctrls(vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p)) {
> +			return v4l2_try_ext_ctrls(vfh->ro_ctrl_handler, vfd,
> +						vfd->v4l2_dev->mdev, p);
> +		}
> +	}
>  	if (vfh && vfh->ctrl_handler)
>  		return v4l2_try_ext_ctrls(vfh->ctrl_handler,
>  					  vfd, vfd->v4l2_dev->mdev, p);
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 62ac9424c92a..166e94ee18a7 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -712,13 +712,6 @@ int v4l2_m2m_qbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  	int ret;
>  
>  	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
> -	if (!V4L2_TYPE_IS_OUTPUT(vq->type) &&
> -	    (buf->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
> -		dprintk("%s: requests cannot be used with capture buffers\n",
> -			__func__);
> -		return -EPERM;
> -	}
> -
>  	ret = vb2_qbuf(vq, vdev->v4l2_dev->mdev, buf);
>  	if (ret)
>  		return ret;
> @@ -1252,10 +1245,14 @@ void v4l2_m2m_request_queue(struct media_request *req)
>  		if (vb2_request_object_is_buffer(obj)) {
>  			/* Sanity checks */
>  			vb = container_of(obj, struct vb2_buffer, req_obj);
> -			WARN_ON(!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type));
> -			m2m_ctx_obj = container_of(vb->vb2_queue,
> -						   struct v4l2_m2m_ctx,
> -						   out_q_ctx.q);
> +			if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +				m2m_ctx_obj = container_of(vb->vb2_queue,
> +							struct v4l2_m2m_ctx,
> +							out_q_ctx.q);
> +			else
> +				m2m_ctx_obj = container_of(vb->vb2_queue,
> +							struct v4l2_m2m_ctx,
> +							cap_q_ctx.q);
>  			WARN_ON(m2m_ctx && m2m_ctx_obj != m2m_ctx);
>  			m2m_ctx = m2m_ctx_obj;
>  		}
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index f40e2cbb21d3..5b10c2e8a402 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -345,6 +345,7 @@ struct v4l2_ctrl_ref {
>   * @nr_of_buckets: Total number of buckets in the array.
>   * @error:	The error code of the first failed control addition.
>   * @request_is_queued: True if the request was queued.
> + * @ro_requests: True if the queue support ro request.
>   * @requests:	List to keep track of open control handler request objects.
>   *		For the parent control handler (@req_obj.req == NULL) this
>   *		is the list header. When the parent control handler is
> @@ -368,6 +369,7 @@ struct v4l2_ctrl_handler {
>  	u16 nr_of_buckets;
>  	int error;
>  	bool request_is_queued;
> +	bool ro_requests;
>  	struct list_head requests;
>  	struct list_head requests_queued;
>  	struct media_request_object req_obj;
> @@ -1261,8 +1263,10 @@ void v4l2_ctrl_request_complete(struct media_request *req,
>   * @parent: The parent control handler ('priv' in media_request_object_find())
>   *
>   * This function finds the control handler in the request. It may return
> - * NULL if not found. When done, you must call v4l2_ctrl_request_put_hdl()
> - * with the returned handler pointer.
> + * NULL if not found. But for Ro Request, the request object maybe
> + * NULL, need to call v4l2_ctrls_find_req_obj() to check whether the
> + * request has request object. When done, you must call
> + * v4l2_ctrl_request_put_hdl() with the returned handler pointer.
>   *
>   * If the request is not in state VALIDATING or QUEUED, then this function
>   * will always return NULL.
> @@ -1454,4 +1458,18 @@ int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
>  int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
>  				    const struct v4l2_ctrl_ops *ctrl_ops,
>  				    const struct v4l2_fwnode_device_properties *p);
> +/**
> + * v4l2_check_ro_ext_ctrls - Check whether the ext controls are ro request
> + *
> + * @hdl: pointer to &struct v4l2_ctrl_handler
> + * @vdev: pointer to &struct video_device
> + * @mdev: pointer to &struct media_device
> + * @cs: pointer to &struct v4l2_ext_controls
> + *
> + * If hdl == NULL then they will all return -EINVAL.
> + */
> +int v4l2_check_ro_ext_ctrls(struct v4l2_ctrl_handler *hdl,
> +			    struct video_device *vdev,
> +			    struct media_device *mdev,
> +			    struct v4l2_ext_controls *cs);
>  #endif
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index b5b3e00c8e6a..479abef6c910 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -27,6 +27,7 @@ struct v4l2_ctrl_handler;
>   * @list: list of file handlers
>   * @vdev: pointer to &struct video_device
>   * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
> + * @ro_ctrl_handler: pointer to &struct v4l2_ctrl_handler used for ro ctrls
>   * @prio: priority of the file handler, as defined by &enum v4l2_priority
>   *
>   * @wait: event' s wait queue
> @@ -43,6 +44,7 @@ struct v4l2_fh {
>  	struct list_head	list;
>  	struct video_device	*vdev;
>  	struct v4l2_ctrl_handler *ctrl_handler;
> +	struct v4l2_ctrl_handler *ro_ctrl_handler;
>  	enum v4l2_priority	prio;
>  
>  	/* Events */
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index f11b96514cf7..dce5c6781be9 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -483,6 +483,7 @@ struct vb2_buf_ops {
>   *              has not been called. This is a vb1 idiom that has been adopted
>   *              also by vb2.
>   * @supports_requests: this queue supports the Request API.
> + * @supports_ro_requests: this queue supports the RO Request API.
>   * @requires_requests: this queue requires the Request API. If this is set to 1,
>   *		then supports_requests must be set to 1 as well.
>   * @uses_qbuf:	qbuf was used directly for this queue. Set to 1 the first
> @@ -564,6 +565,7 @@ struct vb2_queue {
>  	unsigned			allow_zero_bytesused:1;
>  	unsigned		   quirk_poll_must_check_waiting_for_buffers:1;
>  	unsigned			supports_requests:1;
> +	unsigned			supports_ro_requests:1;
>  	unsigned			requires_requests:1;
>  	unsigned			uses_qbuf:1;
>  	unsigned			uses_requests:1;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index c3a1cf1c507f..25793c737eab 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -954,6 +954,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_REQUESTS			(1 << 3)
>  #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
> +#define V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS		(1 << 6)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> 

