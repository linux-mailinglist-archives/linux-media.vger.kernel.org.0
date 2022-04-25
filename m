Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 753F150DCD5
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbiDYJja (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241704AbiDYJiz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:38:55 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7189140E0
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:34:27 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y21so10752654edo.2
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eg7ir52Dj1qV9+S8fu2j2lJ1W35cMb3SwZSQ29mhSeo=;
        b=ENGIfYkyd4wg0H0QBy6yHjx+SmQFOAIXjRBU4RqxAqUHEM/KR/KEgnA13gFiEMAhOh
         vmt3njdvQ6gh2fXU9qx2RC0J83CCkghXQd5Y7TzP08f8UUBJqoOCM4TRFNCfhRII7PGO
         FKzjoKAuLW56hbO0dxy1cUH3UuZ8TEa+N1jAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eg7ir52Dj1qV9+S8fu2j2lJ1W35cMb3SwZSQ29mhSeo=;
        b=vxjNKi3mQHBM5uwG3kHr3hvulz980TISsg1O6dNeN1hTCPCnuE39ntMjlVhx+l2Nsc
         zzDEUuVOFTLeDMViVXnisfHFyC7wQxAYQvyUxpK414qiWY0p/OO/xfMEaecXMYuZ1SX7
         qw+Bc+B2+XxHwmbArruHg6kRv8D1g62jexO0FJhY2c02jQxJB1akPz2dy8Fcsx+fBCQ3
         zzm1fMauWqsPvO0fyjntKWYKKHwqYShI8Ok8KLWRTLMYhBetHNIL/lTB5pgSfdUbgqVS
         Zj/YZuuZyPH8rJyNQ0PkIuoLVp9tpBViRMADyfWbEFkXcfVw25Np7agsJitWKOdK1ZKD
         JstQ==
X-Gm-Message-State: AOAM530Q3D1+snl78b0j1Kkti9VtLtB1QJik2PJab8pDsI49s4QUNIE+
        nQxBS0VunusHwG3beT8vr4euSQ==
X-Google-Smtp-Source: ABdhPJx0CEilFAAok8STiPwb4ruZMcKe+n9MXKj3MyI+KHGNegLbtQDBVfh2caWrpExJgQpP5Ipvig==
X-Received: by 2002:a05:6402:288a:b0:425:c5b2:59d9 with SMTP id eg10-20020a056402288a00b00425c5b259d9mr13353541edb.412.1650879266453;
        Mon, 25 Apr 2022 02:34:26 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id d13-20020a1709063ecd00b006f385c42e5fsm1689746ejj.217.2022.04.25.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:34:26 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:34:08 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 02/21] media: rkisp1: capture: Fix and simplify
 (un)registration
Message-ID: <YmZrEEDwOklI/9S+@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The rkisp1_register_capture() and rkisp1_unregister_capture() functions
> don't destroy the mutex (in the error path for the former). Fix this and
> make rkisp1_unregister_capture() and rkisp1_capture_devs_unregister()
> safe to be called on an unregistered capture node to prepare for
> simplification of error handling at probe time.
> 
> While at it, drop the double initialization of cap->rkisp1 in
> rkisp1_capture_devs_register() as the field is already initialized in
> rkisp1_capture_init().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v2:
> 
> - Use video_is_registered() as registration test
> - Drop double initialization of cap->rkisp1
> - Move part of 03/17 to this patch
> 
> Changes since v1:
> 
> - Reset cap->rkisp1 in rkisp1_capture_devs_register()
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index e88749488969..6c54e95a529b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1326,8 +1326,12 @@ static const struct v4l2_file_operations rkisp1_fops = {
>  
>  static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
>  {
> +	if (!video_is_registered(&cap->vnode.vdev))
> +		return;
> +
>  	media_entity_cleanup(&cap->vnode.vdev.entity);
>  	vb2_video_unregister_device(&cap->vnode.vdev);
> +	mutex_destroy(&cap->vnode.vlock);
>  }
>  
>  void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
> @@ -1381,14 +1385,14 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
>  			"vb2 queue init failed (err=%d)\n", ret);
> -		return ret;
> +		goto error;
>  	}
>  
>  	vdev->queue = q;
>  
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
> @@ -1404,6 +1408,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  
>  error:
>  	media_entity_cleanup(&vdev->entity);
> +	mutex_destroy(&node->vlock);
>  	return ret;
>  }
>  
> @@ -1439,26 +1444,21 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>  
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
>  {
> -	struct rkisp1_capture *cap;
> -	unsigned int i, j;
> +	unsigned int i;
>  	int ret;
>  
>  	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> +		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
> +
>  		rkisp1_capture_init(rkisp1, i);
> -		cap = &rkisp1->capture_devs[i];
> -		cap->rkisp1 = rkisp1;
> +
>  		ret = rkisp1_register_capture(cap);
> -		if (ret)
> -			goto err_unreg_capture_devs;
> +		if (ret) {
> +			rkisp1_capture_devs_unregister(rkisp1);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
>  
> -err_unreg_capture_devs:
> -	for (j = 0; j < i; j++) {
> -		cap = &rkisp1->capture_devs[j];
> -		rkisp1_unregister_capture(cap);
> -	}
> -
> -	return ret;
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
