Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634A43204EF
	for <lists+linux-media@lfdr.de>; Sat, 20 Feb 2021 12:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhBTK7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Feb 2021 05:59:18 -0500
Received: from gofer.mess.org ([88.97.38.141]:38185 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhBTK7R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Feb 2021 05:59:17 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D7AD9C6393; Sat, 20 Feb 2021 10:58:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613818715; bh=kiwsjHABJZ9iMHIHfsBaWOOjNTyzWWPyHLLpPt/Cifc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BgNNcRG2jEp3g/K9iyZ2wHyWXv/vPVIfSOB4Bi6bT80xJC0lOgFR+gURmaqyyl2xJ
         1FWUQ2jBvQuX15LokniOta6+rKelJMf5XJgNHExrLXcaLKuXnOa8XNncSGKWTP3LmQ
         dsjyKKPzJ0gaZk2BDjoQzMjZRGMt5r26gZjeCfnoudRkwTHKGEffo42aUj6eJBnYfe
         YcQHcQ/ao1Yl20MYBelj1yMCZH4gRYxFipD3lEP/AzkB11ZDpQrp/bPi9fV1bBvzAi
         2ZfpURiehI9mk0gqztkFdd5ygg2glPRf+WQvDeI7ztg964lUWy9QCYn/B2xzz3SRBc
         EF6KYVxTineLQ==
Date:   Sat, 20 Feb 2021 10:58:35 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media/rc: compile rc-cec.c into rc-core
Message-ID: <20210220105835.GA23587@gofer.mess.org>
References: <c3b7bb19-a3a7-e954-80cf-a083b11ee69d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b7bb19-a3a7-e954-80cf-a083b11ee69d@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for writing this patch.

On Thu, Feb 18, 2021 at 05:13:08PM +0100, Hans Verkuil wrote:
> The rc-cec keymap is unusual in that it can't be built as a module,
> instead it is registered directly in rc-main.c if CONFIG_MEDIA_CEC_RC
> is set. This is because it can be called from drm_dp_cec_set_edid() via
> cec_register_adapter() in an asynchronous context, and it is not
> allowed to use request_module() to load rc-cec.ko in that case. Trying to
> do so results in a 'WARN_ON_ONCE(wait && current_is_async())'.
> 
> Since this keymap is only used if CONFIG_MEDIA_CEC_RC is set, we
> just compile this keymap into the rc-core module and never as a
> separate module.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 2c6d1fffa1d9 (drm: add support for DisplayPort CEC-Tunneling-over-AUX)
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Sean, I tested this both with RC_CORE=y and =m.
> 
> It looks reasonably clean to me, but I am not sure if this affects v4l-utils
> as well. Let me know what you think.
> 
> Regards,
> 
> 	Hans
> ---
> diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
> index 5bb2932ab119..ff6a8fc4c38e 100644
> --- a/drivers/media/rc/Makefile
> +++ b/drivers/media/rc/Makefile
> @@ -5,6 +5,7 @@ obj-y += keymaps/
>  obj-$(CONFIG_RC_CORE) += rc-core.o
>  rc-core-y := rc-main.o rc-ir-raw.o
>  rc-core-$(CONFIG_LIRC) += lirc_dev.o
> +rc-core-$(CONFIG_MEDIA_CEC_RC) += keymaps/rc-cec.o
>  rc-core-$(CONFIG_BPF_LIRC_MODE2) += bpf-lirc.o
>  obj-$(CONFIG_IR_NEC_DECODER) += ir-nec-decoder.o
>  obj-$(CONFIG_IR_RC5_DECODER) += ir-rc5-decoder.o
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index b252a1d2ebd6..cc6662e1903f 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -21,7 +21,6 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
>  			rc-behold.o \
>  			rc-behold-columbus.o \
>  			rc-budget-ci-old.o \
> -			rc-cec.o \
>  			rc-cinergy-1400.o \
>  			rc-cinergy.o \
>  			rc-d680-dmb.o \

This is a great idea. If rc-core is built as a module, the cec keymap is 
included in the module, and if cec-rc is not enabled then it is not built
at all.

> diff --git a/drivers/media/rc/keymaps/rc-cec.c b/drivers/media/rc/keymaps/rc-cec.c
> index 3e3bd11092b4..068e22aeac8c 100644
> --- a/drivers/media/rc/keymaps/rc-cec.c
> +++ b/drivers/media/rc/keymaps/rc-cec.c
> @@ -1,5 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /* Keytable for the CEC remote control
> + *
> + * This keymap is unusual in that it can't be built as a module,
> + * instead it is registered directly in rc-main.c if CONFIG_MEDIA_CEC_RC
> + * is set. This is because it can be called from drm_dp_cec_set_edid() via
> + * cec_register_adapter() in an asynchronous context, and it is not
> + * allowed to use request_module() to load rc-cec.ko in that case.
> + *
> + * Since this keymap is only used if CONFIG_MEDIA_CEC_RC is set, we
> + * just compile this keymap into the rc-core module and never as a
> + * separate module.
>   *
>   * Copyright (c) 2015 by Kamil Debski
>   */
> @@ -152,7 +162,7 @@ static struct rc_map_table cec[] = {
>  	/* 0x77-0xff: Reserved */
>  };
> 
> -static struct rc_map_list cec_map = {
> +struct rc_map_list cec_map = {
>  	.map = {
>  		.scan		= cec,
>  		.size		= ARRAY_SIZE(cec),
> @@ -160,19 +170,3 @@ static struct rc_map_list cec_map = {
>  		.name		= RC_MAP_CEC,
>  	}
>  };
> -
> -static int __init init_rc_map_cec(void)
> -{
> -	return rc_map_register(&cec_map);
> -}
> -
> -static void __exit exit_rc_map_cec(void)
> -{
> -	rc_map_unregister(&cec_map);
> -}
> -
> -module_init(init_rc_map_cec);
> -module_exit(exit_rc_map_cec);
> -
> -MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("Kamil Debski");
> diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> index 1fd62c1dac76..4768b1e9ffd1 100644
> --- a/drivers/media/rc/rc-main.c
> +++ b/drivers/media/rc/rc-main.c
> @@ -163,6 +163,10 @@ static struct rc_map_list empty_map = {
>  	}
>  };
> 
> +#ifdef CONFIG_MEDIA_CEC_RC
> +extern struct rc_map_list cec_map;
> +#endif
> +
>  /**
>   * scancode_to_u64() - converts scancode in &struct input_keymap_entry
>   * @ke: keymap entry containing scancode to be converted.
> @@ -2069,6 +2073,9 @@ static int __init rc_core_init(void)
> 
>  	led_trigger_register_simple("rc-feedback", &led_feedback);
>  	rc_map_register(&empty_map);
> +#ifdef CONFIG_MEDIA_CEC_RC
> +	rc_map_register(&cec_map);
> +#endif
> 
>  	return 0;
>  }
> @@ -2078,6 +2085,9 @@ static void __exit rc_core_exit(void)
>  	lirc_dev_exit();
>  	class_unregister(&rc_class);
>  	led_trigger_unregister_simple(led_feedback);
> +#ifdef CONFIG_MEDIA_CEC_RC
> +	rc_map_register(&cec_map);
> +#endif
>  	rc_map_unregister(&empty_map);
>  }

Now I'm confused. Do we need these changes at all? I've experimented a little
bit (without the right hardware), and as far as I can make out, just the
changes to the Kconfig/Makefile should be enough.

Thanks,

Sean
