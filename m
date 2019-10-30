Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0891E9A46
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2019 11:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfJ3KoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Oct 2019 06:44:23 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:39063 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbfJ3KoW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Oct 2019 06:44:22 -0400
Received: from [172.20.50.122] ([91.217.168.176])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PlSZiZGw0sBskPlSciLuKw; Wed, 30 Oct 2019 11:44:19 +0100
Subject: Re: [PATCH v3] media: vimc: Make capture devices and subdevices use
 different link_validates
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20191030003209.1997739-1-nfraprado@protonmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cbbfbe59-1692-d669-81f4-b29c44df4bf7@xs4all.nl>
Date:   Wed, 30 Oct 2019 11:44:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030003209.1997739-1-nfraprado@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBlKWpOeLzuwxkFlO8N1PzRdib+hyaGlEB2YalgLgFCwBRRDiD3aDbVpXhiktEGl1iG7GRcAYq4iEnm991AaB+k7pxWniqem/puzdcP8+qesNh54fD5b
 s3uHlAPU7yUBTq3W2aREnEFQolII3J0vAqiPjd8+zvT6f+gf93N8H6jbgg+j5A2q6rEryY2BIuQMUnQ+9yTWPxvvzO1l3mKzO1hpdwT6FSiy5kv+21ickkGM
 +sAdGpMaKmyewZwVwwWKRc0HyNck0cZSkRls1maBmRAVwj5RMNVa5kj0hbsbi9DxxqLJcDIvcayEzoVtiKqPqjFkugN6jLmlNVn9JHogsmdJ/6y4XL1y7lP3
 +BeTJVE27xaTbFfLuXmHSpAPSAlcFMDVc1e1nWU27kjHo57Uzc3+oim6oPio5J1wHze8n4oH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/30/19 1:33 AM, Nícolas F. R. A. Prado wrote:
> Instead of validating the links to capture devices and subdevices with
> the same function, use the default v4l function for links between
> subdevices and only use a different function for validating between
> capture device and subdevice.
> This change should also ease future work to associate multiple mbus
> codes for the same pixelformat in vimc_pix_map.
> 
> These changes were tested with
> v4l2-compliance SHA: 3f806630e2ecbcebe31872b865c5c4b42f111a99, 64 bits
> and passed all tests:
> Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>Applying: media: vimc: Make capture devices and subdevices use different link_validates

Hi Nicolas,

Checkpatch gives me this:

CHECK: Logical continuations should be on the previous line
#116: FILE: drivers/media/platform/vimc/vimc-common.c:265:
+       if (source_fmt.width != sink_fmt.width
+           || source_fmt.height != sink_fmt.height

CHECK: Logical continuations should be on the previous line
#117: FILE: drivers/media/platform/vimc/vimc-common.c:266:
+           || source_fmt.height != sink_fmt.height
+           || source_fmt.pixelformat != sink_fmt.pixelformat)

CHECK: Logical continuations should be on the previous line
#138: FILE: drivers/media/platform/vimc/vimc-common.c:283:
+       if (source_fmt.colorspace == V4L2_COLORSPACE_DEFAULT
+           || sink_fmt.colorspace == V4L2_COLORSPACE_DEFAULT)

CHECK: Logical continuations should be on the previous line
#151: FILE: drivers/media/platform/vimc/vimc-common.c:292:
+       if (source_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
+           && sink_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT

CHECK: Logical continuations should be on the previous line
#152: FILE: drivers/media/platform/vimc/vimc-common.c:293:
+           && sink_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
+           && source_fmt.ycbcr_enc != sink_fmt.ycbcr_enc)

CHECK: Logical continuations should be on the previous line
#159: FILE: drivers/media/platform/vimc/vimc-common.c:297:
+       if (source_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
+           && sink_fmt.quantization != V4L2_QUANTIZATION_DEFAULT

CHECK: Logical continuations should be on the previous line
#160: FILE: drivers/media/platform/vimc/vimc-common.c:298:
+           && sink_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
+           && source_fmt.quantization != sink_fmt.quantization)

CHECK: Logical continuations should be on the previous line
#167: FILE: drivers/media/platform/vimc/vimc-common.c:302:
+       if (source_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
+           && sink_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT

CHECK: Logical continuations should be on the previous line
#168: FILE: drivers/media/platform/vimc/vimc-common.c:303:
+           && sink_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
+           && source_fmt.xfer_func != sink_fmt.xfer_func)

Can you fix this in a v4?

Regards,

	Hans

