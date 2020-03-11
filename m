Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E966D180D55
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 02:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgCKBMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 21:12:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59066 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbgCKBMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 21:12:24 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0B405F;
        Wed, 11 Mar 2020 02:12:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583889143;
        bh=fT87LKgUGKRwMBFuoLXk1MFukcb5S5yozpDF6AlqRL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PE95eF93gC9wcMggYb+MGUgz+maoxgMQ5LaYJu6tk7Klz3/LvUAnafk1Qm5q8fV9A
         TJwW3aV5gcIEkiaoLdcgA8kpBdvHRmyWOrh/1aVCi/Qa95UMdeVBwmky0PH4Dpa72z
         +HaRGiLpX+vlXySNw6Ru1lq9zJ5X0W82LBlnip6E=
Date:   Wed, 11 Mar 2020 03:12:19 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 3/3] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Message-ID: <20200311011219.GE4871@pendragon.ideasonboard.com>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
 <20200306163935.805333-4-niklas.soderlund@ragnatech.se>
 <20200309135318.GV5379@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200309135318.GV5379@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Mar 09, 2020 at 03:53:18PM +0200, Sakari Ailus wrote:
> On Fri, Mar 06, 2020 at 05:39:35PM +0100, Niklas Söderlund wrote:
> > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
> > vidioc_enum_{input,output}, vidioc_g_{input,output} and
> > vidioc_s_{input,output} callbacks.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/staging/media/ipu3/ipu3-v4l2.c | 60 +-------------------------
> >  1 file changed, 2 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > index 09c8ede1457cad96..2c42be3d995621e3 100644
> > --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> > +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> > @@ -845,54 +845,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
> >  	return 0;
> >  }
> >  
> > -static int imgu_vidioc_enum_input(struct file *file, void *fh,
> > -				  struct v4l2_input *input)
> > -{
> > -	if (input->index > 0)
> > -		return -EINVAL;
> > -	strscpy(input->name, "camera", sizeof(input->name));
> > -	input->type = V4L2_INPUT_TYPE_CAMERA;
> > -
> > -	return 0;
> > -}
> > -
> > -static int imgu_vidioc_g_input(struct file *file, void *fh, unsigned int *input)
> > -{
> > -	*input = 0;
> > -
> > -	return 0;
> > -}
> > -
> > -static int imgu_vidioc_s_input(struct file *file, void *fh, unsigned int input)
> > -{
> > -	return input == 0 ? 0 : -EINVAL;
> > -}
> > -
> > -static int imgu_vidioc_enum_output(struct file *file, void *fh,
> > -				   struct v4l2_output *output)
> > -{
> > -	if (output->index > 0)
> > -		return -EINVAL;
> > -	strscpy(output->name, "camera", sizeof(output->name));
> > -	output->type = V4L2_INPUT_TYPE_CAMERA;
> > -
> > -	return 0;
> > -}
> > -
> > -static int imgu_vidioc_g_output(struct file *file, void *fh,
> > -				unsigned int *output)
> > -{
> > -	*output = 0;
> > -
> > -	return 0;
> > -}
> > -
> > -static int imgu_vidioc_s_output(struct file *file, void *fh,
> > -				unsigned int output)
> > -{
> > -	return output == 0 ? 0 : -EINVAL;
> > -}
> > -
> >  /******************** function pointers ********************/
> >  
> >  static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
> > @@ -965,14 +917,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
> >  	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
> >  	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
> >  
> > -	.vidioc_enum_output = imgu_vidioc_enum_output,
> > -	.vidioc_g_output = imgu_vidioc_g_output,
> > -	.vidioc_s_output = imgu_vidioc_s_output,
> > -
> > -	.vidioc_enum_input = imgu_vidioc_enum_input,
> > -	.vidioc_g_input = imgu_vidioc_g_input,
> > -	.vidioc_s_input = imgu_vidioc_s_input,
> > -
> >  	/* buffer queue management */
> >  	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> >  	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> > @@ -1062,7 +1006,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
> >  
> >  	switch (node) {
> >  	case IMGU_NODE_IN:
> > -		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
> > +		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_IO_MC;
> >  		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> >  		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
> >  		break;
> > @@ -1081,7 +1025,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
> >  		imgu_css_meta_fmt_set(&f->fmt.meta);
> >  		break;
> >  	default:
> > -		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> > +		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_IO_MC;
> 
> So here, you'd add V4L2_CAP_IO_MC to all kinds of nodes.
> 
> With that,
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I like that better too. With that change,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >  		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> >  		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
> >  	}

-- 
Regards,

Laurent Pinchart
