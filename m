Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4D2271044
	for <lists+linux-media@lfdr.de>; Sat, 19 Sep 2020 21:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgISTc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 15:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 15:32:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8E2C0613CE;
        Sat, 19 Sep 2020 12:32:27 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so8841668wrs.5;
        Sat, 19 Sep 2020 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=uRD+jtu4T4w3/IBu3hqNZ8Cd+y8HjY9F+wm5MEjM4SU=;
        b=j5EXDhRE8pvoMK7JrAAKL0aJ6LlyvxUeutfhUvbvp9x1Dc9T9tBvRfqDZ+nc3tkDfA
         gV6vWLrHqgq4maYwQUd//5yKxxnjP8BMfwG22frr7OXxmJ3OghfnkAHvBzIy7zjGdSEw
         XMzq5sx82YWQX8wtsToh792Wx7U2GpT+JHGpWrE0nh1t9sHZqDeMeudmFFa858/fedMR
         CBy4zdI4QwUehk/Xt66PBoV/5c6j9vsFpdFvwCAujArYAvEVH5adWnqiYn77P06rk5FA
         hEcvg7/vrCzrwef1nSmGJhMmBFTYvUyBiY9Pcts3qKnAP5UF/NYc7JZmUhS9Cs1c0+8H
         Qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uRD+jtu4T4w3/IBu3hqNZ8Cd+y8HjY9F+wm5MEjM4SU=;
        b=JuR+wdmLTHtnrP584398bYXPGog6VR7NnO5gEmzVTDbS8fLSoap9cZvqm97SHzTcC1
         Vlfcd55oppNIUdi8dErOm/1DlDAxwLkFg1eehn9Ke82jaVFDqQfp7wminysAIiV/mCY3
         xgV+3DaFfSYRC5Dh9cSef96H/9NO+iFdU96jD4ZVtzvTKb65P2LdzQ6xPOaPzn0U3hjT
         MnPl0tiXMqY1V9icdm6L05ypd8Zp3H4ayG7EWHCShyJBZjsrXaDLEBDIyeVIz46ErbsQ
         rfjAWb/Cd22v8N1BjTcrMLXT7NEzq3Mnw4f7RMtVyVOxRAuFzQPywjchk5PWeqx3nAHy
         Xu7A==
X-Gm-Message-State: AOAM5333qtJFDFimgEEIF661/9+XQamCni+ZwH265aJztTZauiKzfWq7
        6IokpU99k8pHuaEidkRITVoT3txSlO/+lQ==
X-Google-Smtp-Source: ABdhPJzrOXv8bcvcOPV2KZZBH0KVfSEQEfKcjfQFzdkmVfez16uArWPgkDhYtbLNjyMUGWSPBk/dqg==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr43684419wrv.8.1600543946429;
        Sat, 19 Sep 2020 12:32:26 -0700 (PDT)
Received: from [192.168.43.148] (92.40.169.140.threembb.co.uk. [92.40.169.140])
        by smtp.gmail.com with ESMTPSA id b11sm12153428wrt.38.2020.09.19.12.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2020 12:32:25 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging: media: atomisp: Remove unhelpful info
 message
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200903183145.720727-1-alex.dewar90@gmail.com>
 <20200903183145.720727-2-alex.dewar90@gmail.com>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <09acb04e-ed83-377c-891e-efbf6b5f101b@gmail.com>
Date:   Sat, 19 Sep 2020 20:32:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903183145.720727-2-alex.dewar90@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-03 19:31, Alex Dewar wrote:
> We don't really need to know that the LED pin reset successfully.
Ping?
>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>   drivers/staging/media/atomisp/i2c/atomisp-lm3554.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> index 621555b0cf6b..77b7f59e62d7 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -771,7 +771,6 @@ static int lm3554_gpio_init(struct i2c_client *client)
>   	ret = gpiod_direction_output(pdata->gpio_reset, 0);
>   	if (ret < 0)
>   		return ret;
> -	dev_info(&client->dev, "flash led reset successfully\n");
>   
>   	if (!pdata->gpio_strobe)
>   		return -EINVAL;

