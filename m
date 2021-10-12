Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA0142A7B5
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237332AbhJLO5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLO5X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:57:23 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE8FC061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 07:55:21 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJBVmsbVJx7rIaJBYmMPsE; Tue, 12 Oct 2021 16:55:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634050520; bh=BEFrR8VkoXbEoxzndTJPhdBdSTKY5s7WXvzYVNd3Tzs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Fq55DULVy9m9PIws18n2PtWobrI4jIMLtr87NSEkpFc2LZxgi6/7UoQrZRabL8vX6
         wIjdqCSLDxtjSVWlmBBCpAuqX3SdBoTVAugXC7BB4d+eYl3pBHEyA5lFcgoltCzX+B
         9PKAQMNZ0aEsEzHXLOpUJSpIuuT/ex6A4j5G8M7DVQDv6kyAejPeCaq+uI0rbCqhNT
         dOg+0QFkn/XQ3Bf0C1v7BAx6hn2T0TjHtpI4PgKF8mqfe8jRkt5QzrRkcDzkW6zt2D
         H3JMy2JJL4ahmT/gmqI0jR0I2eIKP1rAq2HZjdxg/1TXupj/2atIjLu38xuyfoGUe4
         sxz6pi/sOdK5A==
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
Message-ID: <5a49a598-7a2c-7001-296c-02ebce93042d@xs4all.nl>
Date:   Tue, 12 Oct 2021 16:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-26-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKgzarHWyAnxMtyz8KUYrMMrxOPwl+kj6w+goWyqhEO9B1lzs/I7cJx/eue/3l8m3vhp/TXyYHk8rjGSCVDuwvmR0WxcTghErEEWjhu9uQD13kVTdH61
 1sx6KqNWKR98wgENa7r4UC6a2Gga+LbbsaPClFhnNUj37lTTYy7ostFPgalfAGeJY8NyaXqamsppM6ahKz8YObQooJ3Z0P0dvi7kOs+Nkw8LCwCsRtGkJ5l2
 RrZALRWCM9KGPHEEYy0IxDxVYUMuRdIo27Jyw2bMbt6M3xt31ddyWnJ2q+kE9YM/B7jLj13NVt/j4FiGMEaD2oUbEoHkk1KydrUmxuP7EIFP9MvhPqW/1WJj
 RlY0iCl/ENmQpmrQOc5FyAmt304AfJMeapwExeRRS4aZarTq/5H4bEHLbAfRVeFWbOI22+a/ZiBsbwpamkFf53eW71dF2aryFIN1B1jMY6vhhnZofh1ra7Ji
 CzdcFQ3vOrP6RscZdRb0jaks+wCkqa6MKnVrvA==
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
> + * - Routing ioctls are available
> + * - Multiple streams per pad are supported
> + */
> +#define V4L2_SUBDEV_FL_MULTIPLEXED		(1U << 4)

This is an internal kAPI flag. But wouldn't it be useful to have this as
an entity flag instead? E.g. MEDIA_ENT_FL_MULTIPLEXED

Or perhaps as a Sub-Device Capabilities Flag V4L2_SUBDEV_CAP_MULTIPLEXED.
Or a combination. It is useful if you can detect this from userspace without
having to call G_ROUTING to see if that exists.

You can ignore this if something like that is added in later patches.

Regards,

	Hans

>  
>  struct regulator_bulk_data;
>  
> 

