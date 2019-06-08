Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6105039C22
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2019 11:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfFHJay (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jun 2019 05:30:54 -0400
Received: from gofer.mess.org ([88.97.38.141]:49817 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbfFHJay (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 8 Jun 2019 05:30:54 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F253860570; Sat,  8 Jun 2019 10:30:51 +0100 (BST)
Date:   Sat, 8 Jun 2019 10:30:51 +0100
From:   Sean Young <sean@mess.org>
To:     JP <jp@jpvw.nl>
Cc:     linux-media@vger.kernel.org, Jan Pieter <raslal@live.com>
Subject: Re: [PATCH] dvb_usb_dvbsky: Mygica T230C2 add support for T230C hw
 version 2
Message-ID: <20190608093051.wauot4m2cikxzcjp@gofer.mess.org>
References: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63814e94-2db2-b9b0-44c8-ba5b0511bfc2@jpvw.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jan Pieter,

On Sat, Jun 08, 2019 at 04:49:23AM +0200, JP wrote:
> I made the Mygica T230c2 work on kernel 5.1.7, but I have no idea
> 
> how to submit this. http://jpvw.nl/pub/test/dvb/linux-5.1.7-t230c2.patch
> 
> 
> Please can someone help me out. It looks like the extra code in the
> 
> demodulator does not effect other drivers that use it. Tested with a
> 
> T230, they bothseem to work OK.

That's great, but there are some changes needed before we can accept this
patch. It needs a commit message and Signed-off-by and more:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> 
> 
> Jan Pieter van Woerkom
> 
> 
> 
> diff -ru a/drivers/media/dvb-frontends/si2168.c
> b/drivers/media/dvb-frontends/si2168.c
> --- a/drivers/media/dvb-frontends/si2168.c    2019-06-04 07:59:45.000000000
> +0200
> +++ b/drivers/media/dvb-frontends/si2168.c    2019-06-07 22:49:21.226337473
> +0200
> @@ -91,8 +91,16 @@
> 
>      dev_dbg(&client->dev, "%s acquire: %d\n", __func__, acquire);
> 
> +    /* set ts clock freq to 10Mhz */
> +       memcpy(cmd.args, "\x14\x00\x0d\x10\xe8\x03", 6);
> +    cmd.wlen = 6;
> +    cmd.rlen = 4;
> +    ret = si2168_cmd_execute(client, &cmd);
> +    if (ret) return ret;
> +
>      /* set TS_MODE property */
> -    memcpy(cmd.args, "\x14\x00\x01\x10\x10\x00", 6);
> +    memcpy(cmd.args, "\x14\x00\x01\x10\x00\x00", 6);
> +    cmd.args[4] = dev->ts_mode & 0x30;

This change affects every driver that uses the si2168. This will need some
justification.

>      if (acquire)
>          cmd.args[4] |= dev->ts_mode;
>      else
> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c
> b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-04 07:59:45.000000000
> +0200
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c    2019-06-07 16:47:32.141530489
> +0200
> @@ -560,6 +560,9 @@
>      si2168_config.i2c_adapter = &i2c_adapter;
>      si2168_config.fe = &adap->fe[0];
>      si2168_config.ts_mode = SI2168_TS_PARALLEL;
> +    if (d->udev->descriptor.idProduct == USB_PID_MYGICA_T230C2)

This needs le16_to_cpu().

> +        si2168_config.ts_mode |= 0x20;
>      si2168_config.ts_clock_inv = 1;
> 
>      state->i2c_client_demod = dvb_module_probe("si2168", NULL,
> @@ -799,6 +802,9 @@
>      { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>          &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>          RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
> +    { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C2,
> +        &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C2",
> +        RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>      { }
>  };
>  MODULE_DEVICE_TABLE(usb, dvbsky_id_table);
> diff -ru a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
> --- a/include/media/dvb-usb-ids.h    2019-06-04 07:59:45.000000000 +0200
> +++ b/include/media/dvb-usb-ids.h    2019-06-06 17:32:32.159187000 +0200
> @@ -387,6 +387,7 @@
>  #define USB_PID_MYGICA_D689                0xd811
>  #define USB_PID_MYGICA_T230                0xc688
>  #define USB_PID_MYGICA_T230C                0xc689
> +#define USB_PID_MYGICA_T230C2                0xc68a
>  #define USB_PID_ELGATO_EYETV_DIVERSITY            0x0011
>  #define USB_PID_ELGATO_EYETV_DTT            0x0021
>  #define USB_PID_ELGATO_EYETV_DTT_2            0x003f

Thanks,

Sean
