Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830037F645
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 13:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbfHBL6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 07:58:33 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:39168 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfHBL6d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 07:58:33 -0400
Received: by mail-vs1-f66.google.com with SMTP id u3so51094991vsh.6
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2019 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=suaRTPGP/nMT7wZzzSmTkL30FbZvU9QLisEMePnxs1Y=;
        b=r/T0YF/A9reOjt3xG38/JIJ0MLs6doqp60fTolAn6vEq2elyQWbd3+hSXdPhdRMVdI
         TYwZAj35NxFcOOY0EhAyiYY9vs3+K2xpnNgtBlDkydTK6SpP7sXE7GT/GI2kd1J3UrG4
         ptI0wJZKQva2kgtym1tNSTEbGXQ7H1LfB+jcwqyfJpqAiTcExZMf28WI+4R2IPAk7xb2
         mV9ixEYi5wGsvegtvXk3zM5dLezrgHms9exHMSIdRVz23HwneO4hrbWYQOBtnXogwmg1
         r+gVgsX46Ry0JoKg6T5YLt9N8AgpwXQ4EjEK8yW3AE4UKEEWaQpvbqhnhpIgU8Uq37qX
         EqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=suaRTPGP/nMT7wZzzSmTkL30FbZvU9QLisEMePnxs1Y=;
        b=SrjKoPyPvdcmBuIRequb19J1oAYFPOj0FjGxQLjiu8qJSAstgm5vyh/h7MAUILlyU6
         uuPbMJffdpm5fz+oImTLULZ7k1XSlI32iY5ysFcX5lP+VJFkvqt+X3lex8rjVZv3LXjx
         zYfOSRbU66bEeY+bYjy6eH95Qp/Lg1jB3i9mIL4ctxLBkbUKin3+26KPIGVy5iQq4pw2
         LTlYSaBIGPWduaZf3sudbGpCozEj7w2eIsVmSb2zMVYlD9GSmCQGBXaCOkK9gxJUGYwa
         A25WEVzllyMeUmoZqKFzJbS/MVzBAPTTvcRKBOD6/awVrFoJkR1Ohr37fpZkgsvp27Hi
         6iQg==
X-Gm-Message-State: APjAAAVsQEf2vKdOqZ7qodd02PVwSH/73MsvYRTkKseQbAdJC0D7ctx8
        F+dz1mv1wxn5SpKqYKGQgyqL2aJlhgFs/wP3cn0=
X-Google-Smtp-Source: APXvYqyRaRQWuq30Wg+XMRMCZKtsXg51H3iCt/YU6p8zlHRZc9LhZiatIwvmXYJ/hop7JYAVmg0H/ME8pOcZQJTEcyw=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr24069572vsq.179.1564747111647;
 Fri, 02 Aug 2019 04:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl> <20190721182940.kclp27faukxxfc4d@gofer.mess.org>
 <62bc916f-a586-17b5-b9f8-f543d56ea76b@jpvw.nl> <CAD+OKUre40kQiucuryJC0uYrvBSqL5M=pAkmi7QxgOoKUWt0bg@mail.gmail.com>
 <70cb09ed-1ae4-6626-643d-c9e1c9ae47c6@jpvw.nl> <CAD+OKUr-f_a8dcPVp24d4wPhRAE80tf10_kt5s3_WvVmfWu9JQ@mail.gmail.com>
 <20190722162225.GA6919@jpvw.nl> <CAD+OKUpw65wSRjJaExaoHx3nn1w03KbAvZRME_8M3STH5bhzWQ@mail.gmail.com>
In-Reply-To: <CAD+OKUpw65wSRjJaExaoHx3nn1w03KbAvZRME_8M3STH5bhzWQ@mail.gmail.com>
From:   James Hutchinson <jahutchinson99@googlemail.com>
Date:   Fri, 2 Aug 2019 12:58:20 +0100
Message-ID: <CAD+OKUrQQCu4-hug-puRtW1+bqM16hiTsztjYbF2t_aDZVBHGQ@mail.gmail.com>
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

I've been running for a couple of weeks now with your two patches applied:

1) dvbsky: add MyGica T230
2) remove t230 from cxusb

Everything has been working perfectly - the checksum errors when
scanning muxes have gone, and streaming has been working nicely.

Tested-by: James Hutchinson <jahutchinson99@googlemail.com>

Regards,
James

