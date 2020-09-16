Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6838C26C4E2
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 18:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIPQIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 12:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIPQEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 12:04:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12A3C02C2B3;
        Wed, 16 Sep 2020 08:49:24 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 257E326B;
        Wed, 16 Sep 2020 17:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600271046;
        bh=lySLVcxndFknMXMSgr2EWx9F9cUXcq47wEXfwbGQSAE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lut+i5aCD6jc5yaQ3ck1RNYa7TomqMY5PjmXtCNkxtBLse1CVJIQoAKLFJ0eVLMXj
         MsSx0YblCWJWyPqQEjHGUNhgDqiWIZgEntThVADIVmeNaTHMnzbzA6bd/Ws699AALq
         BDhnYjHsHJCRO9Kx99CMVn0ZX5ZudtNN9n90w0tw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/5] media: v4l2-async: Document asd allocation
 requirements
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200811205939.19550-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <0dca7898-01ff-79a2-bb7e-7e946706deb1@ideasonboard.com>
Date:   Wed, 16 Sep 2020 16:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811205939.19550-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 11/08/2020 21:59, Laurent Pinchart wrote:
> The v4l2_async_notifier_add_subdev() function requires the asd pointer
> it receives to be allocated dynamically, but doesn't explicitly say so.
> Only one driver out of 13 get its right (atmel-sama5d2-isc.c, but with
> memory leaks in the error paths), clearly showing we have an issue.
> 
> Update the v4l2_async_notifier_add_subdev() documentation to clearly
> state the allocation requirement. Whether this will be enough to avoid
> new offending code isn't certain, but it's a good first step
> nonetheless.
> 
> Fixes: 9ca465312132 ("media: v4l: fwnode: Support generic parsing of graph endpoints in a device")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Seems reasonable to me:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-async.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 8319284c93cb..d6e31234826f 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -154,8 +154,9 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>   * @notifier: pointer to &struct v4l2_async_notifier
>   * @asd: pointer to &struct v4l2_async_subdev
>   *
> - * Call this function before registering a notifier to link the
> - * provided asd to the notifiers master @asd_list.
> + * Call this function before registering a notifier to link the provided @asd to
> + * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
> + * it will be freed by the framework when the notifier is destroyed.
>   */
>  int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd);
> 

