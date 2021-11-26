Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A61A45F5AD
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 21:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbhKZUSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 15:18:49 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:54726 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbhKZUQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 15:16:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7C3C4B82877;
        Fri, 26 Nov 2021 20:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F809C9305B;
        Fri, 26 Nov 2021 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637957613;
        bh=As6YQdRPUOSbA++YjFQLZ510CZUaExtTy+DYXHuNFZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ot1Bf3vDJJer/RtwDyH6wlJ26CQsT606MMQ5Du8efRwoXrvBR1O5lXcgEKSZBzY+Q
         +C55pCpnPtr6hdKVOkselV/esmzwGYvH6pqzu6sy+4yolJia8pL5bbGPztdzGK97u1
         wyD545DjhfUokbfAMMV4IzifNOXW1j3xopMzdMwe2iZLK2gDh8udrEFIrlO+qvFaWM
         Xrd2r/xmYIy4+PAuix1btdTOlddmPH4eXbaQ3Q+nUqzn7beYsHyjdkFC2vWzzkc4fU
         0cfd6DjsRvJFJNJtq3njX1z5Et+isriO6tqZn7/hbwt9In5sTMyes6GAdiX/BomWlx
         GrN6onewV6ILg==
Date:   Fri, 26 Nov 2021 13:13:27 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH 09/20] media: si470x: fix printk warnings with clang
Message-ID: <YaE/59FBhmdNL4OY@archlinux-ax161>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
 <d1282497070b1051d6b111fbfe752efea08deec2.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1282497070b1051d6b111fbfe752efea08deec2.1637781097.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 24, 2021 at 08:13:12PM +0100, Mauro Carvalho Chehab wrote:
> Clang doesn't like "%hu" on macros:
> 
> 	drivers/media/radio/si470x/radio-si470x-i2c.c:414:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> 	drivers/media/radio/si470x/radio-si470x-i2c.c:417:4: error: format specifies type 'unsigned short' but the argument has type 'int' [-Werror,-Wformat]
> 
> So, just replace them with "%u".
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Maybe worth mentioning commit cbacb5ab0aa0 ("docs: printk-formats: Stop
encouraging use of unnecessary %h[xudi] and %hh[xudi]")?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
> 
>  drivers/media/radio/si470x/radio-si470x-i2c.c | 4 ++--
>  drivers/media/radio/si470x/radio-si470x-usb.c | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/media/radio/si470x/radio-si470x-i2c.c
> index a972c0705ac7..7ea7c6326f53 100644
> --- a/drivers/media/radio/si470x/radio-si470x-i2c.c
> +++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
> @@ -410,10 +410,10 @@ static int si470x_i2c_probe(struct i2c_client *client)
>  			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
>  	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
>  		dev_warn(&client->dev,
> -			"This driver is known to work with firmware version %hu,\n",
> +			"This driver is known to work with firmware version %u,\n",
>  			RADIO_FW_VERSION);
>  		dev_warn(&client->dev,
> -			"but the device has firmware version %hu.\n",
> +			"but the device has firmware version %u.\n",
>  			radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);
>  		version_warning = 1;
>  	}
> diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
> index 3f8634a46573..1e70e6971fe4 100644
> --- a/drivers/media/radio/si470x/radio-si470x-usb.c
> +++ b/drivers/media/radio/si470x/radio-si470x-usb.c
> @@ -681,10 +681,10 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
>  			radio->registers[DEVICEID], radio->registers[SI_CHIPID]);
>  	if ((radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE) < RADIO_FW_VERSION) {
>  		dev_warn(&intf->dev,
> -			"This driver is known to work with firmware version %hu,\n",
> +			"This driver is known to work with firmware version %u,\n",
>  			RADIO_FW_VERSION);
>  		dev_warn(&intf->dev,
> -			"but the device has firmware version %hu.\n",
> +			"but the device has firmware version %u.\n",
>  			radio->registers[SI_CHIPID] & SI_CHIPID_FIRMWARE);
>  		version_warning = 1;
>  	}
> @@ -698,10 +698,10 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
>  			radio->software_version, radio->hardware_version);
>  	if (radio->hardware_version < RADIO_HW_VERSION) {
>  		dev_warn(&intf->dev,
> -			"This driver is known to work with hardware version %hu,\n",
> +			"This driver is known to work with hardware version %u,\n",
>  			RADIO_HW_VERSION);
>  		dev_warn(&intf->dev,
> -			"but the device has hardware version %hu.\n",
> +			"but the device has hardware version %u.\n",
>  			radio->hardware_version);
>  		version_warning = 1;
>  	}
> -- 
> 2.33.1
> 
> 
