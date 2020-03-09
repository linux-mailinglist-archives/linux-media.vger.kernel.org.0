Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECD17E1B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 14:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgCINxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 09:53:24 -0400
Received: from mga18.intel.com ([134.134.136.126]:13566 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgCINxX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 09:53:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 06:53:23 -0700
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; 
   d="scan'208";a="235602128"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 06:53:20 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7160C20AC3; Mon,  9 Mar 2020 15:53:18 +0200 (EET)
Date:   Mon, 9 Mar 2020 15:53:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 3/3] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Message-ID: <20200309135318.GV5379@paasikivi.fi.intel.com>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
 <20200306163935.805333-4-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306163935.805333-4-niklas.soderlund@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 06, 2020 at 05:39:35PM +0100, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
> vidioc_enum_{input,output}, vidioc_g_{input,output} and
> vidioc_s_{input,output} callbacks.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 60 +-------------------------
>  1 file changed, 2 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 09c8ede1457cad96..2c42be3d995621e3 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -845,54 +845,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int imgu_vidioc_enum_input(struct file *file, void *fh,
> -				  struct v4l2_input *input)
> -{
> -	if (input->index > 0)
> -		return -EINVAL;
> -	strscpy(input->name, "camera", sizeof(input->name));
> -	input->type = V4L2_INPUT_TYPE_CAMERA;
> -
> -	return 0;
> -}
> -
> -static int imgu_vidioc_g_input(struct file *file, void *fh, unsigned int *input)
> -{
> -	*input = 0;
> -
> -	return 0;
> -}
> -
> -static int imgu_vidioc_s_input(struct file *file, void *fh, unsigned int input)
> -{
> -	return input == 0 ? 0 : -EINVAL;
> -}
> -
> -static int imgu_vidioc_enum_output(struct file *file, void *fh,
> -				   struct v4l2_output *output)
> -{
> -	if (output->index > 0)
> -		return -EINVAL;
> -	strscpy(output->name, "camera", sizeof(output->name));
> -	output->type = V4L2_INPUT_TYPE_CAMERA;
> -
> -	return 0;
> -}
> -
> -static int imgu_vidioc_g_output(struct file *file, void *fh,
> -				unsigned int *output)
> -{
> -	*output = 0;
> -
> -	return 0;
> -}
> -
> -static int imgu_vidioc_s_output(struct file *file, void *fh,
> -				unsigned int output)
> -{
> -	return output == 0 ? 0 : -EINVAL;
> -}
> -
>  /******************** function pointers ********************/
>  
>  static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
> @@ -965,14 +917,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
>  	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
>  	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
>  
> -	.vidioc_enum_output = imgu_vidioc_enum_output,
> -	.vidioc_g_output = imgu_vidioc_g_output,
> -	.vidioc_s_output = imgu_vidioc_s_output,
> -
> -	.vidioc_enum_input = imgu_vidioc_enum_input,
> -	.vidioc_g_input = imgu_vidioc_g_input,
> -	.vidioc_s_input = imgu_vidioc_s_input,
> -
>  	/* buffer queue management */
>  	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>  	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> @@ -1062,7 +1006,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
>  
>  	switch (node) {
>  	case IMGU_NODE_IN:
> -		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
> +		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_IO_MC;
>  		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>  		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
>  		break;
> @@ -1081,7 +1025,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
>  		imgu_css_meta_fmt_set(&f->fmt.meta);
>  		break;
>  	default:
> -		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> +		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_IO_MC;

So here, you'd add V4L2_CAP_IO_MC to all kinds of nodes.

With that,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
>  	}

-- 
Sakari Ailus
