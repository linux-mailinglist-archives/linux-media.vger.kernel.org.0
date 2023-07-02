Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EF8744D7F
	for <lists+linux-media@lfdr.de>; Sun,  2 Jul 2023 13:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjGBL5t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jul 2023 07:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjGBL5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Jul 2023 07:57:48 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28A7E78
        for <linux-media@vger.kernel.org>; Sun,  2 Jul 2023 04:57:47 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-307d20548adso3913188f8f.0
        for <linux-media@vger.kernel.org>; Sun, 02 Jul 2023 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688299066; x=1690891066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLmNKfiOfs/JzNqpHtl+ogbUGSOD0y7U09pWRIPZWWg=;
        b=PV2Pxs+0ukQHuyLndpoaelR0SjIrZSlX49nniUDo4UOTjRuAmaw4vl+NbeOtY+cTDi
         qp2eHyDNvt9jZdoIKg5HhJ/+mTa/jcEpBX2av8x3JbvNC8SRNdIIgHGw9P4wAxTRa2ap
         +eT1Buyu9yxDaXIBQ4zer7ILF6Xgj4TjzAoTh7//p3AkQUK7E/k4JyGB54YXxOiWFl98
         aX8YsKvR3tCIwGmhe8K7jPrE/aO9cRa3RHleaLlhIoERh9eSo8zHT8KpLa4QnLE812uC
         Mu6Be6mYCmn11AErnP7oHu/Ii+TF+t/VXjzwl4bpFUly9tun/JHbvolcqdHUEcYrbGg3
         pN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688299066; x=1690891066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLmNKfiOfs/JzNqpHtl+ogbUGSOD0y7U09pWRIPZWWg=;
        b=KxwaOmg6aNYz9EJye47XoT00ak45esyUJ/YxkxU1UeU9FRNi6gdpjpdJHho2biKa2h
         x/6klZPSG6joWfCa3nGcng6azrEflGcLLSzwkBAiFSNQkVJet2DIt+zPTa7nntPvk96X
         xxgpGgOVjS09y5XprOzfSgZA4/1T5/JHj63+rBujQ+QIBg4oTm6UyjYRjqZf0hQ+SAb6
         nOF7RUus4uAoA4ayKNajk/AXwh9FOh4hrtuR7EYVFgPQsD9ESPpP++Amo8C898+1OrL0
         kCoxQ3TviZj4tF9mmqYfxxBq+deaI/vpUzZhZbX+mUtiunhJdBNDYYAd+waycbO3UCq5
         xGMQ==
X-Gm-Message-State: ABy/qLYp+GEu3BUuckq50+eq/FxR6Boc5SlmJqpHrXosFKXNI8mJcia3
        0G52Uncc/J/cZJMse3GCFXbB1w==
X-Google-Smtp-Source: APBJJlHM8qkNQSxF5bAfZfblyqIfvfHQlskrF7CqjPSXPzri08XRdVFETaBYmfn4+0jmvFt8+h6Tow==
X-Received: by 2002:adf:ed8a:0:b0:313:f0d7:a46 with SMTP id c10-20020adfed8a000000b00313f0d70a46mr5429689wro.3.1688299066133;
        Sun, 02 Jul 2023 04:57:46 -0700 (PDT)
Received: from [192.168.118.20] ([87.116.165.87])
        by smtp.gmail.com with ESMTPSA id a10-20020adfeeca000000b00314103d6daesm10466211wrp.47.2023.07.02.04.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 04:57:45 -0700 (PDT)
Message-ID: <79496d4a-74c9-76c5-b7e8-c9c0db3a5e9e@linaro.org>
Date:   Sun, 2 Jul 2023 14:57:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/7] media: v4l: subdev: Support INTERNAL pads in routing
 IOCTLs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-4-sakari.ailus@linux.intel.com>
Content-Language: en-US
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
In-Reply-To: <20230630204338.126583-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 30.06.2023 23:43, Sakari Ailus wrote:
> Take the new INTERNAL pad flag into account in validating routing IOCTL
> argument. Effectively this is a SINK pad in this respect. Due to the union
> there's no need to check for the particular name.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 2ec179cd1264..36886a9047c4 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1787,7 +1787,8 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
>   
>   		/* Validate the sink and source pad numbers. */
>   		if (route->sink_pad >= sd->entity.num_pads ||
> -		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
> +		    !(sd->entity.pads[route->sink_pad].flags &
> +		      MEDIA_PAD_FL_SINK)) {

This is a white space only change now, so maybe this patch could be just 
dropped?

Thanks,
Andrey

>   			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
>   				i, route->sink_pad);
>   			goto out;
