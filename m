Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FA71B135A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 19:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgDTRlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 13:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726294AbgDTRll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 13:41:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA24C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=KkrKO03Oz+eH9z+dT8E9ZJbulxxKNlgAJTlLOtA18mo=; b=WYs/fhY1sJpRzR+soY1bKy3azT
        JORQoz/MsXA0bouA2myFJEfSBO/95NFOfbIYX3bm9NYgwGDbnWqrDYQ3+xd8qNBC/OM0EOsNJZNqQ
        2Hl3VB1MhfCdHCpl6jaBSLjmabWrjB1cv4Mf5BgrPseDgF7+uDkU0lvDXAGWR3sX6rz7Jyc+crXfa
        FRZUQBLXfs7yfYFVfkOU22uus1IiWzmS8IkZzuTP4harK1qAVIyrvtJ4mvGnOnH5/bUzjqp3VfwOc
        bFMTzx260XN2Zv3zSH4jmZ0UKz5+e+OaEsUT+qhXd798+62wxgfqYONbb2xd7Yvxn3nThxP0FU9nV
        T7ZOMqJQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jQaQE-0004Qm-4u; Mon, 20 Apr 2020 17:41:30 +0000
Subject: Re: [PATCH] media: usbvision: depends on USB
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <a0ed60978af23b398d128d1075a7961ef57f0694.1587401420.git.mchehab+huawei@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7034ba29-035c-6f0b-e553-68a369e8aaf8@infradead.org>
Date:   Mon, 20 Apr 2020 10:41:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a0ed60978af23b398d128d1075a7961ef57f0694.1587401420.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/20/20 9:50 AM, Mauro Carvalho Chehab wrote:
> When built with:
> 	CONFIG_USB=m
> 	CONFIG_VIDEO_USBVISION=y
> 
> It causes ld errors:
> 
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg_irq':
> usbvision-core.c:(.text+0x8a4): undefined reference to `usb_submit_urb'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_isoc_irq':
> usbvision-core.c:(.text+0x2ee8): undefined reference to `usb_submit_urb'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_read_reg':
> usbvision-core.c:(.text+0x30ad): undefined reference to `usb_control_msg'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_write_reg':
> usbvision-core.c:(.text+0x3178): undefined reference to `usb_control_msg'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_output':
> usbvision-core.c:(.text+0x344e): undefined reference to `usb_control_msg'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_input':
> usbvision-core.c:(.text+0x3b9b): undefined reference to `usb_control_msg'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_setup':
> usbvision-core.c:(.text+0x4009): undefined reference to `usb_control_msg'
> ld: drivers/staging/media/usbvision/usbvision-core.o:usbvision-core.c:(.text+0x417f): more undefined references to `usb_control_msg' follow
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_set_alternate':
> usbvision-core.c:(.text+0x4518): undefined reference to `usb_set_interface'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_init_isoc':
> usbvision-core.c:(.text+0x4673): undefined reference to `usb_alloc_urb'
> ld: usbvision-core.c:(.text+0x46a5): undefined reference to `usb_alloc_coherent'
> ld: usbvision-core.c:(.text+0x4765): undefined reference to `usb_submit_urb'
> ld: drivers/staging/media/usbvision/usbvision-core.o: in function `usbvision_stop_isoc':
> usbvision-core.c:(.text+0x4837): undefined reference to `usb_kill_urb'
> ld: usbvision-core.c:(.text+0x485f): undefined reference to `usb_free_coherent'
> ld: usbvision-core.c:(.text+0x4874): undefined reference to `usb_free_urb'
> ld: usbvision-core.c:(.text+0x48f1): undefined reference to `usb_set_interface'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_release':
> usbvision-video.c:(.text+0x1a8a): undefined reference to `usb_free_urb'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_disconnect':
> usbvision-video.c:(.text+0x1b74): undefined reference to `usb_put_dev'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_radio_close':
> usbvision-video.c:(.text+0x1c89): undefined reference to `usb_set_interface'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_probe':
> usbvision-video.c:(.text+0x1e4b): undefined reference to `usb_get_dev'
> ld: usbvision-video.c:(.text+0x20e1): undefined reference to `usb_alloc_urb'
> ld: usbvision-video.c:(.text+0x2797): undefined reference to `usb_put_dev'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_exit':
> usbvision-video.c:(.exit.text+0x37): undefined reference to `usb_deregister'
> ld: drivers/staging/media/usbvision/usbvision-video.o: in function `usbvision_init':
> usbvision-video.c:(.init.text+0xf9): undefined reference to `usb_register_driver'
> ld: drivers/staging/media/usbvision/usbvision-i2c.o: in function `usbvision_i2c_write':
> usbvision-i2c.c:(.text+0x2f4): undefined reference to `usb_control_msg'
> 
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> ---
>  drivers/staging/media/usbvision/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/usbvision/Kconfig b/drivers/staging/media/usbvision/Kconfig
> index c6e1afb5ac48..1c7da2a2caac 100644
> --- a/drivers/staging/media/usbvision/Kconfig
> +++ b/drivers/staging/media/usbvision/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_USBVISION
>  	tristate "USB video devices based on Nogatech NT1003/1004/1005 (Deprecated)"
> -	depends on MEDIA_USB_SUPPORT && I2C && VIDEO_V4L2
> +	depends on MEDIA_USB_SUPPORT && I2C && VIDEO_V4L2 && USB
>  	select VIDEO_TUNER
>  	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
>  	help
> 

thanks.
-- 
~Randy
