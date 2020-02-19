Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94809164686
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 15:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbgBSOLM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 09:11:12 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54767 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgBSOLL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 09:11:11 -0500
Received: by mail-wm1-f65.google.com with SMTP id n3so790068wmk.4
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 06:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:autocrypt:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=axCnyyhe3vAUMLJ59PD4TeWRmNjRWoddc9LmMj+qFXc=;
        b=SSWbsby9jv3tYUuDz2SGbRsIdHYLu3JWLF3JG1qCttqUXlvPiBg3JbWbhcbbl3JMaq
         GQ2dQYvtvlsbEEIH1EkuEpx2g3/r8O+0HHQNFDTdZsodMo9sbgn65Zva0vVW7r1HI6kX
         DF5Yip2+tfW92AB+a5MYXo3ahJQj2eFc4Gegq31UtRYm6bMc1yl0JuLcNiT5DWxloV8p
         c5x4a+XpRodadhbPIqbHKLqE4PZgCmIyO7DJV8DbJeeogNqAyBai/zby2PF3JrBI4Emp
         K9iXa+S/bJhI+6KwbJi88L0n9k/2LuPHrUNEo7I5928EUJJsr7Kx3TuL7JjnjowpSjrE
         mAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=axCnyyhe3vAUMLJ59PD4TeWRmNjRWoddc9LmMj+qFXc=;
        b=d0iZFYkqgl/m0nL5iyDV6sowuPVxCk5PA97e0uO+Hf965j1I1AmTnDeDKOEBM72k+b
         bZ4lzNi9hfYEc+CRxmn8xztIA8zchmOtMFY7iSt0q/L0N98vgczChMweY63rs16hqrkg
         Sb3l0E6wMeaOvuGZxNYqT86L9Y5q5uyr04d2E2BNr+a+WvQywWQmUv7wMdLj8prkh6gE
         0NVjILiwqFXqCnwDFIsmEC13Nx1JherMJ1YQFzDvqtJ4NbjaBeD4Qa91Wzu47EC3Ljzo
         bzh/rTH4D+rFAWQATtTqoqKUig/AbTmjv2VF8AkRv3GnwDv61j0UV0QkQAx+GdQ0/jBP
         8RJA==
X-Gm-Message-State: APjAAAX/Og9n1Z3TzWuAnsGSZNT863oWzVYt8v4fUHUKn2+83/TgKCqW
        8Rq07HBTtPhp4tnQqNHnXCcW0g==
X-Google-Smtp-Source: APXvYqyequ/xILYnc0wf3lEyrQ3FCRB4LWmzyYrsqThZk98WhI2yRvv66jVhvp+uhFakBDaMNbntdQ==
X-Received: by 2002:a1c:1b42:: with SMTP id b63mr10563446wmb.16.1582121468395;
        Wed, 19 Feb 2020 06:11:08 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858? ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id u8sm3208949wmm.15.2020.02.19.06.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 06:11:07 -0800 (PST)
Subject: Re: [PATCH v5 1/3] media: rc: add keymap for Videostrong KII Pro
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
 <20200214085802.28742-2-mohammad.rasim96@gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e9847ac1-e8cd-fc80-f97b-2bb0c2924fa5@baylibre.com>
