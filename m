Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5975F20A3
	for <lists+linux-media@lfdr.de>; Sun,  2 Oct 2022 01:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiJAXtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Oct 2022 19:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiJAXs6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Oct 2022 19:48:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B911C357D2
        for <linux-media@vger.kernel.org>; Sat,  1 Oct 2022 16:48:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 911A52D8;
        Sun,  2 Oct 2022 01:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664668135;
        bh=/3ivyLjJTD88T8vHVOnb2aVT5Wk2GpeGnX950Tf7zPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CyWf3L4bUrgcOhMwITBoVsyxaEoErIhzufq9ssUQcLi5Bgf+Q1a1+XlkeiHNbK5O3
         UJfBincU7zp5zmIAcrWIACLdz3dV2yJmNpmRPbPHkxBvrY7tpdNga9r8EFdpZOGij1
         wDuSc1bHIy54YEcxMyYsORt6ZBtYGet8jb8Gb9LE=
Date:   Sun, 2 Oct 2022 02:48:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     m.szyprowski@samsung.com, hverkuil@xs4all.nl,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v6 2/4] vb2: add allow_zero_bytesused flag to the
 vb2_queue struct
Message-ID: <YzjR5ajfLfMXvC4D@pendragon.ideasonboard.com>
References: <1424694379-11115-1-git-send-email-k.debski@samsung.com>
 <1424694379-11115-2-git-send-email-k.debski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1424694379-11115-2-git-send-email-k.debski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

While working on fixing occurrences of

[   54.375534] use of bytesused == 0 is deprecated and will be removed in the future,
[   54.388026] use the actual size instead.

in libcamera, I realized that the patch that initially introduced the
warning and deprecated setting bytesused to 0 didn't change the V4L2 API
specification, which still documents bytesused as

    [...] If the application sets this to 0 for an output stream, then
    bytesused will be set to the size of the buffer (see the length
    field of this struct) by the driver. [...]

for both v4l2_buffer and v4l2_plane.

This deprecated behaviour has been present in the kernel for 7 years and
a half now. I'm wondering if it's really deprecated, in which case we
should update the API specification, or if it should be considered
supported, in which case the warning should be dropped.

