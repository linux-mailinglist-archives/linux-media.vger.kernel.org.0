Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0375B54BC14
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 22:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbiFNUqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 16:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiFNUqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 16:46:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9C42F381;
        Tue, 14 Jun 2022 13:46:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 121C22E4;
        Tue, 14 Jun 2022 22:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655239590;
        bh=wX2gQgJTWQQOF5Wrys2HrbI2KH7mSvT/4W+QO54dYbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sjgpR95qxzLVHR4Ju8xqJeTJl7+/3w+4Wwqg0CD84XpN5TzKdF3nwSZkqg30HD37L
         8ND6JdLRhzRCx2CTb+LPbJ0dZC8IfbF1FUuUwzVcKjMTuPudJh1FH0wog6eDsZod1L
         g8nT2xIyAiiVt0Juc4IKw5hu4oQA8PdbTiS/sB+o=
Date:   Tue, 14 Jun 2022 23:46:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/9] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Message-ID: <YqjznJSwPFH4GrhO@pendragon.ideasonboard.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
 <20220503093925.876640-2-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503093925.876640-2-xavier.roumegue@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xavier and Hans,

Thank you for the patch.

On Tue, May 03, 2022 at 11:39:17AM +0200, Xavier Roumegue wrote:
> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
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
> ---
>  .../userspace-api/media/v4l/vidioc-queryctrl.rst          | 8 ++++++++
>  include/uapi/linux/videodev2.h                            | 1 +
>  2 files changed, 9 insertions(+)
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

Wrong indentation.

Can the dimension be changed by the application only, or by the driver
too ? In the latter case, is an event generated ?

Considering this in the context of this series, the driver needs to
change the dimension, as the use case is to size the control based on
the image size. Do we want to document here that the driver will reset
the control to a default value when the dimension changes, or is that
something that should be control-specific ?

>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3768a0a80830..8df13defde75 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1886,6 +1886,7 @@ struct v4l2_querymenu {
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
