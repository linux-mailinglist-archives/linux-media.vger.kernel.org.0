Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22FF7986F1
	for <lists+linux-media@lfdr.de>; Fri,  8 Sep 2023 14:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236549AbjIHMT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Sep 2023 08:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjIHMT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Sep 2023 08:19:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC801BC5
        for <linux-media@vger.kernel.org>; Fri,  8 Sep 2023 05:19:22 -0700 (PDT)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 88AD86607286;
        Fri,  8 Sep 2023 13:19:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694175560;
        bh=o1f6+aNxSQAm0ofRlZZnKiIrSmlP6TaN6BQEuskfCUM=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=e+fp9izT4y68zmtMFi4D1O5EFskiSM1Q3KZhyoHquNmnA5WpW0nTwfNX1CfObCuZz
         xlKSiNvRIqQhVQXVgnH7FWEs9n/SZyKRUrPHKu/gBuZ2wlCRbPlUEjr2ff5IFNXZ1y
         fNcFViD7Xd1mMwzEiWloh4zLN27GJccOudSFPUCFjG8UUtBD4MGy6/0pHp/MnNM5QC
         Ka7RdXG2f4Kfk93mb1yTtvgJ+cTbgwkcz7JMIenjWIQsPbrXdsFY5zwDJVcWmV1XJh
         t2i+UwZuKYcLoDfqnj22U4poGTb2CgwRMD4SAwoshtoyIYMwgluoVbOCSkHasGNPxm
         CUEsvyEU+BPSQ==
Message-ID: <fe386ce3-c1ee-2940-059a-a8705d200d01@collabora.com>
Date:   Fri, 8 Sep 2023 14:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next v3 1/2] media: cx231xx: Switch to use kmemdup()
 helper
To:     Jinjie Ruan <ruanjinjie@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
References: <20230903081440.1564633-1-ruanjinjie@huawei.com>
 <20230903081440.1564633-2-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230903081440.1564633-2-ruanjinjie@huawei.com>
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
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

I have already reviewed this before, you can add my

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
> v2:
> - Adjust use kmemdup() helper to be the first patch as suggested.
> ---
>   drivers/media/usb/cx231xx/cx231xx-core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-core.c b/drivers/media/usb/cx231xx/cx231xx-core.c
> index 727e6268567f..746727ea1a4c 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-core.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-core.c
> @@ -751,10 +751,9 @@ int cx231xx_ep5_bulkout(struct cx231xx *dev, u8 *firmware, u16 size)
>   	int ret = -ENOMEM;
>   	u32 *buffer;
>   
> -	buffer = kzalloc(4096, GFP_KERNEL);
> +	buffer = kmemdup(firmware, 4096, GFP_KERNEL);
>   	if (buffer == NULL)
>   		return -ENOMEM;
> -	memcpy(&buffer[0], firmware, 4096);
>   
>   	ret = usb_bulk_msg(dev->udev, usb_sndbulkpipe(dev->udev, 5),
>   			buffer, 4096, &actlen, 2000);

