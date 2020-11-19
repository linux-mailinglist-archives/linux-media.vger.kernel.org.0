Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCD92B8FF0
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 11:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgKSKMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 05:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgKSKMc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 05:12:32 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D70C0613CF
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 02:12:31 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EED6EC6357; Thu, 19 Nov 2020 10:12:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1605780749; bh=DJ2PORuDOtvRRTp3cjS7bYhqNmn55zQ/OaaydHewGsw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r8hI4BrQS/LrJqdPn5kPUiVwZS7SbPb3qFOHKBUc9YtNzRv8RXrNqqaVFhotM+Eim
         Fiz1Xzzv3VgY0+P9FaV9hCKWuLokpNf0yDtdy1x/LZT9GJoryFxRizKSZuv0C/U05o
         IPdG1B10HwsRERfmHD43daoq/bLW2RWRtNIw7PASCByiZBAV3xsNOmE4PiRVAVpo5M
         FxeTC9x00u1256g3RoW+p8xGKmM6r7A082dN4HHTk3QzVd/YXUKSrwkr775PKTUjkB
         0pMMghIYGvW6k2MEZ+MoNCtE9UKh8quOVeQzObJJX1ouLtBTGyBRvLWlt59S53EgWq
         WKGuhFmZnnuWg==
Date:   Thu, 19 Nov 2020 10:12:28 +0000
From:   Sean Young <sean@mess.org>
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: rc: add keymap for KHAMSIN remote
Message-ID: <20201119101228.GA4372@gofer.mess.org>
References: <20201119082215.12430-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119082215.12430-1-christianshewitt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 19, 2020 at 08:22:15AM +0000, Christian Hewitt wrote:
> This remote ships with the Amlogic SML-5442TW IPTV/VOD Set-tob Box [0]
> used by O2.cz. This keymap adds support for the default IR controls.

s/Set-tob/Set-top/

Not sure what [0] refers to.

> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/media/rc/keymaps/Makefile     |  1 +
>  drivers/media/rc/keymaps/rc-khamsin.c | 75 +++++++++++++++++++++++++++
>  include/media/rc-map.h                |  1 +
>  3 files changed, 77 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-khamsin.c
> 
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index aaa1bf81d00d..1c4d6bec0ae4 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
>  			rc-it913x-v2.o \
>  			rc-kaiomy.o \
>  			rc-khadas.o \
> +			rc-khamsin.o \
>  			rc-kworld-315u.o \
>  			rc-kworld-pc150u.o \
>  			rc-kworld-plus-tv-analog.o \
> diff --git a/drivers/media/rc/keymaps/rc-khamsin.c b/drivers/media/rc/keymaps/rc-khamsin.c
> new file mode 100644
> index 000000000000..8a397590009a
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-khamsin.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2020 Christian Hewitt
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +/*
> + * KHAMSIN is an IR/Bluetooth RCU supplied with the SmartLabs
> + * SML-5442TW DVB-S/VOD box. The RCU has separate IR (TV) and
> + * BT (STB) modes. This keymap suppors the IR controls.
> + */
> +
> +static struct rc_map_table khamsin[] = {
> +	{ 0x70702, KEY_POWER},
> +
> +	{ 0x70701, KEY_VIDEO}, // source
> +
> +	{ 0x7076c, KEY_RED},
> +	{ 0x70714, KEY_GREEN},
> +	{ 0x70715, KEY_YELLOW},
> +	{ 0x70716, KEY_BLUE},
> +
> +	{ 0x7071a, KEY_MENU},
> +	{ 0x7074f, KEY_EPG},
> +
> +	{ 0x70760, KEY_UP },
> +	{ 0x70761, KEY_DOWN },
> +	{ 0x70765, KEY_LEFT },
> +	{ 0x70762, KEY_RIGHT },
> +	{ 0x70768, KEY_ENTER },
> +
> +	{ 0x7072d, KEY_ESC }, // back
> +
> +	{ 0x70707, KEY_VOLUMEUP },
> +	{ 0x7070b, KEY_VOLUMEDOWN },
> +	{ 0x7070f, KEY_MUTE },
> +	{ 0x70712, KEY_CHANNELUP },
> +	{ 0x70710, KEY_CHANNELDOWN },
> +
> +	{ 0x70704, KEY_1 },
> +	{ 0x70705, KEY_2 },
> +	{ 0x70706, KEY_3 },
> +	{ 0x70708, KEY_4 },
> +	{ 0x70709, KEY_5 },
> +	{ 0x7070a, KEY_6 },
> +	{ 0x7070c, KEY_7 },
> +	{ 0x7070d, KEY_8 },
> +	{ 0x7070e, KEY_9 },
> +	{ 0x70711, KEY_0 },
> +};
> +
> +static struct rc_map_list khamsin_map = {
> +	.map = {
> +		.scan     = khamsin,
> +		.size     = ARRAY_SIZE(khamsin),
> +		.rc_proto = RC_PROTO_NEC,

Anything with scancodes > 0xffff is RC_PROTO_NECX.

> +		.name     = RC_MAP_KHAMSIN,
> +	}
> +};
> +
> +static int __init init_rc_map_khamsin(void)
> +{
> +	return rc_map_register(&khamsin_map);
> +}
> +
> +static void __exit exit_rc_map_khamsin(void)
> +{
> +	rc_map_unregister(&khamsin_map);
> +}
> +
> +module_init(init_rc_map_khamsin)
> +module_exit(exit_rc_map_khamsin)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Christian Hewitt <christianshewitt@gmail.com>");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index 7dbb91c601a7..fa270f16a97b 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -263,6 +263,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_IT913X_V2                 "rc-it913x-v2"
>  #define RC_MAP_KAIOMY                    "rc-kaiomy"
>  #define RC_MAP_KHADAS                    "rc-khadas"
> +#define RC_MAP_KHAMSIN                   "rc-khamsin"
>  #define RC_MAP_KWORLD_315U               "rc-kworld-315u"
>  #define RC_MAP_KWORLD_PC150U             "rc-kworld-pc150u"
>  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"

Please can you also patch:

Documentation/devicetree/bindings/media/rc.yaml

Looks good otherwise.

Thanks,

Sean
