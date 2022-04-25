Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A69050DD15
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbiDYJtT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbiDYJtR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:49:17 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB171EAD2
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:46:13 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l18so1862897ejc.7
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A7tKpHO66OtlkiZEApqm2Rk5PAcMX4g/UiiBEWrvxiI=;
        b=Coi+maogkdu8bgu2wPeTHl4ezRymlRBdGbdGUYjPpY+gxd4l/1K8AynSdJfcYQ8ffl
         Gy1iskzq7cJPcrCqk91WSxOT44rq1rXy9uSQ6cGGyV4lfiE1ffkILyH0b59wjEnC4DZ2
         IrMGufTk2AyJ+VOCA+q2GK6EBmUYgGBiJz+qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7tKpHO66OtlkiZEApqm2Rk5PAcMX4g/UiiBEWrvxiI=;
        b=h7sa5jqTqcbZgbPAkNoBxQ4cPQHXcz90MQdolYt3P3YCU/LbPqqXt7AqwtRGjKygPY
         HlAulBY1TO4or4lQmq/uq9o70mfZrJOVVQOqogujuGUAhSsGO0TDAbju+MsVLJQbMhcy
         fNmq1Wim9zzS4LFCwCNBjYKiSQHSh3g1MUfpyKrdfx/LHOigLCM34NMj1wHzLNfD7tZi
         oGtxGz57b9OUzGsMxXR8OTHTluXbnMGJgijaPov+faP66o47ud0lNjPvZFcjB6EfgEJJ
         mpIrglXfL/8CtkP8yZSW6e2MFRG7rinjNgGxPxceXUeZox7KbN3gJ9eguHwsrMOiCp2I
         FwVQ==
X-Gm-Message-State: AOAM5318MaqLQ76+8Slfpb+fqUp36fZGAVqj+vNCb0tPmctJst+s/+/8
        JqR3Lt/9mfK3Ksl8tnwjWBynaQ==
X-Google-Smtp-Source: ABdhPJwtXDEWXDIxL3QZF8LoXzBICG5oDKTsYFb4IPHx2WCj0wAqnhjcsodvKvKCrOYD57fwFPBVJQ==
X-Received: by 2002:a17:906:99c1:b0:6ef:d995:11ac with SMTP id s1-20020a17090699c100b006efd99511acmr14946287ejn.244.1650879972102;
        Mon, 25 Apr 2022 02:46:12 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id b25-20020a056402139900b0041904036ab1sm4387450edv.5.2022.04.25.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 02:46:11 -0700 (PDT)
Date:   Mon, 25 Apr 2022 11:45:54 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 07/21] media: rkisp1: Simplify
 rkisp1_entities_register() error path
Message-ID: <YmZt0kiSm5QpXKWK@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-8-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Now that all the unregistration functions are safe to call on
> non-registered entities, the error path in rkisp1_entities_register()
> can be simplified. Factor out the unregistration to a separate function
> to share code with rkisp1_remove().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 40 +++++++++----------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 3f5cfa7eb937..f8b2573aa9da 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -346,48 +346,50 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
>   * Core
>   */
>  
> +static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
> +{
> +	rkisp1_params_unregister(rkisp1);
> +	rkisp1_stats_unregister(rkisp1);
> +	rkisp1_capture_devs_unregister(rkisp1);
> +	rkisp1_resizer_devs_unregister(rkisp1);
> +	rkisp1_isp_unregister(rkisp1);
> +}
> +
>  static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  {
>  	int ret;
>  
>  	ret = rkisp1_isp_register(rkisp1);
>  	if (ret)
> -		return ret;
> +		goto error;
>  
>  	ret = rkisp1_resizer_devs_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_isp_subdev;
> +		goto error;
>  
>  	ret = rkisp1_capture_devs_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_resizer_devs;
> +		goto error;
>  
>  	ret = rkisp1_stats_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_capture_devs;
> +		goto error;
>  
>  	ret = rkisp1_params_register(rkisp1);
>  	if (ret)
> -		goto err_unreg_stats;
> +		goto error;
>  
>  	ret = rkisp1_subdev_notifier(rkisp1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"Failed to register subdev notifier(%d)\n", ret);
> -		goto err_unreg_params;
> +		goto error;
>  	}
>  
>  	return 0;
> -err_unreg_params:
> -	rkisp1_params_unregister(rkisp1);
> -err_unreg_stats:
> -	rkisp1_stats_unregister(rkisp1);
> -err_unreg_capture_devs:
> -	rkisp1_capture_devs_unregister(rkisp1);
> -err_unreg_resizer_devs:
> -	rkisp1_resizer_devs_unregister(rkisp1);
> -err_unreg_isp_subdev:
> -	rkisp1_isp_unregister(rkisp1);
> +
> +error:
> +	rkisp1_entities_unregister(rkisp1);
>  	return ret;
>  }
>  
> @@ -583,11 +585,7 @@ static int rkisp1_remove(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&rkisp1->notifier);
>  	v4l2_async_nf_cleanup(&rkisp1->notifier);
>  
> -	rkisp1_params_unregister(rkisp1);
> -	rkisp1_stats_unregister(rkisp1);
> -	rkisp1_capture_devs_unregister(rkisp1);
> -	rkisp1_resizer_devs_unregister(rkisp1);
> -	rkisp1_isp_unregister(rkisp1);
> +	rkisp1_entities_unregister(rkisp1);
>  
>  	media_device_unregister(&rkisp1->media_dev);
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