On Mon, Feb 23, 2015 at 01:26:17PM +0100, Kamil Debski wrote:
> The vb2: fix bytesused == 0 handling (8a75ffb) patch changed the behavior
> of __fill_vb2_buffer function, so that if bytesused is 0 it is set to the
> size of the buffer. However, bytesused set to 0 is used by older codec
> drivers as as indication used to mark the end of stream.
> 
> To keep backward compatibility, this patch adds a flag passed to the
> vb2_queue_init function - allow_zero_bytesused. If the flag is set upon
> initialization of the queue, the videobuf2 keeps the value of bytesused
> intact in the OUTPUT queue and passes it to the driver.
> 
> Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> ---
>  drivers/media/v4l2-core/videobuf2-core.c |   39 +++++++++++++++++++++++++-----
>  include/media/videobuf2-core.h           |    2 ++
>  2 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v4l2-core/videobuf2-core.c
> index 5cd60bf..33a5d93 100644
> --- a/drivers/media/v4l2-core/videobuf2-core.c
> +++ b/drivers/media/v4l2-core/videobuf2-core.c
> @@ -1247,6 +1247,16 @@ static void __fill_vb2_buffer(struct vb2_buffer *vb, const struct v4l2_buffer *b
>  {
>  	unsigned int plane;
>  
> +	if (V4L2_TYPE_IS_OUTPUT(b->type)) {
> +		if (WARN_ON_ONCE(b->bytesused == 0)) {
> +			pr_warn_once("use of bytesused == 0 is deprecated and will be removed in the future,\n");
> +			if (vb->vb2_queue->allow_zero_bytesused)
> +				pr_warn_once("use VIDIOC_DECODER_CMD(V4L2_DEC_CMD_STOP) instead.\n");
> +			else
> +				pr_warn_once("use the actual size instead.\n");
> +		}
> +	}
> +
>  	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>  		if (b->memory == V4L2_MEMORY_USERPTR) {
>  			for (plane = 0; plane < vb->num_planes; ++plane) {
> @@ -1276,13 +1286,22 @@ static void __fill_vb2_buffer(struct vb2_buffer *vb, const struct v4l2_buffer *b
>  			 * userspace clearly never bothered to set it and
>  			 * it's a safe assumption that they really meant to
>  			 * use the full plane sizes.
> +			 *
> +			 * Some drivers, e.g. old codec drivers, use bytesused == 0
> +			 * as a way to indicate that streaming is finished.
> +			 * In that case, the driver should use the
> +			 * allow_zero_bytesused flag to keep old userspace
> +			 * applications working.
>  			 */
>  			for (plane = 0; plane < vb->num_planes; ++plane) {
>  				struct v4l2_plane *pdst = &v4l2_planes[plane];
>  				struct v4l2_plane *psrc = &b->m.planes[plane];
>  
> -				pdst->bytesused = psrc->bytesused ?
> -					psrc->bytesused : pdst->length;
> +				if (vb->vb2_queue->allow_zero_bytesused)
> +					pdst->bytesused = psrc->bytesused;
> +				else
> +					pdst->bytesused = psrc->bytesused ?
> +						psrc->bytesused : pdst->length;
>  				pdst->data_offset = psrc->data_offset;
>  			}
>  		}
> @@ -1295,6 +1314,11 @@ static void __fill_vb2_buffer(struct vb2_buffer *vb, const struct v4l2_buffer *b
>  		 *
>  		 * If bytesused == 0 for the output buffer, then fall back
>  		 * to the full buffer size as that's a sensible default.
> +		 *
> +		 * Some drivers, e.g. old codec drivers, use bytesused == 0 as
> +		 * a way to indicate that streaming is finished. In that case,
> +		 * the driver should use the allow_zero_bytesused flag to keep
> +		 * old userspace applications working.
>  		 */
>  		if (b->memory == V4L2_MEMORY_USERPTR) {
>  			v4l2_planes[0].m.userptr = b->m.userptr;
> @@ -1306,10 +1330,13 @@ static void __fill_vb2_buffer(struct vb2_buffer *vb, const struct v4l2_buffer *b
>  			v4l2_planes[0].length = b->length;
>  		}
>  
> -		if (V4L2_TYPE_IS_OUTPUT(b->type))
> -			v4l2_planes[0].bytesused = b->bytesused ?
> -				b->bytesused : v4l2_planes[0].length;
> -		else
> +		if (V4L2_TYPE_IS_OUTPUT(b->type)) {
> +			if (vb->vb2_queue->allow_zero_bytesused)
> +				v4l2_planes[0].bytesused = b->bytesused;
> +			else
> +				v4l2_planes[0].bytesused = b->bytesused ?
> +					b->bytesused : v4l2_planes[0].length;
> +		} else
>  			v4l2_planes[0].bytesused = 0;
>  
>  	}
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index e49dc6b..a5790fd 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -337,6 +337,7 @@ struct v4l2_fh;
>   * @io_modes:	supported io methods (see vb2_io_modes enum)
>   * @fileio_read_once:		report EOF after reading the first buffer
>   * @fileio_write_immediately:	queue buffer after each write() call
> + * @allow_zero_bytesused:	allow bytesused == 0 to be passed to the driver
>   * @lock:	pointer to a mutex that protects the vb2_queue struct. The
>   *		driver can set this to a mutex to let the v4l2 core serialize
>   *		the queuing ioctls. If the driver wants to handle locking
> @@ -388,6 +389,7 @@ struct vb2_queue {
>  	unsigned int			io_modes;
>  	unsigned			fileio_read_once:1;
>  	unsigned			fileio_write_immediately:1;
> +	unsigned			allow_zero_bytesused:1;
>  
>  	struct mutex			*lock;
>  	struct v4l2_fh			*owner;

-- 
Regards,

Laurent Pinchart
