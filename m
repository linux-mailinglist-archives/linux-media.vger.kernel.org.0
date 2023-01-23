Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5435A677FC4
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 16:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbjAWPaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 10:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjAWPaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 10:30:17 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DC410258
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 07:30:16 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388416622"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="388416622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 07:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="693941400"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="693941400"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 07:30:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pJylq-00Dnkq-0E;
        Mon, 23 Jan 2023 17:30:06 +0200
Date:   Mon, 23 Jan 2023 17:30:05 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/57] media: atomisp: Drop atomisp_init_pipe()
Message-ID: <Y86n/Wz5Ed45Ve1d@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-16-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:23PM +0100, Hans de Goede wrote:
> atomisp_init_pipe() does 3 things:
> 
> 1. Init a bunch of list-heads / locks
> 2. Init the vb_queue for the videodev (aka pipe)
> 3. zero the per-frame parameters related variables of the pipe
> 
> 1. and 2. really should not be done at file-open time, but once at probe.
> Currently the code is getting away with doing this on every videodev-open
> because only 1 open is allowed at a time.
> 
> 1. is already done at probe time by atomisp_init_subdev_pipe(), move 2. to
> atomisp_init_subdev_pipe() so that it is also done once at probe.
> 
> As for 3. The per-frame parameters can only be set from a qbuf ioctl,
> which can only happen after a reqbufs ioctl and atomisp_buf_cleanup
> already zeros the per-frame parameters when the buffers are released,
> so 3. is not necessary at all.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 40 +--------------
>  .../staging/media/atomisp/pci/atomisp_fops.h  |  1 +
>  .../media/atomisp/pci/atomisp_subdev.c        | 49 +++++++++++++++----
>  3 files changed, 41 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 036ad339b344..7f4934ff9cab 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -624,7 +624,7 @@ static void atomisp_buf_cleanup(struct vb2_buffer *vb)
>  	hmm_free(frame->data);
>  }
>  
> -static const struct vb2_ops atomisp_vb2_ops = {
> +const struct vb2_ops atomisp_vb2_ops = {
>  	.queue_setup		= atomisp_queue_setup,
>  	.buf_init		= atomisp_buf_init,
>  	.buf_cleanup		= atomisp_buf_cleanup,
> @@ -633,40 +633,6 @@ static const struct vb2_ops atomisp_vb2_ops = {
>  	.stop_streaming		= atomisp_stop_streaming,
>  };
>  
> -static int atomisp_init_pipe(struct atomisp_video_pipe *pipe)
> -{
> -	int ret;
> -
> -	/* init locks */
> -	spin_lock_init(&pipe->irq_lock);
> -	mutex_init(&pipe->vb_queue_mutex);
> -
> -	/* Init videobuf2 queue structure */
> -	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
> -	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
> -	pipe->vb_queue.ops = &atomisp_vb2_ops;
> -	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
> -	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	ret = vb2_queue_init(&pipe->vb_queue);
> -	if (ret)
> -		return ret;
> -
> -	pipe->vdev.queue = &pipe->vb_queue;
> -	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
> -
> -	INIT_LIST_HEAD(&pipe->activeq);
> -	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
> -	INIT_LIST_HEAD(&pipe->per_frame_params);
> -	memset(pipe->frame_request_config_id, 0,
> -	       VIDEO_MAX_FRAME * sizeof(unsigned int));
> -	memset(pipe->frame_params, 0,
> -	       VIDEO_MAX_FRAME *
> -	       sizeof(struct atomisp_css_params_with_list *));
> -
> -	return 0;
> -}
> -
>  static void atomisp_dev_init_struct(struct atomisp_device *isp)
>  {
>  	unsigned int i;
> @@ -773,10 +739,6 @@ static int atomisp_open(struct file *file)
>  		return -EBUSY;
>  	}
>  
> -	ret = atomisp_init_pipe(pipe);
> -	if (ret)
> -		goto error;
> -
>  	if (atomisp_dev_users(isp)) {
>  		dev_dbg(isp->dev, "skip init isp in open\n");
>  		goto init_subdev;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.h b/drivers/staging/media/atomisp/pci/atomisp_fops.h
> index 2efc5245e571..883c1851c1c9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.h
> @@ -31,6 +31,7 @@ unsigned int atomisp_sub_dev_users(struct atomisp_sub_device *asd);
>  
>  int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd);
>  
> +extern const struct vb2_ops atomisp_vb2_ops;
>  extern const struct v4l2_file_operations atomisp_fops;
>  
>  #endif /* __ATOMISP_FOPS_H__ */
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index fc9e07bf63ae..c32db4ffb778 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -25,9 +25,11 @@
>  
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mediabus.h>
> +#include <media/videobuf2-vmalloc.h>
>  #include "atomisp_cmd.h"
>  #include "atomisp_common.h"
>  #include "atomisp_compat.h"
> +#include "atomisp_fops.h"
>  #include "atomisp_internal.h"
>  
>  const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
> @@ -1023,14 +1025,31 @@ static const struct v4l2_ctrl_config ctrl_depth_mode = {
>  	.def = 0,
>  };
>  
> -static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
> -				     struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
> +static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
> +				    struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
>  {
> +	int ret;
> +
>  	pipe->type = buf_type;
>  	pipe->asd = asd;
>  	pipe->isp = asd->isp;
>  	spin_lock_init(&pipe->irq_lock);
>  	mutex_init(&pipe->vb_queue_mutex);
> +
> +	/* Init videobuf2 queue structure */
> +	pipe->vb_queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	pipe->vb_queue.io_modes = VB2_MMAP | VB2_USERPTR;
> +	pipe->vb_queue.buf_struct_size = sizeof(struct ia_css_frame);
> +	pipe->vb_queue.ops = &atomisp_vb2_ops;
> +	pipe->vb_queue.mem_ops = &vb2_vmalloc_memops;
> +	pipe->vb_queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	ret = vb2_queue_init(&pipe->vb_queue);
> +	if (ret)
> +		return ret;
> +
> +	pipe->vdev.queue = &pipe->vb_queue;
> +	pipe->vdev.queue->lock = &pipe->vb_queue_mutex;
> +
>  	INIT_LIST_HEAD(&pipe->buffers_in_css);
>  	INIT_LIST_HEAD(&pipe->activeq);
>  	INIT_LIST_HEAD(&pipe->buffers_waiting_for_param);
> @@ -1040,6 +1059,8 @@ static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
>  	memset(pipe->frame_params,
>  	       0, VIDEO_MAX_FRAME *
>  	       sizeof(struct atomisp_css_params_with_list *));
> +
> +	return 0;
>  }
>  
>  /*
> @@ -1085,17 +1106,25 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
>  	if (ret < 0)
>  		return ret;
>  
> -	atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
> -				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_preview,
> +				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (ret)
> +		return ret;
>  
> -	atomisp_init_subdev_pipe(asd, &asd->video_out_vf,
> -				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_vf,
> +				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (ret)
> +		return ret;
>  
> -	atomisp_init_subdev_pipe(asd, &asd->video_out_capture,
> -				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_capture,
> +				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (ret)
> +		return ret;
>  
> -	atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
> -				 V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
> +				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (ret)
> +		return ret;
>  
>  	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
>  				 ATOMISP_RUN_MODE_STILL_CAPTURE);
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


