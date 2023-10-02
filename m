Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64B07B593C
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 19:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237923AbjJBRij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 13:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238132AbjJBRii (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 13:38:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790FCCE
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 10:38:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [88.124.123.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D25AB9CA;
        Mon,  2 Oct 2023 19:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696268206;
        bh=3l4oDmH4T0E/m63aMZuTD8aFpqD5BOzGnYkXrGUmR0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmXStysw9Ubo/ks4ISMGVRgLONIqYYxjZ7Gk3YYCz+iE0c2QwKn63vuKaV2UOQhus
         MqQsTxoLDnBYoX1O1i1G7PxGGIN3EoU/RSH5RH6AvM7zYBCZzyRRO5K9DprcXBn+Mw
         L+7q6Eo0J7UuE+e3oq6VE1rxSMeZgk6TYDN5b+PI=
Date:   Mon, 2 Oct 2023 20:38:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        Claus Stovgaard <claus.stovgaard@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: Re: [PATCH 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <20231002173841.GD10113@pendragon.ideasonboard.com>
References: <769ebe9f8eb88b2c07eae5910fc7d79c1ff888cb.camel@gmail.com>
 <5fb07c7d-390c-d7ae-c74b-8e03c75f636c@linux.intel.com>
 <0a381077-c07a-ed40-c53e-5e36177bd5f2@linux.intel.com>
 <907f992d4e333f090418f39ebd59bf8ac1fb5e3f.camel@gmail.com>
 <d451bbec67358373ca8495544cc0802233108a03.camel@gmail.com>
 <1d03c5f9-1813-40f0-f280-520e2da38e09@hansg.org>
 <1d46186b-24a6-3ae9-ccc1-0ada0f068313@redhat.com>
 <253b5ba6-d44d-4ee1-8c18-44159632d023@redhat.com>
 <DM8PR11MB565393F11EDB68BB5784661C99E9A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <bc4a6204-6487-9403-243d-6f0a1b20e8ab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bc4a6204-6487-9403-243d-6f0a1b20e8ab@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 02, 2023 at 07:19:13PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/4/23 05:13, Cao, Bingbu wrote:
> > Hans,
> > 
> > Thanks for your test and report.
> > 
> > I have made some changes locally which will support the latest
> > v4l2-async APIs, I will also add the fix for this issue and merge
> > them in v3.
> 
> I have been trying to make rawbayer capture with the mainline isys code
> work in libcamera and I have hit several short comings in the ipu6-isys
> code. I have attached 3 patches to fix various issues please integrate
> these into the next version of this series.

They look good to me.

> Talking about the next version of this series, I think it would be
> good to post a new version soon ?
> 

> From 14f42fd3071a7aba8b83b98802ca3b413794296d Mon Sep 17 00:00:00 2001
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Mon, 2 Oct 2023 16:37:11 +0200
> Subject: [PATCH 1/3] media: intel/ipu6: Add mbus code filtering to isys
>  /dev/video enum_fmt
> 
> Add mbus code filtering to ipu6_isys_vidioc_enum_fmt().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index dc1605491352..20fd03f6f204 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -130,14 +130,31 @@ int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
>  int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>  			      struct v4l2_fmtdesc *f)
>  {
> -	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
> -		return -EINVAL;
> +	unsigned int i, found = 0;
>  
> -	f->flags = 0;
> -	f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
> -	f->mbus_code = ipu6_isys_pfmts[f->index].code;
> +	if (!f->mbus_code) {
> +		if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
> +			return -EINVAL;
>  
> -	return 0;
> +		f->flags = 0;
> +		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
> +		f->mbus_code = ipu6_isys_pfmts[f->index].code;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
> +		if (f->mbus_code != ipu6_isys_pfmts[i].code)
> +			continue;
> +
> +		if (f->index == found) {
> +			f->flags = 0;
> +			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
> +			return 0;
> +		}
> +
> +		found++;
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
> -- 
> 2.41.0
> 

> From 8250d2c3fd1c2ab83debcca80b4947d3b9d410f7 Mon Sep 17 00:00:00 2001
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Mon, 2 Oct 2023 17:02:06 +0200
> Subject: [PATCH 2/3] media: intel/ipu6: Implement g_enum_framesizes for isys
>  /dev/video# nodes
> 
> Implement g_enum_framesizes for isys /dev/video# nodes.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index 20fd03f6f204..ad74a19527b7 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -157,6 +157,23 @@ int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
>  	return -EINVAL;
>  }
>  
> +static int ipu6_isys_vidioc_g_enum_framesizes(struct file *file, void *fh,
> +					      struct v4l2_frmsizeenum *fsize)
> +{
> +	if (fsize->index > 0)
> +		return -EINVAL;
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +	fsize->stepwise.min_width = IPU6_ISYS_MIN_WIDTH;
> +	fsize->stepwise.max_width = IPU6_ISYS_MAX_WIDTH;
> +	fsize->stepwise.min_height = IPU6_ISYS_MIN_HEIGHT;
> +	fsize->stepwise.max_height = IPU6_ISYS_MAX_HEIGHT;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.step_height = 1;
> +
> +	return 0;
> +}
> +
>  static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
>  				       struct v4l2_format *fmt)
>  {
> @@ -987,6 +1004,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
>  static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>  	.vidioc_querycap = ipu6_isys_vidioc_querycap,
>  	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
> +	.vidioc_enum_framesizes = ipu6_isys_vidioc_g_enum_framesizes,
>  	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_vid_cap_mplane,
>  	.vidioc_s_fmt_vid_cap_mplane = vidioc_s_fmt_vid_cap_mplane,
>  	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_vid_cap_mplane,
> -- 
> 2.41.0
> 

> From b5db94bbd147711885986c1f6e46f59fdca10d3c Mon Sep 17 00:00:00 2001
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Mon, 2 Oct 2023 16:05:35 +0200
> Subject: [PATCH 3/3] media: intel/ipu6: Set V4L2_CAP_IO_MC flag for isys
>  /dev/video# nodes
> 
> The IPU6 isys is a media-controller centric device which needs
> the pipeline to be configured using the media controller API before use.
> 
> Set the V4L2_CAP_IO_MC flag to reflect this.
> 
> This also allows dropping of the enum_input() g_input() and s_input()
> implementations, with V4L2_CAP_IO_MC set the v4l2-core will take care
> of those.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 29 ++-----------------
>  1 file changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> index ad74a19527b7..e6fc32603c3f 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
> @@ -262,29 +262,6 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int vidioc_enum_input(struct file *file, void *fh,
> -			     struct v4l2_input *input)
> -{
> -	if (input->index > 0)
> -		return -EINVAL;
> -	strscpy(input->name, "camera", sizeof(input->name));
> -	input->type = V4L2_INPUT_TYPE_CAMERA;
> -
> -	return 0;
> -}
> -
> -static int vidioc_g_input(struct file *file, void *fh, unsigned int *input)
> -{
> -	*input = 0;
> -
> -	return 0;
> -}
> -
> -static int vidioc_s_input(struct file *file, void *fh, unsigned int input)
> -{
> -	return input == 0 ? 0 : -EINVAL;
> -}
> -
>  static int link_validate(struct media_link *link)
>  {
>  	struct ipu6_isys_video *av =
> @@ -1017,9 +994,6 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
>  	.vidioc_streamon = vb2_ioctl_streamon,
>  	.vidioc_streamoff = vb2_ioctl_streamoff,
>  	.vidioc_expbuf = vb2_ioctl_expbuf,
> -	.vidioc_enum_input = vidioc_enum_input,
> -	.vidioc_g_input = vidioc_g_input,
> -	.vidioc_s_input = vidioc_s_input,
>  };
>  
>  static const struct media_entity_operations entity_ops = {
> @@ -1217,7 +1191,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
>  
>  	mutex_init(&av->mutex);
>  	av->vdev.device_caps = V4L2_CAP_STREAMING |
> -			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
> +			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +			       V4L2_CAP_IO_MC;
>  	av->vdev.vfl_dir = VFL_DIR_RX;
>  
>  	ret = ipu6_isys_queue_init(&av->aq);
> -- 
> 2.41.0
> 


-- 
Regards,

Laurent Pinchart
