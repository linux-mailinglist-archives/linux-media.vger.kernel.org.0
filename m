Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A4E4D076A
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 20:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237059AbiCGTQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 14:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245011AbiCGTQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 14:16:30 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBE97DAAC
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 11:15:35 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id x3so12822025qvd.8
        for <linux-media@vger.kernel.org>; Mon, 07 Mar 2022 11:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/T06aUbPfselr2n9TidREgOZVwSFDIvHWwBUr3oboEY=;
        b=0fW5OJ6uXE0+94/55NGIEmnq+6afVcsDLJcD4bhRA6plcBlDqgEo7x8BF4GAcQJWOh
         7PCJaLW3V3APTBN8pFeIrn3JmBXkgtJS24zRzFV2bMU9CS1GiGBZVHbkuIWFCJSorQ1T
         AyhT8RGCVsELcXtpzQkUoVO4USZ3fnoGj1x8xa8dl1TlX9VZ838bz22ddMpTZ8p0Xjks
         M6TOpCzCDNj62s6O2EsIZnXMYApXsIuL4lzyQFGsAtS5Noo80dJcZtJr5ab7MaCCxRP2
         VWVrgmCM9JW4yXnjkUEbX+lVc9+sc7UHRadF3PL9eqWUv6HtTyaNvtj4okktk3te2NJ6
         fUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/T06aUbPfselr2n9TidREgOZVwSFDIvHWwBUr3oboEY=;
        b=Bf2S1iBJb1ujJ3OgaTzgbGvuVa02s7TuRTSln/apK3uGHpwTJX7LJqr7J11BZSmPmB
         XGXRjogNE4+5NS5WelfoBZaq/1RwSaf2e1aeEfbe7B35HAMmdzqbU3INxtAbgOiDMmJw
         /3Q4REhXNjg63daBqKsqLhO8vHGsMRXvGXKiTpacNZ5lQAxe/BgAlnqBBZzzgfFUBCtN
         Ur0ykh6CqPa52oxFd2bQDWHN+B2lAtx4ickySxHIkODXJSqIDEYcdlBm9a0QHh5t6Cfu
         cWmF4K9fZsYp3nf3iNWdp8HYOQTE+7ehxBRzQEkG8zLtWXL+b45UWQL8lYwHI8pRYB99
         Josg==
X-Gm-Message-State: AOAM533WvdXLRleJ2yqOtznUk/0yyZO1w1Qx+MImWalrOExGMsYomUlW
        SB+FU4jiJOL10hGZABDZvd5Lig==
X-Google-Smtp-Source: ABdhPJxAVg/j3lDy7bc75kjBmzKmDN0hepKqllxf/hSt06pbVJQG70GO1a73cXthkmhH0nvdgcBqwA==
X-Received: by 2002:a05:6214:212f:b0:42f:e1c1:9f00 with SMTP id r15-20020a056214212f00b0042fe1c19f00mr9724294qvc.79.1646680534557;
        Mon, 07 Mar 2022 11:15:34 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id q8-20020a05622a04c800b002e06d7c1eabsm797470qtx.16.2022.03.07.11.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 11:15:34 -0800 (PST)
Message-ID: <4f76307485579893114ae4fb9e07cdeb83fd9383.camel@ndufresne.ca>
Subject: Re: [PATCH v2 01/17] media: rkisp1: capture: Initialize entity
 before video device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Date:   Mon, 07 Mar 2022 14:15:32 -0500
In-Reply-To: <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
References: <20220304171925.1592-1-laurent.pinchart@ideasonboard.com>
         <20220304171925.1592-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Le vendredi 04 mars 2022 à 19:19 +0200, Laurent Pinchart a écrit :
> The media_entity embedded in the video_device needs to be initialized
> before registering the video_device. Do so.

We've seen the same bug in MTK vcodec topology. Any idea if that could be catch
this at lower level to prevent invalid path being populated in the media
controller over and over ?

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c   | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index c95c00a91180..9c11f2b8e5f5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1372,22 +1372,25 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
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

