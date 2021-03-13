Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AD333A18D
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 23:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbhCMV7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 16:59:53 -0500
Received: from jpvw.nl ([80.127.100.2]:36106 "EHLO jpvw.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234838AbhCMV7o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 16:59:44 -0500
X-Greylist: delayed 1324 seconds by postgrey-1.27 at vger.kernel.org; Sat, 13 Mar 2021 16:59:44 EST
Received: from [127.0.0.1] (helo=jpvw.nl)
        by jpvw.nl with esmtp (Exim 4.94)
        (envelope-from <jp@jpvw.nl>)
        id 1lLBx5-0002oX-OH; Sat, 13 Mar 2021 22:37:39 +0100
Subject: Re: [PATCH] Backport MYGICA T230A adapter
To:     Vincent Fortier <th0ma7@gmail.com>, linux-media@vger.kernel.org,
        Sean Young <sean@mess.org>
References: <e57634b4-b6f3-fcbd-2e43-cfed3a429918@gmail.com>
From:   JP <jp@jpvw.nl>
Message-ID: <d411edd5-f6ee-3af5-4bfa-27a107cd9b17@jpvw.nl>
Date:   Sat, 13 Mar 2021 22:37:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e57634b4-b6f3-fcbd-2e43-cfed3a429918@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

{added Sean Young)

On 3/13/21 1:36 PM, Vincent Fortier wrote:
> Hi all,
>
> (first patch posting so don't hesitate to let me know where to find 
> additional info to improve next time)
>
> The following patch is a manual backport based on crazycat69 / 
> linux_media git repository:
>
> https://github.com/crazycat69/linux_media/commit/e1ef47d604775c550a8f0d1bda276c113f882c9b?branch=e1ef47d604775c550a8f0d1bda276c113f882c9b&diff=unified 
>
>
>
> MYGICA T230A support was found on the following thread:
> https://forum.libreelec.tv/thread/23142-mygica-t230a/?pageNo=2
>
> Built successfully over commit 
> 069192365e2cec8b47f6e6701fb2aa50f763c602 (March 9th) on media_build 
> git tree with driver snapshot from 2021-03-07-1c5ab1e2286f over 
> Synology 4.4.59 / 4.4.60 kernels. Also built successfully over 
> 3.10.105 using latest compatible snapshot from 2021-01-13 using driver 
> version 2021-01-08-321af22a3d2f (as sadly pre-4.4 support was removed 
> recently).
>
> User thread confirming it to work under Synology NAS under 4.4.59 
> kernel available here:
>
> https://github.com/th0ma7/synology/issues/9
>
> Much thnx in advance.
>
> - vin
>
> ---
>
> diff -uprN ../linuxtv.orig/linux/drivers/media/usb/dvb-usb-v2/dvbsky.c 
> ./linux/drivers/media/usb/dvb-usb-v2/dvbsky.c
> --- ../linuxtv.orig/linux/drivers/media/usb/dvb-usb-v2/dvbsky.c 
> 2020-11-06 05:40:16.000000000 +0000
> +++ ./linux/drivers/media/usb/dvb-usb-v2/dvbsky.c    2021-02-19 
> 14:31:34.405091839 +0000
> @@ -529,7 +529,7 @@ static int dvbsky_t330_attach(struct dvb
>      return 0;
>  }
>
> -static int dvbsky_mygica_t230c_attach(struct dvb_usb_adapter *adap)
> +static int dvbsky_mygica_t230_attach(struct dvb_usb_adapter *adap)
>  {
>      struct dvbsky_state *state = adap_to_priv(adap);
>      struct dvb_usb_device *d = adap_to_d(adap);
> @@ -541,7 +541,9 @@ static int dvbsky_mygica_t230c_attach(st
>      si2168_config.i2c_adapter = &i2c_adapter;
>      si2168_config.fe = &adap->fe[0];
>      si2168_config.ts_mode = SI2168_TS_PARALLEL;
> -    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230C2)
> +    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230C2 ||
> +        le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230C2_LITE ||
> +        le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230A)
>          si2168_config.ts_mode |= SI2168_TS_CLK_MANUAL;
>      si2168_config.ts_clock_inv = 1;
>
> @@ -553,19 +555,26 @@ static int dvbsky_mygica_t230c_attach(st
>
>      /* attach tuner */
>      si2157_config.fe = adap->fe[0];
> -    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230) {
> -        si2157_config.if_port = 1;
> -        state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
> +    switch (le16_to_cpu(d->udev->descriptor.idProduct)) {
> +    case USB_PID_MYGICA_T230C:
> +    case USB_PID_MYGICA_T230C2:
> +    case USB_PID_MYGICA_T230C2_LITE:
> +    case USB_PID_MYGICA_T230A: {
> +        si2157_config.if_port = 0;
> +        state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>                                 i2c_adapter,
>                                 0x60,
>                                 &si2157_config);
> -    } else {
> -        si2157_config.if_port = 0;
> -        state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
> +        break;
> +    }
> +    default: {
> +        si2157_config.if_port = 1;
> +        state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
>                                 i2c_adapter,
>                                 0x60,
>                                 &si2157_config);
>      }
> +    }
>      if (!state->i2c_client_tuner) {
>          dvb_module_release(state->i2c_client_demod);
>          return -ENODEV;
> @@ -577,14 +586,24 @@ static int dvbsky_mygica_t230c_attach(st
>
>  static int dvbsky_identify_state(struct dvb_usb_device *d, const char 
> **name)
>  {
> -    dvbsky_gpio_ctrl(d, 0x04, 1);
> -    msleep(20);
> -    dvbsky_gpio_ctrl(d, 0x83, 0);
> -    dvbsky_gpio_ctrl(d, 0xc0, 1);
> -    msleep(100);
> -    dvbsky_gpio_ctrl(d, 0x83, 1);
> -    dvbsky_gpio_ctrl(d, 0xc0, 0);
> -    msleep(50);
> +    if (le16_to_cpu(d->udev->descriptor.idProduct) == 
> USB_PID_MYGICA_T230A) {
> +        dvbsky_gpio_ctrl(d, 0x87, 0);
> +        msleep(20);
> +        dvbsky_gpio_ctrl(d, 0x86, 1);
> +        dvbsky_gpio_ctrl(d, 0x80, 0);
> +        msleep(100);
> +        dvbsky_gpio_ctrl(d, 0x80, 1);
> +        msleep(50);
> +    } else {
> +        dvbsky_gpio_ctrl(d, 0x04, 1);
> +        msleep(20);
> +        dvbsky_gpio_ctrl(d, 0x83, 0);
> +        dvbsky_gpio_ctrl(d, 0xc0, 1);
> +        msleep(100);
> +        dvbsky_gpio_ctrl(d, 0x83, 1);
> +        dvbsky_gpio_ctrl(d, 0xc0, 0);
> +        msleep(50);
> +    }
>
>      return WARM;
>  }
> @@ -719,7 +738,7 @@ static struct dvb_usb_device_properties
>      }
>  };
>
> -static struct dvb_usb_device_properties mygica_t230c_props = {
> +static struct dvb_usb_device_properties mygica_t230_props = {
>      .driver_name = KBUILD_MODNAME,
>      .owner = THIS_MODULE,
>      .adapter_nr = adapter_nr,
> @@ -730,7 +749,7 @@ static struct dvb_usb_device_properties
>      .generic_bulk_ctrl_delay = DVBSKY_MSG_DELAY,
>
>      .i2c_algo         = &dvbsky_i2c_algo,
> -    .frontend_attach  = dvbsky_mygica_t230c_attach,
> +    .frontend_attach  = dvbsky_mygica_t230_attach,
>      .frontend_detach  = dvbsky_frontend_detach,
>      .init             = dvbsky_init,
>      .get_rc_config    = dvbsky_get_rc_config,
> @@ -778,16 +797,22 @@ static const struct usb_device_id dvbsky
>          &dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>          RC_MAP_DVBSKY) },
>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230",
> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230",
>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C",
> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C",
>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C_LITE,
> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
> T230C Lite",
> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C 
> Lite",
>          NULL) },
>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
> -        &mygica_t230c_props, "MyGica Mini DVB-(T/T2/C) USB Stick 
> T230C v2",
> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230C 
> v2",
> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
> +     { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2_LITE,
> +        &mygica_t230_props, "MyGica Mini DVB-T2 USB Stick T230C Lite 
> v2",
> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230A,
> +        &mygica_t230_props, "MyGica Mini DVB-(T/T2/C) USB Stick T230A",
>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>      { }
>  };
> diff -uprN ../linuxtv.orig/linux/include/media/dvb-usb-ids.h 
> ./linux/include/media/dvb-usb-ids.h
> --- ../linuxtv.orig/linux/include/media/dvb-usb-ids.h 2020-05-26 
> 05:40:21.000000000 +0000
> +++ ./linux/include/media/dvb-usb-ids.h    2021-02-19 
> 14:27:21.459391941 +0000
> @@ -394,6 +394,8 @@
>  #define USB_PID_MYGICA_T230C                0xc689
>  #define USB_PID_MYGICA_T230C2                0xc68a
>  #define USB_PID_MYGICA_T230C_LITE            0xc699
> +#define USB_PID_MYGICA_T230C2_LITE            0xc69a
> +#define USB_PID_MYGICA_T230A                0x689a
>  #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>  #define USB_PID_ELGATO_EYETV_DTT            0x0021
>  #define USB_PID_ELGATO_EYETV_DTT_2            0x003f
>
>

