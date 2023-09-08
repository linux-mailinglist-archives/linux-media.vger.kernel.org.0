Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7FB7986F9
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 14:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234207AbjIHM02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 08:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjIHM01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 08:26:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CB11BEA
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 05:26:23 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 50CB26607249;
        Fri,  8 Sep 2023 13:26:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694175981;
        bh=w3FbYn1LEX6ZbHALnPvIoWf/02qdy0DmBQ+2aNpQYzU=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=UrHikluPYIsXQDvJRF+daTJMJjkYCKbUTcrYyNdtspxi/+85C+9+9GlaFE2jGrMqL
         LMIGrBHJikoQUntx/lpF2w/7uZuiDZtt++bbe+SyuoS8YtfWG+PKR43v8yR1cpACPY
         zp5CRv+M+9lQ0XmSo4hQEwWy7TN1c0f+i0PEOYa7pc4HfCA8LlLFIrrG324wfwib/6
         BNP3EGgYqcQIAoWt9f7/d9vYhHOJjL+k+CoEduxn8ouF3aSQD2mHJ67LxQRDQAmplD
         hg1EQlq5Ev7ph+W5AqZFLEvC+JjAElIfosgOs+XViIPxpX36d6tsPO05CcnHDOo0yu
         nbcinOLy1HQbA==
Message-ID: <ede17d5c-a727-5308-1cff-8adf2eb090e9@collabora.com>
Date:   Fri, 8 Sep 2023 14:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next v3 2/2] media: cx231xx: Add EP5_BUF_SIZE and
 EP5_TIMEOUT_MS macros
Content-Language: en-US
To:     Jinjie Ruan <ruanjinjie@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <20230903081440.1564633-1-ruanjinjie@huawei.com>
 <20230903081440.1564633-3-ruanjinjie@huawei.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230903081440.1564633-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

W dniu 3.09.2023 o 10:14, Jinjie Ruan pisze:
> Define EP5_BUF_SIZE and EP5_TIMEOUT_MS macros to make the code
> more readable.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> v2:
> - Adjust the patch to be the second.
> - Adjust the macro name.
> ---
>   drivers/media/usb/cx231xx/cx231xx-core.c | 4 ++--
>   drivers/media/usb/cx231xx/cx231xx.h      | 3 +++
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
> index 746727ea1a4c..57a8b4780a7d 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-core.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-core.c
> @@ -751,12 +751,12 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
>   	int ret = -ENOMEM;
>   	u32 *buffer;
>   
> -	buffer = kmemdup(firmware, 4096, GFP_KERNEL);
> +	buffer = kmemdup(firmware, EP5_BUF_SIZE, GFP_KERNEL);
>   	if (buffer == NULL)
>   		return -ENOMEM;
>   
>   	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
> -			buffer, 4096, &actlen, 2000);
> +			buffer, EP5_BUF_SIZE, &actlen, EP5_TIMEOUT_MS);
>   

$ git grep 4096 drivers/media/usb/cx231xx | sort | wc -l
6

4096 is a pretty popular constant in this driver. What about the other 4 places?

Andrzej

>   	if (ret)
>   		dev_err(dev->dev,
> diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
> index 6929e4d97067..74339a6a2f71 100644
> --- a/drivers/media/usb/cx231xx/cx231xx.h
> +++ b/drivers/media/usb/cx231xx/cx231xx.h
> @@ -120,6 +120,9 @@
>   #define CX23417_OSC_EN   8
>   #define CX23417_RESET    9
>   
> +#define EP5_BUF_SIZE     4096
> +#define EP5_TIMEOUT_MS   2000
> +
>   struct cx23417_fmt {
>   	u32   fourcc;          /* v4l2 format id */
>   	int   depth;

