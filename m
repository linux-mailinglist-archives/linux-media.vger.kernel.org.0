Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5445342A7A1
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbhJLOuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhJLOuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:50:15 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD4BC061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:48:13 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJ4amsZByx7rIaJ4emMOni; Tue, 12 Oct 2021 16:48:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634050092; bh=oRHyVo/HOjObgWEwZWIESktyi15WlEkdG2pQv51LzAw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Cb0dqNUDh5TeRJ/gIN9npIBTnVGqgAa/zamM6ji4BEyx4aWoL4g5mGAxkVmjdBpyK
         2GTNzyxtmx8rlV/nmnzcgwycb5o3v5g4hyM9MIfXb3W84BeP/sqFRmy03QOAiVVQNk
         LW9SjquXKXZW6XnJf4kCyHdJW8K3gWzeRxRny6645Trrvoj00BGdVC1sihA59LbeBV
         hKmKcSsYpsyNCxuZmficjiPM6zolosHUgp1dchOAsBD4O/OD9HU/T1crlc45OMYv6i
         jsWRstDn8Zkt4jyUpkWKQDI0LfzZGlx2zKZ17lVATGuQ2pWskbixTpzO1eJo0Ovx0P
         eAHrMR7Ex7WJg==
Subject: Re: [PATCH v9 25/36] media: add V4L2_SUBDEV_FL_MULTIPLEXED
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c3f939a1-81ac-d2a1-d669-9ae59143c07f@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKSFbDATqgOtJNi0zQI4mV3BrzfArmqj4+qsbWCeFyXYtWqXyxPu8SFpAiBb0hukqmCoCe+Qnc4mKCxBAfniL0enzunC3xHwbLTfRvy50TZmKLUeHzaO
 pUnj1RSpkqlmtrMiRajpbrgU8MuWHhvnB32yRVnQQzX3V35KRufkc4NZlrjKaRDn+zIySaHIGaC6P0+2ZZrhz85i3uUTFwnqFNgGxYAeQZDTKAJbWij4RhHo
 tjNBQzd/DGhoRHEpy45PIG2xQ7oFZMzUgBR8lxN/DsEQsRXptvsR1ew/42TmDitUz8Ssbs03IBkLaL6285n7R4Ri2+NieGv3xLkCZvf1hxYzq7hY0TGvtzbP
 nTpWjdiamzoC7U1RSShsBrwON/bvwev41jZUkR3hk86EaW3/LBnIusgmA3M+KmE8MCluO6gHac0qbAmtPt4X1eo4FcU2lGbob/VemLiAlDuwFyerZluzvajC
 x7/4nm00Zzld4mYQw+J7gxNdc82mNSa/9gA9Mw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add subdev flag V4L2_SUBDEV_FL_MULTIPLEXED. It is used to indicate that
> the subdev supports the new API with multiplexed streams (routing,
> stream configs).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/v4l2-subdev.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index b3a72c98a2d3..7f9c83fac020 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -888,6 +888,17 @@ struct v4l2_subdev_internal_ops {
>   * should set this flag.
>   */
>  #define V4L2_SUBDEV_FL_HAS_EVENTS		(1U << 3)
> +/*
> + * Set this flag if this subdev supports multiplexed streams. This means
> + * that the driver supports routing and handles the stream parameter in its
> + * v4l2_subdev_pad_ops handlers. More specifically, this means:
> + *
> + * - Centrally managed active state is enabled
> + * - Legacy pad config is _not_ supported (state->pads)

I'm not sure what is meant with this. Can you elaborate?

Regards,

	Hans

> + * - Routing ioctls are available
> + * - Multiple streams per pad are supported
> + */
> +#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)
>  
>  struct regulator_bulk_data;
>  
> 

