Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31B156B6FC
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 12:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbiGHKOb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 06:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238093AbiGHKOP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 06:14:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC5C84EE7
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 03:14:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 417F56BD;
        Fri,  8 Jul 2022 12:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657275244;
        bh=Nr38t+o+sQJWJ0njf+FoS7KSgtiHak96VrarA0odi/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ujz7w4fkLSr81PCoJjwPicYQaxMAJV4V5vJyjGw3KX/q0nUBR16C9x6fVAxIG51S3
         p0ylABv3DFllIPWmUK2zsdVlnBySZ9nnPRGkcGZHeKqquNnKazW+Ocst51j7tSnhKf
         IJ+UcNx/fRgamJjqkjylTC/YEHW7OBMnGa+o7mmM=
Date:   Fri, 8 Jul 2022 13:13:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 1/8] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Message-ID: <YsgDUhJogkseEi1a@pendragon.ideasonboard.com>
References: <20220628120523.2915913-1-hverkuil-cisco@xs4all.nl>
 <20220628120523.2915913-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628120523.2915913-2-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jun 28, 2022 at 02:05:16PM +0200, Hans Verkuil wrote:
> Add a new flag that indicates that this control is a dynamically sized
> array. Also document this flag.
> 
> Currently dynamically sized arrays are limited to one dimensional arrays,
> but that might change in the future if there is a need for it.
> 
> The initial use-case of dynamic arrays are stateless codecs. A frame
> can be divided in many slices, so you want to provide an array containing
> slice information for each slice. Typically the number of slices is small,
> but the standard allow for hundreds or thousands of slices. Dynamic arrays
> are a good solution since sizing the array for the worst case would waste
> substantial amounts of memory.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Tested-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
>  .../userspace-api/media/videodev2.h.rst.exceptions        | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  3 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 88f630252d98..a20dfa2a933b 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -625,6 +625,14 @@ See also the examples in :ref:`control`.
>  	``V4L2_CTRL_FLAG_GRABBED`` flag when buffers are allocated or
>  	streaming is in progress since most drivers do not support changing
>  	the format in that case.
> +    * - ``V4L2_CTRL_FLAG_DYNAMIC_ARRAY``
> +      - 0x0800
> +      - This control is a dynamically sized 1-dimensional array. It
> +        behaves the same as a regular array, except that the number
> +	of elements as reported by the ``elems`` field is between 1 and
> +	``dims[0]``. So setting the control with a differently sized
> +	array will change the ``elems`` field when the control is
> +	queried afterwards.
>  
>  Return Value
>  ============
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 9cbb7a0c354a..0b91200776f8 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -379,6 +379,7 @@ replace define V4L2_CTRL_FLAG_VOLATILE control-flags
>  replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
>  replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
>  replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
> +replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
>  
>  replace define V4L2_CTRL_FLAG_NEXT_CTRL control
>  replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5311ac4fde35..9018aa984db3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1890,6 +1890,7 @@ struct v4l2_querymenu {
>  #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
>  #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
>  #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
> +#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
>  
>  /*  Query flags, to be ORed with the control ID */
>  #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000

-- 
Regards,

Laurent Pinchart
