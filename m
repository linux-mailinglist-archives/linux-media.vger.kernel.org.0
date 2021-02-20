Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34518320527
	for <lists+linux-media@lfdr.de>; Sat, 20 Feb 2021 12:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhBTL5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Feb 2021 06:57:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26785 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229476AbhBTL5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Feb 2021 06:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613822170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VDVOCTlUKmm84yaRnw0bBwE3/cgnV3O8/6xpvUNaKCY=;
        b=NrYtcnDS8j5QF6wetGfYVUOY3dY0/AcIvLmNH2jvFBV3zPW9PFc+4lBiX6Lizm4Gs4MtRY
        UEdSdmfd+HwyKl1VLU9SGxTxUnToccOKoKWgYljLe1oE1KYsULahBwqLtSCZW9+wymhyqb
        FtJvhMkSIVPjBhX7Y6i4bJxX2s1oydw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-gfn8XAm2Mp2DpJKiJypAMA-1; Sat, 20 Feb 2021 06:56:08 -0500
X-MC-Unique: gfn8XAm2Mp2DpJKiJypAMA-1
Received: by mail-ed1-f72.google.com with SMTP id y90so4327776ede.8
        for <linux-media@vger.kernel.org>; Sat, 20 Feb 2021 03:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VDVOCTlUKmm84yaRnw0bBwE3/cgnV3O8/6xpvUNaKCY=;
        b=d1DqpGO4/Vm/8RasrLiUWwjeIbvcrgoe1pjyr308oE11qMeMOmiJ5XRPWwx286r/cp
         shTuNI/L+gMoCAtPpTvVjuQmavhUKFOVi2KyXswjG856vhgpeJA19Fi7a6V0Ko2SMUup
         9Y1CNUxxZlmliT3bBbnAXQCySMX7qYzpnVPvI1CiGxTGRVQDL3n1Ww2jCceUuyGrDFav
         //Is9AkYI6CIJYiHtO++Upk+WKZLLAIb824LGoQfglvMugC3nEXJyN73SpgwwCMKHOAd
         PLLCxsyLOP5lS51ZcGuHrD3ZDtH03lre9LAk21gxH5ZmQmDjXTBdUmquRq211KMjKN8e
         yXmQ==
X-Gm-Message-State: AOAM533sPcRpFOuhClwQlEc79TBCKbo0NZBUiyhvEMkhMxhq0KWMixFF
        +B2JIIMkQwFCT1ASA5CE6a0LkZ1KNbAey6tfTTLz5WtICTCoXhyF4DkfVtEtweqzoE7nuAqAXxH
        Ehv1282Y254CPaL0K3odl8xihQSUB8rR2YUprG0lG2IPE5uwj7x61hQ86apVfmZS6+f4s4CAs5Y
        o=
X-Received: by 2002:a05:6402:497:: with SMTP id k23mr13603385edv.315.1613822166793;
        Sat, 20 Feb 2021 03:56:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJAlVLzjVDSq0jNtHNpY4VZe0VbB/hXodOETRD74MNPFNEN0mUEb8By4/KhcOgHzczjHGspQ==
X-Received: by 2002:a05:6402:497:: with SMTP id k23mr13603372edv.315.1613822166555;
        Sat, 20 Feb 2021 03:56:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gc17sm573532ejb.89.2021.02.20.03.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 03:56:06 -0800 (PST)
Subject: Re: [PATCH] media/rc: compile rc-cec.c into rc-core
To:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <c3b7bb19-a3a7-e954-80cf-a083b11ee69d@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <751af446-d82a-3724-23b4-b21a73465639@redhat.com>
Date:   Sat, 20 Feb 2021 12:56:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c3b7bb19-a3a7-e954-80cf-a083b11ee69d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/18/21 5:13 PM, Hans Verkuil wrote:
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

Thank you for writing this patch, this looks like a good solution to me.

Regards,

Hans





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
> 
> 

