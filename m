Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DDD26C510
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 18:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgIPQW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 12:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgIPQU5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:20:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6F0C06121E;
        Wed, 16 Sep 2020 04:00:59 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FDFA57F;
        Wed, 16 Sep 2020 13:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600254056;
        bh=cj37W3JwQc455FhNdm8j/UfRxb22jhLiH2x8t9KxV/8=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VLI1DbUppAyeD0ATptMvB2PhunRupk2iBco2Yoyb0MQjK/1P0nyhJLZSAURm/Vuim
         Ug+JYZRaOo65uv7tZK7qAaRV9d/n24tuExo+wm8A2v5zfGrojGPhZoCgeW2Oyp/u7O
         EZKyKO0UGMAA/O1ZB6UnmURL/4cis9ATXem1u0xk=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] media: i2c: max9286: Fix async subdev size
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200915123914.22807-1-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <82d2c47e-9197-776d-b78b-6ca7cdecb94c@ideasonboard.com>
Date:   Wed, 16 Sep 2020 12:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915123914.22807-1-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/09/2020 13:39, Jacopo Mondi wrote:
> Since

Does 'Since' really need it's own line ;-)

> commit 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> the async subdevice registered to the max9286 notifier is dynamically
> allocated by the v4l2 framework by using the
> v4l2_async_notifier_add_fwnode_subdev() function. In order to allocate

A newline before 'In order to' would be nice to split 'what happened'
from 'what is going to happen'. Oh, in fact it doesn't describe what
happened though...

> enough space for max9286_asd structure that encloses the async subdevice

for "the" max9286_asd...


> paired with a pointer to the corresponding source, pass to the framework
> the size of the whole structure in place of the one of the enclosed async
> subdev.

That's quite hard to parse though, and I don't think describing the
contents of max9286_asd really matters here?

How about:

Since commit 86d37bf31af6 ("media: i2c: max9286: Allocate
v4l2_async_subdev dynamically") the async subdevice registered to the
max9286 notifier is dynamically allocated by the v4l2 framework by using
the v4l2_async_notifier_add_fwnode_subdev() function, but provides an
incorrect size, potentially leading to incorrect memory accesses.

Allocate enough space for the driver specific max9286_asd structure
(which contains the async subdevice) by passing the size of the correct
structure.

> Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The code is fine though, so with any commit message updates you deem
necessary:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index c82c1493e099..6852448284ea 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -577,10 +577,11 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  	for_each_source(priv, source) {
>  		unsigned int i = to_index(priv, source);
>  		struct v4l2_async_subdev *asd;
> +		struct max9286_asd *masd;
> 
>  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
>  							    source->fwnode,
> -							    sizeof(*asd));
> +							    sizeof(*masd));
>  		if (IS_ERR(asd)) {
>  			dev_err(dev, "Failed to add subdev for source %u: %ld",
>  				i, PTR_ERR(asd));
> @@ -588,7 +589,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  			return PTR_ERR(asd);
>  		}
> 
> -		to_max9286_asd(asd)->source = source;
> +		masd = to_max9286_asd(asd);
> +		masd->source = source;
>  	}
> 
>  	priv->notifier.ops = &max9286_notify_ops;
> --
> 2.28.0
> 

