Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBC47F64D
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2019 14:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbfHBMAM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Aug 2019 08:00:12 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:42935 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfHBMAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Aug 2019 08:00:12 -0400
Received: by mail-ua1-f44.google.com with SMTP id a97so29538576uaa.9
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2019 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SE9T2wf2aFcDnz79m8bSL0B746t8ugzwVfP8M8SeEA=;
        b=I+K2fk8k0u4gyATkIxH33GEuB8VFokIxF4kwMxj+IX0vp7SCPUbxSLzBH8F9XJ9AKx
         Dr3dJ5z54wkNqoS70/o+p0TfmKPje9khy86el4c8Vrr4580Y2VwwHYU83jn7qqXtUrQm
         tJVq/vFuTZajnd/FkxtHC1yCcrDhsWTt50Cwbt/L+l9ifFHGjBIQyM18DGSPFvj5NJBy
         3ilXiekLW9uJ3+ADXzMgxCpiGngSW9mt02Tg/Mj1xUsxV0++aGoBQsT42FAbhrwDc7XW
         +O9dMZPDUnoxEFiYiLJ9OAvpq1RB7GLmFOTP6nlESqVyvIGQZyQJTRgoyIoFb5qERJOl
         MuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SE9T2wf2aFcDnz79m8bSL0B746t8ugzwVfP8M8SeEA=;
        b=Sjvds/h7QPnEzgTSqFb9/lIwc0U8WAsuw8+CCyM8UzTv3+JYQX4Oft/6MVKHSVoAP1
         +ts/3AM7zVArd8c0HmqySSpOqhqP8qjZy3/RX0e8ZAvd6ycGsbk8W3dy1BMEIUQdu22l
         fvpYAcW9qMbWMZCT6Iz3aIyFNGLW9FV1PduZTcrvBz4qFr0Qa98MNP6T/zBatJ7cY2Hd
         wpG/OYIdT9ReMVwv1WJz2e9/iIevsNAykdStqECsPLYrtDqaMsf5oCRgnhQo/wg9vomx
         iwjfxZ75ch1MD8WPb17hktpTRVYfT2d14QGC9OE3em3CMYgUkdmfpbXcZMFfaOXbexLq
         9eQA==
X-Gm-Message-State: APjAAAVtUhgis01vxPaLddwscoo1MeVwymARmDuYi+GDXzn9Sdg4SLzt
        A2nNM/7QOOY9rLVorKAz5jLavIVeB2uRgTyA4kE=
X-Google-Smtp-Source: APXvYqxm/d6uRnZ8hqYp2zpFdb17gZhl6Kz8UbiqLvab2lMuPTeHuGXdkeEkI0hvNYvxKpvIxGZXnBb7mhZZRjtcI80=
X-Received: by 2002:ab0:7491:: with SMTP id n17mr31582416uap.102.1564747211109;
 Fri, 02 Aug 2019 05:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAD+OKUpCVHUO1=mEGCx8Mx7TJLc4rJZjV8+Rgd_fRFrwpBDExA@mail.gmail.com>
 <20190719183542.GA25609@jpvw.nl>
In-Reply-To: <20190719183542.GA25609@jpvw.nl>
From:   James Hutchinson <jahutchinson99@googlemail.com>
Date:   Fri, 2 Aug 2019 13:00:00 +0100
Message-ID: <CAD+OKUoCXV1LLM40Frm8VGoFDzhKmO__ALdsnttmfr=nueBFAg@mail.gmail.com>
Subject: Re: MyGica T230 dvb-t2 data corruption since commit 5fa8815
To:     Jan Pieter van Woerkom <jp@jpvw.nl>
Cc:     Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org,
        Thomas Hollstegge <thomas.hollstegge@gmail.com>
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

On Fri, 19 Jul 2019 at 19:35, Jan Pieter van Woerkom <jp@jpvw.nl> wrote:
>
> dvbsky: add MyGica T230.
> Moved from cxusb driver as that driver can't handle FX2 FIFO issue.
>
> Signed-off-by: Jan Pieter van Woerkom <jp@jpvw.nl>
> ---
> diff -ru a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
> --- a/drivers/media/usb/dvb-usb-v2/dvbsky.c     2019-07-08 00:41:56.000000000 +0200
> +++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c     2019-07-19 17:50:54.671341146 +0200
> @@ -561,11 +561,18 @@
>
>         /* attach tuner */
>         si2157_config.fe = adap->fe[0];
> -       si2157_config.if_port = 0;
> -
> -       state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
> +       if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_T230) {
> +               si2157_config.if_port = 1;
> +               state->i2c_client_tuner = dvb_module_probe("si2157", NULL,
> +                                                  i2c_adapter,
> +                                                  0x60, &si2157_config);
> +       }
> +       else {
> +               si2157_config.if_port = 0;
> +               state->i2c_client_tuner = dvb_module_probe("si2157", "si2141",
>                                                    i2c_adapter,
>                                                    0x60, &si2157_config);
> +       }
>         if (!state->i2c_client_tuner) {
>                 dvb_module_release(state->i2c_client_demod);
>                 return -ENODEV;
> @@ -787,6 +794,9 @@
>         { DVB_USB_DEVICE(USB_VID_TERRATEC, USB_PID_TERRATEC_CINERGY_S2_R4,
>                 &dvbsky_s960_props, "Terratec Cinergy S2 Rev.4",
>                 RC_MAP_DVBSKY) },
> +       { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230,
> +               &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230",
> +               RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
>         { DVB_USB_DEVICE(USB_VID_CONEXANT, USB_PID_MYGICA_T230C,
>                 &mygica_t230c_props, "MyGica Mini DVB-T2 USB Stick T230C",
>                 RC_MAP_TOTAL_MEDIA_IN_HAND_02) },
