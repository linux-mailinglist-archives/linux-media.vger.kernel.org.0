Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA7583D7559
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 14:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhG0MxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 08:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhG0MxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 08:53:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B85EC061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 05:53:19 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DF53EE;
        Tue, 27 Jul 2021 14:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627390397;
        bh=B9kJIqXI9ElhvHQoNmIBvrpGLT27g5TGGKvy5gQNTSQ=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=DACAQyhSdHzaZ7tMhhiGQvkfiAmTFjcgN72Pbzo+sdE3lA8CpgNpB43A7QkYocemd
         Y3N/dWrMQFZFj5n1ZxaAzf8G1Ydb3a2nKTpBbQrIgcOkly1PLLQcD/rRZcsgQG/8LT
         JNKMhoMd+A6EPeuXPcr75pg8Kl1z1xz+RS8eKzIA=
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-6-sakari.ailus@linux.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 5/6] media: rcar-vin: Remove explicit device
 availability check
Message-ID: <d9c77476-8a80-9799-7cbf-a01f33fc4b67@ideasonboard.com>
Date:   Tue, 27 Jul 2021 13:53:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624084046.13136-6-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2021 09:40, Sakari Ailus wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The fwnode is retrieved using fwnode_graph_get_endpoint_by_id() without
> the FWNODE_GRAPH_DEVICE_DISABLED flag set. So there is no need to
> explicitly check if the fwnode is available as it always will be when
> the check is performed, remove it.

Interestingly I don't see any users of FWNODE_GRAPH_DEVICE_DISABLED ...
I guess it's just there in case someone does one day need it.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 3b7052ff7117..a24aeda37e74 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -834,13 +834,6 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
>  		goto out;
>  	}
>  
> -	if (!of_device_is_available(to_of_node(fwnode))) {
> -		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
> -			to_of_node(fwnode));
> -		ret = -ENOTCONN;
> -		goto out;
> -	}
> -
>  	asd = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
>  				       struct v4l2_async_subdev);
>  	if (IS_ERR(asd)) {
> 
