Return-Path: <linux-media+bounces-12714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A3890007B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C9321C213A6
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C306315B98E;
	Fri,  7 Jun 2024 10:14:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F0158214
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 10:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755285; cv=none; b=PyCg3CRT86fksYzeRps/Ota41ghAaKYf5BKASQDunmzpMMbNkvOi7PJ5c3Nk2Lw4AmLjdR3fRX9e++evCa3ywt3ASciYd2lzdEx6JxbxWjk05KoMmaW/m4g3GN7aQdsEeEKHdaP9iwnXVtnYkCsSaqUbrOXeCCZ6WzhtXEw1X3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755285; c=relaxed/simple;
	bh=SEXfy27OJ5ZJVZdt92XcnJc6n/ry6+bXz9JV0WlInQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhI3Rj80QmCCYQk0AHB2Kqy04/eqyMjF8Cvh6HKTxWVjPRjh67Nv24fG/3o8484PtmW+LONDT+RbztBDXIMLjzRCRDW19Ll6/WG3g0pIpOczhmvBnZLJTJ78LRCNhjjaN2qyv4o0Z4a9vRB82bL45xdjfZKXr1sYoDOy4oU4HnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559ECC2BBFC;
	Fri,  7 Jun 2024 10:14:44 +0000 (UTC)
Message-ID: <f99fd24e-18f4-4666-adcc-40215807cdd0@xs4all.nl>
Date: Fri, 7 Jun 2024 12:14:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: em28xx: Add support for MyGica UTV3
To: Nils Rothaug <nils.rothaug@gmx.de>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
 <20240203124745.10257-3-nils.rothaug@gmx.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240203124745.10257-3-nils.rothaug@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2024 13:47, Nils Rothaug wrote:
> The MyGica UTV3 Analog USB2.0 TV Box is a USB video capture card
> that has analog TV, composite video, and FM radio inputs, an IR
> remote, and provides audio only as Line Out, but not over USB.
> Mine is prepared for an FM tuner, but not equipped with one.
> Support for FM radio is therefore missing. The device contains:
>  - Empia EM2860 USB bridge
>  - Philips SAA7113 video decoder
>  - NXP TDA9801T demodulator
>  - Tena TNF931D-DFDR1 tuner
>  - ST HCF4052 demux, switches input audio to Line Out
> 
> Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
> ---
>  drivers/media/rc/keymaps/Makefile         |  1 +
>  drivers/media/rc/keymaps/rc-mygica-utv3.c | 69 +++++++++++++++++++++++

Split off the rc changes into a separate patch. Those patches are independent of
the em28xx changes. Also, the rc changes are reviewed by Sean Young, not me, so
it is much easier to review if this is in a patch of its own.

Regards,

	Hans

