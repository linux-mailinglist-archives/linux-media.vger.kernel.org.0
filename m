Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60898AF272
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 22:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfIJU7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 16:59:54 -0400
Received: from danelski.pl ([185.20.172.155]:16018 "EHLO danelski.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbfIJU7y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 16:59:54 -0400
Received: from vaio-debian (unknown [10.0.3.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by danelski.pl (Postfix) with ESMTPSA id 4F664682015E;
        Tue, 10 Sep 2019 20:59:49 +0000 (UTC)
Message-ID: <be4ea159656d26befe62da112a5caa6eecf0cdee.camel@danelski.pl>
Subject: Re: [PATCH] media: em28xx: Add support for Magix Wideowandler 2
From:   Dominik Danelski <dominik@danelski.pl>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Date:   Tue, 10 Sep 2019 22:59:49 +0200
In-Reply-To: <20190901212746.2249-1-dominik@danelski.pl>
References: <20190901212746.2249-1-dominik@danelski.pl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu nie, 01.09.2019 o godzinie 23∶27 +0200, użytkownik Dominik Danelski napisał:
> Add support for Magix Wideowandler 2 - analog USB capture card
> 
> Co-author: Cornelius Porosanu <cornelius591@gmail.com>
> Signed-off-by: Dominik Danelski <dominik@danelski.pl>
> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 20 ++++++++++++++++++++
>  drivers/media/usb/em28xx/em28xx.h       |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
> b/drivers/media/usb/em28xx/em28xx-cards.c
> index 1283c7ca9ad5..2faeb91c5afd 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -2487,6 +2487,24 @@ const struct em28xx_board em28xx_boards[] = {
>  		.ir_codes      = RC_MAP_HAUPPAUGE,
>  		.leds          = hauppauge_dualhd_leds,
>  	},
> +	/*
> +	 * 1b80:e349 Magix USB Videowandler-2
> +	 * (same chips as Honestech VIDBOX NW03)
> +	 * Empia EM2860, Philips SAA7113, Empia EMP202, No Tuner
> +	 */
> +	[EM2861_BOARD_MAGIX_VIDEOWANDLER2] = {
> +		.name                = "Magix USB Videowandler-2",
> +		.tuner_type          = TUNER_ABSENT,
> +		.decoder             = EM28XX_SAA711X,
> +		.input               = { {
> +			.type     = EM28XX_VMUX_COMPOSITE,
> +			.vmux     = SAA7115_COMPOSITE0,
> +			.amux     = EM28XX_AMUX_LINE_IN,
> +		}, {
> +			.type     = EM28XX_VMUX_SVIDEO,
> +			.amux     = EM28XX_AMUX_LINE_IN,
> +		} },
> +	},
>  };
>  EXPORT_SYMBOL_GPL(em28xx_boards);
>  
> @@ -2696,6 +2714,8 @@ struct usb_device_id em28xx_id_table[] = {
>  			.driver_info = EM28178_BOARD_PLEX_PX_BCUD },
>  	{ USB_DEVICE(0xeb1a, 0x5051), /* Ion Video 2 PC MKII / Startech
> svid2usb23 / Raygo R12-41373 */
>  			.driver_info =
> EM2860_BOARD_TVP5150_REFERENCE_DESIGN },
> +	{ USB_DEVICE(0x1b80, 0xe349), /* Magix USB Videowandler-2 */
> +		.driver_info = EM2861_BOARD_MAGIX_VIDEOWANDLER2 },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(usb, em28xx_id_table);
> diff --git a/drivers/media/usb/em28xx/em28xx.h
> b/drivers/media/usb/em28xx/em28xx.h
> index a551072e62ed..ef8f2729f7b8 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -149,6 +149,7 @@
>  #define EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 100
>  #define EM2884_BOARD_TERRATEC_H6		  101
>  #define EM2882_BOARD_ZOLID_HYBRID_TV_STICK		102
> +#define EM2861_BOARD_MAGIX_VIDEOWANDLER2          103
>  
>  /* Limits minimum and default number of buffers */
>  #define EM28XX_MIN_BUF 4

Hello,
It's been 9 days now without any reponse. Do I need to change anything in my patch to have it accepted?
Regards
Dominik Danelski

