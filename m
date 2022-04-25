Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8C550DCE2
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbiDYJkn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240305AbiDYJkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:40:22 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4791A3AC
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:36:40 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bv19so28450881ejb.6
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IICvgo8nR6+CwR6K2NQjDjUzv2CjDXLn1hL/X5+bgjQ=;
        b=Uy5cCk6XSulIBATC6l+wqR5QMl5K8c54iV/JBxtHhMUBRb3Pql6NyP6dKW8Njpm5yP
         AxZD7MndZL6wfSDAkoJgmX392nJcdFSx+jJNWNLGPHpfX1Nti6LHJppMJ8EVIsMb/qJw
         j9lSO4UnuvmbphBmiAqiQhs5vBGKpTafs5N7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IICvgo8nR6+CwR6K2NQjDjUzv2CjDXLn1hL/X5+bgjQ=;
        b=7Hmfg165TKhZ7zx1WE4yC5FU8tl6uJTRcmJ6Rv7cPVqa0MR6qbKSNPXEx8jIokxb7s
         0zEDOGfcRV4W+RJ2mRl4eP3uauKPA2bZgikCn+Po9d4+Ec4JNNzyYPd5b7dopF7FQCRJ
         m5mAUR9bu0c1y9uhLDns9jfR1mGLwTUcD/jzrZr/y/Fy/haMLcTS+A4qED697PTGlyxo
         3ecUVyXPQMhJknmT5Lk06p03CwgYqiugXVPxNbxXXdG6lxbAwpOORFLKpYyLXju8XdPo
         xFrZv+EPoAFWJObHv3Ae/HMrhxEVCTvaT2qb5bK5ZVuNKRcpcL9HUMlntEQIpXla/WeE
         gOrA==
X-Gm-Message-State: AOAM533x9xYOlux9/QT3IPFrHRHA9wzVpe4wLzgyQx7WUheiupjmr9+3
        fgd+qz/Bl2fb28IIkGtqYZbQ9g==
X-Google-Smtp-Source: ABdhPJyaD/ooPmJsbStGHDHPN1o9gZTUObU3z3+xu/Oct5/971yUhlU98YG6Jts0+eb6E24Dz+3Hxw==
X-Received: by 2002:a17:906:5cb:b0:6cf:954:d84d with SMTP id t11-20020a17090605cb00b006cf0954d84dmr15997650ejt.560.1650879397862;
        Mon, 25 Apr 2022 02:36:37 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id y19-20020a056402359300b00423e51be1cesm4311100edc.64.2022.04.25.02.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:36:37 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:36:20 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 03/21] media: rkisp1: isp: Fix and simplify
 (un)registration
Message-ID: <YmZrlImBrUUA91jh@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The rkisp1_isp_register() and rkisp1_isp_unregister() functions don't
> destroy the mutex (in the error path for the former). Fix this, simplify
> error handling at registration time as media_entity_cleanup() can be
> called on an uninitialized entity, and make rkisp1_isp_unregister() and
> safe to be called on an unregistered isp subdev to prepare for
> simplification of error handling at probe time.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v3:
> 
> - Use isp->sd.v4l2_dev instead of isp->sd.flags for registration test
> ---
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2a35bf24e54e..4f7b2157b8cc 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -1090,29 +1090,35 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1)
>  	mutex_init(&isp->ops_lock);
>  	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
>  	if (ret) {
>  		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
> -		goto err_cleanup_media_entity;
> +		goto error;
>  	}
>  
>  	rkisp1_isp_init_config(sd, &state);
> +
>  	return 0;
>  
> -err_cleanup_media_entity:
> +error:
>  	media_entity_cleanup(&sd->entity);
> -
> +	mutex_destroy(&isp->ops_lock);
> +	isp->sd.v4l2_dev = NULL;
>  	return ret;
>  }
>  
>  void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>  {
> -	struct v4l2_subdev *sd = &rkisp1->isp.sd;
> +	struct rkisp1_isp *isp = &rkisp1->isp;
>  
> -	v4l2_device_unregister_subdev(sd);
> -	media_entity_cleanup(&sd->entity);
> +	if (!isp->sd.v4l2_dev)
> +		return;
> +
> +	v4l2_device_unregister_subdev(&isp->sd);
> +	media_entity_cleanup(&isp->sd.entity);
> +	mutex_destroy(&isp->ops_lock);
>  }
>  
>  /* ----------------------------------------------------------------------------
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
