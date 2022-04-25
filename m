Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFADF50DD10
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiDYJsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiDYJsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:48:12 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB35E3DA44
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:45:08 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l18so1858103ejc.7
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T8f9eDm266Y1Ts1ErDo5iBQJArVZ/NqFH0l8pTYu7ME=;
        b=kkGGbsst6N0RMpxcGT14jD0Wvkxms3LbVz9Yw4yq4U/JbMIZH8LBCM8oIpSeDZFK5n
         A5g49+EPBjrNQ2pK/UZlw2Fhr2BpxYN5qkIzjue9ihSFMVDEsVq37CeiwOqZJPlx2bQ8
         /b2DSDRceRRtUyI6SmaKVAVYVHquI1nwu0Nxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T8f9eDm266Y1Ts1ErDo5iBQJArVZ/NqFH0l8pTYu7ME=;
        b=qZ7dWLSht0s/uI1n1G38xNkdbBjHn7AKwLZgwkmT7SibvDydjasut+1TaFzqp/GdrG
         ZdSZ0ZvQRMHPYYbArjFcxXi8eKxmiHRM/uNI9cp+MofPOl2d2qHR63fOM8t8MBHBFdgi
         mvTW2zYsEuKnbVQBZ56kUpmGLeXEAgvxee3tRjbxXoEeFCknC1tdZL/A9m+3SdEeybuh
         mtU38YOjFjBQPY/+4y2WC9E+5u66f277jjDySAejDADo9m0P5LxCd/WyLfQthkHI60Zx
         aagDiVk4GFn+Hxgp+TmfZOraPJY4EZd6R3LVIfzuQSd+XZun3GKsdIhyoa0drr0nG5eL
         p6Gg==
X-Gm-Message-State: AOAM530gJrO4pebvUFn3KiwYJGV4FnsjdUuxTaOzZ5XvNxXIcSSGj+nz
        3z0Ghyc8KNMIpK6ojnLbSZnTxw==
X-Google-Smtp-Source: ABdhPJwOWdu7Rutex5YWxhMqcBhGl7bPWyrgXmdptv5vJjDWtx+P2HmnImlNIXTNsWcNX85z2QaV0g==
X-Received: by 2002:a17:906:c104:b0:6ef:fb70:1c54 with SMTP id do4-20020a170906c10400b006effb701c54mr15939082ejc.71.1650879907535;
        Mon, 25 Apr 2022 02:45:07 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm4333531edt.94.2022.04.25.02.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:45:07 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:44:49 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 06/21] media: rkisp1: stats: Simplify (un)registration
Message-ID: <YmZtkcekluV2ZdV9@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Simplify error handling at registration time as media_entity_cleanup()
> can be called on an uninitialized entity, and make
> rkisp1_stats_unregister() safe to be called on an unregistered stats
> node to prepare for simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index be5777c65bfb..26ef3bbe43d0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -463,21 +463,21 @@ int rkisp1_stats_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SINK;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto err_mutex_destroy;
> +		goto error;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(&vdev->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
>  
>  	return 0;
>  
> -err_cleanup_media_entity:
> +error:
>  	media_entity_cleanup(&vdev->entity);
> -err_mutex_destroy:
>  	mutex_destroy(&node->vlock);
> +	stats->rkisp1 = NULL;
>  	return ret;
>  }
>  
> @@ -487,6 +487,9 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1)
>  	struct rkisp1_vdev_node *node = &stats->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> +	if (!stats->rkisp1)
> +		return;
> +
>  	vb2_video_unregister_device(vdev);
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
