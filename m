Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB6941E08
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 09:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407438AbfFLHm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 03:42:59 -0400
Received: from gofer.mess.org ([88.97.38.141]:47575 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406649AbfFLHm7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 03:42:59 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 79842602BB; Wed, 12 Jun 2019 08:42:55 +0100 (BST)
Date:   Wed, 12 Jun 2019 08:42:55 +0100
From:   Sean Young <sean@mess.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     mchehab@kernel.org, tglx@linutronix.de, corbet@lwn.net,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ttpci: Fix build error without RC_CORE
Message-ID: <20190612074254.eky2xo7bajorkhfy@gofer.mess.org>
References: <20190612034310.4640-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612034310.4640-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 11:43:10AM +0800, YueHaibing wrote:
> If RC_CORE is not set, building fails:
> 
> drivers/media/pci/ttpci/av7110_ir.o: In function `av7110_ir_init':
> av7110_ir.c:(.text+0x1b0): undefined reference to `rc_allocate_device'
> av7110_ir.c:(.text+0x2c1): undefined reference to `rc_register_device'
> av7110_ir.c:(.text+0x2dc): undefined reference to `rc_free_device'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 71f49a8bf5c5 ("media: ttpci: use rc-core for the IR receiver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thank you for spotting this and writing a patch.

> ---
>  drivers/media/pci/ttpci/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/ttpci/Kconfig b/drivers/media/pci/ttpci/Kconfig
> index d96d4fa..b705631 100644
> --- a/drivers/media/pci/ttpci/Kconfig
> +++ b/drivers/media/pci/ttpci/Kconfig
> @@ -7,7 +7,7 @@ config DVB_AV7110
>  	depends on DVB_CORE && PCI && I2C
>  	select TTPCI_EEPROM
>  	select VIDEO_SAA7146_VV
> -	select DVB_AV7110_IR if INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110

This says if
 - select DVB_AV7110_IR if INPUT_EVDEV and DVB_AV7110 are both y or m
 - select DVB_AV7110_IR if INPUT_EVDEV=y
   This exists for the case when INPUT_EVDEV=y and DVB_AV7110=m, which is fine

> +	select DVB_AV7110_IR if RC_CORE=DVB_AV7110 && (INPUT_EVDEV=y || INPUT_EVDEV=DVB_AV7110)

That's not exactly the same. For one thing it should not longer depend on
INPUT_EVDEV=y.

Now if DVB_AV7110=m and RC_CORE=y is not allowed which should be (this is
the case in Fedora default kernel config for example).

>  	depends on VIDEO_DEV	# dependencies of VIDEO_SAA7146_VV
>  	select DVB_VES1820 if MEDIA_SUBDRV_AUTOSELECT
>  	select DVB_VES1X93 if MEDIA_SUBDRV_AUTOSELECT
> -- 
> 2.7.4
> 

Thanks,

Sean
