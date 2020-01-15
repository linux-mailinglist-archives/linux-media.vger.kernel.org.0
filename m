Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39BD13CB4A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 18:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAORp6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 12:45:58 -0500
Received: from gofer.mess.org ([88.97.38.141]:44637 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728896AbgAORp5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 12:45:57 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DB00F11A001; Wed, 15 Jan 2020 17:45:55 +0000 (GMT)
Date:   Wed, 15 Jan 2020 17:45:55 +0000
From:   Sean Young <sean@mess.org>
To:     Thomas Pantzer <Thomas.Pantzer@gmx.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Support for Terratech Grabster MX150/250 and ADStech XPress
 USBAV-192
Message-ID: <20200115174555.GB24471@gofer.mess.org>
References: <5DB62609.3050404@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DB62609.3050404@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thomas,

On Mon, Oct 28, 2019 at 12:19:37AM +0100, Thomas Pantzer wrote:
> - Adds support for USB analog video/audio capture devices
>     - Terratec Grabster AV 150/250 MX 	USB-ID (0ccd:0079)
>     - ADS Tech Instant Video XPress USBAV-192  USB-ID (06e1:a192)
> 
> - Bugfix: constant TM6000_MAXBOARDS off by one,
> 	 Grabster was never enumerated
> 
> Signed-off-by: Thomas Pantzer <kernel-org@pantzer.net>
> ---
>  drivers/media/usb/tm6000/tm6000-cards.c | 79
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 58 insertions(+), 21 deletions(-)

> diff -bBduwp linux-3.18.16/drivers/media/usb/tm6000/tm6000-cards.c-vanilla linux/drivers/media/usb/tm6000/tm6000-cards.c
> --- linux-3.18.16/drivers/media/usb/tm6000/tm6000-cards.c-vanilla	2015-06-19 18:42:40.000000000 +0200

This is a diff against 3.18.16? Please diff and _test_ against something
more recent.

> +++ linux/drivers/media/usb/tm6000/tm6000-cards.c	2019-10-28 00:01:45.000000000 +0100
> @@ -52,13 +52,16 @@
>  #define TM6010_BOARD_BEHOLD_WANDER_LITE		14
>  #define TM6010_BOARD_BEHOLD_VOYAGER_LITE	15
>  #define TM5600_BOARD_TERRATEC_GRABSTER		16
> +#define TM5600_BOARD_ADSTECH_XPRESS_USBAV_192   17
> +
> 
>  #define is_generic(model) ((model == TM6000_BOARD_UNKNOWN) || \
>  			   (model == TM5600_BOARD_GENERIC) || \

Your patch got mangled by your email client, and it does not apply any more.

See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

That doesn't mean the code is wrong.


>  			   (model == TM6000_BOARD_GENERIC) || \
>  			   (model == TM6010_BOARD_GENERIC))
> 
> -#define TM6000_MAXBOARDS        16
> +#define TM6000_MAXBOARDS        18

Indeed that is wrong.

