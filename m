Return-Path: <linux-media+bounces-10032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99A8B0CA6
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527991C21033
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142D615E5CB;
	Wed, 24 Apr 2024 14:35:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29081E501
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713969307; cv=none; b=fpRYcXEcDH+mJjBEyKOcjeZuViDCfUmRRzTErVKf/GcxZVTbsC4348mqgfUD0lPwEUbVt1EqyjmuLivfdCMcrnC3Wlcn4HwonUftfwWu8Ux84qwyrBgXyNxkWxNXo1WkiaXwjZkCTrhFPWJvyWMH+D+pcJASjQd8+7x/WwEMMsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713969307; c=relaxed/simple;
	bh=sPRJ+g4l6ZyEqt7IWg0xZp/rzMbWh9T4ENtYQX0FgCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aH8m8VrNbh+0kGg6qH6N8UKBmADGHUxGsekiiAfsl8tehBqaeT+itsHKvTuXVX1KK7wuCMrMQaQX2e47/Ywqgtu9QRNVgJWC+MFbelGD43b0w0OGLCrXuQwsXZhnI3aU7xBbyBLLNFLB4yM4fE97saSsk72lxN3AW6Jp5myuc+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2581C2BBFC;
	Wed, 24 Apr 2024 14:35:04 +0000 (UTC)
Message-ID: <a6abe216-5905-482e-918d-8f5db4757717@xs4all.nl>
Date: Wed, 24 Apr 2024 16:35:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] media: v4l: subdev: Add len_routes field to struct
 v4l2_subdev_routing
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240424122237.875000-1-sakari.ailus@linux.intel.com>
 <20240424122237.875000-13-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <20240424122237.875000-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 14:22, Sakari Ailus wrote:
> The len_routes field is used to tell the size of the routes array in
> struct v4l2_subdev_routing. This way the number of routes returned from
> S_ROUTING IOCTL may be larger than the number of routes provided, in case
> there are more routes returned by the driver.
> 
> Note that this uAPI is still disabled in the code, so this change can
> safely be done. Anyone who manually patched the code to enable this uAPI
> must update their code.

