Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD13B5E8433
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 22:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbiIWUkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 16:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbiIWUj6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 16:39:58 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0756212646A;
        Fri, 23 Sep 2022 13:35:11 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id cc5so1650421wrb.6;
        Fri, 23 Sep 2022 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3GTfrM0xAmg6CQZF7/FnBuxE5N54OIBbpsiD+Ni6eOc=;
        b=SBafpol1TJk6trNlpNf24nyutL2QzEZyo3aNuJCG40qh/ujpyVnBnmN2QCvhU9jvSS
         HbFOfHlhUS8Bf1z1LhxRCo/bUOg0MxB9qdDbmA3mXcG3bllNTIxVTPDjOrz9JTwogjUC
         dyM1JkK8zPdpHbrI40ixGkwfdOErgSBdZGaK5kYsmW9oDy0Cxw/SQlSs/wkzIeKK5Ttr
         1X1sS8UUtD6MT+ofKD8pQge/N4awyWU6XUSy3WnOVLYXVbUlkeD8ZIbiIvTZ37/C5AaX
         rmZVBh1dSDRUzB9ImpH9TQ+38t5JMNuBlpDtPkKYUfa3ZgKRMsmUDbvjTN3P1Y9iPZGK
         cGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3GTfrM0xAmg6CQZF7/FnBuxE5N54OIBbpsiD+Ni6eOc=;
        b=DflNiiDrB8jdCMqL4mhZ16wkhkqzd67rFDUitASTTk0rot0voP4uCG/FDQ26fx7kNr
         EwFvkpDoaBw2OPdxsZzzjhoF231cZhDTo8FnYFqIxeOxtMT7okNrqVzNDEhNfnBjMHnm
         SrJ8MwS2meKKXTcg2UfocCWJgDK8N3JsizoM4OU9brw8FEnElRnXLdpMunBI/2J87sYe
         3fMiOv0sU8y7O4hwFlqfRh0KQMb8JYODA6GWI4rFhzHfgJdeJi8hxWz8OVQgwJDDaZ5q
         EJP7IC6a8HnIeZjLVP3+ofUcYQKaU6F5aNxyI504Ts3L7fSWnEmtD9T3/2FuveUlrOQn
         T8Ng==
X-Gm-Message-State: ACrzQf2un9ygQUO3iR1UZH5pAQ6kTTskIoxFNyzPH5egHe/+a4yFGxaR
        kTiE4esB4Pc87mRkOMHtWhRPkGOzBII=
X-Google-Smtp-Source: AMsMyM4HK5gt2jETkQZCd3v7kXedzpcgXfMa5t7oiOXpEAbW9xJeFfCrOow2XEe86NCoQYkD1NbS0Q==
X-Received: by 2002:a5d:6987:0:b0:228:623e:2dc5 with SMTP id g7-20020a5d6987000000b00228623e2dc5mr6492538wru.574.1663965309820;
        Fri, 23 Sep 2022 13:35:09 -0700 (PDT)
Received: from [192.168.0.30] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id c190-20020a1c35c7000000b003b4a33a7d08sm3452670wma.9.2022.09.23.13.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 13:35:09 -0700 (PDT)
Message-ID: <441b7031-bc23-e0ff-6a28-51796c920790@gmail.com>
Date:   Fri, 23 Sep 2022 21:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: exynos4-is: don't rely on the v4l2_async_subdev
 internals
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <CGME20220923094232eucas1p1deb3985c9637a0876609c75967175e9b@eucas1p1.samsung.com>
 <20220923094201.18047-1-m.szyprowski@samsung.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <20220923094201.18047-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek

On 23/09/2022 10:42, Marek Szyprowski wrote:
> Commit 1f391df44607 ("media: v4l2-async: Use endpoints in
> __v4l2_async_nf_add_fwnode_remote()") changed the data that is stored in
> the v4l2_async_subdev internals from the fwnode pointer to the parent
> device to the fwnode pointer to the matched endpoint. This broke the
> sensor matching code, which relied on the particular fwnode data in the
> v4l2_async_subdev internals. Fix this by simply matching the
> v4l2_async_subdev pointer, which is already available there.
>
> Reported-by: Daniel Scally <djrscally@gmail.com>
> Fixes: fa91f1056f17 ("[media] exynos4-is: Add support for asynchronous subdevices registration")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---


Yeah that makes more sense to me:


Reviewed-by: Daniel Scally <djrscally@gmail.com>

>   drivers/media/platform/samsung/exynos4-is/media-dev.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.c b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> index 52b43ea04030..412213b0c384 100644
> --- a/drivers/media/platform/samsung/exynos4-is/media-dev.c
> +++ b/drivers/media/platform/samsung/exynos4-is/media-dev.c
> @@ -1380,9 +1380,7 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
>   
>   	/* Find platform data for this sensor subdev */
>   	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
> -		if (fmd->sensor[i].asd &&
> -		    fmd->sensor[i].asd->match.fwnode ==
> -		    of_fwnode_handle(subdev->dev->of_node))
> +		if (fmd->sensor[i].asd == asd)
>   			si = &fmd->sensor[i];
>   
>   	if (si == NULL)
