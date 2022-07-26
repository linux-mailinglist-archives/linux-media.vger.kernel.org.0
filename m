Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 096AA580E1D
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 09:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238175AbiGZHnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 03:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbiGZHnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 03:43:11 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717022C664;
        Tue, 26 Jul 2022 00:42:52 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E6AB9100063; Tue, 26 Jul 2022 08:42:48 +0100 (BST)
Date:   Tue, 26 Jul 2022 08:42:48 +0100
From:   Sean Young <sean@mess.org>
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
        linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [v5 2/4] media: rc: add keymap for MagicBox M16S remote
Message-ID: <Yt+a+N1BJ+AZqPRt@gofer.mess.org>
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_5AC39B81CB85E258763BA8CD8774E9045806@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_5AC39B81CB85E258763BA8CD8774E9045806@qq.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 25, 2022 at 07:17:02AM +0800, Zhang Ning wrote:
> MagicBox M16S Tv box shipped with a simple NEC remote.
> it has a key labeled "M", used as Magic key in vendor OS.
> This has mapped to KEY_MUTE.

Please put this commit in the source code next to the key definition.
This doesn't belong in the commit message.

Thanks
Sean

> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> ---
>  drivers/media/rc/keymaps/Makefile      |  1 +
>  drivers/media/rc/keymaps/rc-magicbox.c | 53 ++++++++++++++++++++++++++
>  include/media/rc-map.h                 |  1 +
>  3 files changed, 55 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> 
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
> index 000000000000..b4fc1856a9e7
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> @@ -0,0 +1,53 @@
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
> +static struct rc_map_table magicbox[] = {
> +	{ 0x9f57, KEY_POWER },
> +	{ 0x9f8a, KEY_MUTE }, // M
> +
> +	{ 0x9f43, KEY_UP },
> +	{ 0x9f0a, KEY_DOWN },
> +	{ 0x9f06, KEY_LEFT },
> +	{ 0x9f0e, KEY_RIGHT },
> +	{ 0x9f02, KEY_OK },
> +
> +	{ 0x9f47, KEY_HOME },
> +	{ 0x9f4f, KEY_BACK },
> +	{ 0x9f16, KEY_MENU },
> +
> +	{ 0x9fff, KEY_VOLUMEDOWN },
> +	{ 0x9f5d, KEY_VOLUMEUP },
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
> -- 
> 2.35.1
