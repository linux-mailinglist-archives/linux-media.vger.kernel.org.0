Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15F32EC2AD
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 18:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbhAFRqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 12:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbhAFRqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 12:46:19 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100FBC061575
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 09:45:39 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id 91so3180103wrj.7
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=b8LIngRyScmVnIe1ytAg0w2BNpOAx5ZDIvlpFGty80I=;
        b=g0MGIE4CgbGAm7qK5fnXccg6wHU2TYBaqtRcDKXkqHpzC/7B8LqH2G6mrkLCIREvQZ
         YspCdzZKu23UEIU8JCdnN+k2CwNAVtKs+vQk70mwZQdbSK++MQaQnfuPoeHji4008Xuv
         RL/VFTpYf0D0XEKIuuhMo4ytZtuXQgMAtUO30IeAgFx/rSxoJRFIjVvz6jCjvG0/sK8W
         sYJ/6RKv4xhj9ApWYWpWf9fsZ1ndU2bNMF8BbuwQWXWxK9mtYdjHYaSEKIBDzTo9zMwd
         A598wfFXuqQAbcB2bAqSoqKqXbdW2ZQKqBVHCFdFsL5OGjXiHGf5kHP4DsNj+JOvOJdX
         1PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=b8LIngRyScmVnIe1ytAg0w2BNpOAx5ZDIvlpFGty80I=;
        b=LLgCxJy2oKFfuv6FxoffvTB4s5wMV096LJQ9TnGIb0KDRU5YQfqAPDW7SI3dU2yxmX
         6dmhOH5GTiBcucvKgtHCn94KsIh6gytG25PCAK1kMcdejH+kxKZMGbGdSvyII1HfM2s+
         +CWBby3Px/KkyOT4SGtsdSDAGjPyHbHqq7P9faz17YS2bNNXFlRLNl9G8qkNJLB0S/li
         cglqKUWbgNfM6IH8c8uafse3DFtQuLD+u1OD/PZ1jm7/5zoNpCm4SLojlPl8vFDUuXyS
         xDw1MhlwA8jIUXsugxC6u58xAac1+GNgDaaD97QonIV/AwKw+frybTkX+rKnh0yzCZ+X
         GY3g==
X-Gm-Message-State: AOAM532KxdBokMUJnqY1cAOGP2JI96aooQvf+msdd97zwoJL63OJq/jF
        Ch9vTMF9fy6+HSOAAoUS0GA=
X-Google-Smtp-Source: ABdhPJwn5+40T6eBIB6C6KKQO5WXwf06kl81HUA9NdOchVJC2TE/SFwuud08mTjGe1sVk13+glJ4ng==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr5433517wrv.51.1609955137757;
        Wed, 06 Jan 2021 09:45:37 -0800 (PST)
Received: from [172.30.88.143] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j15sm3985107wrr.85.2021.01.06.09.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 09:45:37 -0800 (PST)
Subject: Re: [PATCH 19/75] media: imx: capture: Rename querycap handler to
 capture_querycap
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-20-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <5e100381-d37e-a744-ff97-40f6854d31d9@gmail.com>
Date:   Wed, 6 Jan 2021 09:45:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105152852.5733-20-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/5/21 7:27 AM, Laurent Pinchart wrote:
> For consistency with all the other ioctl handlers, rename
> vidioc_querycap() to capture_querycap().
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx-media-capture.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index 009dd8733813..db1f551b86ea 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -56,8 +56,8 @@ struct capture_priv {
>    * Video ioctls follow
>    */
>   
> -static int vidioc_querycap(struct file *file, void *fh,
> -			   struct v4l2_capability *cap)
> +static int capture_querycap(struct file *file, void *fh,
> +			    struct v4l2_capability *cap)
>   {
>   	struct capture_priv *priv = video_drvdata(file);
>   
> @@ -414,7 +414,7 @@ static int capture_subscribe_event(struct v4l2_fh *fh,
>   }
>   
>   static const struct v4l2_ioctl_ops capture_ioctl_ops = {
> -	.vidioc_querycap	= vidioc_querycap,
> +	.vidioc_querycap	= capture_querycap,
>   
>   	.vidioc_enum_framesizes = capture_enum_framesizes,
>   	.vidioc_enum_frameintervals = capture_enum_frameintervals,

Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
