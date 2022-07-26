Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3ECF5814B2
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 15:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238762AbiGZN7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 09:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbiGZN7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 09:59:37 -0400
X-Greylist: delayed 22606 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Jul 2022 06:59:36 PDT
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2C424F35;
        Tue, 26 Jul 2022 06:59:36 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A313810006A; Tue, 26 Jul 2022 14:59:34 +0100 (BST)
Date:   Tue, 26 Jul 2022 14:59:34 +0100
From:   Sean Young <sean@mess.org>
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [v6 2/4] media: rc: add keymap for MagicBox M16S remote
Message-ID: <Yt/zRoDbEMiMT6qj@gofer.mess.org>
References: <20220726131523.140581-1-zhangn1985@qq.com>
 <tencent_7941C3ADC1F805DF58467BADCD88F4C0C406@qq.com>
 <tencent_DAA1CCC0ECA273CCA2DDC726455A73C2B705@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_DAA1CCC0ECA273CCA2DDC726455A73C2B705@qq.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 26, 2022 at 09:39:46PM +0800, Zhang Ning wrote:
> On Tue, Jul 26, 2022 at 09:15:21PM +0800, Zhang Ning wrote:
> > MagicBox M16S Tv box shipped with a simple NEC remote.
> > 
> > Signed-off-by: Zhang Ning <zhangn1985@qq.com>
> > ---
> >  drivers/media/rc/keymaps/Makefile      |  1 +
> >  drivers/media/rc/keymaps/rc-magicbox.c | 58 ++++++++++++++++++++++++++
> >  include/media/rc-map.h                 |  1 +
> >  3 files changed, 60 insertions(+)
> >  create mode 100644 drivers/media/rc/keymaps/rc-magicbox.c
> > 
> > diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> > index f513ff5caf4e..02c1c2150f03 100644
> > --- a/drivers/media/rc/keymaps/Makefile
> > +++ b/drivers/media/rc/keymaps/Makefile
> > @@ -71,6 +71,7 @@ obj-$(CONFIG_RC_MAP) += \
> >  			rc-kworld-plus-tv-analog.o \
> >  			rc-leadtek-y04g0051.o \
> >  			rc-lme2510.o \
> > +			rc-magicbox.o \
> >  			rc-manli.o \
> >  			rc-mecool-kiii-pro.o \
> >  			rc-mecool-kii-pro.o \
> > diff --git a/drivers/media/rc/keymaps/rc-magicbox.c b/drivers/media/rc/keymaps/rc-magicbox.c
> > new file mode 100644
> > index 000000000000..015767429028
> > --- /dev/null
> > +++ b/drivers/media/rc/keymaps/rc-magicbox.c
> > @@ -0,0 +1,58 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +//
> > +// Copyright (C) 2022 Zhang Ning <zhangn1985@qq.com>
> > +
> > +/*
> > + * Keytable for the MagicBox M16S remote control
> > + */
> > +
> > +#include <media/rc-map.h>
> > +#include <linux/module.h>
> > +
> > +static struct rc_map_table magicbox[] = {
> > +	{ 0x9f57, KEY_POWER },
> > +
> > +	/*
> > +	 * This key labeled "M" is used as magic key in vendor OS,
> > +         * and mapped to KEY_MUTE.
> oh no, mixed tab and space. I will fix it next version.

That's something minor that can be fixed when merging.

Looks good to me, thank you for dealing with all the pedantic reviews.

Signed-off-by: Sean Young <sean@mess.org>

> 
> > +	 */
> > +	{ 0x9f8a, KEY_MUTE },
> > +
> > +	{ 0x9f43, KEY_UP },
> > +	{ 0x9f0a, KEY_DOWN },
> > +	{ 0x9f06, KEY_LEFT },
> > +	{ 0x9f0e, KEY_RIGHT },
> > +	{ 0x9f02, KEY_OK },
> > +
> > +	{ 0x9f47, KEY_HOME },
> > +	{ 0x9f4f, KEY_BACK },
> > +	{ 0x9f16, KEY_MENU },
> > +
> > +	{ 0x9fff, KEY_VOLUMEUP },
> > +	{ 0x9f5d, KEY_VOLUMEDOWN },
> > +};
> > +
> > +static struct rc_map_list magicbox_map = {
> > +	.map = {
> > +		.scan     = magicbox,
> > +		.size     = ARRAY_SIZE(magicbox),
> > +		.rc_proto = RC_PROTO_NEC,
> > +		.name     = RC_MAP_MAGICBOX,
> > +	}
> > +};
> > +
> > +static int __init init_rc_map_magicbox(void)
> > +{
> > +	return rc_map_register(&magicbox_map);
> > +}
> > +
> > +static void __exit exit_rc_map_magicbox(void)
> > +{
> > +	rc_map_unregister(&magicbox_map);
> > +}
> > +
> > +module_init(init_rc_map_magicbox)
> > +module_exit(exit_rc_map_magicbox)
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Zhang Ning <zhangn1985@qq.com>");
> > diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> > index 793b54342dff..656217b8e91b 100644
> > --- a/include/media/rc-map.h
> > +++ b/include/media/rc-map.h
> > @@ -277,6 +277,7 @@ struct rc_map *rc_map_get(const char *name);
> >  #define RC_MAP_KWORLD_PLUS_TV_ANALOG     "rc-kworld-plus-tv-analog"
> >  #define RC_MAP_LEADTEK_Y04G0051          "rc-leadtek-y04g0051"
> >  #define RC_MAP_LME2510                   "rc-lme2510"
> > +#define RC_MAP_MAGICBOX                  "rc-magicbox"
> >  #define RC_MAP_MANLI                     "rc-manli"
> >  #define RC_MAP_MECOOL_KII_PRO            "rc-mecool-kii-pro"
> >  #define RC_MAP_MECOOL_KIII_PRO           "rc-mecool-kiii-pro"
> > -- 
> > 2.35.1
> > 
