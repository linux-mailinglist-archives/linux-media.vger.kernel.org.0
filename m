Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6B650DCF3
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235124AbiDYJnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241604AbiDYJmi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:42:38 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4717C2BB12
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:39:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y3so8082713ejo.12
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kKHAS8yuamKKqcmKSO+BS/tDqzgE+/ScvF8BNqhQ3w=;
        b=kmxzm09EX9L/7Mr9Vh1Yg7ps87lABi5yc+KEQRV+r6TsAdTMIDzAWdSZOPtVuKq/3K
         YWhl9wMa0lL7PB7AMVL7c//yZqPJy/iksXAjJueLJ3J/bFUrXddgl37dPJcCQhdiulcc
         01LSZM2pzT4pIq3K9bIkAffdNjw/Wy9Ezk85I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kKHAS8yuamKKqcmKSO+BS/tDqzgE+/ScvF8BNqhQ3w=;
        b=O6L/W0XYbaVpgPmesWCHxh7K9BNM5yquS23Ts/D4UY4l0U7OYO6QfVzWrzNDryr8f/
         V79w/UuT08iJxRjuvUBI79ZXLzViCo1Se+RKMXzSflbjnW6zMIi+R1RCwui1f12Alnlo
         QUSIj1v0EX77+/ThBTOgMI0f5IYSiF3P30Z1tg7momAGu4vkgXewn76psPo3lFat7oSY
         kAgTKhgbGoHS8Rk/Mkd5LstNBohRLXaRVQ6FDOGo0f+WS6zVE7Ir6I/ioDRsiAqqmCKH
         NTC55u10h4Jrpk9u6oqapo54CNAspVfMpECqiYkc6U7FIRF77ZmIULD2tbzRzRli1MdX
         wgww==
X-Gm-Message-State: AOAM530y1YAbLvZezFzlu20rvQ1lCmCcM+bP48T7DXU1pSbZ9rWK780A
        T1iq9OMfR23hX93Kd0jdDsT0sQ==
X-Google-Smtp-Source: ABdhPJxzjnupASBEe5HfYSESn4d7GsiiO4W71kGmjRoJ2wlcx2fA6etHFXZUQQio+KeawidxsasS5g==
X-Received: by 2002:a17:906:fad6:b0:6f3:9ea7:1d49 with SMTP id lu22-20020a170906fad600b006f39ea71d49mr1768664ejb.635.1650879558907;
        Mon, 25 Apr 2022 02:39:18 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id la23-20020a170906ad9700b006f3902ba948sm1225416ejb.168.2022.04.25.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:39:18 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:39:01 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 05/21] media: rkisp1: params: Fix and simplify
 (un)registration
Message-ID: <YmZsNYy/s0FoTfHO@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-6-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The rkisp1_params_register() and rkisp1_params_unregister() functions
> don't destroy the mutex (in the error path for the former). Fix this,
> simplify error handling at registration time as media_entity_cleanup()
> can be called on an uninitialized entity, and make
> rkisp1_params_unregister() safe to be called on an unregistered params
> node to prepare for simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v3:
> 
> - Use video_is_registered() for registration test
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 8f62f09e635f..f6da2571b55f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1844,16 +1844,20 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		return ret;
> +		goto error;
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
> +
>  	return 0;
> -err_cleanup_media_entity:
> +
> +error:
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
>  	return ret;
>  }
>  
> @@ -1863,6 +1867,10 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
>  	struct rkisp1_vdev_node *node = &params->vnode;
>  	struct video_device *vdev = &node->vdev;
>  
> +	if (!video_is_registered(vdev))
> +		return;
> +
>  	vb2_video_unregister_device(vdev);
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
