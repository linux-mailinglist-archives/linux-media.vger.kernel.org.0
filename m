Return-Path: <linux-media+bounces-16784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5C95EFA3
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBE3EB20C87
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BFE1537D9;
	Mon, 26 Aug 2024 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aVRC90px"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A971514F6;
	Mon, 26 Aug 2024 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724671393; cv=none; b=l9g+ntKsLCgnRtdHM3ktrsi4z0gYxRfb93Z14LEi4T7jl3wr1sxTgRhDbDfZWl+iJ6aBLJ014LZ/XW/oQSJLS866B9J7h9LUg/Hoy6+D2gZW/9oyMd0qUteRetC8yyWNclsXTpoIuYsDb9Gs0tpz96Q1xRMQd7aIwZjgO4a+6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724671393; c=relaxed/simple;
	bh=Kj7h9bpv+0UPcS9aPXU+xmE4aPfo72AZJcGDaoxuxbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1JwoCgj6l63Or0wVZPNSkurbmO2+6P5GcuLdi3GMhikTGjNtXfvbFvjpu1s2WjDQ701+Li0qVOCeIT2/S56nwaTxvgGc20CVhwQK65cQXFYvPuv5srKMrpRFLs9P69q3/Xoz8XuLAsDr8X4832t+08j30WMHGjmceVrF7mDWQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aVRC90px; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 717F36CA;
	Mon, 26 Aug 2024 13:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724671324;
	bh=Kj7h9bpv+0UPcS9aPXU+xmE4aPfo72AZJcGDaoxuxbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aVRC90pxzn2zJjFh3+9tBJmfKh6LX0938p4z4VDNEP0GDCTyNB4ekxd65kBDO4WPM
	 lHzSNxm0Rk3V8b6HVyZl0WkmElsqam/VzI0BkTU6Y4RkEVYnXWUAJW+QGbwyLKLkC0
	 kn6zIuJDrbgU+Yn2TtH+Bb+sAG/90RTCXIhAsNoo=
Message-ID: <5b1c9f47-3253-48b3-9a43-bd1a4a514caa@ideasonboard.com>
Date: Mon, 26 Aug 2024 14:23:06 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: v4l2-subdev: Support hybrid links in
 v4l2_subdev_link_validate()
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240822154531.25912-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240822154531.25912-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20240822154531.25912-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2024 18:45, Laurent Pinchart wrote:
> The v4l2_subdev_link_validate() helper function is meant to be used as a
> drop-in implementation of a V4L2 subdev entity .link_validate() handler.
> It supports subdev-to-subdev links only, and complains if one end of the
> link is not a subdev. This forces drivers that have video output devices
> connected to subdevs to implement a custom .link_validate() handler,
> calling v4l2_subdev_link_validate() for the subdev-to-subdev links, and
> performing manual link validation for the video-to-subdev links.
> 
> Video devices embed a media entity, and therefore also have a
> .link_validate() operation. For video capture devices, the operation
> should be manually implemented by drivers for validate the
> subdev-to-video links. For video output devices, on the other hand, that
> operation is never called, as link validation is performed in the
> context of the sink entity.
> 
> As a result, we end up forcing drivers to implement a custom
> .link_validate() handler for subdevs connected to video output devices,
> when the video devices provide an operation that could be used for that
> purpose.
> 
> To improve that situation, make v4l2_subdev_link_validate() delegate
> link validation to the source's .link_validate() operation when the link
> source is a video device and the link sink is a subdev. This allows
> broader usage of v4l2_subdev_link_validate(), and simplifies drivers by
> making video device link validation easy to implement in the video
> device .link_validate(), regardless of whether the video device is an
> output device or a capture device.

Maybe mention this patch in the previous patch's desc to answer the 
question I sent =)

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 40 +++++++++++++++++++++++----
>   include/media/v4l2-subdev.h           |  6 ++++
>   2 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d3196042d5c5..32ffebae4d17 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1450,13 +1450,43 @@ int v4l2_subdev_link_validate(struct media_link *link)
>   	if (WARN_ON_ONCE(!is_media_entity_v4l2_subdev(link->sink->entity)))
>   		return -EINVAL;
>   
> -	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> -		pr_warn_once("source of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
> -			     link->source->entity->name, link->source->index,
> -			     link->sink->entity->name, link->sink->index);
> -		return 0;
> +	/*
> +	 * If the source is a video device, delegate link validation to it. This
> +	 * allows usage of this helper for subdev connected to a video output
> +	 * device, provided that the driver implement the video output device's
> +	 * .link_validate() operation.
> +	 */
> +	if (is_media_entity_v4l2_video_device(link->source->entity)) {
> +		struct media_entity *source = link->source->entity;
> +
> +		if (!source->ops || !source->ops->link_validate) {
> +			/*
> +			 * Many existing drivers do not implement the required
> +			 * .link_validate() operation for their video devices.
> +			 * Print a warning to get the drivers fixed, and return
> +			 * 0 to avoid breaking userspace. This should
> +			 * eventually be turned into a WARN_ON() when all
> +			 * drivers will have been fixed.
> +			 */
> +			pr_warn_once("video device '%s' does not implement .link_validate(), driver bug!\n",
> +				     source->name);
> +			return 0;
> +		}
> +
> +		/* Avoid infinite loops. */

Maybe this could elaborate a bit, and say that non-subdev drivers should 
not use v4l2_subdev_link_validate, but some do (?) or might use it by 
mistake, and this catches the driver bug.

> +		if (WARN_ON(source->ops->link_validate == v4l2_subdev_link_validate))
> +			return -EINVAL;

This might still be risky. The driver could implement its own validate, 
which does some checks and then calls v4l2_subdev_link_validate(). But 
I'm sure that'll get get noticed =).

  Tomi

> +
> +		return source->ops->link_validate(link);
>   	}
>   
> +	/*
> +	 * If the source is still not a subdev, usage of this helper is a clear
> +	 * driver bug.
> +	 */
> +	if (WARN_ON(!is_media_entity_v4l2_subdev(link->source->entity)))
> +		return -EINVAL;
> +
>   	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
>   	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>   
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index bd235d325ff9..8daa0929865c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1250,6 +1250,12 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>    * calls v4l2_subdev_link_validate_default() to ensure that
>    * width, height and the media bus pixel code are equal on both
>    * source and sink of the link.
> + *
> + * The function can be used as a drop-in &media_entity_ops.link_validate
> + * implementation for v4l2_subdev instances. It supports all links between
> + * subdevs, as well as links between subdevs and video devices, provided that
> + * the video devices also implement their &media_entity_ops.link_validate
> + * operation.
>    */
>   int v4l2_subdev_link_validate(struct media_link *link);
>   


