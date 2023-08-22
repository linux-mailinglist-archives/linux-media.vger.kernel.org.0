Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B07783C4B
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 10:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbjHVI5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 04:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbjHVI5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 04:57:04 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47B9CEA
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 01:56:34 -0700 (PDT)
Received: from [192.168.15.130] (94-240-0-14.lukman.pl [94.240.0.14])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 293A36607241;
        Tue, 22 Aug 2023 09:56:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1692694588;
        bh=8bFZCPT7Rjo3CxT+0jkr51F/7W1mc+UaD8IfloAgLXs=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=LZt2EGdi3STD3gbDXESNGM7Y+KHpUOHZ4QYFpEWDVm/fNEio/Calj7LiX14rOSfl/
         hxzjqzSh/NCFoh6+RC3IPjT4sSg6LyCRQNQ3NGwDYkFWNEOiiEER4TlWIK5WFkthix
         KnCU16+KzdwW4KYgl2O1csunF3lGNTEEB1MFQVPAe2mtdqCQYqqvMpJEjJQSrFuh07
         I1AgxnDwB/3GRSedjo9ZbvjhhevevjK/r8sPY3oOSaFD4BKbxjr1ixxpJU4oLNalDo
         pNcjzFJ7TtLVPQ10Oy9uYnHaARfC5svCFhsAzZJT3jYTKezIifYLyzTQ23EnLg1H5W
         Ye7jEpTCJqBTQ==
Message-ID: <36488f14-8cb9-0b69-92b5-69c1ffb572da@collabora.com>
Date:   Tue, 22 Aug 2023 10:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] media: cx231xx: Switch to use kmemdup() helper
To:     Ruan Jinjie <ruanjinjie@huawei.com>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230815114647.1550908-1-ruanjinjie@huawei.com>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20230815114647.1550908-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

W dniu 15.08.2023 o 13:46, Ruan Jinjie pisze:
> Use kmemdup() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

You could consider replacing the magic constant "4096" with some #defined value.
However, to keep a small granularity of changes this could be done in a
separate patch.

If you prefer to leave this patch as-is you can add

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

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

