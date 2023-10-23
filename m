Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342497D395F
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 16:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbjJWOcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 10:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJWOcw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 10:32:52 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E68E10C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 07:32:50 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso50621841fa.2
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071568; x=1698676368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4zLfZKHxVydtU/EGWqXKarc7iejpbu5G0JHAWOhD6zo=;
        b=JMza0nv10PyH1JNzrqXrSfm2Dn4ei2SwL54trvXuUnbGLSdKNus+5Fc0Vc6PYHIh0J
         p/XXqqxiR4LK94U43ZtcOwngmZsvBgXFtAFigg7fS8RdOYDh8AvG0VDqjeZmL1jiEkT5
         ZMJWDeB669/w7BRuCrSdNA0hSkw3r+WZNVfa0EEkBCH/+k1Y602SvB12DzpSK1TJ1YK/
         jdIi9BYxP1zwfV3qmKX3X1R1wfMh5gL0mYciyIASvD7thAGdCehAbgt4g6lqYRrkMcVK
         BA+HvVjSWRkjiF5qiwurwcEkVs819edIE8+EQvvymcxUMbT4M1vXYYIW1iZO93kzjHV9
         mHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071568; x=1698676368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zLfZKHxVydtU/EGWqXKarc7iejpbu5G0JHAWOhD6zo=;
        b=IqWQeGb0LISxXw6h6XnC/8KP8WUAiyqiVVpVCZI0jP93fNvPBe0Rn2UlJNmaeTOfyj
         c8/AeYzkg1/YoVgNCezESB2ESuKuKe4xpFlut68c8B7J3Uf61QWheXeNJOOwKjRB6aZK
         Vx8hYTl85rPhQi/7Jk70MQ2AsG7yFVOpUscIpaGqZw0By27RM+WP4AXjcBJJMpUKwvLi
         9HvI3K5NdYlcsAN+SI69Mn1rO0tRx5XrtXcKR5uslOzElPAAmp1HDDYpImOQIMLmhbKh
         MMgvy2SBbSvIKrvfEpF8y8Mo5lVMUYZCiec73yjlkqXa2H9PVU9SOf44P2AD0MCPqNrO
         jL1A==
X-Gm-Message-State: AOJu0Yy8bQhDJDt5w5x7c+l6ppzZ3gPl3tR9a2gOY3kRHWrzywYaLsXp
        K65KtPL6NsoZbZNwcfeildcIUg==
X-Google-Smtp-Source: AGHT+IHWAvcn3DtHE1zZNxaFAmobec0SjV+b2xWBbgNDrpNvHCcScjtF3CCZpq1XsfYEUllNhe1Dyg==
X-Received: by 2002:a2e:a7c7:0:b0:2c5:1867:b0bd with SMTP id x7-20020a2ea7c7000000b002c51867b0bdmr6020677ljp.23.1698071568320;
        Mon, 23 Oct 2023 07:32:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r5-20020a056000014500b0032db4825495sm7854704wrx.22.2023.10.23.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:32:47 -0700 (PDT)
Date:   Mon, 23 Oct 2023 17:32:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jonathan Bergh <bergh.jonathan@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, error27@gmail.com,
        linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: media: av7110: Fix various formating issues
Message-ID: <052d566b-574a-439c-8113-b894406a4407@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
 <20231020232332.55024-6-bergh.jonathan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020232332.55024-6-bergh.jonathan@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 21, 2023 at 01:23:32AM +0200, Jonathan Bergh wrote:
>  drivers/staging/media/av7110/av7110_av.c | 29 +++++++++++++-----------
>  1 file changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index 82d4c02ae3ef..bdef95244121 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 3);
>  
> -		if (((sync &~0x0f) == 0x000001e0) ||
> -		    ((sync &~0x1f) == 0x000001c0) ||
> +		if (((sync & ~0x0f) == 0x000001e0) ||
> +		    ((sync & ~0x1f) == 0x000001c0) ||

You introduced this yourself earlier.  Which is good.  But better to
not create the issue in the first place.

regards,
dan carpenter

