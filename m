Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74381412AAD
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 03:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbhIUBqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Sep 2021 21:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbhIUBkB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Sep 2021 21:40:01 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B6FC061D78;
        Mon, 20 Sep 2021 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=JLhSqax26+J0GW/Co2tVaizBoPDQ4xYs1QjiJCsCNrk=; b=DALxwl8wwX/1GRP29oGH9hKlsU
        wRmqdyfWwDiS2YE8NzQmHXLu/1kc/PB2r0nR2lL6IhOu+XqA/30xBiC6PYp49d+TFNVcJPPQM4TJy
        VZfHneCS0ZsjXGzyvSUTgOH+mP7eVYlhFpI3lcyFrcTqkhTIbq/Wd4VaR5tPpKwVLS2b/02C6dWa8
        +9JdUMV2dhGKReLhYmwr9s+ePh1sOpfl5V4N1t6XAg2myyRHTqooQ0vYhJDYcpXqH4g6YLSbF6kYG
        2hxMl8rqX6dC/34j5nhwsY/119YivGOJABZqoQCOKFQcVPqJzg2FLrc7VaM9CVgIAhjdThLXoamDP
        q8QsrNKA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mSPx8-0032fd-Ne; Mon, 20 Sep 2021 20:31:50 +0000
Subject: Re: [PATCH] media: i2c: select V4L2_ASYNC where needed
To:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210920095830.1259051-1-arnd@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <387f295c-69e4-76f2-5f7d-29be6a801639@infradead.org>
Date:   Mon, 20 Sep 2021 13:31:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920095830.1259051-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/20/21 2:58 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I came across a link failure from randconfig builds:
> 
> x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_remove':
> ths8200.c:(.text+0x491): undefined reference to `v4l2_async_unregister_subdev'
> x86_64-linux-ld: drivers/media/i2c/ths8200.o: in function `ths8200_probe':
> ths8200.c:(.text+0xe49): undefined reference to `v4l2_async_register_subdev'

ths8200 is already fixed.

> x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_remove':
> tw9910.c:(.text+0x467): undefined reference to `v4l2_async_unregister_subdev'
> x86_64-linux-ld: drivers/media/i2c/tw9910.o: in function `tw9910_probe':
> tw9910.c:(.text+0x1123): undefined reference to `v4l2_async_register_subdev'
> 
> These clearly lack a 'select' statement, but I don't know why
> this started happening only now. I had a bit of a look around to find
> other configs that have the same problem, but could not come up with
> a reliable way and found nothing else through experimentation.
> It is likely that other symbols like these exist that need an extra
> select.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/i2c/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 08feb3e8c1bf..d49eecc4fe33 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -450,6 +450,7 @@ config VIDEO_TW9906
>   config VIDEO_TW9910
>   	tristate "Techwell TW9910 video decoder"
>   	depends on VIDEO_V4L2 && I2C
> +	select V4L2_ASYNC
>   	help
>   	  Support for Techwell TW9910 NTSC/PAL/SECAM video decoder.
>   
> @@ -597,6 +598,7 @@ config VIDEO_AK881X
>   config VIDEO_THS8200
>   	tristate "Texas Instruments THS8200 video encoder"
>   	depends on VIDEO_V4L2 && I2C
> +	select V4L2_ASYNC
>   	help
>   	  Support for the Texas Instruments THS8200 video encoder.
>   
> 

Thanks.
-- 
~Randy
