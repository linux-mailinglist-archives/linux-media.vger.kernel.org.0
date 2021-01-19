Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1F42FBE12
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387895AbhASPFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 10:05:16 -0500
Received: from gofer.mess.org ([88.97.38.141]:49185 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391099AbhASOze (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 09:55:34 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9EEECC63BE; Tue, 19 Jan 2021 14:54:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1611068092; bh=4FCk/3hL7LqfDUDV5R8M7KZf2iejU6Dbcp6DcL4aT20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kKZyK9lq5hsZgQzh7Tovpf+G4vnPVDMm5wJKKJuxnu9PgrYuZg7D3CPPq7a8qEF80
         17r66RM07SfWNVGbK3dWVjWAtWOC8Q/9C5SclRZDJKs21NyfFYeyF0kOHd9OU+JC64
         Ixrtp7xV5MhcA7m0yYlOQEtsyHxPQFw4FSmDEUMYPRyG7a8latL35lKahBywtfYWxs
         EEGQvpV8a8FGkhqpN8PpmVYLRWkEPhf9tdCj/tnEUE2yiBILPotCrjcq6T39UE9L3b
         E9PR+BneTYHTrX39gRe3TOM6AEAM3Vh7eU9JOEmJJiWFFF8aHrt/uSkxKy6tESbP86
         WRXafBiJ5hqvA==
Date:   Tue, 19 Jan 2021 14:54:52 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rc: select CONFIG_BITREVERSE where needed
Message-ID: <20210119145452.GA19746@gofer.mess.org>
References: <20201203231714.1484408-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203231714.1484408-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 04, 2020 at 12:17:03AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of remote control drivers require the bitreverse
> helper, and run into a link error when it is disabled:
> 
> arm-linux-gnueabi-ld: drivers/media/rc/img-ir/img-ir-nec.o: in function `img_ir_nec_scancode':
> img-ir-nec.c:(.text+0x10c): undefined reference to `byte_rev_table'
> arm-linux-gnueabi-ld: drivers/media/rc/img-ir/img-ir-nec.o: in function `img_ir_nec_filter':
> img-ir-nec.c:(.text+0x2dc): undefined reference to `byte_rev_table'
> arm-linux-gnueabi-ld: drivers/media/usb/cx231xx/cx231xx-input.o: in function `get_key_isdbt':
> cx231xx-input.c:(.text+0x38c): undefined reference to `byte_rev_table'
> arm-linux-gnueabi-ld: drivers/media/usb/em28xx/em28xx-input.o: in function `em28xx_get_key_em_haup':
> em28xx-input.c:(.text+0x1704): undefined reference to `byte_rev_table'
> 
Acked-by: Sean Young <sean@mess.org>

Thanks

Sean

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/rc/Kconfig          | 2 ++
>  drivers/media/rc/img-ir/Kconfig   | 1 +
>  drivers/media/usb/cx231xx/Kconfig | 1 +
>  drivers/media/usb/em28xx/Kconfig  | 1 +
>  4 files changed, 5 insertions(+)
> 
> diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
> index 2c0ee2e5b446..8a4b4040be45 100644
> --- a/drivers/media/rc/Kconfig
> +++ b/drivers/media/rc/Kconfig
> @@ -92,6 +92,7 @@ config IR_SONY_DECODER
>  config IR_SANYO_DECODER
>  	tristate "Enable IR raw decoder for the Sanyo protocol"
>  	depends on RC_CORE
> +	select BITREVERSE
>  
>  	help
>  	   Enable this option if you have an infrared remote control which
> @@ -101,6 +102,7 @@ config IR_SANYO_DECODER
>  config IR_SHARP_DECODER
>  	tristate "Enable IR raw decoder for the Sharp protocol"
>  	depends on RC_CORE
> +	select BITREVERSE
>  
>  	help
>  	   Enable this option if you have an infrared remote control which
> diff --git a/drivers/media/rc/img-ir/Kconfig b/drivers/media/rc/img-ir/Kconfig
> index 5c0508f2719f..a80cfcd87a95 100644
> --- a/drivers/media/rc/img-ir/Kconfig
> +++ b/drivers/media/rc/img-ir/Kconfig
> @@ -30,6 +30,7 @@ config IR_IMG_HW
>  config IR_IMG_NEC
>  	bool "NEC protocol support"
>  	depends on IR_IMG_HW
> +	select BITREVERSE
>  	help
>  	   Say Y here to enable support for the NEC, extended NEC, and 32-bit
>  	   NEC protocols in the ImgTec infrared decoder block.
> diff --git a/drivers/media/usb/cx231xx/Kconfig b/drivers/media/usb/cx231xx/Kconfig
> index 2fe2b2d335ba..b80661b8375f 100644
> --- a/drivers/media/usb/cx231xx/Kconfig
> +++ b/drivers/media/usb/cx231xx/Kconfig
> @@ -18,6 +18,7 @@ config VIDEO_CX231XX_RC
>  	bool "Conexant cx231xx Remote Controller additional support"
>  	depends on RC_CORE=y || RC_CORE=VIDEO_CX231XX
>  	depends on VIDEO_CX231XX
> +	select BITREVERSE
>  	default y
>  	help
>  	  cx231xx hardware has a builtin RX/TX support. However, a few
> diff --git a/drivers/media/usb/em28xx/Kconfig b/drivers/media/usb/em28xx/Kconfig
> index f2031a933e54..8a24731b373a 100644
> --- a/drivers/media/usb/em28xx/Kconfig
> +++ b/drivers/media/usb/em28xx/Kconfig
> @@ -77,5 +77,6 @@ config VIDEO_EM28XX_RC
>  	depends on VIDEO_EM28XX
>  	depends on !(RC_CORE=m && VIDEO_EM28XX=y)
>  	default VIDEO_EM28XX
> +	select BITREVERSE
>  	help
>  	  Enables Remote Controller support on em28xx driver.
> -- 
> 2.27.0