> +
>  static unsigned int card[]     = {[0 ... (TM6000_MAXBOARDS - 1)] = UNSET };
> 
>  module_param_array(card,  int, NULL, 0444);
> @@ -500,25 +503,6 @@ static struct tm6000_board tm6000_boards
>  			.amux = TM6000_AMUX_SIF1,
>  		},
>  	},
> -	[TM5600_BOARD_TERRATEC_GRABSTER] = {
> -		.name         = "Terratec Grabster AV 150/250 MX",
> -		.type         = TM5600,
> -		.tuner_type   = TUNER_ABSENT,
> -		.vinput = { {
> -			.type	= TM6000_INPUT_TV,
> -			.vmux	= TM6000_VMUX_VIDEO_B,
> -			.amux	= TM6000_AMUX_ADC1,
> -			}, {
> -			.type	= TM6000_INPUT_COMPOSITE1,
> -			.vmux	= TM6000_VMUX_VIDEO_A,
> -			.amux	= TM6000_AMUX_ADC2,
> -			}, {
> -			.type	= TM6000_INPUT_SVIDEO,
> -			.vmux	= TM6000_VMUX_VIDEO_AB,
> -			.amux	= TM6000_AMUX_ADC2,
> -			},
> -		},
> -	},
>  	[TM6010_BOARD_TWINHAN_TU501] = {
>  		.name         = "Twinhan TU501(704D1)",
>  		.tuner_type   = TUNER_XC2028, /* has a XC3028 */
> @@ -614,6 +598,58 @@ static struct tm6000_board tm6000_boards
>  			.amux	= TM6000_AMUX_ADC1,
>  		},
>  	},
> +	[TM5600_BOARD_TERRATEC_GRABSTER] = {
> +		.name         = "Terratec Grabster AV 150/250 MX",
> +		.type         = TM5600,
> +		.tuner_type   = TUNER_ABSENT,

These lines haven't changed so they shouldn't be in the diff.

> +		.gpio = {
> +			.tuner_reset    = TM6000_GPIO_1,
> +			/* this GPIO configuration needs to be here due to a
> +			bug elsewhere, if it is missing the driver fails to
> +			load, if TUNER_ABSENT or has_tuner==0 is stated, the
> +			tuner-reset configuration should be ignored */
> +		},
> +		.caps = {
> +			.has_tuner = 0,
> +			.has_eeprom = 0,
> +		},
> +		.vinput = { {
> +			.type   = TM6000_INPUT_SVIDEO,
> +			.vmux   = TM6000_VMUX_VIDEO_A,
> +			.amux   = TM6000_AMUX_ADC1,
> +			}, {
> +			.type   = TM6000_INPUT_COMPOSITE1,
> +			.vmux   = TM6000_VMUX_VIDEO_B,
> +			.amux   = TM6000_AMUX_ADC2,
> +			},
> +		},
> +	},
> +	[TM5600_BOARD_ADSTECH_XPRESS_USBAV_192] = {
> +		.name         = "ADStech XPress USBAV-192",
> +		.type         = TM5600,
> +		.tuner_type   = TUNER_ABSENT,
> +		.caps = {
> +			.has_eeprom	= 1,
> +			.has_tuner	= 0,
> +		},
> +		.gpio = {
> +			.tuner_reset	= TM6000_GPIO_1,
> +			/* this GPIO configuration needs to be here due to a
> +			bug elsewhere, if it is missing the driver fails to
> +			load, if TUNER_ABSENT or has_tuner==0 is stated, the
> +			tuner-reset configuration should be ignored */
> +		},
> +		.vinput = { {
> +			.type	= TM6000_INPUT_SVIDEO,
> +			.vmux	= TM6000_VMUX_VIDEO_A,
> +			.amux	= TM6000_AMUX_ADC1,
> +			}, {
> +			.type	= TM6000_INPUT_COMPOSITE1,
> +			.vmux	= TM6000_VMUX_VIDEO_B,
> +			.amux	= TM6000_AMUX_ADC2,
> +			},
> +		},
> +	},
>  };
> 
>  /* table of devices that work with this driver */
> @@ -631,13 +667,14 @@ static struct usb_device_id tm6000_id_ta
>  	{ USB_DEVICE(0x6000, 0xdec1), .driver_info = TM6010_BOARD_BEHOLD_VOYAGER },
>  	{ USB_DEVICE(0x0ccd, 0x0086), .driver_info = TM6010_BOARD_TERRATEC_CINERGY_HYBRID_XE },
>  	{ USB_DEVICE(0x0ccd, 0x00A5), .driver_info = TM6010_BOARD_TERRATEC_CINERGY_HYBRID_XE },
> -	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info = TM5600_BOARD_TERRATEC_GRABSTER },
>  	{ USB_DEVICE(0x13d3, 0x3240), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
>  	{ USB_DEVICE(0x13d3, 0x3241), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
>  	{ USB_DEVICE(0x13d3, 0x3243), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
>  	{ USB_DEVICE(0x13d3, 0x3264), .driver_info = TM6010_BOARD_TWINHAN_TU501 },
>  	{ USB_DEVICE(0x6000, 0xdec2), .driver_info = TM6010_BOARD_BEHOLD_WANDER_LITE },
>  	{ USB_DEVICE(0x6000, 0xdec3), .driver_info = TM6010_BOARD_BEHOLD_VOYAGER_LITE },
> +	{ USB_DEVICE(0x0ccd, 0x0079), .driver_info = TM5600_BOARD_TERRATEC_GRABSTER },

Why is it moved?

> +	{ USB_DEVICE(0x06e1, 0xa192), .driver_info = TM5600_BOARD_ADSTECH_XPRESS_USBAV_192 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(usb, tm6000_id_table);


Thanks
Sean
