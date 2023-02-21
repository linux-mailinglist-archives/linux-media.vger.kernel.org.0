Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4CF69E3F7
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbjBUPxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbjBUPxE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:53:04 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60A972B8
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 07:53:02 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="312296209"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="312296209"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 07:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="845719363"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="845719363"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 21 Feb 2023 07:52:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUUwq-00A1aQ-1C;
        Tue, 21 Feb 2023 17:52:56 +0200
Date:   Tue, 21 Feb 2023 17:52:56 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/10] media: atomisp: Remove depth-mode support
Message-ID: <Y/To2Mw0+wUYiorQ@smile.fi.intel.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221145906.8113-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 03:58:57PM +0100, Hans de Goede wrote:
> Remove support for depth mode. This is a special mode where 2 streams
> (from 2 different sensors) can be setup and then starting/stopping
> 1 will automatically also start/stop the other.
> 
> Like many of these special features I'm pretty sure that if the queue
> setup is not done exactly right things will crash and there is no error
> checking for this.
> 
> This seems to be for stereoscopic vision and the only known hw which
> actually supports this is the Intel Aero board/SDK, all other 1000+
> BYT/CHT models don't need this.
> 
> This false outside of the standard webcam use scenario which we are
> trying to get working and this involves a bunch of hacks / special
> exceptions all over the code, so lets remove this.

> Link: https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/

