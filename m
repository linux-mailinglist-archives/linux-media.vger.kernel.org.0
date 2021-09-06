Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101AF401619
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 07:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239146AbhIFF4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 01:56:11 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:38754 "EHLO
        smtp.gentoo.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbhIFF4J (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 01:56:09 -0400
X-Greylist: delayed 511 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Sep 2021 01:56:09 EDT
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Re: Fwd: Experimental additions dvb-usb-v2 rtl28xxu to support Delock
 61959 V2
To:     Oliver Kleinecke <kleinecke.oliver@googlemail.com>,
        linux-media@vger.kernel.org
References: <CAFi-X+WyqNv5ZcDdTH0ZXgWa7o+eT5EE2UsGnemKjeSiGRHyeQ@mail.gmail.com>
 <CAFi-X+WpLfDqW+2KWf6FPxZ0rHiMkatw1N427XUoP2A_qV-Zag@mail.gmail.com>
Message-ID: <a65620fe-82aa-0f08-c7c2-d53beb372f57@gentoo.org>
Date:   Mon, 6 Sep 2021 07:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFi-X+WpLfDqW+2KWf6FPxZ0rHiMkatw1N427XUoP2A_qV-Zag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 29.08.21 um 12:13 schrieb Oliver Kleinecke:
 > Hi everybody !
 >
Hi Oliver,

 > While trying to get a usb dvb-c/t stick running, which I own, I was
 > able to make a biot of progress and I hope it is enough to ask for
 > further help with tidying up my noobish poc code and help me to fix an
 > I2C problem I am unable to fix myself actually.
 >
 > The device is a  Delock USB 2.0 DVB-T/DVB-C Receiver (Version 2.0) -
 > V1 is fully supported, V2 currently not.
 > This device is nearly identical to the (already fully mainline-kernel
 > supported) GotView  MasterHD3 except it uses a different slave demod -
 > the SI2165 instead of SI2168.
 >
 > Current status for the device with my unprofessional additions: dvb-c
 > running with regular continuity errors and FE-Read errors. Dvb-T is
 > fully untested, as I have no signal in my area here.

With an Hauppauge stick I had the same issue. DVB-C had permanent 
issues. Channel lock was fine, but the data was having missing parts. 
This was fixed by Brad Love in commit 
8b1ca8a0363efdfa63358f598a2cadda2e514ab7 (media: cx231xx: Increase USB 
bridge bandwidth).
Maybe a similar fix could be applied to RTL2832P chip.
According to your log the continuity errors do not appear each second, 
but with intervals of ~10s. So it might be a different issue that just 
requires some fine-tuning of parameters.

 >
 > The patch with my own additions is attached as well as a log showing
 > the full usb-registering and load of fw files. Any help on debugging
 > mentioned continuity errors / FE errors would be very much
 > appreciated, I am willing to apply testing patches & provide
 > additional debug info, if necessary.

Please put patches into the body of the mail and not as attachment.
I copied your patch here to comment on it. See comments inline.
The patch is a good start.

Regards
Matthias


I had a look at the patch:
 > --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c    2021-08-29 
11:52:57.046097064 +0200
 > +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c    2021-08-29 
11:58:54.903816166 +0200
 > @@ -594,6 +594,13 @@
 >              dev->slave_demod = SLAVE_DEMOD_SI2168;
 >              goto demod_found;
 >          }
 > +        /* TODO: check Si2165 ID register; reg=23 val=07 assumed but 
doesnt work

According to your comment you tried to read the ID register from here. 
But this does not work as long as si2165 is in standby. To wake it up 
you need to write to REG_CHIP_MODE (0x0000). Then you are able to read 
other registers besides 0x0000 and 0x0001, e.g. the ID and revision. And 
after that you should send it back to standby.

Compare the probe function of si2165: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/dvb-frontends/si2165.c#n1200


 > +        terrible hack here for PoC */
 > +                else {
 > +                        dev_dbg(&d->intf->dev, "Si2165 found\n");
 > +                        dev->slave_demod = SLAVE_DEMOD_SI2165;
 > +                        goto demod_found;
 > +                }
 >      }
 >
 >  demod_found:
 > @@ -1010,33 +1017,65 @@
 >                  goto err_slave_demod_failed;
 >              adap->fe[1]->id = 1;
 >              dev->i2c_client_slave_demod = NULL;
 > -        } else {
 > -            struct si2168_config si2168_config = {};
 > -            struct i2c_adapter *adapter;
 > -
 > -            si2168_config.i2c_adapter = &adapter;
 > -            si2168_config.fe = &adap->fe[1];
 > -            si2168_config.ts_mode = SI2168_TS_SERIAL;
 > -            si2168_config.ts_clock_inv = false;
 > -            si2168_config.ts_clock_gapped = true;
 > -            strscpy(info.type, "si2168", I2C_NAME_SIZE);
 > -            info.addr = 0x64;
 > -            info.platform_data = &si2168_config;
 > -            request_module(info.type);
 > -            client = i2c_new_client_device(&d->i2c_adap, &info);
 > -            if (!i2c_client_has_driver(client))
 > -                goto err_slave_demod_failed;
 > -
 > -            if (!try_module_get(client->dev.driver->owner)) {
 > -                i2c_unregister_device(client);
 > -                goto err_slave_demod_failed;
 > -            }
 > -
 > -            dev->i2c_client_slave_demod = client;
 > -
 > -            /* for Si2168 devices use only new I2C write method */
 > -            dev->new_i2c_write = true;
 > -        }
 > +        } else if (dev->slave_demod == SLAVE_DEMOD_SI2168) {
 > +                        struct si2168_config si2168_config = {};
 > +                        struct i2c_adapter *adapter;
 > +
 > +                        si2168_config.i2c_adapter = &adapter;
 > +                        si2168_config.fe = &adap->fe[1];
 > +                        si2168_config.ts_mode = SI2168_TS_SERIAL;
 > +                        si2168_config.ts_clock_inv = false;
 > +                        si2168_config.ts_clock_gapped = true;
 > +                        strscpy(info.type, "si2168", I2C_NAME_SIZE);
 > +                        info.addr = 0x64;
 > +                        info.platform_data = &si2168_config;
 > +                        request_module(info.type);
 > +                        client = i2c_new_client_device(&d->i2c_adap, 
&info);
 > +                        if (!i2c_client_has_driver(client)) {
 > +                                dev->slave_demod = SLAVE_DEMOD_NONE;
 > +                                goto err_slave_demod_failed;
 > +                        }
 > +
 > +                        if 
(!try_module_get(client->dev.driver->owner)) {
 > +                                i2c_unregister_device(client);
 > +                                dev->slave_demod = SLAVE_DEMOD_NONE;
 > +                                goto err_slave_demod_failed;
 > +                        }
 > +
 > +                        dev->i2c_client_slave_demod = client;
 > +
 > +                        /* for Si2168 devices use only new I2C write 
method */
 > +                        dev->new_i2c_write = true;
 > +                } else if (dev->slave_demod == SLAVE_DEMOD_SI2165) {
 > +                        struct si2165_platform_data 
si2165_platform_data = {};
 > +                        si2165_platform_data.fe = &adap->fe[1];
 > +                        si2165_platform_data.chip_mode = 
SI2165_MODE_PLL_XTAL;
 > +                        si2165_platform_data.ref_freq_hz = 24000000;
 > +                        si2165_platform_data.inversion = false;
 > +                        strscpy(info.type, "si2165", I2C_NAME_SIZE);
 > +                        info.addr = 0x64;
 > +                        info.platform_data = &si2165_platform_data;
 > +                        request_module(info.type);
 > +                        client = i2c_new_client_device(&d->i2c_adap, 
&info);
 > +                        if (!i2c_client_has_driver(client)) {
 > +                                dev->slave_demod = SLAVE_DEMOD_NONE;
 > +                                goto err_slave_demod_failed;
 > +
 > +                        }
 > +
 > +                        if 
(!try_module_get(client->dev.driver->owner)) {
 > +                                i2c_unregister_device(client);
 > +                                dev->slave_demod = SLAVE_DEMOD_NONE;
 > +                                goto err_slave_demod_failed;
 > +                        }

This part could be switched to dvb_module_probe. But I do not know if 
this conversion can be done for single frontends at a time. Or if it 
need to be done for all supported devices (of rt28xxu) together.

 > +
 > +                        dev->i2c_client_slave_demod = client;
 > +                        dev->new_i2c_write = true;
 > +                } else {
 > +                        /* Unknown demodulator */
 > +                        dev->slave_demod = SLAVE_DEMOD_NONE;
 > +                        goto err_slave_demod_failed;
 > +                }
 >      }
 >      return 0;
 >
 > @@ -1969,6 +2008,8 @@
 >          RC_MAP_ASTROMETA_T2HYBRID) },
 >      { DVB_USB_DEVICE(0x5654, 0xca42,
 >          &rtl28xxu_props, "GoTView MasterHD 3", NULL) },
 > +    { DVB_USB_DEVICE(0x1b80, 0xd3b1,
 > +                &rtl28xxu_props, "Delock 61959 v2", NULL) },
 >      { }
 >  };
 >  MODULE_DEVICE_TABLE(usb, rtl28xxu_id_table);
 > --- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.h    2021-08-29 
