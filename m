Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B8F5B593F
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 13:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiILL0u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 07:26:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiILL0t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 07:26:49 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DD6222B1C
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662982007; x=1694518007;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s5O4HU2roUD/g8/TOyBrVo9A3sZRwgzYDnswmBa5lVM=;
  b=NMyCx+mdgv8lktlOik9wKPY8pt5OkmAbSkoqWQIhE1sJr1jQbP84zVO3
   l393UzrsLzB/U0uJf0L5xqPFxUwmpI5TPJ8iNOepY9hCpAfVv4A96vyFD
   +C108H91p5Xxn2vVjFrWvE4ic8H9d3vYPgUtE8XpBnfy5AeEDUEOWjWHe
   i6lpuumg+u4/mPFdn1WMS16xAPHS633KPV74SXHZj1rM5eSqn7mMvugWl
   7zW8D2L95EFcuclAho6joSwbCNyAomAaYlX6rpeW2sdoe0oSh3lynPy04
   RUpRBwKfxILIVOAc1ee6bjp9Vc8suLJHi56Dxtqt7QJFuNtpx5iwUafis
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="361793390"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="361793390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:26:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="705117512"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:26:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oXhaL-001K53-0H;
        Mon, 12 Sep 2022 14:26:41 +0300
Date:   Mon, 12 Sep 2022 14:26:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 03/17] media: atomisp: Fix locking around asd->streaming
 read/write
