Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881FA57F541
	for <lists+linux-media@lfdr.de>; Sun, 24 Jul 2022 15:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiGXNof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Jul 2022 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiGXNoc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Jul 2022 09:44:32 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAEAEE0D
        for <linux-media@vger.kernel.org>; Sun, 24 Jul 2022 06:44:30 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8165410006F; Sun, 24 Jul 2022 14:44:28 +0100 (BST)
Date:   Sun, 24 Jul 2022 14:44:28 +0100
From:   Sean Young <sean@mess.org>
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] rc/keymap: add keymap for MagicBox M16S
Message-ID: <Yt1MvOQtRgxYFm7F@gofer.mess.org>
References: <20220723155502.127404-1-zhangn1985@qq.com>
 <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_ED01C585DBD86EFB91CD8074FB0460C3BA06@qq.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jul 23, 2022 at 11:55:02PM +0800, Zhang Ning wrote:
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  .../dts/amlogic/meson-gxm-magicbox-m16s.dts   |  4 ++
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c        | 55 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  4 files changed, 61 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> index 464de73d2f0f..69e72687ac9c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
> @@ -34,3 +34,7 @@ &ethmac {
>  &sdio_pwrseq {
>  	reset-gpios = <&gpio GPIODV_2 GPIO_ACTIVE_LOW>;
>  };
> +
> +&ir {
> +        linux,rc-map-name = "rc-magicbox";
> +};

As has been pointed out already, this should go a in a different patch.

> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index f513ff5caf4e..02c1c2150f03 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
>  			rc-kworld-plus-tv-analog.o \
>  			rc-leadtek-y04g0051.o \
>  			rc-lme2510.o \
> +			rc-magicbox.o \
>  			rc-manli.o \
>  			rc-mecool-kiii-pro.o \
>  			rc-mecool-kii-pro.o \
> diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
> new file mode 100644
> index 000000000000..7dd3afd8a42c
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
> +
> +/*
> + * Keytable for the MagicBox M16S remote control
> + */
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +
> +static struct rc_map_table magicbox[] = {
> +	{ 40791, KEY_POWER },
> +	{ 40842, KEY_MUTE }, // M

This comment needs elaboration. What does M mean?

> +	{ 40771, KEY_UP },
> +	{ 40714, KEY_DOWN },
> +	{ 40710, KEY_LEFT },
> +	{ 40718, KEY_RIGHT },
> +	{ 40706, KEY_OK },
> +
> +	{ 40775, KEY_HOME },
> +	{ 40783, KEY_BACK },
> +	{ 40726, KEY_MENU },
> +
> +	{ 40959, KEY_VOLUMEDOWN },
> +	{ 40797, KEY_VOLUMEUP },

Please use hex values here, they make much more sense for nec protocol.

> +

Remove blank line.

> +};
> +
> +static struct rc_map_list magicbox_map = {
> +	.map = {
> +		.scan     = magicbox,
> +		.size     = ARRAY_SIZE(magicbox),
> +		.rc_proto = RC_PROTO_NEC,
> +		.name     = RC_MAP_MAGICBOX,
> +	}
> +};
> +
> +static int __init init_rc_map_magicbox(void)
> +{
> +	return rc_map_register(&magicbox_map);
> +}
> +
> +static void __exit exit_rc_map_magicbox(void)
> +{
> +	rc_map_unregister(&magicbox_map);
> +}
> +
> +module_init(init_rc_map_magicbox)
> +module_exit(exit_rc_map_magicbox)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index 793b54342dff..656217b8e91b 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
>  #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
>  #define RC_MAP_LME2510                   "rc-lme2510"
> +#define RC_MAP_MAGICBOX                  "rc-magicbox"
>  #define RC_MAP_MANLI                     "rc-manli"
>  #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
>  #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"

You should update Documentation/devicetree/bindings/media/rc.yaml as well.

Thanks,

Sean
