Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA15950DA99
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 09:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbiDYH4u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 03:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241677AbiDYH42 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 03:56:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 875E22AC42
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 00:52:57 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id el3so12551372edb.11
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 00:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=liPzVtEJOh3iNfCv/BYXN8l4UEs1DYNoebKNl/6PqeQ=;
        b=F95tSg0UvNAE0JVMyCvPaagcTqt4rof7PnodwFpjfRCCS4F59ZJnGo6ItcwqGr/+dl
         z/I1LzbipNl6N/od+5FFDfXpIlWfd7BXZa7NBBkMrfQPs3iG0an2NexpF2zk3Nc8L5YG
         zpSlrAYFHXqOaJsyWD26Zfg7n74xFGYriVEww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=liPzVtEJOh3iNfCv/BYXN8l4UEs1DYNoebKNl/6PqeQ=;
        b=PbIwt9CLTtp7j8tljYCw7RzDVsUJZpxTET6v2sBOaQxvAQbaMmRvV84wjnWDBcoEmC
         klnUFdAfr2R5EJIG/oCotZZ9xPPMYD9dvgAfKB33tCEBdr4ADtQUMlWilOywm7W+b2s+
         5cC9TbQVePKlvWzZTsLV6VVnO+Dsl/RV76cRKrqUQnDklVqXxBX6AxJYR/gOt+LVdAZl
         1BQngoejQ6SomdMVJQ4iaBgttXUHDCVP8bCU8mv8/9hXq+lM/s19+2mBQbR2hNafL8l5
         DLfUCzMkR0ssM9XLJ9DqRvFcKDFqHNp06kYkCppziP0LKwrX/dpBUXbhc3r8KArkcWI2
         GIsA==
X-Gm-Message-State: AOAM5329lNjTERPH7/94MeTFcawFOwpkU+Y+kNWfFNHwOdVCPUeSznbm
        QP26g7/Xl9c2l3zg3B7bEgXzGA==
X-Google-Smtp-Source: ABdhPJxJTPPWJ5KjCQoS97gTgsxfl46CdbjfVQhHSEtbWUs/O4sRjmfbiBAQDonY+BnpEKIMLxgZ7A==
X-Received: by 2002:a50:ed16:0:b0:425:f420:e51a with SMTP id j22-20020a50ed16000000b00425f420e51amr19992eds.23.1650873176086;
        Mon, 25 Apr 2022 00:52:56 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm3307904ejc.197.2022.04.25.00.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 00:52:55 -0700 (PDT)
Date:   Mon, 25 Apr 2022 09:52:38 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 01/21] media: rkisp1: capture: Initialize entity
 before video device
Message-ID: <YmZTRu5a9bXAgsh3@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-2-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The media_entity embedded in the video_device needs to be initialized
> before registering the video_device. Do so.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index fee2aaacb26b..e88749488969 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1386,22 +1386,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
>  
>  	vdev->queue = q;
>  
> +	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> +	if (ret)
> +		return ret;
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(cap->rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		return ret;
> +		goto error;
>  	}
> +
>  	v4l2_info(v4l2_dev, "registered %s as /dev/video%d\n", vdev->name,
>  		  vdev->num);
>  
> -	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> -	if (ret) {
> -		video_unregister_device(vdev);
> -		return ret;
> -	}
> -
>  	return 0;
> +
> +error:
> +	media_entity_cleanup(&vdev->entity);
> +	return ret;
>  }
>  
>  static void
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
