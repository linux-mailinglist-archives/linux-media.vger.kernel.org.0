Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04B6D5BAC2A
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 13:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiIPLSp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 07:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiIPLSo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 07:18:44 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8404E867
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 04:18:43 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x14so2577727wrv.2
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 04:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vFMmx4O+ayirs7Z/R2okd6fcSd7C2lhBekWtYqyPhH0=;
        b=e4O+aERvWvIwRppCBdTQH/oLMPVUtbdmRoBWAERnxzlkNOWSHZrNigenpy7dnlCpf2
         78n30MI9LJR73QlnTvQUoPgYsnQPjoXD7Xmcy7abOOu5uc/2BsJtQAkoNKVv1T+W5GmY
         R5Z5/uACH40qom2JGGc4IWL4We+sPf6E0n3LA8up6MPdtxvcPQ0pYwH3+zclyf7V+2UC
         muXWSr8GLsyNu2GraAeSJFPU6DEyJsE3R0PokzGtmwJJ+d52KthnGtgskHYlYYSgA5XE
         IQNQRAsB0EIyg8GBX6ycTlZ9aIp5UODUcdSzFOx6IcT5gmmF9V48jmV0QhcJKhht2FvR
         QJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vFMmx4O+ayirs7Z/R2okd6fcSd7C2lhBekWtYqyPhH0=;
        b=FIYbNDMNYdnsE17LnlfTSALmS7pW5nR8/Z9QhcSBk7wvZxwVvAWll5MCnyMZesdN5b
         D8hCzA28mYWzd7Qc6xyLK5fyfWrOv+C0LvQnbEi68+0wPER7g6PP2PkMoBwDrRcRCodJ
         USvF2ZCPynlffBHGuhTL4B8JFr3/ptGbVBp8wHOHXVVB2IBLBO+PjkkqY5cylf0hHVxW
         moLI4fJUH2aW+nBwtmmQkxrPbd6YopjE3LeKS4lH9h+xNGr1K6DelnAGX4MKdv861IPW
         e+HnuWhS2luO6kMnWMOK0kUYqTUOevV6sEIj6QzuYf4hKPxRkfqofEg4FF55b8SNJdBY
         Ybfg==
X-Gm-Message-State: ACrzQf37vxg+TDJGxhmG5IdEAyFN/QcBTFcgjmKh/4ay8XvfjwHeed/k
        WZ1o4nAfKXuLgFoSfX0XqY/JUA==
X-Google-Smtp-Source: AMsMyM7+8h0Gv3mPUegKhz24yYAmx1A269JRrSLRGBc2NpRzU9uN7+8dEYbGQZO3/Yr7eq1DTMnwnQ==
X-Received: by 2002:adf:d209:0:b0:228:6298:f288 with SMTP id j9-20020adfd209000000b002286298f288mr2462723wrh.386.1663327121678;
        Fri, 16 Sep 2022 04:18:41 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c128c00b003b4931eb435sm1852270wmd.26.2022.09.16.04.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 04:18:41 -0700 (PDT)
Message-ID: <d597dcb1-f6fe-236a-4fbf-603c4859da21@linaro.org>
Date:   Fri, 16 Sep 2022 12:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>, jacopo@jmondi.org,
        paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
 <CAPY8ntCmRy_BSQW6QajrRMLpQBzMimcQPvZw1ocazxhr2dOd0A@mail.gmail.com>
 <e29e5573-13b6-0a29-20c7-ba780d825a37@linaro.org>
 <YyRX78PH/3zSCdCU@valkosipuli.retiisi.eu>
 <450af6ff-7b72-401c-c0a4-239d16a07cf5@linaro.org>
In-Reply-To: <450af6ff-7b72-401c-c0a4-239d16a07cf5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/09/2022 12:14, Bryan O'Donoghue wrote:
> - A Nvidia driver modified by Leopard imaging that ignores the chip id
>    and uses the same init sequence.
>    This driver is called "imx477" and I can verify it works with
>    imx412 and imx577.
>    The code for this driver modifies the original out of tree driver they
>    had and stops validating the CHIP_ID
>    So I think we can take it as read it works with imx412, imx477 and
>    imx577 - I've verified the first and last is the case.

I should have added

- An RPI driver that works with imx477 and imx378

https://github.com/raspberrypi/linux/blob/rpi-5.15.y/drivers/media/i2c/imx477.c#L38
