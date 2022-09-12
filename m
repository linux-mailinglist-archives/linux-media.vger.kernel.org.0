Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D945B5957
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 13:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbiILLaY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 07:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiILLaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 07:30:19 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B9ADFB0
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 04:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662982211; x=1694518211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KG6gouVWsvRBsUor+r2BI2JsWqQ7XMKZsuoysJ+77RM=;
  b=BR23jvF9StMrGIodQ+2r8M88BDp5viDjfgBg3ix3payAGYEkjplc5leq
   P3YFoC6ujZZ+Qj+k1h+ZZXLZAZQkuMxD0fFFpTmSkob36fqdVuFhZadHq
   QuJfRjz2um2jniaPbz+huCz2XPltZdq9QdGC9ZddRHwn47xMHhr3dkXfN
   JsPbSJKUE1cKexTzAoUNjBxf1Nm8Y0b2N8IyxF8UXCx6nBWyo4CpWLNe/
   9+SXtZ/lvorvkApA8RvE1n6JlA5AhcLWIE2KEakKfcU6vuhVb3Ez+Bpjg
   JEXX/VoL3BM7xZmtpbkro/jrgjK/U9vTI/jsZyuJ6uMBqRH0j28oMC9eQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="280860238"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="280860238"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:30:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="567132732"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:30:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oXhdb-001KBp-0f;
        Mon, 12 Sep 2022 14:30:03 +0300
