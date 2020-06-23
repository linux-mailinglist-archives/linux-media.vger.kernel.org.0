Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0286B204C3E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 10:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbgFWIX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 04:23:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60258 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731579AbgFWIXZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 04:23:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592900603; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0vR+p/RMWPL1tQ7TRskIM07erg5V5Hlq81AC+gIktnI=;
 b=YP1lM7ctrmU6SRg3j/nM0YacNOWqnWtI9y/Gqmmu2uiztuoTtpS/twx7CjlfnIw4EnxQHGXM
 XmL0jfSKuqXIA2hxVUb1F4Y+jmvObiv7zF8IbR43skhkPPWP4OyhPPbhnF2f1X6f5vsZdHOg
 kVnxjUkgzwbAJWo9jqRmJFjK5/E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5ef1bbec117610c7ff3268b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 08:23:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81B97C433A0; Tue, 23 Jun 2020 08:23:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50660C433C6;
        Tue, 23 Jun 2020 08:23:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 23 Jun 2020 13:53:06 +0530
From:   dikshita@codeaurora.org
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>,
        linux-media-owner@vger.kernel.org
Subject: Re: [PATCH v2, 2/2] media: v4l: Add Ro request api for capture queue
In-Reply-To: <20200622015227.24134-3-yunfei.dong@mediatek.com>
References: <20200622015227.24134-1-yunfei.dong@mediatek.com>
 <20200622015227.24134-3-yunfei.dong@mediatek.com>
Message-ID: <9ce7d36bd34dd30a68309e5c55321bbd@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunfei Dong,

Thanks for the patch.
I believe there is one additional change required in 
vb2_core_queue_init() to allow
ro request if the driver sets supports_ro_requests while queue_init.

thanks,
Dikshita