Date:   Wed, 19 Feb 2020 15:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214085802.28742-2-mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/02/2020 09:58, Mohammad Rasim wrote:
> This is an NEC remote control device shipped with the Videostrong KII Pro tv box.
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-videostrong-kii-pro.c | 83 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> 
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
> index 63261ef6380a..aaa1bf81d00d 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_RC_MAP) += rc-adstech-dvb-t-pci.o \
>  			rc-videomate-m1f.o \
>  			rc-videomate-s350.o \
>  			rc-videomate-tv-pvr.o \
> +			rc-videostrong-kii-pro.o \
>  			rc-wetek-hub.o \
>  			rc-wetek-play2.o \
>  			rc-winfast.o \
> diff --git a/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> new file mode 100644
> index 000000000000..74a278ffa3f1
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-videostrong-kii-pro.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Copyright (C) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +//
> +// Keytable for the Videostrong KII Pro STB remote control
> +//
> +
> +static struct rc_map_table kii_pro[] = {
> +	{ 0x59, KEY_POWER },
> +	{ 0x19, KEY_MUTE },
> +	{ 0x42, KEY_RED },
> +	{ 0x40, KEY_GREEN },
> +	{ 0x00, KEY_YELLOW },
> +	{ 0x03, KEY_BLUE },
> +	{ 0x4a, KEY_BACK },
> +	{ 0x48, KEY_FORWARD },
> +	{ 0x08, KEY_PREVIOUSSONG},
> +	{ 0x0b, KEY_NEXTSONG},
> +	{ 0x46, KEY_PLAYPAUSE },
> +	{ 0x44, KEY_STOP },
> +	{ 0x1f, KEY_FAVORITES},	//KEY_F5?
> +	{ 0x04, KEY_PVR},
> +	{ 0x4d, KEY_EPG},
> +	{ 0x02, KEY_INFO},
> +	{ 0x09, KEY_SUBTITLE},
> +	{ 0x01, KEY_AUDIO},
> +	{ 0x0d, KEY_HOMEPAGE},
> +	{ 0x11, KEY_TV},		// DTV ?
> +	{ 0x06, KEY_UP},
> +	{ 0x5a, KEY_LEFT},
> +	{ 0x1a, KEY_ENTER},	// KEY_OK ?
> +	{ 0x1b, KEY_RIGHT},
> +	{ 0x16, KEY_DOWN},
> +	{ 0x45, KEY_MENU},
> +	{ 0x05, KEY_ESC},
> +	{ 0x13, KEY_VOLUMEUP },
> +	{ 0x17, KEY_VOLUMEDOWN },
> +	{ 0x58, KEY_APPSELECT},
> +	{ 0x12, KEY_VENDOR},	// mouse
> +	{ 0x55, KEY_PAGEUP},	// KEY_CHANNELUP ?
> +	{ 0x15, KEY_PAGEDOWN},	//KEY_CHANNELDOWN ?
> +	{ 0x52, KEY_1},
> +	{ 0x50, KEY_2},
> +	{ 0x10, KEY_3},
> +	{ 0x56, KEY_4},
> +	{ 0x54, KEY_5},
> +	{ 0x14, KEY_6},
> +	{ 0x4e, KEY_7},
> +	{ 0x4c, KEY_8},
> +	{ 0x0c, KEY_9},
> +	{ 0x18, KEY_F7},
> +	{ 0x0f, KEY_0},
> +	{ 0x51, KEY_BACKSPACE},
> +};
> +
> +static struct rc_map_list kii_pro_map = {
> +	.map = {
> +		.scan     = kii_pro,
> +		.size     = ARRAY_SIZE(kii_pro),
> +		.rc_proto = RC_PROTO_NEC,
> +		.name     = RC_MAP_KII_PRO,
> +	}
> +};
> +
> +static int __init init_rc_map_kii_pro(void)
> +{
> +	return rc_map_register(&kii_pro_map);
> +}
> +
> +static void __exit exit_rc_map_kii_pro(void)
> +{
> +	rc_map_unregister(&kii_pro_map);
> +}
> +
> +module_init(init_rc_map_kii_pro)
> +module_exit(exit_rc_map_kii_pro)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Mohammad Rasim <mohammad.rasim96@gmail.com>");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index f99575a0d29c..d22810dcd85c 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -274,6 +274,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_VIDEOMATE_K100            "rc-videomate-k100"
>  #define RC_MAP_VIDEOMATE_S350            "rc-videomate-s350"
>  #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
> +#define RC_MAP_KII_PRO                   "rc-videostrong-kii-pro"
>  #define RC_MAP_WETEK_HUB                 "rc-wetek-hub"
>  #define RC_MAP_WETEK_PLAY2               "rc-wetek-play2"
>  #define RC_MAP_WINFAST                   "rc-winfast"
> --
> 2.25.0
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
