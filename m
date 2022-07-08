Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCAEB56B61C
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 11:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbiGHJ6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 05:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237719AbiGHJ6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 05:58:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D6074375;
        Fri,  8 Jul 2022 02:58:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114616BD;
        Fri,  8 Jul 2022 11:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657274328;
        bh=ZkccrAGFHTOs6BmA7Kj7Zqe2MX6092+yVWm/6RO96Is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UssiqFYRcXzQZ+f25ZUBhtlsd6HDFw5lUudMwK+HKKsbefzuMzYwnsiqDYXWtuQ7N
         +PzSvFCgejkIsgKpKelCJTIdLOk7Yr6MRiXuezZi52aGKjc9oZuZMxALapUhfnCjYJ
         Ahs2gaBScAg6Wtn+EeMIoM/Xd51QA+tUU2r0lLLY=
Date:   Fri, 8 Jul 2022 12:58:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, nicolas@ndufresne.ca,
        alexander.stein@ew.tq-group.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 01/14] videodev2.h: add V4L2_CTRL_FLAG_DYNAMIC_ARRAY
Message-ID: <Ysf/vnz542nBjSpC@pendragon.ideasonboard.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
 <20220623143115.3185297-2-xavier.roumegue@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623143115.3185297-2-xavier.roumegue@oss.nxp.com>
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

On Thu, Jun 23, 2022 at 04:31:02PM +0200, Xavier Roumegue wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
>  
>  Return Value
>  ============
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 343b95107fce..5c45ca18fac9 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1889,6 +1889,7 @@ struct v4l2_querymenu {
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