>  drivers/media/usb/em28xx/em28xx-cards.c   | 52 +++++++++++++++++
>  drivers/media/usb/em28xx/em28xx.h         |  1 +
>  include/media/rc-map.h                    |  1 +
>  5 files changed, 124 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-mygica-utv3.c
> 
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index f19558fdab0..7fdf0d9edbf 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-msi-digivox-ii.o \
>  			rc-msi-tvanywhere.o \
>  			rc-msi-tvanywhere-plus.o \
> +			rc-mygica-utv3.o \
>  			rc-nebula.o \
>  			rc-nec-terratec-cinergy-xs.o \
>  			rc-norwood.o \
> diff --git a/drivers/media/rc/keymaps/rc-mygica-utv3.c b/drivers/media/rc/keymaps/rc-mygica-utv3.c
> new file mode 100644
> index 00000000000..f32b8281459
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-mygica-utv3.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* rc-mygica-utv3.c - Keytable for the MyGica UTV3 Analog USB2.0 TV Box
> + *
> + * Copyright (c) 2024 by Nils Rothaug
> + */
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +static struct rc_map_table mygica_utv3[] = {
> +	{ 0x0d, KEY_MUTE },
> +	{ 0x38, KEY_VIDEO },  /* Source */
> +	{ 0x14, KEY_RADIO },  /* FM Radio */
> +	{ 0x0c, KEY_POWER2 },
> +
> +	{ 0x01, KEY_NUMERIC_1},
> +	{ 0x02, KEY_NUMERIC_2},
> +	{ 0x03, KEY_NUMERIC_3},
> +	{ 0x04, KEY_NUMERIC_4},
> +	{ 0x05, KEY_NUMERIC_5},
> +	{ 0x06, KEY_NUMERIC_6},
> +	{ 0x07, KEY_NUMERIC_7},
> +	{ 0x08, KEY_NUMERIC_8},
> +	{ 0x09, KEY_NUMERIC_9},
> +	{ 0x00, KEY_NUMERIC_0},
> +
> +	{ 0x0a, KEY_DIGITS }, /* Single/double/triple digit */
> +	{ 0x0e, KEY_CAMERA }, /* Snapshot */
> +	{ 0x0f, KEY_ZOOM },   /* Full Screen */
> +	{ 0x29, KEY_LAST },   /* Recall (return to previous channel) */
> +
> +	{ 0x17, KEY_PLAY },
> +	{ 0x1f, KEY_RECORD },
> +	{ 0x0b, KEY_STOP },
> +	{ 0x16, KEY_PAUSE },
> +
> +	{ 0x20, KEY_CHANNELUP },
> +	{ 0x21, KEY_CHANNELDOWN },
> +	{ 0x10, KEY_VOLUMEUP },
> +	{ 0x11, KEY_VOLUMEDOWN },
> +	{ 0x26, KEY_REWIND },
> +	{ 0x27, KEY_FASTFORWARD },
> +};
> +
> +static struct rc_map_list mygica_utv3_map = {
> +	.map = {
> +		.scan     = mygica_utv3,
> +		.size     = ARRAY_SIZE(mygica_utv3),
> +		.rc_proto = RC_PROTO_RC5,
> +		.name     = RC_MAP_MYGICA_UTV3,
> +	}
> +};
> +
> +static int __init init_rc_map_mygica_utv3(void)
> +{
> +	return rc_map_register(&mygica_utv3_map);
> +}
> +
> +static void __exit exit_rc_map_mygica_utv3(void)
> +{
> +	rc_map_unregister(&mygica_utv3_map);
> +}
> +
> +module_init(init_rc_map_mygica_utv3)
> +module_exit(exit_rc_map_mygica_utv3)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Nils Rothaug");
> +MODULE_DESCRIPTION("MyGica UTV3 Analog USB2.0 TV Box remote keytable");
> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
> index 4d037c92af7..2c53063d69c 100644
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -554,6 +554,30 @@ static struct em28xx_reg_seq hauppauge_usb_quadhd_atsc_reg_seq[] = {
>  	{-1,                           -1,   -1,       -1},
>  };
> 
> +/*
> + * MyGica USB TV Box
> + * GPIO_1,0: 00=Composite audio
> + *           01=Tuner audio
> + *           10=Mute audio
> + *           11=FM radio? (if equipped)
> + * GPIO_2-6: Unused
> + * GPIO_7:   ??
> + */
> +static const struct em28xx_reg_seq mygica_utv3_composite_audio_gpio[] = {
> +	{EM2820_R08_GPIO_CTRL, 0xfc, 0xff, 0},
> +	{ -1, -1, -1, -1},
> +};
> +
> +static const struct em28xx_reg_seq mygica_utv3_tuner_audio_gpio[] = {
> +	{EM2820_R08_GPIO_CTRL, 0xfd, 0xff, 0},
> +	{ -1, -1, -1, -1},
> +};
> +
> +static const struct em28xx_reg_seq mygica_utv3_suspend_gpio[] = {
> +	{EM2820_R08_GPIO_CTRL, 0xfe, 0xff, 0},
> +	{ -1, -1, -1, -1},
> +};
> +
>  /*
>   *  Button definitions
>   */
> @@ -2578,6 +2602,32 @@ const struct em28xx_board em28xx_boards[] = {
>  		.tuner_gpio    = hauppauge_usb_quadhd_atsc_reg_seq,
>  		.leds          = hauppauge_usb_quadhd_leds,
>  	},
> +	/*
> +	 * eb1a:2860 MyGica UTV3 Analog USB2.0 TV Box
> +	 * Empia EM2860, Philips SAA7113, NXP TDA9801T demod,
> +	 * Tena TNF931D-DFDR1 tuner (contains NXP TDA6509A),
> +	 * ST HCF4052 demux (switches audio to line out),
> +	 * no audio over USB
> +	 */
> +	[EM2860_BOARD_MYGICA_UTV3] = {
> +		.name         = "MyGica UTV3 Analog USB2.0 TV Box",
> +		.xclk		  = EM28XX_XCLK_IR_RC5_MODE | EM28XX_XCLK_FREQUENCY_12MHZ,
> +		.tuner_type   = TUNER_TENA_TNF_931D_DFDR1,
> +		.ir_codes     = RC_MAP_MYGICA_UTV3,
> +		.decoder      = EM28XX_SAA711X,
> +		.suspend_gpio = mygica_utv3_suspend_gpio,
> +		.input        = { {
> +			.type     = EM28XX_VMUX_COMPOSITE,
> +			.vmux     = SAA7115_COMPOSITE0,
> +			.amux     = EM28XX_AMUX_VIDEO,
> +			.gpio     = mygica_utv3_composite_audio_gpio,
> +		}, {
> +			.type     = EM28XX_VMUX_TELEVISION,
> +			.vmux     = SAA7115_COMPOSITE2,
> +			.amux     = EM28XX_AMUX_VIDEO,
> +			.gpio     = mygica_utv3_tuner_audio_gpio,
> +		} },
> +	},
>  };
>  EXPORT_SYMBOL_GPL(em28xx_boards);
> 
> @@ -2819,6 +2869,7 @@ static const struct em28xx_hash_table em28xx_eeprom_hash[] = {
>  	{0x63f653bd, EM2870_BOARD_REDDO_DVB_C_USB_BOX, TUNER_ABSENT},
>  	{0x4e913442, EM2882_BOARD_DIKOM_DK300, TUNER_XC2028},
>  	{0x85dd871e, EM2882_BOARD_ZOLID_HYBRID_TV_STICK, TUNER_XC2028},
> +	{0x8f597549, EM2860_BOARD_MYGICA_UTV3, TUNER_TENA_TNF_931D_DFDR1},
>  };
> 
>  /* I2C devicelist hash table for devices with generic USB IDs */
> @@ -2831,6 +2882,7 @@ static const struct em28xx_hash_table em28xx_i2c_hash[] = {
>  	{0x4ba50080, EM2861_BOARD_GADMEI_UTV330PLUS, TUNER_TNF_5335MF},
>  	{0x6b800080, EM2874_BOARD_LEADERSHIP_ISDBT, TUNER_ABSENT},
>  	{0x27e10080, EM2882_BOARD_ZOLID_HYBRID_TV_STICK, TUNER_XC2028},
> +	{0x840d0484, EM2860_BOARD_MYGICA_UTV3, TUNER_TENA_TNF_931D_DFDR1},
>  };
> 
>  /* NOTE: introduce a separate hash table for devices with 16 bit eeproms */
> diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
> index db18dd814a6..f3449c240d2 100644
> --- a/drivers/media/usb/em28xx/em28xx.h
> +++ b/drivers/media/usb/em28xx/em28xx.h
> @@ -143,6 +143,7 @@
>  #define EM28178_BOARD_PCTV_461E_V2                104
>  #define EM2860_BOARD_MYGICA_IGRABBER              105
>  #define EM2874_BOARD_HAUPPAUGE_USB_QUADHD         106
> +#define EM2860_BOARD_MYGICA_UTV3                  107
> 
>  /* Limits minimum and default number of buffers */
>  #define EM28XX_MIN_BUF 4
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index 4676545ffd8..4867eb2f931 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -290,6 +290,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_MSI_DIGIVOX_III           "rc-msi-digivox-iii"
>  #define RC_MAP_MSI_TVANYWHERE            "rc-msi-tvanywhere"
>  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
> +#define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
>  #define RC_MAP_NEBULA                    "rc-nebula"
>  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
>  #define RC_MAP_NORWOOD                   "rc-norwood"
> --
> 2.34.1
> 
> 