Date:   Mon, 12 Sep 2022 14:30:02 +0300
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
Subject: Re: [PATCH 05/17] media: atomisp: Add atomisp_pipe_check() helper
Message-ID: <Yx8YOj7L9V32qC7D@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-6-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 07:16:41PM +0200, Hans de Goede wrote:
> Several of the ioctl handlers all do the same checks
> (isp->fatal_error and asd->streaming errors) add
> an atomisp_pipe_check() helper for this.
> 
> Note this changes the vidioc_s_fmt_vid_cap and vidioc_s_input handlers
> to now reject calls made while asd->streaming==STOPPING. This fixes
> a possible race where one thread can make this ioctls while
> vidioc_streamoff is running from another thread and it has
> temporarily released isp->mutex to kill the watchdog timers / work.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(One minor question below)

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  9 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 89 +++++++++----------
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |  2 +
>  3 files changed, 48 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 087078900415..7945852ecd13 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -5549,16 +5549,13 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
>  	struct v4l2_subdev_fh fh;
>  	int ret;
>  
> -	lockdep_assert_held(&isp->mutex);
> +	ret = atomisp_pipe_check(pipe, true);
> +	if (ret)
> +		return ret;
>  
>  	if (source_pad >= ATOMISP_SUBDEV_PADS_NUM)
>  		return -EINVAL;
>  
> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_ENABLED) {
> -		dev_warn(isp->dev, "ISP does not support set format while at streaming!\n");
> -		return -EBUSY;
> -	}
> -
>  	dev_dbg(isp->dev,
>  		"setting resolution %ux%u on pad %u for asd%d, bytesperline %u\n",
>  		f->fmt.pix.width, f->fmt.pix.height, source_pad,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index 9c7022be3a06..9b50f637c46a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -535,6 +535,32 @@ atomisp_get_format_bridge_from_mbus(u32 mbus_code)
>  	return NULL;
>  }
>  
> +int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool settings_change)
> +{
> +	lockdep_assert_held(&pipe->isp->mutex);
> +
> +	if (pipe->isp->isp_fatal_error)
> +		return -EIO;
> +
> +	switch (pipe->asd->streaming) {
> +	case ATOMISP_DEVICE_STREAMING_DISABLED:
> +		break;
> +	case ATOMISP_DEVICE_STREAMING_ENABLED:
> +		if (settings_change) {
> +			dev_err(pipe->isp->dev, "Set fmt/input IOCTL while streaming\n");
> +			return -EBUSY;
> +		}
> +		break;

> +	case ATOMISP_DEVICE_STREAMING_STOPPING:
> +		dev_err(pipe->isp->dev, "IOCTL issued while stopping\n");
> +		return -EBUSY;

Wouldn't -EAGAIN match better in this case?

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * v4l2 ioctls
>   * return ISP capabilities
> @@ -646,12 +672,18 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
> -	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
> +	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
> +	struct atomisp_sub_device *asd = pipe->asd;
>  	struct v4l2_subdev *camera = NULL;
>  	struct v4l2_subdev *motor;
>  	int ret;
>  
>  	mutex_lock(&isp->mutex);
> +
> +	ret = atomisp_pipe_check(pipe, true);
> +	if (ret)
> +		goto error;
> +
>  	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
>  		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
>  		ret = -EINVAL;
> @@ -678,13 +710,6 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
>  		goto error;
>  	}
>  
> -	if (atomisp_subdev_streaming_count(asd)) {
> -		dev_err(isp->dev,
> -			"ISP is still streaming, stop first\n");
> -		ret = -EINVAL;
> -		goto error;
> -	}
> -
>  	/* power off the current owned sensor, as it is not used this time */
>  	if (isp->inputs[asd->input_curr].asd == asd &&
>  	    asd->input_curr != input) {
> @@ -976,11 +1001,6 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
>  	int ret;
>  
>  	mutex_lock(&isp->mutex);
> -	if (isp->isp_fatal_error) {
> -		ret = -EIO;
> -		mutex_unlock(&isp->mutex);
> -		return ret;
> -	}
>  	ret = atomisp_set_fmt(vdev, f);
>  	mutex_unlock(&isp->mutex);
>  	return ret;
> @@ -1236,20 +1256,13 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  	struct ia_css_frame *handle = NULL;
>  	u32 length;
>  	u32 pgnr;
> -	int ret = 0;
> +	int ret;
>  
>  	mutex_lock(&isp->mutex);
> -	if (isp->isp_fatal_error) {
> -		ret = -EIO;
> -		goto error;
> -	}
>  
> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
> -		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
> -			__func__);
> -		ret = -EIO;
> +	ret = atomisp_pipe_check(pipe, false);
> +	if (ret)
>  		goto error;
> -	}
>  
>  	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
>  	    !pipe->capq.bufs[buf->index]) {
> @@ -1418,23 +1431,13 @@ static int atomisp_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
>  	struct atomisp_sub_device *asd = pipe->asd;
>  	struct atomisp_device *isp = video_get_drvdata(vdev);
> -	int ret = 0;
> +	int ret;
>  
>  	mutex_lock(&isp->mutex);
> -
> -	if (isp->isp_fatal_error) {
> -		mutex_unlock(&isp->mutex);
> -		return -EIO;
> -	}
> -
> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
> -		mutex_unlock(&isp->mutex);
> -		dev_err(isp->dev, "%s: reject, as ISP at stopping.\n",
> -			__func__);
> -		return -EIO;
> -	}
> -
> +	ret = atomisp_pipe_check(pipe, false);
>  	mutex_unlock(&isp->mutex);
> +	if (ret)
> +		return ret;
>  
>  	ret = videobuf_dqbuf(&pipe->capq, buf, file->f_flags & O_NONBLOCK);
>  	if (ret) {
> @@ -1668,8 +1671,8 @@ static int atomisp_streamon(struct file *file, void *fh,
>  	enum ia_css_pipe_id css_pipe_id;
>  	unsigned int sensor_start_stream;
>  	unsigned int wdt_duration = ATOMISP_ISP_TIMEOUT_DURATION;
> -	int ret = 0;
>  	unsigned long irqflags;
> +	int ret;
>  
>  	dev_dbg(isp->dev, "Start stream on pad %d for asd%d\n",
>  		atomisp_subdev_source_pad(vdev), asd->index);
> @@ -1680,15 +1683,9 @@ static int atomisp_streamon(struct file *file, void *fh,
>  	}
>  
>  	mutex_lock(&isp->mutex);
> -	if (isp->isp_fatal_error) {
> -		ret = -EIO;
> -		goto out;
> -	}
> -
> -	if (asd->streaming == ATOMISP_DEVICE_STREAMING_STOPPING) {
> -		ret = -EBUSY;
> +	ret = atomisp_pipe_check(pipe, false);
> +	if (ret)
>  		goto out;
> -	}
>  
>  	if (pipe->capq.streaming)
>  		goto out;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> index 382b78275240..61a6148a6ad5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> @@ -34,6 +34,8 @@ atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
>  const struct
>  atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
>  
> +int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
> +
>  int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
>  				uint16_t stream_id);
>  
> -- 
> 2.37.3
> 

-- 
With Best Regards,
Andy Shevchenko