On Tue, 23 Jul 2019 at 17:02, James Hutchinson
<jahutchinson99@googlemail.com> wrote:
>
> Hi Jan,
>
> My initial testing of your two patches to move the T230 to the dvbsky
> module looks good so far.
>
> I'm testing on an 8th Gen NUC (8i3BEH) 16GB RAM, 2 x MyGica T230 T2
> USB tuners, and 2 x DVBSky S960 S2 tuners.
>
> This machine is running Debian stretch with the Debian 4.19.37
> backport kernel (incl. your two patches to move the T230 to the dvbsky
> module).
>
> I have a test script that performs 200x consecutive tvheadend network scans...
> This was executed against the UK Freeview network (6 muxes) =~1,200
> tuning requests. This took a couple of hours, but not a single
> checksum error.
>
> I moved onto streaming various channels and didn't have any problems
> so far. I only noted a couple of minor picture disturbances
> (continuity counter errors) when i tried to record two HD channels
> whilst watching a 3rd on the same mux. I'm not sure whether this was
> pushing things too far, and would like to carry out similar tests on a
> known working 4.9.x kernel.
>
> I'll do more testing over the next couple of weeks and report back.
>
> Also adding Thomas who has the same issue with the T230 tuner and
> bisected to issue to the same problematic commit as me.
>
> Regards,
> James.
>
>
>
> On Mon, 22 Jul 2019 at 17:22, Jan Pieter van Woerkom <jp@jpvw.nl> wrote:
> >
> > remove t230 from cxusb
> >
> > Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
> > ---
> > diff -ru a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
> > --- a/drivers/media/usb/dvb-usb/cxusb.c 2019-07-08 00:41:56.000000000 +0200
> > +++ b/drivers/media/usb/dvb-usb/cxusb.c 2019-07-22 17:34:51.550698820 +0200
> > @@ -369,26 +369,6 @@
> >         return 0;
> >  }
> >
> > -static int cxusb_read_status(struct dvb_frontend *fe,
> > -                                 enum fe_status *status)
> > -{
> > -       struct dvb_usb_adapter *adap = (struct dvb_usb_adapter *)fe->dvb->priv;
> > -       struct cxusb_state *state = (struct cxusb_state *)adap->dev->priv;
> > -       int ret;
> > -
> > -       ret = state->fe_read_status(fe, status);
> > -
> > -       /* it need resync slave fifo when signal change from unlock to lock.*/
> > -       if ((*status & FE_HAS_LOCK) && (!state->last_lock)) {
> > -               mutex_lock(&state->stream_mutex);
> > -               cxusb_streaming_ctrl(adap, 1);
> > -               mutex_unlock(&state->stream_mutex);
> > -       }
> > -
> > -       state->last_lock = (*status & FE_HAS_LOCK) ? 1 : 0;
> > -       return ret;
> > -}
> > -
> >  static void cxusb_d680_dmb_drain_message(struct dvb_usb_device *d)
> >  {
> >         int       ep = d->props.generic_bulk_ctrl_endpoint;
> > @@ -1164,83 +1144,6 @@
> >         return 0;
> >  }
> >
> > -static int cxusb_mygica_t230_frontend_attach(struct dvb_usb_adapter *adap)
> > -{
> > -       struct dvb_usb_device *d = adap->dev;
> > -       struct cxusb_state *st = d->priv;
> > -       struct i2c_adapter *adapter;
> > -       struct i2c_client *client_demod;
> > -       struct i2c_client *client_tuner;
> > -       struct i2c_board_info info;
> > -       struct si2168_config si2168_config;
> > -       struct si2157_config si2157_config;
> > -
> > -       /* Select required USB configuration */
> > -       if (usb_set_interface(d->udev, 0, 0) < 0)
> > -               err("set interface failed");
> > -
> > -       /* Unblock all USB pipes */
> > -       usb_clear_halt(d->udev,
> > -               usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
> > -       usb_clear_halt(d->udev,
> > -               usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
> > -       usb_clear_halt(d->udev,
> > -               usb_rcvbulkpipe(d->udev, d->props.adapter[0].fe[0].stream.endpoint));
> > -
> > -       /* attach frontend */
> > -       si2168_config.i2c_adapter = &adapter;
> > -       si2168_config.fe = &adap->fe_adap[0].fe;
> > -       si2168_config.ts_mode = SI2168_TS_PARALLEL;
> > -       si2168_config.ts_clock_inv = 1;
> > -       memset(&info, 0, sizeof(struct i2c_board_info));
> > -       strscpy(info.type, "si2168", I2C_NAME_SIZE);
> > -       info.addr = 0x64;
> > -       info.platform_data = &si2168_config;
> > -       request_module(info.type);
> > -       client_demod = i2c_new_device(&d->i2c_adap, &info);
> > -       if (client_demod == NULL || client_demod->dev.driver == NULL)
> > -               return -ENODEV;
> > -
> > -       if (!try_module_get(client_demod->dev.driver->owner)) {
> > -               i2c_unregister_device(client_demod);
> > -               return -ENODEV;
> > -       }
> > -
> > -       st->i2c_client_demod = client_demod;
> > -
> > -       /* attach tuner */
> > -       memset(&si2157_config, 0, sizeof(si2157_config));
> > -       si2157_config.fe = adap->fe_adap[0].fe;
> > -       si2157_config.if_port = 1;
> > -       memset(&info, 0, sizeof(struct i2c_board_info));
> > -       strscpy(info.type, "si2157", I2C_NAME_SIZE);
> > -       info.addr = 0x60;
> > -       info.platform_data = &si2157_config;
> > -       request_module(info.type);
> > -       client_tuner = i2c_new_device(adapter, &info);
> > -       if (client_tuner == NULL || client_tuner->dev.driver == NULL) {
> > -               module_put(client_demod->dev.driver->owner);
> > -               i2c_unregister_device(client_demod);
> > -               return -ENODEV;
> > -       }
> > -       if (!try_module_get(client_tuner->dev.driver->owner)) {
> > -               i2c_unregister_device(client_tuner);
> > -               module_put(client_demod->dev.driver->owner);
> > -               i2c_unregister_device(client_demod);
> > -               return -ENODEV;
> > -       }
> > -
> > -       st->i2c_client_tuner = client_tuner;
> > -
> > -       /* hook fe: need to resync the slave fifo when signal locks. */
> > -       mutex_init(&st->stream_mutex);
> > -       st->last_lock = 0;
> > -       st->fe_read_status = adap->fe_adap[0].fe->ops.read_status;
> > -       adap->fe_adap[0].fe->ops.read_status = cxusb_read_status;
> > -
> > -       return 0;
> > -}
> > -
> >  /*
> >   * DViCO has shipped two devices with the same USB ID, but only one of them
> >   * needs a firmware download.  Check the device class details to see if they
> > @@ -1322,7 +1225,6 @@
> >  static struct dvb_usb_device_properties cxusb_aver_a868r_properties;
> >  static struct dvb_usb_device_properties cxusb_d680_dmb_properties;
> >  static struct dvb_usb_device_properties cxusb_mygica_d689_properties;
> > -static struct dvb_usb_device_properties cxusb_mygica_t230_properties;
> >
> >  static int cxusb_probe(struct usb_interface *intf,
> >                        const struct usb_device_id *id)
> > @@ -1353,8 +1255,6 @@
> >                                      THIS_MODULE, NULL, adapter_nr) ||
> >             0 == dvb_usb_device_init(intf, &cxusb_mygica_d689_properties,
> >                                      THIS_MODULE, NULL, adapter_nr) ||
> > -           0 == dvb_usb_device_init(intf, &cxusb_mygica_t230_properties,
> > -                                    THIS_MODULE, NULL, adapter_nr) ||
> >             0)
> >                 return 0;
> >
> > @@ -1405,7 +1305,6 @@
> >         DVICO_BLUEBIRD_DUAL_4_REV_2,
> >         CONEXANT_D680_DMB,
> >         MYGICA_D689,
> > -       MYGICA_T230,
> >         NR__cxusb_table_index
> >  };
> >
> > @@ -1470,9 +1369,6 @@
> >         [MYGICA_D689] = {
> >                 USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_D689)
> >         },
> > -       [MYGICA_T230] = {
> > -               USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230)
> > -       },
> >         {}              /* Terminating entry */
> >  };
> >  MODULE_DEVICE_TABLE (usb, cxusb_table);
> > @@ -2128,60 +2024,6 @@
> >                 },
> >         }
> >  };
> > -
> > -static struct dvb_usb_device_properties cxusb_mygica_t230_properties = {
> > -       .caps = DVB_USB_IS_AN_I2C_ADAPTER,
> > -
> > -       .usb_ctrl         = CYPRESS_FX2,
> > -
> > -       .size_of_priv     = sizeof(struct cxusb_state),
> > -
> > -       .num_adapters = 1,
> > -       .adapter = {
> > -               {
> > -               .num_frontends = 1,
> > -               .fe = {{
> > -                       .streaming_ctrl   = cxusb_streaming_ctrl,
> > -                       .frontend_attach  = cxusb_mygica_t230_frontend_attach,
> > -
> > -                       /* parameter for the MPEG2-data transfer */
> > -                       .stream = {
> > -                               .type = USB_BULK,
> > -                               .count = 5,
> > -                               .endpoint = 0x02,
> > -                               .u = {
> > -                                       .bulk = {
> > -                                               .buffersize = 8192,
> > -                                       }
> > -                               }
> > -                       },
> > -               } },
> > -               },
> > -       },
> > -
> > -       .power_ctrl       = cxusb_d680_dmb_power_ctrl,
> > -
> > -       .i2c_algo         = &cxusb_i2c_algo,
> > -
> > -       .generic_bulk_ctrl_endpoint = 0x01,
> > -
> > -       .rc.core = {
> > -               .rc_interval    = 100,
> > -               .rc_codes       = RC_MAP_D680_DMB,
> > -               .module_name    = KBUILD_MODNAME,
> > -               .rc_query       = cxusb_d680_dmb_rc_query,
> > -               .allowed_protos = RC_PROTO_BIT_UNKNOWN,
> > -       },
> > -
> > -       .num_device_descs = 1,
> > -       .devices = {
> > -               {
> > -                       "Mygica T230 DVB-T/T2/C",
> > -                       { NULL },
> > -                       { &cxusb_table[MYGICA_T230], NULL },
> > -               },
> > -       }
> > -};
> >
> >  static struct usb_driver cxusb_driver = {
> >         .name           = "dvb_usb_cxusb",
