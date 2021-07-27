Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC133D755E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 14:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbhG0Myx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 08:54:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbhG0Myx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 08:54:53 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E318EE;
        Tue, 27 Jul 2021 14:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627390492;
        bh=q0vJ/F88S+eu/x76HMyel6tdF/NB3OdEWmGEecYalv0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FUYi7RIzXz1g9BTAp+VjERwXkpohJ3lIQQQNcWw08LJdW8c0TRg4vK92wEoab2xd9
         aU5b2klSO2EBB1ArPJq3WSUBWEr3ur3R60cCNrifU0XyypaGAthqb2DLcZy31z12z4
         QYvkLpNVUBFoVk8NMXrnmoG1T7pmgpmwrc0xDriE=
Subject: Re: [PATCH v3 6/6] Documentation: v4l: Fix V4L2_CID_PIXEL_RATE
 documentation
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20210624084046.13136-1-sakari.ailus@linux.intel.com>
 <20210624084046.13136-7-sakari.ailus@linux.intel.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <4d9053ba-f10f-16fa-291c-8518a3174bba@ideasonboard.com>
Date:   Tue, 27 Jul 2021 13:54:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624084046.13136-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2021 09:40, Sakari Ailus wrote:
> The V4L2_CID_PIXEL_RATE is nowadays used to tell pixel sampling rate in
> the sub-device's pixel array, not the pixel rate over a link (for which it
> also becomes unfit with the addition of multiplexed streams later on). Fix
> this.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index ed65fb594cc8..2b5a13dc843f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -40,7 +40,7 @@ Image Process Control IDs
>  .. _v4l2-cid-pixel-rate:
>  
>  ``V4L2_CID_PIXEL_RATE (64-bit integer)``
> -    Pixel rate in the source pads of the subdev. This control is
> +    Pixel sampling rate in the device's pixel array. This control is
>      read-only and its unit is pixels / second.
>  
>  ``V4L2_CID_TEST_PATTERN (menu)``
> 