Message-ID: <Yx8XcG0c/aU/ENwz@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 07:16:39PM +0200, Hans de Goede wrote:
> For reading / writing the asd->streaming enum the following rules
> should be followed:
> 
> 1. Writers of streaming must hold both isp->mutex and isp->lock.
> 2. Readers of streaming need to hold only one of the two locks.
> 
> Not all writers where properly taking both locks this fixes this.
> 
> In the case of the readers, many readers depend on their caller
> to hold isp->mutex, add asserts for this
> 
> And in the case of atomisp_css_get_dis_stat() it is called with
> isp->mutex held, so there is no need to take the spinlock just
> for reading the streaming value.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Although description of the 'streaming' doesn't clarify which one should be
used on which circumstances. I assume it's only for sleeping / non-sleeping
context? If there is an IRQ relation, shouldn't we always use spinlock for
readers?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 32 +++++++++++++++++--
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 10 +++---
>  .../staging/media/atomisp/pci/atomisp_fops.c  |  3 ++
>  .../media/atomisp/pci/atomisp_internal.h      |  2 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +++
>  .../media/atomisp/pci/atomisp_subdev.c        |  8 ++++-
>  .../media/atomisp/pci/atomisp_subdev.h        |  6 +++-
>  7 files changed, 55 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 97ef02e4e7a6..c7f825e38921 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -899,6 +899,8 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
>  	struct v4l2_control ctrl;
>  	bool reset_wdt_timer = false;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	if (
>  	    buf_type != IA_CSS_BUFFER_TYPE_METADATA &&
>  	    buf_type != IA_CSS_BUFFER_TYPE_3A_STATISTICS &&
> @@ -1298,6 +1300,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  	bool stream_restart[MAX_STREAM_NUM] = {0};
>  	bool depth_mode = false;
>  	int i, ret, depth_cnt = 0;
> +	unsigned long flags;
> +
> +	lockdep_assert_held(&isp->mutex);
>  
>  	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
>  
> @@ -1320,7 +1325,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  
>  		stream_restart[asd->index] = true;
>  
> +		spin_lock_irqsave(&isp->lock, flags);
>  		asd->streaming = ATOMISP_DEVICE_STREAMING_STOPPING;
> +		spin_unlock_irqrestore(&isp->lock, flags);
>  
>  		/* stream off sensor */
>  		ret = v4l2_subdev_call(
> @@ -1335,7 +1342,9 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  		css_pipe_id = atomisp_get_css_pipe_id(asd);
>  		atomisp_css_stop(asd, css_pipe_id, true);
>  
> +		spin_lock_irqsave(&isp->lock, flags);
>  		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
> +		spin_unlock_irqrestore(&isp->lock, flags);
>  
>  		asd->preview_exp_id = 1;
>  		asd->postview_exp_id = 1;
> @@ -1376,11 +1385,14 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  						   IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
>  
>  		css_pipe_id = atomisp_get_css_pipe_id(asd);
> -		if (atomisp_css_start(asd, css_pipe_id, true))
> +		if (atomisp_css_start(asd, css_pipe_id, true)) {
>  			dev_warn(isp->dev,
>  				 "start SP failed, so do not set streaming to be enable!\n");
> -		else
> +		} else {
> +			spin_lock_irqsave(&isp->lock, flags);
>  			asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
> +			spin_unlock_irqrestore(&isp->lock, flags);
> +		}
>  
>  		atomisp_csi2_configure(asd);
>  	}
> @@ -1608,6 +1620,8 @@ void atomisp_css_flush(struct atomisp_device *isp)
>  {
>  	int i;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	if (!atomisp_streaming_count(isp))
>  		return;
>  
> @@ -4046,6 +4060,8 @@ void atomisp_handle_parameter_and_buffer(struct atomisp_video_pipe *pipe)
>  	unsigned long irqflags;
>  	bool need_to_enqueue_buffer = false;
>  
> +	lockdep_assert_held(&asd->isp->mutex);
> +
>  	if (!asd) {
>  		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
>  			__func__, pipe->vdev.name);
> @@ -4139,6 +4155,8 @@ int atomisp_set_parameters(struct video_device *vdev,
>  	struct atomisp_css_params *css_param = &asd->params.css_param;
>  	int ret;
>  
> +	lockdep_assert_held(&asd->isp->mutex);
> +
>  	if (!asd) {
>  		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
>  			__func__, vdev->name);
> @@ -5537,6 +5555,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  	struct v4l2_subdev_fh fh;
>  	int ret;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	if (!asd) {
>  		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
>  			__func__, vdev->name);
> @@ -6159,6 +6179,8 @@ int atomisp_offline_capture_configure(struct atomisp_sub_device *asd,
>  {
>  	struct v4l2_ctrl *c;
>  
> +	lockdep_assert_held(&asd->isp->mutex);
> +
>  	/*
>  	* In case of M10MO ZSL capture case, we need to issue a separate
>  	* capture request to M10MO which will output captured jpeg image
> @@ -6433,6 +6455,8 @@ int atomisp_exp_id_capture(struct atomisp_sub_device *asd, int *exp_id)
>  	int value = *exp_id;
>  	int ret;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	ret = __is_raw_buffer_locked(asd, value);
>  	if (ret) {
>  		dev_err(isp->dev, "%s exp_id %d invalid %d.\n", __func__, value, ret);
> @@ -6454,6 +6478,8 @@ int atomisp_exp_id_unlock(struct atomisp_sub_device *asd, int *exp_id)
>  	int value = *exp_id;
>  	int ret;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	ret = __clear_raw_buffer_bitmap(asd, value);
>  	if (ret) {
>  		dev_err(isp->dev, "%s exp_id %d invalid %d.\n", __func__, value, ret);
> @@ -6489,6 +6515,8 @@ int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event)
>  	if (!event || asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
>  		return -EINVAL;
>  
> +	lockdep_assert_held(&asd->isp->mutex);
> +
>  	dev_dbg(asd->isp->dev, "%s: trying to inject a fake event 0x%x\n",
>  		__func__, *event);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index cda0b5eba16d..15ef31b0c601 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -3626,6 +3626,8 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
>  	struct atomisp_dis_buf *dis_buf;
>  	unsigned long flags;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	if (!asd->params.dvs_stat->hor_prod.odd_real ||
>  	    !asd->params.dvs_stat->hor_prod.odd_imag ||
>  	    !asd->params.dvs_stat->hor_prod.even_real ||
> @@ -3637,12 +3639,8 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
>  		return -EINVAL;
>  
>  	/* isp needs to be streaming to get DIS statistics */
> -	spin_lock_irqsave(&isp->lock, flags);
> -	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED) {
> -		spin_unlock_irqrestore(&isp->lock, flags);
> +	if (asd->streaming != ATOMISP_DEVICE_STREAMING_ENABLED)
>  		return -EINVAL;
> -	}
> -	spin_unlock_irqrestore(&isp->lock, flags);
>  
>  	if (atomisp_compare_dvs_grid(asd, &stats->dvs2_stat.grid_info) != 0)
>  		/* If the grid info in the argument differs from the current
> @@ -3801,6 +3799,8 @@ int atomisp_css_isr_thread(struct atomisp_device *isp,
>  	bool reset_wdt_timer[MAX_STREAM_NUM] = {false};
>  	int i;
>  
> +	lockdep_assert_held(&isp->mutex);
> +
>  	while (!ia_css_dequeue_psys_event(&current_event.event)) {
>  		if (current_event.event.type ==
>  		    IA_CSS_EVENT_TYPE_FW_ASSERT) {
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> index 57587d739c4b..e1b213ba4686 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
> @@ -813,6 +813,7 @@ static int atomisp_release(struct file *file)
>  	struct v4l2_requestbuffers req;
>  	struct v4l2_subdev_fh fh;
>  	struct v4l2_rect clear_compose = {0};
> +	unsigned long flags;
>  	int ret = 0;
>  
>  	v4l2_fh_init(&fh.vfh, vdev);
> @@ -878,7 +879,9 @@ static int atomisp_release(struct file *file)
>  
>  	/* clear the asd field to show this camera is not used */
>  	isp->inputs[asd->input_curr].asd = NULL;
> +	spin_lock_irqsave(&isp->lock, flags);
>  	asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
> +	spin_unlock_irqrestore(&isp->lock, flags);
>  
>  	if (atomisp_dev_users(isp))
>  		goto done;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> index 759575cbd356..b2c362ef7199 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -266,7 +266,7 @@ struct atomisp_device {
>  
>  	atomic_t wdt_work_queued;
>  
> -	spinlock_t lock; /* Just for streaming below */
> +	spinlock_t lock; /* Protects asd[i].streaming */
>  
>  	bool need_gfx_throttle;
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 4016ac4fffe0..21af5feca386 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1837,7 +1837,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>  	if (ret)
>  		goto out;
>  
> +	spin_lock_irqsave(&isp->lock, irqflags);
>  	asd->streaming = ATOMISP_DEVICE_STREAMING_ENABLED;
> +	spin_unlock_irqrestore(&isp->lock, irqflags);
>  	atomic_set(&asd->sof_count, -1);
>  	atomic_set(&asd->sequence, -1);
>  	atomic_set(&asd->sequence_temp, -1);
> @@ -1910,7 +1912,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>  	ret = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
>  			       video, s_stream, 1);
>  	if (ret) {
> +		spin_lock_irqsave(&isp->lock, irqflags);
>  		asd->streaming = ATOMISP_DEVICE_STREAMING_DISABLED;
> +		spin_unlock_irqrestore(&isp->lock, irqflags);
>  		ret = -EINVAL;
>  		goto out;
>  	}
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index 4a4367701509..88bf693f4c50 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -874,12 +874,18 @@ static int s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct atomisp_sub_device *asd = container_of(
>  					     ctrl->handler, struct atomisp_sub_device, ctrl_handler);
> +	unsigned int streaming;
> +	unsigned long flags;
>  
>  	switch (ctrl->id) {
>  	case V4L2_CID_RUN_MODE:
>  		return __atomisp_update_run_mode(asd);
>  	case V4L2_CID_DEPTH_MODE:
> -		if (asd->streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
> +		/* Use spinlock instead of mutex to avoid possible locking issues */
> +		spin_lock_irqsave(&asd->isp->lock, flags);
> +		streaming = asd->streaming;
> +		spin_unlock_irqrestore(&asd->isp->lock, flags);
> +		if (streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
>  			dev_err(asd->isp->dev,
>  				"ISP is streaming, it is not supported to change the depth mode\n");
>  			return -EINVAL;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> index eaf767880407..b44f060b0bb5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> @@ -330,7 +330,11 @@ struct atomisp_sub_device {
>  	atomic_t sequence;      /* Sequence value that is assigned to buffer. */
>  	atomic_t sequence_temp;
>  
> -	unsigned int streaming; /* Hold both mutex and lock to change this */
> +	/*
> +	 * Writers of streaming must hold both isp->mutex and isp->lock.
> +	 * Readers of streaming need to hold only one of the two locks.
> +	 */
> +	unsigned int streaming;
>  	bool stream_prepared; /* whether css stream is created */
>  
>  	/* subdev index: will be used to show which subdev is holding the
> -- 
> 2.37.3
> 

-- 
With Best Regards,
Andy Shevchenko