Note that `b4` has a mode when the patch series can be merged in a similar way
as PR where cover letter becomes a merge commit message. In such case you may
write a good description with all links and other material there and use that
mode, it will be saved in the Git.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/include/linux/atomisp.h     |  2 -
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 24 +-------
>  .../media/atomisp/pci/atomisp_internal.h      |  5 --
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 59 -------------------
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |  3 -
>  .../media/atomisp/pci/atomisp_subdev.c        | 36 -----------
>  .../media/atomisp/pci/atomisp_subdev.h        |  1 -
>  7 files changed, 1 insertion(+), 129 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index 63b1bcd35399..1dc7ac2b90ba 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -1107,8 +1107,6 @@ struct atomisp_sensor_ae_bracketing_lut {
>  /* Lock and unlock raw buffer */
>  #define V4L2_CID_ENABLE_RAW_BUFFER_LOCK (V4L2_CID_CAMERA_LASTP1 + 29)
>  
> -#define V4L2_CID_DEPTH_MODE		(V4L2_CID_CAMERA_LASTP1 + 30)
> -
>  #define V4L2_CID_EXPOSURE_ZONE_NUM	(V4L2_CID_CAMERA_LASTP1 + 31)
>  /* Disable digital zoom */
>  #define V4L2_CID_DISABLE_DZ		(V4L2_CID_CAMERA_LASTP1 + 32)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index 47f18ac5e40e..a89686ac2d97 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -1114,9 +1114,8 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  	struct pci_dev *pdev = to_pci_dev(isp->dev);
>  	enum ia_css_pipe_id css_pipe_id;
>  	bool stream_restart[MAX_STREAM_NUM] = {0};
> -	bool depth_mode = false;
> -	int i, ret, depth_cnt = 0;
>  	unsigned long flags;
> +	int i, ret;
>  
>  	lockdep_assert_held(&isp->mutex);
>  
> @@ -1134,8 +1133,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  		    !asd->stream_prepared)
>  			continue;
>  
> -		depth_cnt++;
> -
>  		if (asd->delayed_init == ATOMISP_DELAYED_INIT_QUEUED)
>  			cancel_work_sync(&asd->delayed_init_work);
>  
> @@ -1186,13 +1183,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  	atomisp_reset(isp);
>  	isp->isp_timeout = false;
>  
> -	if (!isp_timeout) {
> -		for (i = 0; i < isp->num_of_streams; i++) {
> -			if (isp->asd[i].depth_mode->val)
> -				return;
> -		}
> -	}
> -
>  	for (i = 0; i < isp->num_of_streams; i++) {
>  		struct atomisp_sub_device *asd = &isp->asd[i];
>  
> @@ -1248,12 +1238,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  		atomisp_recover_params_queue(&asd->video_out_preview);
>  		atomisp_recover_params_queue(&asd->video_out_video_capture);
>  
> -		if ((asd->depth_mode->val) &&
> -		    (depth_cnt == ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
> -			depth_mode = true;
> -			continue;
> -		}
> -
>  		ret = v4l2_subdev_call(
>  			  isp->inputs[asd->input_curr].camera, video,
>  			  s_stream, 1);
> @@ -1261,12 +1245,6 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
>  			dev_warn(isp->dev,
>  				 "can't start streaming on sensor!\n");
>  	}
> -
> -	if (depth_mode) {
> -		if (atomisp_stream_on_master_slave_sensor(isp, true))
> -			dev_warn(isp->dev,
> -				 "master slave sensor stream on failed!\n");
> -	}
>  }
>  
>  void atomisp_assert_recovery_work(struct work_struct *work)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> index fa38d91420cf..90caa4254893 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -133,11 +133,6 @@
>  	(ATOMISP_SOC_CAMERA(asd) && ATOMISP_CSS_SUPPORT_YUVPP && \
>  	!asd->copy_mode)
>  
> -#define ATOMISP_DEPTH_SENSOR_STREAMON_COUNT 2
> -
> -#define ATOMISP_DEPTH_DEFAULT_MASTER_SENSOR 0
> -#define ATOMISP_DEPTH_DEFAULT_SLAVE_SENSOR 1
> -
>  /* ISP2401 */
>  #define ATOMISP_ION_DEVICE_FD_OFFSET   16
>  #define ATOMISP_ION_SHARED_FD_MASK     (0xFFFF)
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index d1314bdbf7d5..d3b773bac5aa 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1173,51 +1173,6 @@ static unsigned int atomisp_sensor_start_stream(struct atomisp_sub_device *asd)
>  		return 1;
>  }
>  
> -int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
> -	bool isp_timeout)
> -{
> -	unsigned int master, slave, delay_slave = 0;
> -	int ret;
> -
> -	master = ATOMISP_DEPTH_DEFAULT_MASTER_SENSOR;
> -	slave = ATOMISP_DEPTH_DEFAULT_SLAVE_SENSOR;
> -	dev_warn(isp->dev,
> -		 "depth mode use default master=%s.slave=%s.\n",
> -		 isp->inputs[master].camera->name,
> -		 isp->inputs[slave].camera->name);
> -
> -	ret = v4l2_subdev_call(isp->inputs[master].camera, core,
> -			       ioctl, ATOMISP_IOC_G_DEPTH_SYNC_COMP,
> -			       &delay_slave);
> -	if (ret)
> -		dev_warn(isp->dev,
> -			 "get depth sensor %s compensation delay failed.\n",
> -			 isp->inputs[master].camera->name);
> -
> -	ret = v4l2_subdev_call(isp->inputs[master].camera,
> -			       video, s_stream, 1);
> -	if (ret) {
> -		dev_err(isp->dev, "depth mode master sensor %s stream-on failed.\n",
> -			isp->inputs[master].camera->name);
> -		return -EINVAL;
> -	}
> -
> -	if (delay_slave != 0)
> -		udelay(delay_slave);
> -
> -	ret = v4l2_subdev_call(isp->inputs[slave].camera,
> -			       video, s_stream, 1);
> -	if (ret) {
> -		dev_err(isp->dev, "depth mode slave sensor %s stream-on failed.\n",
> -			isp->inputs[slave].camera->name);
> -		v4l2_subdev_call(isp->inputs[master].camera, video, s_stream, 0);
> -
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  /* Input system HW workaround */
>  /* Input system address translation corrupts burst during */
>  /* invalidate. SW workaround for this is to set burst length */
> @@ -1396,19 +1351,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  			dev_dbg(isp->dev, "DFS auto mode failed!\n");
>  	}
>  
> -	if (asd->depth_mode->val && atomisp_streaming_count(isp) ==
> -	    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT) {
> -		ret = atomisp_stream_on_master_slave_sensor(isp, false);
> -		if (ret) {
> -			dev_err(isp->dev, "master slave sensor stream on failed!\n");
> -			goto out_unlock;
> -		}
> -		goto start_delay_wq;
> -	} else if (asd->depth_mode->val && (atomisp_streaming_count(isp) <
> -					    ATOMISP_DEPTH_SENSOR_STREAMON_COUNT)) {
> -		goto start_delay_wq;
> -	}
> -
>  	/* Enable the CSI interface on ANN B0/K0 */
>  	if (isp->media_dev.hw_revision >= ((ATOMISP_HW_REVISION_ISP2401 <<
>  					    ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0)) {
> @@ -1427,7 +1369,6 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto out_unlock;
>  	}
>  
> -start_delay_wq:
>  	if (asd->continuous_mode->val) {
>  		atomisp_subdev_get_ffmt(&asd->subdev, NULL,
>  				        V4L2_SUBDEV_FORMAT_ACTIVE,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> index 59e071f035f9..93139decf1d0 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
> @@ -53,9 +53,6 @@ unsigned int atomisp_streaming_count(struct atomisp_device *isp);
>  long atomisp_compat_ioctl32(struct file *file,
>  			    unsigned int cmd, unsigned long arg);
>  
> -int atomisp_stream_on_master_slave_sensor(struct atomisp_device *isp,
> -	bool isp_timeout);
> -
>  int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count);
>  void atomisp_stop_streaming(struct vb2_queue *vq);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> index 9cfb85c61db6..4cbe900d3ca1 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
> @@ -758,23 +758,9 @@ static int s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct atomisp_sub_device *asd = container_of(
>  					     ctrl->handler, struct atomisp_sub_device, ctrl_handler);
> -	unsigned int streaming;
> -	unsigned long flags;
> -
>  	switch (ctrl->id) {
>  	case V4L2_CID_RUN_MODE:
>  		return __atomisp_update_run_mode(asd);
> -	case V4L2_CID_DEPTH_MODE:
> -		/* Use spinlock instead of mutex to avoid possible locking issues */
> -		spin_lock_irqsave(&asd->isp->lock, flags);
> -		streaming = asd->streaming;
> -		spin_unlock_irqrestore(&asd->isp->lock, flags);
> -		if (streaming != ATOMISP_DEVICE_STREAMING_DISABLED) {
> -			dev_err(asd->isp->dev,
> -				"ISP is streaming, it is not supported to change the depth mode\n");
> -			return -EINVAL;
> -		}
> -		break;
>  	}
>  
>  	return 0;
> @@ -930,24 +916,6 @@ static const struct v4l2_ctrl_config ctrl_disable_dz = {
>  	.def = 0,
>  };
>  
> -/*
> - * Control for ISP depth mode
> - *
> - * When enabled, that means ISP will deal with dual streams and sensors will be
> - * in slave/master mode.
> - * slave sensor will have no output until master sensor is streamed on.
> - */
> -static const struct v4l2_ctrl_config ctrl_depth_mode = {
> -	.ops = &ctrl_ops,
> -	.id = V4L2_CID_DEPTH_MODE,
> -	.type = V4L2_CTRL_TYPE_BOOLEAN,
> -	.name = "Depth mode",
> -	.min = 0,
> -	.max = 1,
> -	.step = 1,
> -	.def = 0,
> -};
> -
>  static int atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
>  				    struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
>  {
> @@ -1086,10 +1054,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
>  	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
>  				 &ctrl_enable_raw_buffer_lock,
>  				 NULL);
> -	asd->depth_mode =
> -	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
> -				 &ctrl_depth_mode,
> -				 NULL);
>  	asd->disable_dz =
>  	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
>  				 &ctrl_disable_dz,
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> index daa6077a83bd..5cf8f3d9c916 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
> @@ -266,7 +266,6 @@ struct atomisp_sub_device {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *fmt_auto;
>  	struct v4l2_ctrl *run_mode;
> -	struct v4l2_ctrl *depth_mode;
>  	struct v4l2_ctrl *vfpp;
>  	struct v4l2_ctrl *continuous_mode;
>  	struct v4l2_ctrl *continuous_raw_buffer_size;
> -- 
> 2.39.1
> 

-- 
With Best Regards,
Andy Shevchenko