> ---
> Changes in v3:
> - Rebase patch on current media tree
> - Make vimc_get_pix_format() static
> 
> Changes in v2:
> - Remove blank lines
> - Rename vimc_cap_link_validate to vimc_vdev_link_validate and move it back to
>    vimc-common.c
> - Fix style issue on vimc_get_pix_format header
> - Remove vimc_get_pix_format declaration from vimc-common.h
> 
>   drivers/media/platform/vimc/vimc-capture.c |  2 +-
>   drivers/media/platform/vimc/vimc-common.c  | 85 +++++++++++-----------
>   drivers/media/platform/vimc/vimc-common.h  |  4 +-
>   3 files changed, 46 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
> index a5d79fb25dff..76c015898cfd 100644
> --- a/drivers/media/platform/vimc/vimc-capture.c
> +++ b/drivers/media/platform/vimc/vimc-capture.c
> @@ -322,7 +322,7 @@ static const struct vb2_ops vimc_cap_qops = {
>   };
>   
>   static const struct media_entity_operations vimc_cap_mops = {
> -	.link_validate		= vimc_link_validate,
> +	.link_validate		= vimc_vdev_link_validate,
>   };
>   
>   static void vimc_cap_release(struct video_device *vdev)
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index 2a0c40e9ae88..eb1cac0c01d6 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -194,35 +194,36 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat)
>   	return NULL;
>   }
>   
> -static int vimc_get_mbus_format(struct media_pad *pad,
> -				struct v4l2_subdev_format *fmt)
> +static int vimc_get_pix_format(struct media_pad *pad,
> +			       struct v4l2_pix_format *fmt)
>   {
>   	if (is_media_entity_v4l2_subdev(pad->entity)) {
>   		struct v4l2_subdev *sd =
>   			media_entity_to_v4l2_subdev(pad->entity);
> +		struct v4l2_subdev_format sd_fmt;
> +		const struct vimc_pix_map *pix_map;
>   		int ret;
>   
> -		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -		fmt->pad = pad->index;
> +		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		sd_fmt.pad = pad->index;
>   
> -		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
> +		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>   		if (ret)
>   			return ret;
>   
> +		v4l2_fill_pix_format(fmt, &sd_fmt.format);
> +		pix_map = vimc_pix_map_by_code(sd_fmt.format.code);
> +		fmt->pixelformat = pix_map->pixelformat;
>   	} else if (is_media_entity_v4l2_video_device(pad->entity)) {
>   		struct video_device *vdev = container_of(pad->entity,
>   							 struct video_device,
>   							 entity);
>   		struct vimc_ent_device *ved = video_get_drvdata(vdev);
> -		const struct vimc_pix_map *vpix;
> -		struct v4l2_pix_format vdev_fmt;
>   
>   		if (!ved->vdev_get_format)
>   			return -ENOIOCTLCMD;
>   
> -		ved->vdev_get_format(ved, &vdev_fmt);
> -		vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
> -		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
> +		ved->vdev_get_format(ved, fmt);
>   	} else {
>   		return -EINVAL;
>   	}
> @@ -230,16 +231,16 @@ static int vimc_get_mbus_format(struct media_pad *pad,
>   	return 0;
>   }
>   
> -int vimc_link_validate(struct media_link *link)
> +int vimc_vdev_link_validate(struct media_link *link)
>   {
> -	struct v4l2_subdev_format source_fmt, sink_fmt;
> +	struct v4l2_pix_format source_fmt, sink_fmt;
>   	int ret;
>   
> -	ret = vimc_get_mbus_format(link->source, &source_fmt);
> +	ret = vimc_get_pix_format(link->source, &source_fmt);
>   	if (ret)
>   		return ret;
>   
> -	ret = vimc_get_mbus_format(link->sink, &sink_fmt);
> +	ret = vimc_get_pix_format(link->sink, &sink_fmt);
>   	if (ret)
>   		return ret;
>   
> @@ -248,21 +249,21 @@ int vimc_link_validate(struct media_link *link)
>   		"%s:snk:%dx%d (0x%x, %d, %d, %d, %d)\n",
>   		/* src */
>   		link->source->entity->name,
> -		source_fmt.format.width, source_fmt.format.height,
> -		source_fmt.format.code, source_fmt.format.colorspace,
> -		source_fmt.format.quantization, source_fmt.format.xfer_func,
> -		source_fmt.format.ycbcr_enc,
> +		source_fmt.width, source_fmt.height,
> +		source_fmt.pixelformat, source_fmt.colorspace,
> +		source_fmt.quantization, source_fmt.xfer_func,
> +		source_fmt.ycbcr_enc,
>   		/* sink */
>   		link->sink->entity->name,
> -		sink_fmt.format.width, sink_fmt.format.height,
> -		sink_fmt.format.code, sink_fmt.format.colorspace,
> -		sink_fmt.format.quantization, sink_fmt.format.xfer_func,
> -		sink_fmt.format.ycbcr_enc);
> -
> -	/* The width, height and code must match. */
> -	if (source_fmt.format.width != sink_fmt.format.width
> -	    || source_fmt.format.height != sink_fmt.format.height
> -	    || source_fmt.format.code != sink_fmt.format.code)
> +		sink_fmt.width, sink_fmt.height,
> +		sink_fmt.pixelformat, sink_fmt.colorspace,
> +		sink_fmt.quantization, sink_fmt.xfer_func,
> +		sink_fmt.ycbcr_enc);
> +
> +	/* The width, height and pixelformat must match. */
> +	if (source_fmt.width != sink_fmt.width
> +	    || source_fmt.height != sink_fmt.height
> +	    || source_fmt.pixelformat != sink_fmt.pixelformat)
>   		return -EPIPE;
>   
>   	/*
> @@ -270,43 +271,43 @@ int vimc_link_validate(struct media_link *link)
>   	 * to support interlaced hardware connected to bridges that support
>   	 * progressive formats only.
>   	 */
> -	if (source_fmt.format.field != sink_fmt.format.field &&
> -	    sink_fmt.format.field != V4L2_FIELD_NONE)
> +	if (source_fmt.field != sink_fmt.field &&
> +	    sink_fmt.field != V4L2_FIELD_NONE)
>   		return -EPIPE;
>   
>   	/*
>   	 * If colorspace is DEFAULT, then assume all the colorimetry is also
>   	 * DEFAULT, return 0 to skip comparing the other colorimetry parameters
>   	 */
> -	if (source_fmt.format.colorspace == V4L2_COLORSPACE_DEFAULT
> -	    || sink_fmt.format.colorspace == V4L2_COLORSPACE_DEFAULT)
> +	if (source_fmt.colorspace == V4L2_COLORSPACE_DEFAULT
> +	    || sink_fmt.colorspace == V4L2_COLORSPACE_DEFAULT)
>   		return 0;
>   
>   	/* Colorspace must match. */
> -	if (source_fmt.format.colorspace != sink_fmt.format.colorspace)
> +	if (source_fmt.colorspace != sink_fmt.colorspace)
>   		return -EPIPE;
>   
>   	/* Colorimetry must match if they are not set to DEFAULT */
> -	if (source_fmt.format.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
> -	    && sink_fmt.format.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
> -	    && source_fmt.format.ycbcr_enc != sink_fmt.format.ycbcr_enc)
> +	if (source_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
> +	    && sink_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
> +	    && source_fmt.ycbcr_enc != sink_fmt.ycbcr_enc)
>   		return -EPIPE;
>   
> -	if (source_fmt.format.quantization != V4L2_QUANTIZATION_DEFAULT
> -	    && sink_fmt.format.quantization != V4L2_QUANTIZATION_DEFAULT
> -	    && source_fmt.format.quantization != sink_fmt.format.quantization)
> +	if (source_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
> +	    && sink_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
> +	    && source_fmt.quantization != sink_fmt.quantization)
>   		return -EPIPE;
>   
> -	if (source_fmt.format.xfer_func != V4L2_XFER_FUNC_DEFAULT
> -	    && sink_fmt.format.xfer_func != V4L2_XFER_FUNC_DEFAULT
> -	    && source_fmt.format.xfer_func != sink_fmt.format.xfer_func)
> +	if (source_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
> +	    && sink_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
> +	    && source_fmt.xfer_func != sink_fmt.xfer_func)
>   		return -EPIPE;
>   
>   	return 0;
>   }
>   
>   static const struct media_entity_operations vimc_ent_sd_mops = {
> -	.link_validate = vimc_link_validate,
> +	.link_validate = v4l2_subdev_link_validate,
>   };
>   
>   int vimc_ent_sd_register(struct vimc_ent_device *ved,
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index c75401a36312..bf729fcde6a9 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -206,12 +206,12 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>   			 const struct v4l2_subdev_ops *sd_ops);
>   
>   /**
> - * vimc_link_validate - validates a media link
> + * vimc_vdev_link_validate - validates a media link
>    *
>    * @link: pointer to &struct media_link
>    *
>    * This function calls validates if a media link is valid for streaming.
>    */
> -int vimc_link_validate(struct media_link *link);
> +int vimc_vdev_link_validate(struct media_link *link);
>   
>   #endif
> 