I see that the 'reserved' array is also enlarged by this patch. That should
be mentioned in the commit log.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/vidioc-subdev-g-routing.rst     | 46 +++++++++++++------
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  4 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 12 ++---
>  include/media/v4l2-subdev.h                   |  2 +
>  include/uapi/linux/v4l2-subdev.h              |  9 ++--
>  5 files changed, 48 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 26b5004bfe6d..cbd9370006b6 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -43,23 +43,38 @@ The routing configuration determines the flows of data inside an entity.
>  Drivers report their current routing tables using the
>  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
>  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> -setting or clearing flags of the  ``flags`` field of a
> -struct :c:type:`v4l2_subdev_route`.
> +setting or clearing flags of the ``flags`` field of a struct
> +:c:type:`v4l2_subdev_route`.
>  
> -All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called. This
> -means that the userspace must reconfigure all streams after calling the ioctl
> -with e.g. ``VIDIOC_SUBDEV_S_FMT``.
> +All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
> +This means that the userspace must reconfigure all stream formats and selections
> +after calling the ioctl with e.g. ``VIDIOC_SUBDEV_S_FMT``.
>  
>  Only subdevices which have both sink and source pads can support routing.
>  
> -When inspecting routes through ``VIDIOC_SUBDEV_G_ROUTING`` and the application
> -provided ``num_routes`` is not big enough to contain all the available routes
> -the subdevice exposes, drivers return the ENOSPC error code and adjust the
> -value of the ``num_routes`` field. Application should then reserve enough memory
> -for all the route entries and call ``VIDIOC_SUBDEV_G_ROUTING`` again.
> -
> -On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
> -``num_routes`` field to reflect the actual number of routes returned.
> +The ``len_routes`` field indicates the number of routes that can fit in the
> +``routes`` array allocated by userspace. It is set by applications for both
> +ioctls to indicate how many routes the kernel can return, and is never modified
> +by the kernel.
> +
> +The ``num_routes`` field indicates the number of routes in the routing
> +table. For ``VIDIOC_SUBDEV_S_ROUTING``, it is set by userspace to the number of
> +routes that the application stored in the ``routes`` array. For both ioctls, it
> +is returned by the kernel and indicates how many routes are stored in the
> +subdevice routing table. This may be smaller or larger than the value of
> +``num_routes`` set by the application for ``VIDIOC_SUBDEV_S_ROUTING``, as
> +drivers may adjust the requested routing table.
> +
> +The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> +both ioctls. This indicates thare are more routes in the routing table than fits
> +the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> +with the first ``len_routes`` entries of the subdevice routing table. This is
> +not considered to be an error, and the ioctl call succeeds. If the applications
> +wants to retrieve the missing routes, it can issue a new
> +``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.
> +
> +``VIDIOC_SUBDEV_S_ROUTING`` may return more routes than the user provided in
> +``num_routes`` field due to e.g. hardware properties.
>  
>  .. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.7cm}|
>  
> @@ -74,6 +89,9 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
>        - ``which``
>        - Routing table to be accessed, from enum
>          :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
> +    * - __u32
> +      - ``len_routes``
> +      - The length of the array (as in memory reserved for the array)
>      * - struct :c:type:`v4l2_subdev_route`
>        - ``routes[]``
>        - Array of struct :c:type:`v4l2_subdev_route` entries
> @@ -81,7 +99,7 @@ On a successful ``VIDIOC_SUBDEV_G_ROUTING`` call the driver updates the
>        - ``num_routes``
>        - Number of entries of the routes array
>      * - __u32
> -      - ``reserved``\ [5]
> +      - ``reserved``\ [11]
>        - Reserved for future extensions. Applications and drivers must set
>  	the array to zero.
>  
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0260acef97d2..aab671fae45b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3201,13 +3201,13 @@ static int check_array_args(unsigned int cmd, void *parg, size_t *array_size,
>  	case VIDIOC_SUBDEV_S_ROUTING: {
>  		struct v4l2_subdev_routing *routing = parg;
>  
> -		if (routing->num_routes > 256)
> +		if (routing->len_routes > 256)
>  			return -E2BIG;
>  
>  		*user_ptr = u64_to_user_ptr(routing->routes);
>  		*kernel_ptr = (void **)&routing->routes;
>  		*array_size = sizeof(struct v4l2_subdev_route)
> -			    * routing->num_routes;
> +			    * routing->len_routes;
>  		ret = 1;
>  		break;
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 779583447eac..b565f202df67 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -960,14 +960,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  
>  		krouting = &state->routing;
>  
> -		if (routing->num_routes < krouting->num_routes) {
> -			routing->num_routes = krouting->num_routes;
> -			return -ENOSPC;
> -		}
> -
>  		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
>  		       krouting->routes,
> -		       krouting->num_routes * sizeof(*krouting->routes));
> +		       min(krouting->num_routes, routing->len_routes) *
> +		       sizeof(*krouting->routes));
>  		routing->num_routes = krouting->num_routes;
>  
>  		return 0;
> @@ -989,6 +985,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>  			return -EPERM;
>  
> +		if (routing->num_routes > routing->len_routes)
> +			return -EINVAL;
> +
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>  
>  		for (i = 0; i < routing->num_routes; ++i) {
> @@ -1015,6 +1014,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		}
>  
>  		krouting.num_routes = routing->num_routes;
> +		krouting.len_routes = routing->len_routes;
>  		krouting.routes = routes;
>  
>  		return v4l2_subdev_call(sd, pad, set_routing, state,
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e22c50ce7e05..e30c463d90e5 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -714,12 +714,14 @@ struct v4l2_subdev_stream_configs {
>  /**
>   * struct v4l2_subdev_krouting - subdev routing table
>   *
> + * @len_routes: length of routes array, in routes
>   * @num_routes: number of routes
>   * @routes: &struct v4l2_subdev_route
>   *
>   * This structure contains the routing table for a subdev.
>   */
>  struct v4l2_subdev_krouting {
> +	unsigned int len_routes;
>  	unsigned int num_routes;
>  	struct v4l2_subdev_route *routes;
>  };
> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> index 81a24bd38003..6a39128d0606 100644
> --- a/include/uapi/linux/v4l2-subdev.h
> +++ b/include/uapi/linux/v4l2-subdev.h
> @@ -228,15 +228,18 @@ struct v4l2_subdev_route {
>   * struct v4l2_subdev_routing - Subdev routing information
>   *
>   * @which: configuration type (from enum v4l2_subdev_format_whence)
> - * @num_routes: the total number of routes in the routes array
> + * @len_routes: the length of the routes array, in routes

I recommend adding: "Set by userspace, untouched by kernelspace." or something
similar.

>   * @routes: pointer to the routes array
> + * @num_routes: the total number of routes, possibly more than fits in the
> + *		routes array
>   * @reserved: drivers and applications must zero this array
>   */
>  struct v4l2_subdev_routing {
>  	__u32 which;
> -	__u32 num_routes;
> +	__u32 len_routes;
>  	__u64 routes;
> -	__u32 reserved[6];
> +	__u32 num_routes;
> +	__u32 reserved[11];
>  };
>  
>  /*

Regards,

	Hans