On 2020-06-22 07:22, Yunfei Dong wrote:
> Add Read-only(Ro) request for capture queue. Ro request mean that
> user driver can get ext ctrls, buf set ext ctrls is not allowed.
> 
> Add param ro_requests in struct v4l2_ctrl_handler to present current
> ctrl is read only. Add param ro_ctrl_handler in struct v4l2_fh used
> for ro request.
> 
> When set/get ext ctrls, will check whether current CID ctrls is ro 
> ctrls
> or not using function v4l2_check_ro_ext_ctrls().
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   7 ++
>  drivers/media/mc/mc-request.c                 |  10 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 107 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  22 ++++
>  drivers/media/v4l2-core/v4l2-mem2mem.c        |  19 ++--
>  include/media/v4l2-ctrls.h                    |  22 +++-
>  include/media/v4l2-fh.h                       |   2 +
>  include/media/videobuf2-core.h                |   2 +
>  include/uapi/linux/videodev2.h                |   1 +
>  9 files changed, 154 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..91a6f3a0c208 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -402,6 +402,11 @@ static int vb2_queue_or_prepare_buf(struct
> vb2_queue *q, struct media_device *md
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
> @@ -665,6 +670,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 
> *caps)
>  #ifdef CONFIG_MEDIA_CONTROLLER_REQUEST_API
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->supports_ro_requests)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS;
>  #endif
>  }
> 
> diff --git a/drivers/media/mc/mc-request.c 
> b/drivers/media/mc/mc-request.c
> index e3fca436c75b..e50ae259c1ff 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -404,16 +404,12 @@ int media_request_object_bind(struct 
> media_request *req,
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
> @@ -423,11 +419,9 @@ int media_request_object_bind(struct media_request 
> *req,
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
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c
> b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 3f3fbcd60cc6..effc26f733de 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -3386,22 +3386,6 @@ static const struct media_request_object_ops 
> req_ops = {
>  	.release = v4l2_ctrl_request_release,
>  };
> 
> -struct v4l2_ctrl_handler *v4l2_ctrl_request_hdl_find(struct 
> media_request *req,
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
> @@ -3420,6 +3404,10 @@ static int v4l2_ctrl_request_bind(struct
> media_request *req,
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
> @@ -3593,6 +3581,62 @@ static int class_check(struct v4l2_ctrl_handler
> *hdl, u32 which)
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
> @@ -3694,7 +3738,7 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler 
> *hdl,
>  	obj = media_request_object_find(req, &req_ops, hdl);
>  	if (obj)
>  		return obj;
> -	if (!set)
> +	if (!set && !hdl->ro_requests)
>  		return ERR_PTR(-ENOENT);
> 
>  	new_hdl = kzalloc(sizeof(*new_hdl), GFP_KERNEL);
> @@ -3702,6 +3746,7 @@ v4l2_ctrls_find_req_obj(struct v4l2_ctrl_handler 
> *hdl,
>  		return ERR_PTR(-ENOMEM);
> 
>  	obj = &new_hdl->req_obj;
> +	new_hdl->ro_requests = hdl->ro_requests;
>  	ret = v4l2_ctrl_handler_init(new_hdl, (hdl->nr_of_buckets - 1) * 8);
>  	if (!ret)
>  		ret = v4l2_ctrl_request_bind(req, new_hdl, hdl);
> @@ -3763,6 +3808,28 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler
> *hdl, struct video_device *vdev,
>  }
>  EXPORT_SYMBOL(v4l2_g_ext_ctrls);
> 
> +struct v4l2_ctrl_handler *v4l2_ctrl_request_hdl_find(struct 
> media_request *req,
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
>  static int get_ctrl(struct v4l2_ctrl *ctrl, struct v4l2_ext_control 
> *c)
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
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
> b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2322f08a98be..b9e1058a5067 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2270,6 +2270,13 @@ static int v4l_g_ext_ctrls(const struct
> v4l2_ioctl_ops *ops,
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
> @@ -2291,6 +2298,14 @@ static int v4l_s_ext_ctrls(const struct
> v4l2_ioctl_ops *ops,
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
> @@ -2312,6 +2327,13 @@ static int v4l_try_ext_ctrls(const struct
> v4l2_ioctl_ops *ops,
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
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
> b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 62ac9424c92a..166e94ee18a7 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -712,13 +712,6 @@ int v4l2_m2m_qbuf(struct file *file, struct
> v4l2_m2m_ctx *m2m_ctx,
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
> @@ -1252,10 +1245,14 @@ void v4l2_m2m_request_queue(struct 
> media_request *req)
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
>   * @requests:	List to keep track of open control handler request 
> objects.
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
> @@ -1261,8 +1263,10 @@ void v4l2_ctrl_request_complete(struct
> media_request *req,
>   * @parent: The parent control handler ('priv' in 
> media_request_object_find())
>   *
>   * This function finds the control handler in the request. It may 
> return
> - * NULL if not found. When done, you must call 
> v4l2_ctrl_request_put_hdl()
> - * with the returned handler pointer.
> + * NULL if not found. But for Ro Request, the request object maybe
> + * NULL, need to call v4l2_ctrls_find_req_obj() to check whether the
> + * request has request object. When done, you must call
> + * v4l2_ctrl_request_put_hdl() with the returned handler pointer.
>   *
>   * If the request is not in state VALIDATING or QUEUED, then this 
> function
>   * will always return NULL.
> @@ -1454,4 +1458,18 @@ int v4l2_ctrl_subdev_log_status(struct 
> v4l2_subdev *sd);
>  int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
>  				    const struct v4l2_ctrl_ops *ctrl_ops,
>  				    const struct v4l2_fwnode_device_properties *p);
> +/**
> + * v4l2_check_ro_ext_ctrls - Check whether the ext controls are ro 
> request
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
> + * @ro_ctrl_handler: pointer to &struct v4l2_ctrl_handler used for ro 
> ctrls
>   * @prio: priority of the file handler, as defined by &enum 
> v4l2_priority
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
> diff --git a/include/media/videobuf2-core.h 
> b/include/media/videobuf2-core.h
> index f11b96514cf7..dce5c6781be9 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -483,6 +483,7 @@ struct vb2_buf_ops {
>   *              has not been called. This is a vb1 idiom that has been 
> adopted
>   *              also by vb2.
>   * @supports_requests: this queue supports the Request API.
> + * @supports_ro_requests: this queue supports the RO Request API.
>   * @requires_requests: this queue requires the Request API. If this
> is set to 1,
>   *		then supports_requests must be set to 1 as well.
>   * @uses_qbuf:	qbuf was used directly for this queue. Set to 1 the 
> first
> @@ -564,6 +565,7 @@ struct vb2_queue {
>  	unsigned			allow_zero_bytesused:1;
>  	unsigned		   quirk_poll_must_check_waiting_for_buffers:1;
>  	unsigned			supports_requests:1;
> +	unsigned			supports_ro_requests:1;
>  	unsigned			requires_requests:1;
>  	unsigned			uses_qbuf:1;
>  	unsigned			uses_requests:1;
> diff --git a/include/uapi/linux/videodev2.h 
> b/include/uapi/linux/videodev2.h
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
