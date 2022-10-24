Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9402C60A935
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 15:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiJXNQ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 09:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbiJXNPM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 09:15:12 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BAA32EEB
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 05:25:47 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-13bd19c3b68so923937fac.7
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr2OwgYAkh/iPZ3dEejRZ/Na7QuC29LAY1OCU4aJJZI=;
        b=Wskq0O17oJEjQjL7lSpO+5yN3GsGf/+L8WroRfIenTnzePM6NbYdizlmSbpYUhsny6
         Cb6FdwSZ8cHuNFTRq9iJXQPP6rbuOYxC2Gdp8ES8e8lY0gun8uyXYDHuT8RajOuRmId7
         2sEKCr6x4QLkeARAVO4vT9FHqTWljlxGYPfDBYl/1oM8S3SSRaLVnQIf95V7oKZYZxeT
         cTEruj/zcQ4ketOHTEEw7P33a9Dq+WQHfhT2OaQn+22BtXRFhP1aire2XZH4Gc5tHJ4/
         os+q7T43dYJOMZuNOPJPSZc5tzpIwttkLFUBTWB5eNYqLJR2pc7jaA0Yl3h0ikzmf6VK
         oVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr2OwgYAkh/iPZ3dEejRZ/Na7QuC29LAY1OCU4aJJZI=;
        b=x+0Yvyb7EgHEFF9oZXS7aPryj+bKPNISF3C683X/hXuMmDXdWIjduRZkZa2U6l0fZQ
         ZzDdd1FQ5lCiyZuPaxtOG+gp5DEV3mCF2dhNJMoeHYZq8fU/MeJudNHo2E3MKt7Q1Kb2
         i0tWLeGreNjSmxNb0A0CFq3I6K5hAUwCcIBiJ7fMNQiaEglXJOD0U6PDprK1koFTFaUg
         qrQg9sDHXmJ9b1DBrktYwM8QGHW798c8PGa6fF/toT9/FeUrTb4tYCYq+o5K4n2zw1EQ
         54TmVhdCsVNa7GZDy/oZhNr5OnzdSUQcknE1P2bHeTdkv7e5AY5L9wgcsjpBM5j+Bixz
         pZbA==
X-Gm-Message-State: ACrzQf16YWeGKcKO6TyJJ4V5w8s+fIw791F2pn7ZGaLT0RP1NYW6SNN4
        mCcMlBJVwEJJqwKE9wgP6yMyILh5moEBUA==
X-Google-Smtp-Source: AMsMyM4fo+VWW/D0udECHxOZvqfTmN9dsLhk83PkvbIgTzk/b+gltno4P3bnjks39FaWupacpj8stg==
X-Received: by 2002:a17:90b:1c0c:b0:213:1455:131f with SMTP id oc12-20020a17090b1c0c00b002131455131fmr4658181pjb.129.1666611969219;
        Mon, 24 Oct 2022 04:46:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3698:60f8:9964:1fb4])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7970b000000b00562664d5027sm19618859pfg.61.2022.10.24.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:46:08 -0700 (PDT)
Date:   Mon, 24 Oct 2022 04:46:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v5] media: s5k4ecgx: Switch to GPIO descriptors
Message-ID: <Y1Z6/WuC76wnAde4@google.com>
References: <20221024111523.7289-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024111523.7289-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

On Mon, Oct 24, 2022 at 01:15:23PM +0200, Linus Walleij wrote:
> diff --git a/include/media/i2c/s5k4ecgx.h b/include/media/i2c/s5k4ecgx.h
> deleted file mode 100644
> index 92202eb35249..000000000000
> --- a/include/media/i2c/s5k4ecgx.h
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * S5K4ECGX image sensor header file
> - *
> - * Copyright (C) 2012, Linaro
> - * Copyright (C) 2012, Samsung Electronics Co., Ltd.
> - */
> -
> -#ifndef S5K4ECGX_H
> -#define S5K4ECGX_H
> -
> -/**
> - * struct s5k4ecgx_gpio - data structure describing a GPIO
> - * @gpio: GPIO number
> - * @level: indicates active state of the @gpio
> - */
> -struct s5k4ecgx_gpio {
> -	int gpio;
> -	int level;
> -};
> -
> -/**
> - * struct s5k4ecgx_platform_data - s5k4ecgx driver platform data
> - * @gpio_reset:	 GPIO driving RESET pin
> - * @gpio_stby:	 GPIO driving STBY pin
> - */
> -
> -struct s5k4ecgx_platform_data {
> -	struct s5k4ecgx_gpio gpio_reset;
> -	struct s5k4ecgx_gpio gpio_stby;
> -};
> -
> -#endif /* S5K4ECGX_H */

If you are removing support for the platform data (since there are no
users in mainline) and the driver does not have OF support maybe it
should be removed altogether?

Thanks.

-- 
Dmitry
