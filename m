Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07CB36783B8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 18:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbjAWR4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 12:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbjAWR4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 12:56:37 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C085C2BECF
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 09:56:36 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="309680246"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="309680246"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 09:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639284802"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="639284802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 23 Jan 2023 09:56:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK13X-00DrSD-1g;
        Mon, 23 Jan 2023 19:56:31 +0200
Date:   Mon, 23 Jan 2023 19:56:31 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 23/57] media: atomisp: Fix WARN() when the vb2
 start_streaming callback fails
Message-ID: <Y87KT+GFAbPiUJiJ@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-24-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-24-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:31PM +0100, Hans de Goede wrote:
> The videobuf2-core expects buffers to be put back in the queued state
> when the vb2 start_streaming callback fails. But the atomisp
> atomisp_flush_video_pipe() would unconditionally return them to the core
> in an error state.
> 
> This triggers the following warning in the videobuf2-core:
> 
> drivers/media/common/videobuf2/videobuf2-core.c:1652:
> 	/*
> 	 * If done_list is not empty, then start_streaming() didn't call
> 	 * vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED) but STATE_ERROR or
> 	 * STATE_DONE.
> 	 */
> 	WARN_ON(!list_empty(&q->done_list));
> 
> Fix this by adding a state argument to atomisp_flush_video_pipe() and use
> VB2_BUF_STATE_QUEUED as state when atomisp_start_streaming() fails.

Also sounds like a fix.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++++--------
>  drivers/staging/media/atomisp/pci/atomisp_cmd.h |  3 ++-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c   |  4 ++--
>  3 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 01c9845b9f28..b9e7ad57040e 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -679,7 +679,8 @@ void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state
>  	vb2_buffer_done(&frame->vb.vb2_buf, state);
>  }
>  
> -void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames)
> +void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_state state,
> +			      bool warn_on_css_frames)
>  {
>  	struct ia_css_frame *frame, *_frame;
>  	unsigned long irqflags;
> @@ -689,15 +690,15 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_
>  	list_for_each_entry_safe(frame, _frame, &pipe->buffers_in_css, queue) {
>  		if (warn_on_css_frames)
>  			dev_warn(pipe->isp->dev, "Warning: CSS frames queued on flush\n");
> -		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
> +		atomisp_buffer_done(frame, state);
>  	}
>  
>  	list_for_each_entry_safe(frame, _frame, &pipe->activeq, queue)
> -		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
> +		atomisp_buffer_done(frame, state);
>  
>  	list_for_each_entry_safe(frame, _frame, &pipe->buffers_waiting_for_param, queue) {
>  		pipe->frame_request_config_id[frame->vb.vb2_buf.index] = 0;
> -		atomisp_buffer_done(frame, VB2_BUF_STATE_ERROR);
> +		atomisp_buffer_done(frame, state);
>  	}
>  
>  	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
> @@ -706,10 +707,10 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_
>  /* Returns queued buffers back to video-core */
>  void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
>  {
> -	atomisp_flush_video_pipe(&asd->video_out_capture, false);
> -	atomisp_flush_video_pipe(&asd->video_out_vf, false);
> -	atomisp_flush_video_pipe(&asd->video_out_preview, false);
> -	atomisp_flush_video_pipe(&asd->video_out_video_capture, false);
> +	atomisp_flush_video_pipe(&asd->video_out_capture, VB2_BUF_STATE_ERROR, false);
> +	atomisp_flush_video_pipe(&asd->video_out_vf, VB2_BUF_STATE_ERROR, false);
> +	atomisp_flush_video_pipe(&asd->video_out_preview, VB2_BUF_STATE_ERROR, false);
> +	atomisp_flush_video_pipe(&asd->video_out_video_capture, VB2_BUF_STATE_ERROR, false);
>  }
>  
>  /* clean out the parameters that did not apply */
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> index a10577df10cb..733b9f8cd06f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
> @@ -57,7 +57,8 @@ struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev);
>  int atomisp_reset(struct atomisp_device *isp);
>  int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe);
>  void atomisp_buffer_done(struct ia_css_frame *frame, enum vb2_buffer_state state);
> -void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, bool warn_on_css_frames);
> +void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_state state,
> +			      bool warn_on_css_frames);
>  void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd);
>  void atomisp_clear_css_buffer_counters(struct atomisp_sub_device *asd);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 77856cbc5ba7..c15bb0b7458b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1339,7 +1339,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	ret = atomisp_css_start(asd, css_pipe_id, false);
>  	if (ret) {
> -		atomisp_flush_video_pipe(pipe, true);
> +		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
>  		goto out_unlock;
>  	}
>  
> @@ -1515,7 +1515,7 @@ void atomisp_stop_streaming(struct vb2_queue *vq)
>  	css_pipe_id = atomisp_get_css_pipe_id(asd);
>  	atomisp_css_stop(asd, css_pipe_id, false);
>  
> -	atomisp_flush_video_pipe(pipe, true);
> +	atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_ERROR, true);
>  
>  	atomisp_subdev_cleanup_pending_events(asd);
>  stopsensor:
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


