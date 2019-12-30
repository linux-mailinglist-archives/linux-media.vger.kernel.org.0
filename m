Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8FBB12CDC8
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 09:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfL3Ikw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 03:40:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:25678 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727175AbfL3Ikw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 03:40:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 00:40:50 -0800
X-IronPort-AV: E=Sophos;i="5.69,374,1571727600"; 
   d="scan'208";a="221084586"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 00:40:48 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BFD3020628; Mon, 30 Dec 2019 10:40:46 +0200 (EET)
Date:   Mon, 30 Dec 2019 10:40:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: staging/intel-ipu3: make imgu use fixed running
 mode
Message-ID: <20191230084046.GE19828@paasikivi.fi.intel.com>
References: <1577683024-25937-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577683024-25937-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch.

On Mon, Dec 30, 2019 at 01:17:04PM +0800, Bingbu Cao wrote:
> Currently, the imgu running mode need user to set by v4l2 ctrl.
> However, imgu only support 2 pipes and 2 operation modes - video and
> still. This patch make the first imgu subdev running as video and second
> one running as still, it will make the user understand easily, it can
> also cover current camera use cases requirement. The running mode is set
> during subdev registering, no race-condition after change, so it is safe
> to change the mode data type to integer.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  Documentation/media/v4l-drivers/ipu3.rst        |  6 +--
>  drivers/staging/media/ipu3/include/intel-ipu3.h |  4 --
>  drivers/staging/media/ipu3/ipu3-v4l2.c          | 64 +++----------------------
>  drivers/staging/media/ipu3/ipu3.h               |  4 +-
>  4 files changed, 11 insertions(+), 67 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/ipu3.rst b/Documentation/media/v4l-drivers/ipu3.rst
> index e4904ab44e60..50bd264a3408 100644
> --- a/Documentation/media/v4l-drivers/ipu3.rst
> +++ b/Documentation/media/v4l-drivers/ipu3.rst
> @@ -234,9 +234,9 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
>  Firmware binary selection
>  -------------------------
>  
> -The firmware binary is selected using the V4L2_CID_INTEL_IPU3_MODE, currently
> -defined in drivers/staging/media/ipu3/include/intel-ipu3.h . "VIDEO" and "STILL"
> -modes are available.
> +The firmware binary is selected according to the running mode of imgu. There are
> +2 modes are available - "video" and "still". "ipu3-imgu video" are running under
> +"video" mode and "ipu3-imgu still" is running under "still" mode.
>  
>  Processing the image in raw Bayer format
>  ----------------------------------------
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 08eaa0bad0de..d30d9d6c92db 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -12,10 +12,6 @@
>  #define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
>  #define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
>  
> -/* from include/uapi/linux/v4l2-controls.h */
> -#define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
> -#define V4L2_CID_INTEL_IPU3_MODE	(V4L2_CID_INTEL_IPU3_BASE + 1)
> -
>  /******************* ipu3_uapi_stats_3a *******************/
>  
>  #define IPU3_UAPI_MAX_STRIPES				2
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 3c7ad1eed434..4d9c3dde5036 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -67,8 +67,6 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
>  
>  	dev_dbg(dev, "%s %d for pipe %u", __func__, enable, pipe);
> -	/* grab ctrl after streamon and return after off */
> -	v4l2_ctrl_grab(imgu_sd->ctrl, enable);
>  
>  	if (!enable) {
>  		imgu_sd->active = false;
> @@ -96,7 +94,7 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (imgu_pipe->nodes[IMGU_NODE_VF].enabled)
>  		css_pipe->vf_output_en = true;
>  
> -	if (atomic_read(&imgu_sd->running_mode) == IPU3_RUNNING_MODE_VIDEO)
> +	if (imgu_sd->running_mode == IPU3_RUNNING_MODE_VIDEO)
>  		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_VIDEO;
>  	else
>  		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_CAPTURE;
> @@ -668,7 +666,7 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
>  	if (imgu_pipe->nodes[IMGU_NODE_VF].enabled)
>  		css_pipe->vf_output_en = true;
>  
> -	if (atomic_read(&imgu_sd->running_mode) == IPU3_RUNNING_MODE_VIDEO)
> +	if (imgu_sd->running_mode == IPU3_RUNNING_MODE_VIDEO)
>  		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_VIDEO;
>  	else
>  		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_CAPTURE;
> @@ -1011,44 +1009,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_meta_ioctl_ops = {
>  	.vidioc_expbuf = vb2_ioctl_expbuf,
>  };
>  
> -static int imgu_sd_s_ctrl(struct v4l2_ctrl *ctrl)
> -{
> -	struct imgu_v4l2_subdev *imgu_sd =
> -		container_of(ctrl->handler, struct imgu_v4l2_subdev, ctrl_handler);
> -	struct imgu_device *imgu = v4l2_get_subdevdata(&imgu_sd->subdev);
> -	struct device *dev = &imgu->pci_dev->dev;
> -
> -	dev_dbg(dev, "set val %d to ctrl 0x%8x for subdev %u",
> -		ctrl->val, ctrl->id, imgu_sd->pipe);
> -
> -	switch (ctrl->id) {
> -	case V4L2_CID_INTEL_IPU3_MODE:
> -		atomic_set(&imgu_sd->running_mode, ctrl->val);
> -		return 0;
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -static const struct v4l2_ctrl_ops imgu_subdev_ctrl_ops = {
> -	.s_ctrl = imgu_sd_s_ctrl,
> -};
> -
> -static const char * const imgu_ctrl_mode_strings[] = {
> -	"Video mode",
> -	"Still mode",
> -};
> -
> -static const struct v4l2_ctrl_config imgu_subdev_ctrl_mode = {
> -	.ops = &imgu_subdev_ctrl_ops,
> -	.id = V4L2_CID_INTEL_IPU3_MODE,
> -	.name = "IPU3 Pipe Mode",
> -	.type = V4L2_CTRL_TYPE_MENU,
> -	.max = ARRAY_SIZE(imgu_ctrl_mode_strings) - 1,
> -	.def = IPU3_RUNNING_MODE_VIDEO,
> -	.qmenu = imgu_ctrl_mode_strings,
> -};
> -
>  /******************** Framework registration ********************/
>  
>  /* helper function to config node's video properties */
> @@ -1094,7 +1054,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
>  				     unsigned int pipe)
>  {
>  	int i, r;
> -	struct v4l2_ctrl_handler *hdl = &imgu_sd->ctrl_handler;
>  	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
>  
>  	/* Initialize subdev media entity */
> @@ -1118,18 +1077,10 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
>  	imgu_sd->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>  				V4L2_SUBDEV_FL_HAS_EVENTS;

As the driver only supported control events, you can remove the support for
events, too, as there are none left now. I.e. the event (un)subscription
callback plus this flag, and the associated headers if any.

>  	snprintf(imgu_sd->subdev.name, sizeof(imgu_sd->subdev.name),
> -		 "%s %u", IMGU_NAME, pipe);
> +		 "%s %s", IMGU_NAME, pipe ? "still" : "video");
>  	v4l2_set_subdevdata(&imgu_sd->subdev, imgu);
> -	atomic_set(&imgu_sd->running_mode, IPU3_RUNNING_MODE_VIDEO);
> -	v4l2_ctrl_handler_init(hdl, 1);
> -	imgu_sd->subdev.ctrl_handler = hdl;
> -	imgu_sd->ctrl = v4l2_ctrl_new_custom(hdl, &imgu_subdev_ctrl_mode, NULL);
> -	if (hdl->error) {
> -		r = hdl->error;
> -		dev_err(&imgu->pci_dev->dev,
> -			"failed to create subdev v4l2 ctrl with err %d", r);
> -		goto fail_subdev;
> -	}
> +	imgu_sd->running_mode =
> +		pipe ? IPU3_RUNNING_MODE_STILL : IPU3_RUNNING_MODE_VIDEO;
>  	r = v4l2_device_register_subdev(&imgu->v4l2_dev, &imgu_sd->subdev);
>  	if (r) {
>  		dev_err(&imgu->pci_dev->dev,
> @@ -1141,7 +1092,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
>  	return 0;
>  
>  fail_subdev:
> -	v4l2_ctrl_handler_free(imgu_sd->subdev.ctrl_handler);
>  	media_entity_cleanup(&imgu_sd->subdev.entity);
>  
>  	return r;
> @@ -1236,8 +1186,8 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
>  	}
>  
>  	/* Initialize vdev */
> -	snprintf(vdev->name, sizeof(vdev->name), "%s %u %s",
> -		 IMGU_NAME, pipe, node->name);
> +	snprintf(vdev->name, sizeof(vdev->name), "%s %s %s",
> +		 IMGU_NAME, pipe ? "still" : "video", node->name);
>  	vdev->release = video_device_release_empty;
>  	vdev->fops = &imgu_v4l2_fops;
>  	vdev->lock = &node->lock;
> diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
> index 73b123b2b8a2..63db6fe544ef 100644
> --- a/drivers/staging/media/ipu3/ipu3.h
> +++ b/drivers/staging/media/ipu3/ipu3.h
> @@ -96,9 +96,7 @@ struct imgu_v4l2_subdev {
>  		struct v4l2_rect bds; /* bayer-domain scaled resolution*/
>  		struct v4l2_rect gdc; /* gdc output resolution */
>  	} rect;
> -	struct v4l2_ctrl_handler ctrl_handler;
> -	struct v4l2_ctrl *ctrl;
> -	atomic_t running_mode;
> +	unsigned int running_mode;
>  	bool active;
>  };
>  

-- 
Kind regards,

Sakari Ailus
