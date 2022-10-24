Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6991660A0F9
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 13:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiJXLVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 07:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbiJXLVM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 07:21:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001DF61B0E
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 04:20:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A1F0E6122F
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 11:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F8CC433D6;
        Mon, 24 Oct 2022 11:20:44 +0000 (UTC)
Message-ID: <fd464c8c-1714-3460-4ff7-5c24feda8cc1@xs4all.nl>
Date:   Mon, 24 Oct 2022 13:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH -next] media: vpfe_capture: fix kconfig dependency errors
Content-Language: en-US
To:     Zeng Heng <zengheng4@huawei.com>, prabhakar.csengg@gmail.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        liwei391@huawei.com
References: <20220926043741.553781-1-zengheng4@huawei.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220926043741.553781-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zeng,

I'm skipping this since the driver will be removed very soon (6.2 if all goes well).

Regards,

	Hans

On 9/26/22 06:37, Zeng Heng wrote:
> CONFIG_VIDEO_DM6446_CCDC & CONFIG_VIDEO_DM355_CCDC
> & CONFIG_VIDEO_DM365_ISIF all depend on feature
> VIDEO_DAVINCI_VPBE_DISPLAY, or the compiler would
> complain build errors as below:
> 
> ld: drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.o: in function `ccdc_sbl_reset':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
> ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_restore_defaults':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:175: undefined reference to `vpss_select_ccdc_source'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:180: undefined reference to `vpss_enable_clock'
> ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_close':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:196: undefined reference to `vpss_enable_clock'
> ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_restore_defaults':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:252: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:253: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:254: undefined reference to `vpss_enable_clock'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:257: undefined reference to `vpss_select_ccdc_source'
> ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_config_raw':
> /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:680: undefined reference to `dm365_vpss_set_sync_pol'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:683: undefined reference to `dm365_vpss_set_pg_frame_size'
> ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:684: undefined reference to `vpss_select_ccdc_source'
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  drivers/staging/media/deprecated/vpfe_capture/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/deprecated/vpfe_capture/Kconfig b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> index 10250e7e566b..557603b51b3f 100644
> --- a/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> +++ b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_DM6446_CCDC
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
> @@ -25,6 +26,7 @@ config VIDEO_DM355_CCDC
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables DM355 CCD hw module. DM355 CCDC hw interfaces
> @@ -45,6 +47,7 @@ config VIDEO_DM365_ISIF
>  	depends on VIDEO_DEV
>  	depends on ARCH_DAVINCI || COMPILE_TEST
>  	depends on I2C
> +	depends on VIDEO_DAVINCI_VPBE_DISPLAY
>  	select VIDEOBUF_DMA_CONTIG
>  	help
>  	  Enables ISIF hw module. This is the hardware module for
