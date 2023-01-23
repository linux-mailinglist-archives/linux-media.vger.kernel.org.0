Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B04C677B12
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjAWMhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjAWMhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:37:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8134185
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:37:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A19EAB80CB1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 12:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D527DC433D2;
        Mon, 23 Jan 2023 12:37:03 +0000 (UTC)
Message-ID: <bf1314db-2757-553a-f115-cc85896ec15b@xs4all.nl>
Date:   Mon, 23 Jan 2023 13:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH -next] media: staging: stkwebcam: Fix the build error with
 stkwebcam
Content-Language: en-US
To:     Gaosheng Cui <cuigaosheng1@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, ribalda@chromium.org,
        neil.armstrong@linaro.org, geert+renesas@glider.be
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221226094820.1157244-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

FYI: for v6.3 the whole driver will be removed, so I'm dropping this patch.

Regards,

	Hans

On 26/12/2022 10:48, Gaosheng Cui wrote:
> When I am building the kernel on arm64, set config CONFIG_USB=m &&
> CONFIG_VIDEO_STKWEBCAM=y, I get some error reports as follows:
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>     function `stk_v4l_dev_release':
>   stk-webcam.c:(.text+0x3e0): undefined reference to `usb_put_intf'
>   stk-webcam.c:(.text+0x3e8): undefined reference to `usb_put_dev'
>   drivers/staging/media/deprecated/stkwebcam/stk-webcam.o: In
>   function `stk_clean_iso':
>   stk-webcam.c:(.text+0xb0c): undefined reference to `usb_kill_urb'
>   stk-webcam.c:(.text+0xb14): undefined reference to `usb_free_urb'
> 
> Fix it by add dependency option on USB for VIDEO_STKWEBCAM.
> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  drivers/staging/media/deprecated/stkwebcam/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/deprecated/stkwebcam/Kconfig b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> index 7234498e634a..083fadab232d 100644
> --- a/drivers/staging/media/deprecated/stkwebcam/Kconfig
> +++ b/drivers/staging/media/deprecated/stkwebcam/Kconfig
> @@ -2,7 +2,7 @@
>  config VIDEO_STKWEBCAM
>  	tristate "USB Syntek DC1125 Camera support (DEPRECATED)"
>  	depends on VIDEO_DEV
> -	depends on MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
> +	depends on USB && MEDIA_USB_SUPPORT && MEDIA_CAMERA_SUPPORT
>  	help
>  	  Say Y here if you want to use this type of camera.
>  	  Supported devices are typically found in some Asus laptops,

