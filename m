Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1EBE5B58D5
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 12:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiILK46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 06:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiILK44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 06:56:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD9C399E6
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 03:56:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k10so14181910lfm.4
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6tUzH5tD0/EQDJEHdG2/yvhoYIxFUu9UMKWjQ4i6dFU=;
        b=SteGjDdLxOkNmkZpFFdzmeBoHnptV89fx54Dw/Oq0PuAe8oAuJV+gZsgGNzUvlISyV
         6PYF38zZkik05eSX8MajAQR9M0Huu+NQys7oOd88lgiBWzxJD45vl6m6SHoJEfJoYTMe
         HQ0GGJu0nKzn3j1OQSrt8Gky3N9KPvFQID5TKwuIoZ/Dv3XzWrBx6MkkTc4uTHn0CCpY
         ximD+qWIvYS16GSJ+uHHpyo875URq4ospCkjtpGgP6w+aeJoGShxs86YneVdCB6GSc37
         9tj5VgPVbmIPhaQN2awukxTRNMnVY8Bpx/9+fJIcoZUrafA8Rn8YAxl9EBiXG8o6DrDv
         053w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6tUzH5tD0/EQDJEHdG2/yvhoYIxFUu9UMKWjQ4i6dFU=;
        b=rz3uxtEcOOjbDliNkLaZldiJvbHOkY08AgKXfL6KTYtj4RGjQN9AvAe7uCxj+ERJik
         f+cblLuc3YtGhKhZqafegHzUMT5O9PLfzPyfOms7UITccneazHB7V4gQt4DeuZpqEug8
         5nUOv8VNTs8d5tYO0TBLs0djvf24V6WlyESMe+f9WBH+Cp1WjwLHXnI2JkEt0tii87Oh
         b4phEq8Mx0YgctKRNWtcnniDpkDcrbw7FC/5lT00vbC1bGXejesAyjwJ3cOpLzLJgPwG
         nnwUIjdEfxuAEVCZChd/R2elUnk+CaRyT4XpsQ0zWqzwhVN2IImnkoGspGS3BpJTseIP
         gv+w==
X-Gm-Message-State: ACgBeo26XQwa3fbHDdTwBD8pncWXQ3LX/v1qHwLmnjiW9/oliUcj9P4h
        ZV2A4+snhRTr6t5dR9w5Q2yQcg==
X-Google-Smtp-Source: AA6agR7DCprV111kPIM22VhkcLuzQZR4DAuJ30/naNbA1c9awj4/5+Rmp5HIg+7zRvXmBQbRD/hMDg==
X-Received: by 2002:a05:6512:2381:b0:492:afa4:6b67 with SMTP id c1-20020a056512238100b00492afa46b67mr8076625lfv.621.1662980212623;
        Mon, 12 Sep 2022 03:56:52 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id n4-20020a05651203e400b00492d064e8f8sm1002962lfq.263.2022.09.12.03.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:56:52 -0700 (PDT)
Message-ID: <e3c0bafe-394c-e8cc-aba0-6eb480dc5b43@linaro.org>
Date:   Mon, 12 Sep 2022 12:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] media: i2c: add support for ov4689
Content-Language: en-US
To:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Christian Hemp <c.hemp@phytec.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220911200147.375198-1-mike.rudenko@gmail.com>
 <20220911200147.375198-3-mike.rudenko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911200147.375198-3-mike.rudenko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/09/2022 22:01, Mikhail Rudenko wrote:
> +static const struct i2c_device_id ov4689_id[] = {
> +	{ "ov4689", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ov4689_id);
> +
> +static const struct of_device_id ov4689_of_match[] = {
> +	{ .compatible = "ovti,ov4689" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ov4689_of_match);
> +
> +static struct i2c_driver ov4689_i2c_driver = {
> +	.driver = {
> +		.name = "ov4689",
> +		.pm = &ov4689_pm_ops,
> +		.of_match_table = of_match_ptr(ov4689_of_match),

of_match_ptr is usually paired with maybe_unused, otherwise you will
have compile test warnings.

> +	},
> +	.probe = ov4689_probe,
> +	.remove	= ov4689_remove,
> +	.id_table = ov4689_id,
> +};
> +
> +module_i2c_driver(ov4689_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov4689 sensor driver");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof
