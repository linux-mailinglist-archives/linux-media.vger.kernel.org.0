Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C0F71C63
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 18:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731801AbfGWQCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 12:02:39 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42517 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbfGWQCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 12:02:39 -0400
Received: by mail-ua1-f67.google.com with SMTP id a97so17085022uaa.9
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=varoWwZSngiKfxbEqeoC24alJcMby+q2ZyTdJ9LyCjM=;
        b=OEI6s0dxyiDxt/LktZ5f2m8SQiJDydVvhThxnvPH+wDcegGz01pWEPes7VHwVsevmF
         DQkCkWxDO6Jy8RovhUmZB1NDUTimoori5NNu10Igy58qadGmgHnKcVygqjzxmSmkXZYB
         XWKf64Jyh56Tx5ISloR2vjRy85MN2aPQDah7yolIfCcDS4OZMbePeF53csPrT9V6T6LP
         oJDO+0R3Pl5FLSdF+Riq+xOEzOA8yuUL9+KbxiTq4Gr6H8Pfp36dlqPCTI3w3lnGdFAM
         rqq58fpeRfZ6CxDl8zPLmCiggL0kRgRJMAzvfYbmyl9s8lhRg2W56Be4ZGDCkYqMhkcU
         rIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=varoWwZSngiKfxbEqeoC24alJcMby+q2ZyTdJ9LyCjM=;
        b=ZemqnGY2JkIpqZEo48eIx2FILCD0/50WshF0UzHEMgCJKcCMu1CHZSBtKgJATy4gON
         n+/LHtOUYgTVZrjAuHHJlOQ8azoz7ZgpIZUfEjLM0dXUdj6+9gU2WOj0rhiD/QqhHSUI
         HRPtuW07ROC3KFAwyFgArqe72bRbtTIXFWgMzsey2rh22sUhHSO5KevJnuxMEzmeBhA8
         m3LKUGF9+wu/6obYG4srqOAenXUiwJkmwkx4KtmJ/+GCRTEuWhXHjW+09yaMmae3dmqW
         U/JBnkbsLlhsqpAspATp8qoftc19pUUpn2NBJKVRl08Gb+laERWJvwgRAQd0mR3DGYG6
         HPOw==
X-Gm-Message-State: APjAAAXduPJJxgUspEgHxdL3PZVqzCY3smZ1PV+iOAaEwZ1I3UvrZ+gN
        6o0p4g2qLV55n82uNnmPCzADhBd6lBNm5lIjEMc=
X-Google-Smtp-Source: APXvYqw7aU029x32Nym1w8x1KXb7SXKotzVvoMe4APUiLu68FdItXXkx1g60me5LHyT0OKniW8Sc1AFSgBatAm9V7Ho=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr19804837uak.71.1563897756761;
 Tue, 23 Jul 2019 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl> <20190721182940.kclp27faukxxfc4d@gofer.mess.org>
 <62bc916f-a586-17b5-b9f8-f543d56ea76b@jpvw.nl> <CAD+OKUre40kQiucuryJC0uYrvBSqL5M=pAkmi7QxgOoKUWt0bg@mail.gmail.com>
 <70cb09ed-1ae4-6626-643d-c9e1c9ae47c6@jpvw.nl> <CAD+OKUr-f_a8dcPVp24d4wPhRAE80tf10_kt5s3_WvVmfWu9JQ@mail.gmail.com>
 <20190722162225.GA6919@jpvw.nl>
In-Reply-To: <20190722162225.GA6919@jpvw.nl>
From:   James Hutchinson <jahutchinson99@googlemail.com>
Date:   Tue, 23 Jul 2019 17:02:25 +0100
Message-ID: <CAD+OKUpw65wSRjJaExaoHx3nn1w03KbAvZRME_8M3STH5bhzWQ@mail.gmail.com>
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     Jan Pieter van Woerkom <jp@jpvw.nl>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, thomas.hollstegge@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jan,

My initial testing of your two patches to move the T230 to the dvbsky
module looks good so far.

I'm testing on an 8th Gen NUC (8i3BEH) 16GB RAM, 2 x MyGica T230 T2
USB tuners, and 2 x DVBSky S960 S2 tuners.

This machine is running Debian stretch with the Debian 4.19.37
backport kernel (incl. your two patches to move the T230 to the dvbsky
module).

I have a test script that performs 200x consecutive tvheadend network scans...
This was executed against the UK Freeview network (6 muxes) =~1,200
tuning requests. This took a couple of hours, but not a single
checksum error.

I moved onto streaming various channels and didn't have any problems
so far. I only noted a couple of minor picture disturbances
(continuity counter errors) when i tried to record two HD channels
whilst watching a 3rd on the same mux. I'm not sure whether this was
pushing things too far, and would like to carry out similar tests on a
known working 4.9.x kernel.

I'll do more testing over the next couple of weeks and report back.

Also adding Thomas who has the same issue with the T230 tuner and
bisected to issue to the same problematic commit as me.

Regards,
James.



On Mon, 22 Jul 2019 at 17:22, Jan Pieter van Woerkom <jp@jpvw.nl> wrote:
>
> remove t230 from cxusb
>
> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
> ---
> diff -ru a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
> --- a/drivers/media/usb/dvb-usb/cxusb.c 2019-07-08 00:41:56.000000000 +0200
> +++ b/drivers/media/usb/dvb-usb/cxusb.c 2019-07-22 17:34:51.550698820 +0200
> @@ -369,26 +369,6 @@
>         return 0;
>  }
>
> -static int cxusb_read_status(struct dvb_frontend *fe,
> -                                 enum fe_status *status)
> -{
> -       struct dvb_usb_adapter *adap = (struct dvb_usb_adapter *)fe->dvb->priv;
> -       struct cxusb_state *state = (struct cxusb_state *)adap->dev->priv;
> -       int ret;
> -
> -       ret = state->fe_read_status(fe, status);
> -
> -       /* it need resync slave fifo when signal change from unlock to lock.*/
> -       if ((*status & FE_HAS_LOCK) && (!state->last_lock)) {
> -               mutex_lock(&state->stream_mutex);
> -               cxusb_streaming_ctrl(adap, 1);
> -               mutex_unlock(&state->stream_mutex);
> -       }
> -
> -       state->last_lock = (*status & FE_HAS_LOCK) ? 1 : 0;
> -       return ret;
> -}
> -
>  static void cxusb_d680_dmb_drain_message(struct dvb_usb_device *d)
>  {
>         int       ep = d->props.generic_bulk_ctrl_endpoint;
> @@ -1164,83 +1144,6 @@
>         return 0;
>  }
>
> -static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
> -{
> -       struct dvb_usb_device *d = adap->dev;
> -       struct cxusb_state *st = d->priv;
> -       struct i2c_adapter *adapter;
> -       struct i2c_client *client_demod;
> -       struct i2c_client *client_tuner;
> -       struct i2c_board_info info;
> -       struct si2168_config si2168_config;
> -       struct si2157_config si2157_config;
> -
> -       /* Select required USB configuration */
> -       if (usb_set_interface(d->udev, 0, 0) < 0)
> -               err("set interface failed");
> -
> -       /* Unblock all USB pipes */
> -       usb_clear_halt(d->udev,
> -               usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
> -       usb_clear_halt(d->udev,
> -               usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
> -       usb_clear_halt(d->udev,
> -               usb_rcvbulkpipe(d->udev, d->props.adapter[0].fe[0].stream.endpoint));
> -
> -       /* attach frontend */
> -       si2168_config.i2c_adapter = &adapter;
> -       si2168_config.fe = &adap->fe_adap[0].fe;
> -       si2168_config.ts_mode = SI2168_TS_PARALLEL;
> -       si2168_config.ts_clock_inv = 1;
> -       memset(&info, 0, sizeof(struct i2c_board_info));
> -       strscpy(info.type, "si2168", I2C_NAME_SIZE);
> -       info.addr = 0x64;
> -       info.platform_data = &si2168_config;
> -       request_module(info.type);
> -       client_demod = i2c_new_device(&d->i2c_adap, &info);
> -       if (client_demod == NULL || client_demod->dev.driver == NULL)
> -               return -ENODEV;
> -
> -       if (!try_module_get(client_demod->dev.driver->owner)) {
> -               i2c_unregister_device(client_demod);
> -               return -ENODEV;
> -       }
> -
> -       st->i2c_client_demod = client_demod;
> -
> -       /* attach tuner */
> -       memset(&si2157_config, 0, sizeof(si2157_config));
> -       si2157_config.fe = adap->fe_adap[0].fe;
> -       si2157_config.if_port = 1;
> -       memset(&info, 0, sizeof(struct i2c_board_info));
> -       strscpy(info.type, "si2157", I2C_NAME_SIZE);
> -       info.addr = 0x60;
> -       info.platform_data = &si2157_config;
> -       request_module(info.type);
> -       client_tuner = i2c_new_device(adapter, &info);
> -       if (client_tuner == NULL || client_tuner->dev.driver == NULL) {
> -               module_put(client_demod->dev.driver->owner);
> -               i2c_unregister_device(client_demod);
> -               return -ENODEV;
> -       }
> -       if (!try_module_get(client_tuner->dev.driver->owner)) {
> -               i2c_unregister_device(client_tuner);
> -               module_put(client_demod->dev.driver->owner);
> -               i2c_unregister_device(client_demod);
> -               return -ENODEV;
> -       }
> -
> -       st->i2c_client_tuner = client_tuner;
> -
> -       /* hook fe: need to resync the slave fifo when signal locks. */
> -       mutex_init(&st->stream_mutex);
> -       st->last_lock = 0;
> -       st->fe_read_status = adap->fe_adap[0].fe->ops.read_status;
> -       adap->fe_adap[0].fe->ops.read_status = cxusb_read_status;
> -
> -       return 0;
> -}
> -
>  /*
>   * DViCO has shipped two devices with the same USB ID, but only one of them
>   * needs a firmware download.  Check the device class details to see if they
> @@ -1322,7 +1225,6 @@
>  static struct dvb_usb_device_properties cxusb_aver_a868r_properties;
>  static struct dvb_usb_device_properties cxusb_d680_dmb_properties;
>  static struct dvb_usb_device_properties cxusb_mygica_d689_properties;
> -static struct dvb_usb_device_properties cxusb_mygica_t230_properties;
>
>  static int cxusb_probe(struct usb_interface *intf,
>                        const struct usb_device_id *id)
> @@ -1353,8 +1255,6 @@
>                                      THIS_MODULE, NULL, adapter_nr) ||
>             0 == dvb_usb_device_init(intf, &cxusb_mygica_d689_properties,
>                                      THIS_MODULE, NULL, adapter_nr) ||
> -           0 == dvb_usb_device_init(intf, &cxusb_mygica_t230_properties,
> -                                    THIS_MODULE, NULL, adapter_nr) ||
>             0)
>                 return 0;
>
> @@ -1405,7 +1305,6 @@
>         DVICO_BLUEBIRD_DUAL_4_REV_2,
>         CONEXANT_D680_DMB,
>         MYGICA_D689,
> -       MYGICA_T230,
>         NR__cxusb_table_index
>  };
>
> @@ -1470,9 +1369,6 @@
>         [MYGICA_D689] = {
>                 USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_D689)
>         },
> -       [MYGICA_T230] = {
> -               USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230)
> -       },
>         {}              /* Terminating entry */
>  };
>  MODULE_DEVICE_TABLE (usb, cxusb_table);
> @@ -2128,60 +2024,6 @@
>                 },
>         }
>  };
> -
> -static struct dvb_usb_device_properties cxusb_mygica_t230_properties = {
> -       .caps = DVB_USB_IS_AN_I2C_ADAPTER,
> -
> -       .usb_ctrl         = CYPRESS_FX2,
> -
> -       .size_of_priv     = sizeof(struct cxusb_state),
> -
> -       .num_adapters = 1,
> -       .adapter = {
> -               {
> -               .num_frontends = 1,
> -               .fe = {{
> -                       .streaming_ctrl   = cxusb_streaming_ctrl,
> -                       .frontend_attach  = cxusb_mygica_t230_frontend_attach,
> -
> -                       /* parameter for the MPEG2-data transfer */
> -                       .stream = {
> -                               .type = USB_BULK,
> -                               .count = 5,
> -                               .endpoint = 0x02,
> -                               .u = {
> -                                       .bulk = {
> -                                               .buffersize = 8192,
> -                                       }
> -                               }
> -                       },
> -               } },
> -               },
> -       },
> -
> -       .power_ctrl       = cxusb_d680_dmb_power_ctrl,
> -
> -       .i2c_algo         = &cxusb_i2c_algo,
> -
> -       .generic_bulk_ctrl_endpoint = 0x01,
> -
> -       .rc.core = {
> -               .rc_interval    = 100,
> -               .rc_codes       = RC_MAP_D680_DMB,
> -               .module_name    = KBUILD_MODNAME,
> -               .rc_query       = cxusb_d680_dmb_rc_query,
> -               .allowed_protos = RC_PROTO_BIT_UNKNOWN,
> -       },
> -
> -       .num_device_descs = 1,
> -       .devices = {
> -               {
> -                       "Mygica T230 DVB-T/T2/C",
> -                       { NULL },
> -                       { &cxusb_table[MYGICA_T230], NULL },
> -               },
> -       }
> -};
>
>  static struct usb_driver cxusb_driver = {
>         .name           = "dvb_usb_cxusb",