11:36:06.034933825 +0200
 > +++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.h    2021-08-11 
17:40:13.625130749 +0200
 > @@ -29,6 +29,7 @@
 >  #include "fc2580.h"
 >  #include "tua9001.h"
 >  #include "r820t.h"
 > +#include "si2165.h"
 >  #include "si2168.h"
 >  #include "si2157.h"
 >
 > @@ -76,6 +77,7 @@
 >      #define SLAVE_DEMOD_MN88473        2
 >      #define SLAVE_DEMOD_SI2168         3
 >      #define SLAVE_DEMOD_CXD2837ER      4
 > +    #define SLAVE_DEMOD_SI2165         5
 >      unsigned int slave_demod:3;
 >      union {
 >          struct rtl2830_platform_data rtl2830_platform_data;
 > --- a/drivers/media/usb/dvb-usb-v2/Kconfig    2021-08-29 
11:37:01.364542549 +0200
 > +++ b/drivers/media/usb/dvb-usb-v2/Kconfig    2021-08-11 
16:26:00.294109619 +0200
 > @@ -138,6 +138,7 @@
 >      select DVB_RTL2830
 >      select DVB_RTL2832
 >      select DVB_RTL2832_SDR if (MEDIA_SUBDRV_AUTOSELECT && 
MEDIA_SDR_SUPPORT && VIDEO_V4L2)
 > +    select DVB_SI2165 if MEDIA_SUBDRV_AUTOSELECT
 >      select DVB_SI2168 if MEDIA_SUBDRV_AUTOSELECT
 >      select MEDIA_TUNER_E4000 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_V4L2)
 >      select MEDIA_TUNER_FC0012 if MEDIA_SUBDRV_AUTOSELECT
