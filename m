Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9057A4019F8
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 12:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242147AbhIFKmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 06:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhIFKmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 06:42:40 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9C8C061575;
        Mon,  6 Sep 2021 03:41:34 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id NC4Cm6nDvlQKhNC4DmQwkp; Mon, 06 Sep 2021 12:41:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630924893; bh=vjohvXnrFKlBdiz3oYMdSMBPjlKY4iAjqhA/wpKZxTE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l6qBStbzTISMnJrBHPozMylVnfunAihoUWMuCOooeV85P92Ga2bIUHM8GKWtN9iJJ
         flu14jTkRFKh3MF1XL73OuZpC5DBid879MhMoDcgyTB/us42rmQsqco2u1EzwrRhbk
         NBgv3OesFarKecsLQja4EBrllyR6KBAqVvrgbR7yQpcKkdvl9OOum6usw0Utw0SPhD
         +mBiz60Ao4vQ1rdT6c3o7YUE4Oxj6euLz/r61ZSS54MKT1Dga5A3RJkSOQ+83KDIa6
         dFTGa01dJ/YRxKfa16l3BsqV27C+sWZZeVt3OkcNpKHBXFVavq6kz6Q7mUvKAIBzyc
         Pr5UaNtAqEi/w==
Subject: Re: [PATCH 6/8] staging: media: zoran: fusion all modules
To:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-7-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9318ec41-d884-2c1a-1190-3a93c3f5a3fb@xs4all.nl>
Date:   Mon, 6 Sep 2021 12:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903191540.3052775-7-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCuB3x2gc1GtRdLitv1ZCtg5JiZqkO1+p3aY264VtpcbXqDQ54t01hFaxXDgJMYKJd/UdYyaBKE9SK/yBjGE6YkiPCizs/J2Yc5AWarRjsbdSvLz/y+g
 xiVpx3NaBhWOpMJC+Eg9UHKT7OO5ZAXsMDtYN1OrV7iNaHlnVFVAyXIBoNVyD2a2dH6NbiBpNzxvr6rb03JPwxBQjos02Ts7Q/cUcHIVqgiOV4MIPQq8P1rh
 2VjO9oLhvt/6N5OBlf8lCLYSwZuEpsoy6Ea1GkcUcjTglzmy4chZXBwy5MHO2ixMQB4Kv/Pp9kVgWo9hFipLHjrATcQEVugYCNja8xYDTpwyNN+gOjor8ZY3
 A1OxTAKg+hQTlDN3yQxKr2elDtSi79YL/i0PN79LJuuwWCobcSK23KY7/ObzqDT/j8mD2EKIquYWUCQA7e3faCRy19cPLjKG/I2eFKlchAeI2zh8tM09j8fa
 K9jwxlm79zyqoLec0pJJXKw7E6NB4mz3R7NyRJy6/Dp9Uc5u0oJgIIJGodQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/09/2021 21:15, Corentin Labbe wrote:
> The zoran driver is split in many modules, but this lead to some
> problems.
> One of them is that load order is incorrect when everything is built-in.
> 
> Having more than one module is useless, so fusion all zoran modules in
> one.

After applying this patch I am no longer able to rmmod the module: it will
always report that it is in use. This is with a Miro DC30.

So something is wrong with refcounting.

I do like the idea of merging all these modules, but it needs a bit more
testing.

Regards,

	Hans

> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/staging/media/zoran/Kconfig      | 14 +++----
>  drivers/staging/media/zoran/Makefile     |  8 ++--
>  drivers/staging/media/zoran/videocodec.c | 28 --------------
>  drivers/staging/media/zoran/zoran_card.c | 48 +++++++++++++++++++++---
>  drivers/staging/media/zoran/zr36016.c    | 11 +-----
>  drivers/staging/media/zoran/zr36016.h    |  2 +
>  drivers/staging/media/zoran/zr36050.c    | 12 +-----
>  drivers/staging/media/zoran/zr36050.h    |  2 +
>  drivers/staging/media/zoran/zr36060.c    | 11 +-----
>  drivers/staging/media/zoran/zr36060.h    |  2 +
>  10 files changed, 66 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
> index 7d2d3c2431b1..8eacdc00b081 100644
> --- a/drivers/staging/media/zoran/Kconfig
> +++ b/drivers/staging/media/zoran/Kconfig
> @@ -14,7 +14,7 @@ config VIDEO_ZORAN
>  	  module will be called zr36067.
>  
>  config VIDEO_ZORAN_DC30
> -	tristate "Pinnacle/Miro DC30(+) support"
> +	bool "Pinnacle/Miro DC30(+) support"
>  	depends on VIDEO_ZORAN
>  	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_VPX3220 if MEDIA_SUBDRV_AUTOSELECT
> @@ -24,7 +24,7 @@ config VIDEO_ZORAN_DC30
>  	  zr36050 MJPEG codec and zr36016 VFE.
>  
>  config VIDEO_ZORAN_ZR36060
> -	tristate "Zoran ZR36060"
> +	bool "Zoran ZR36060"
>  	depends on VIDEO_ZORAN
>  	help
>  	  Say Y to support Zoran boards based on 36060 chips.
> @@ -32,7 +32,7 @@ config VIDEO_ZORAN_ZR36060
>  	  and 33 R10 and AverMedia 6 boards.
>  
>  config VIDEO_ZORAN_BUZ
> -	tristate "Iomega Buz support"
> +	bool "Iomega Buz support"
>  	depends on VIDEO_ZORAN_ZR36060
>  	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_SAA7185 if MEDIA_SUBDRV_AUTOSELECT
> @@ -40,7 +40,7 @@ config VIDEO_ZORAN_BUZ
>  	  Support for the Iomega Buz MJPEG capture/playback card.
>  
>  config VIDEO_ZORAN_DC10
> -	tristate "Pinnacle/Miro DC10(+) support"
> +	bool "Pinnacle/Miro DC10(+) support"
>  	depends on VIDEO_ZORAN_ZR36060
>  	select VIDEO_SAA7110 if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_ADV7175 if MEDIA_SUBDRV_AUTOSELECT
> @@ -49,7 +49,7 @@ config VIDEO_ZORAN_DC10
>  	  card.
>  
>  config VIDEO_ZORAN_LML33
> -	tristate "Linux Media Labs LML33 support"
> +	bool "Linux Media Labs LML33 support"
>  	depends on VIDEO_ZORAN_ZR36060
>  	select VIDEO_BT819 if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
> @@ -58,7 +58,7 @@ config VIDEO_ZORAN_LML33
>  	  card.
>  
>  config VIDEO_ZORAN_LML33R10
> -	tristate "Linux Media Labs LML33R10 support"
> +	bool "Linux Media Labs LML33R10 support"
>  	depends on VIDEO_ZORAN_ZR36060
>  	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_ADV7170 if MEDIA_SUBDRV_AUTOSELECT
> @@ -67,7 +67,7 @@ config VIDEO_ZORAN_LML33R10
>  	  card.
>  
>  config VIDEO_ZORAN_AVS6EYES
> -	tristate "AverMedia 6 Eyes support"
> +	bool "AverMedia 6 Eyes support"
>  	depends on VIDEO_ZORAN_ZR36060
>  	select VIDEO_BT856 if MEDIA_SUBDRV_AUTOSELECT
>  	select VIDEO_BT866 if MEDIA_SUBDRV_AUTOSELECT
> diff --git a/drivers/staging/media/zoran/Makefile b/drivers/staging/media/zoran/Makefile
> index 7023158e3892..9603bac0195c 100644
> --- a/drivers/staging/media/zoran/Makefile
> +++ b/drivers/staging/media/zoran/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  zr36067-objs	:=	zoran_device.o \
> -			zoran_driver.o zoran_card.o
> +			zoran_driver.o zoran_card.o videocodec.o
>  
> -obj-$(CONFIG_VIDEO_ZORAN) += zr36067.o videocodec.o
> -obj-$(CONFIG_VIDEO_ZORAN_DC30) += zr36050.o zr36016.o
> -obj-$(CONFIG_VIDEO_ZORAN_ZR36060) += zr36060.o
> +obj-$(CONFIG_VIDEO_ZORAN) += zr36067.o
> +zr36067-$(CONFIG_VIDEO_ZORAN_DC30) += zr36050.o zr36016.o
> +zr36067-$(CONFIG_VIDEO_ZORAN_ZR36060) += zr36060.o
> diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
> index 3d5a83a07e07..7350d7747516 100644
> --- a/drivers/staging/media/zoran/videocodec.c
> +++ b/drivers/staging/media/zoran/videocodec.c
> @@ -8,8 +8,6 @@
>   * (c) 2002 Wolfgang Scherr <scherr@net4you.at>
>   */
>  
> -#define VIDEOCODEC_VERSION "v0.2"
> -
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -119,7 +117,6 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
>  	kfree(codec);
>  	return NULL;
>  }
> -EXPORT_SYMBOL(videocodec_attach);
>  
>  int videocodec_detach(struct videocodec *codec)
>  {
> @@ -175,7 +172,6 @@ int videocodec_detach(struct videocodec *codec)
>  	pr_err("%s: given codec not found!\n", __func__);
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL(videocodec_detach);
>  
>  int videocodec_register(const struct videocodec *codec)
>  {
> @@ -208,7 +204,6 @@ int videocodec_register(const struct videocodec *codec)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(videocodec_register);
>  
>  int videocodec_unregister(const struct videocodec *codec)
>  {
> @@ -255,7 +250,6 @@ int videocodec_unregister(const struct videocodec *codec)
>  	pr_err("%s: given codec not found!\n", __func__);
>  	return -EINVAL;
>  }
> -EXPORT_SYMBOL(videocodec_unregister);
>  
>  #ifdef CONFIG_VIDEO_ZORAN_DEBUG
>  int videocodec_debugfs_show(struct seq_file *m)
> @@ -286,25 +280,3 @@ int videocodec_debugfs_show(struct seq_file *m)
>  	return 0;
>  }
>  #endif
> -
> -/* ===================== */
> -/* hook in driver module */
> -/* ===================== */
> -static int __init videocodec_init(void)
> -{
> -	pr_info("Linux video codec intermediate layer: %s\n", VIDEOCODEC_VERSION);
> -
> -	return 0;
> -}
> -
> -static void __exit videocodec_exit(void)
> -{
> -}
> -
> -module_init(videocodec_init);
> -module_exit(videocodec_exit);
> -
> -MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
> -MODULE_DESCRIPTION("Intermediate API module for video codecs "
> -		   VIDEOCODEC_VERSION);
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
> index 1ed8ed2f4f7f..7b2e1d1c4622 100644
> --- a/drivers/staging/media/zoran/zoran_card.c
> +++ b/drivers/staging/media/zoran/zoran_card.c
> @@ -29,6 +29,9 @@
>  #include "zoran.h"
>  #include "zoran_card.h"
>  #include "zoran_device.h"
> +#include "zr36016.h"
> +#include "zr36050.h"
> +#include "zr36060.h"
>  
>  extern const struct zoran_format zoran_formats[];
>  
> @@ -266,6 +269,39 @@ static const char *codecid_to_modulename(u16 codecid)
>  	return name;
>  }
>  
> +static int load_codec(struct zoran *zr, u16 codecid)
> +{
> +	switch (codecid) {
> +	case CODEC_TYPE_ZR36060:
> +#ifdef CONFIG_VIDEO_ZORAN_ZR36060
> +		return zr36060_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36060 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	case CODEC_TYPE_ZR36050:
> +#ifdef CONFIG_VIDEO_ZORAN_DC30
> +		return zr36050_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36050 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	case CODEC_TYPE_ZR36016:
> +#ifdef CONFIG_VIDEO_ZORAN_DC30
> +		return zr36016_init_module();
> +#else
> +		pci_err(zr->pci_dev, "ZR36016 support is not enabled\n");
> +		return -EINVAL;
> +#endif
> +		break;
> +	}
> +
> +	pci_err(zr->pci_dev, "unknown codec id %x\n", codecid);
> +	return -EINVAL;
> +}
> +
>  // struct tvnorm {
>  //      u16 wt, wa, h_start, h_sync_start, ht, ha, v_start;
>  // };
> @@ -1078,6 +1114,8 @@ static int zoran_debugfs_show(struct seq_file *seq, void *v)
>  
>  	seq_printf(seq, "Prepared %u\n", zr->prepared);
>  	seq_printf(seq, "Queued %u\n", zr->queued);
> +
> +	videocodec_debugfs_show(seq);
>  	return 0;
>  }
>  
> @@ -1262,17 +1300,17 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (zr->card.video_codec) {
>  		codec_name = codecid_to_modulename(zr->card.video_codec);
>  		if (codec_name) {
> -			result = request_module(codec_name);
> -			if (result)
> -				pci_err(pdev, "failed to load modules %s: %d\n", codec_name, result);
> +			result = load_codec(zr, zr->card.video_codec);
> +			if (result < 0)
> +				pci_err(pdev, "failed to load codec %s: %d\n", codec_name, result);
>  		}
>  	}
>  	if (zr->card.video_vfe) {
>  		vfe_name = codecid_to_modulename(zr->card.video_vfe);
>  		if (vfe_name) {
> -			result = request_module(vfe_name);
> +			result = load_codec(zr, zr->card.video_vfe);
>  			if (result < 0)
> -				pci_err(pdev, "failed to load modules %s: %d\n", vfe_name, result);
> +				pci_err(pdev, "failed to load codec %s: %d\n", vfe_name, result);
>  		}
>  	}
>  
> diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
> index 50605460a44b..adf738b5a1d5 100644
> --- a/drivers/staging/media/zoran/zr36016.c
> +++ b/drivers/staging/media/zoran/zr36016.c
> @@ -409,14 +409,14 @@ static const struct videocodec zr36016_codec = {
>     HOOK IN DRIVER AS KERNEL MODULE
>     ========================================================================= */
>  
> -static int __init zr36016_init_module(void)
> +int zr36016_init_module(void)
>  {
>  	//dprintk(1, "ZR36016 driver %s\n",ZR016_VERSION);
>  	zr36016_codecs = 0;
>  	return videocodec_register(&zr36016_codec);
>  }
>  
> -static void __exit zr36016_cleanup_module(void)
> +void zr36016_cleanup_module(void)
>  {
>  	if (zr36016_codecs) {
>  		dprintk(1,
> @@ -425,10 +425,3 @@ static void __exit zr36016_cleanup_module(void)
>  	}
>  	videocodec_unregister(&zr36016_codec);
>  }
> -
> -module_init(zr36016_init_module);
> -module_exit(zr36016_cleanup_module);
> -
> -MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
> -MODULE_DESCRIPTION("Driver module for ZR36016 video frontends");
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/zoran/zr36016.h b/drivers/staging/media/zoran/zr36016.h
> index 1475f971cc24..04afba35669d 100644
> --- a/drivers/staging/media/zoran/zr36016.h
> +++ b/drivers/staging/media/zoran/zr36016.h
> @@ -89,4 +89,6 @@ struct zr36016 {
>  #define ZR016_SIGN           0x02
>  #define ZR016_YMCS           0x01
>  
> +int zr36016_init_module(void);
> +void zr36016_cleanup_module(void);
>  #endif				/*fndef ZR36016_H */
> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
> index 4dc7927fefc3..e36eff4a798c 100644
> --- a/drivers/staging/media/zoran/zr36050.c
> +++ b/drivers/staging/media/zoran/zr36050.c
> @@ -817,14 +817,14 @@ static const struct videocodec zr36050_codec = {
>     HOOK IN DRIVER AS KERNEL MODULE
>     ========================================================================= */
>  
> -static int __init zr36050_init_module(void)
> +int zr36050_init_module(void)
>  {
>  	//dprintk(1, "ZR36050 driver %s\n",ZR050_VERSION);
>  	zr36050_codecs = 0;
>  	return videocodec_register(&zr36050_codec);
>  }
>  
> -static void __exit zr36050_cleanup_module(void)
> +void zr36050_cleanup_module(void)
>  {
>  	if (zr36050_codecs) {
>  		dprintk(1,
> @@ -833,11 +833,3 @@ static void __exit zr36050_cleanup_module(void)
>  	}
>  	videocodec_unregister(&zr36050_codec);
>  }
> -
> -module_init(zr36050_init_module);
> -module_exit(zr36050_cleanup_module);
> -
> -MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
> -MODULE_DESCRIPTION("Driver module for ZR36050 jpeg processors "
> -		   ZR050_VERSION);
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/zoran/zr36050.h b/drivers/staging/media/zoran/zr36050.h
> index 8f972d045b58..f9b58f4c77b9 100644
> --- a/drivers/staging/media/zoran/zr36050.h
> +++ b/drivers/staging/media/zoran/zr36050.h
> @@ -160,4 +160,6 @@ struct zr36050 {
>  #define ZR050_U_COMPONENT         1
>  #define ZR050_V_COMPONENT         2
>  
> +int zr36050_init_module(void);
> +void zr36050_cleanup_module(void);
>  #endif				/*fndef ZR36050_H */
> diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
> index 7904d5b1f402..0a6a8c985137 100644
> --- a/drivers/staging/media/zoran/zr36060.c
> +++ b/drivers/staging/media/zoran/zr36060.c
> @@ -846,13 +846,13 @@ static const struct videocodec zr36060_codec = {
>  	// others are not used
>  };
>  
> -static int __init zr36060_init_module(void)
> +int zr36060_init_module(void)
>  {
>  	zr36060_codecs = 0;
>  	return videocodec_register(&zr36060_codec);
>  }
>  
> -static void __exit zr36060_cleanup_module(void)
> +void zr36060_cleanup_module(void)
>  {
>  	if (zr36060_codecs) {
>  		dprintk(1,
> @@ -863,10 +863,3 @@ static void __exit zr36060_cleanup_module(void)
>  	/* however, we can't just stay alive */
>  	videocodec_unregister(&zr36060_codec);
>  }
> -
> -module_init(zr36060_init_module);
> -module_exit(zr36060_cleanup_module);
> -
> -MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@skynet.be>");
> -MODULE_DESCRIPTION("Driver module for ZR36060 jpeg processors " ZR060_VERSION);
> -MODULE_LICENSE("GPL");
> diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/staging/media/zoran/zr36060.h
> index d2cdc26bf625..fbf5429534ac 100644
> --- a/drivers/staging/media/zoran/zr36060.h
> +++ b/drivers/staging/media/zoran/zr36060.h
> @@ -198,4 +198,6 @@ struct zr36060 {
>  #define ZR060_SR_H_SCALE2		 BIT(0)
>  #define ZR060_SR_H_SCALE4		(2 << 0)
>  
> +int zr36060_init_module(void);
> +void zr36060_cleanup_module(void);
>  #endif				/*fndef ZR36060_H */
> 

