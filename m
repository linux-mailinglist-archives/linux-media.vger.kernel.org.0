Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB10D385C2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 09:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbfFGHyW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 03:54:22 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38606 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfFGHyW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jun 2019 03:54:22 -0400
Received: by mail-ed1-f66.google.com with SMTP id g13so1699792edu.5
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ArYYKIMOHCWSGh7ZEky8JCH+cH+neP3KWbv+59bI+28=;
        b=Bq2TWJruDFYdyZULuzbY3hPJEj2zvv5gXoXPLGbzPuv0Pg0U1NDPxH/X3qaJ1YHC7Y
         /MXlv48Cgef8tb+DGmKSI7kzSZGY5/foWVte1IKChKjP9n6WUOVQZc7ciz87hBjfTreD
         o34AOo3A23IKDE/KlbW4UGPsFGQ1HBSHAf3I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ArYYKIMOHCWSGh7ZEky8JCH+cH+neP3KWbv+59bI+28=;
        b=jt/XRspjErIUAx3MawcAdpJK6CXhNgiQEmykBvyvOO7CdJnF+fcAMHhN6aieNu3mfw
         f3hfYmtnx07gIGJS0N/gkoJiv6fQQ1SFO8fIC0hx/63pHfy+Qs4pt7Hr7pCztsq+w6q2
         2ES2Q0Np0K1tEhIh18TtfnZP1+XAbWvUuoNgjfSlDyHDIpSS1SIF41ksC31et5styb+/
         XhtxJaLLuh2nEhnZpPcWrhpOah47whrHGU2NUNGqv5mPcupvKrU6CMiI7Vqc3F48lyhc
         E94OjkU646qgeGxYNWuAorfk0WNxmjCGwMuiZmPrAaE4ntSX7MWBwWsYWtij3z8kj9AE
         HgEg==
X-Gm-Message-State: APjAAAXOgrQVkWVoAqPIrTfVuKUs1pVr80CQEUKIguc5rLddWBH3WPey
        /5IR5kiBZ5bfOepHXYWvJixKOMlURYvUSg==
X-Google-Smtp-Source: APXvYqxuxfSdaozILPgLx0mf6zf0exvf1ptt0vlxvOkA2Rl3rshW9spUqcr6pF5stBWPacmIEhCF7g==
X-Received: by 2002:aa7:dd92:: with SMTP id g18mr66176edv.194.1559894060654;
        Fri, 07 Jun 2019 00:54:20 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id s17sm237919ejf.48.2019.06.07.00.54.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 00:54:19 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id g135so965367wme.4
        for <linux-media@vger.kernel.org>; Fri, 07 Jun 2019 00:54:19 -0700 (PDT)
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr2676794wmk.10.1559894059267;
 Fri, 07 Jun 2019 00:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190510100930.14641-1-sakari.ailus@linux.intel.com>
 <20190510100930.14641-4-sakari.ailus@linux.intel.com> <20190605070752.GA126683@chromium.org>
 <20190605101535.4sydewuv656x6c2g@kekkonen.localdomain>
In-Reply-To: <20190605101535.4sydewuv656x6c2g@kekkonen.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 7 Jun 2019 16:54:06 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D+RZS0E6xpZ3v8gC5zerj5fd6b6YxcAS_TeWei6vGvUA@mail.gmail.com>
Message-ID: <CAAFQd5D+RZS0E6xpZ3v8gC5zerj5fd6b6YxcAS_TeWei6vGvUA@mail.gmail.com>
Subject: Re: [PATCH 3/5] ov5670: Support probe whilst the device is off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 5, 2019 at 7:15 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Wed, Jun 05, 2019 at 04:07:52PM +0900, Tomasz Figa wrote:
> > Hi Sakari,
> >
> > On Fri, May 10, 2019 at 01:09:28PM +0300, Sakari Ailus wrote:
> > > Tell ACPI device PM code that the driver supports the device being po=
wered
> > > off when the driver's probe function is entered.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/ov5670.c | 25 ++++++++++++++-----------
> > >  1 file changed, 14 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > index 041fcbb4eebdf..57e8b92f90e09 100644
> > > --- a/drivers/media/i2c/ov5670.c
> > > +++ b/drivers/media/i2c/ov5670.c
> > > @@ -2444,6 +2444,7 @@ static int ov5670_probe(struct i2c_client *clie=
nt)
> > >     struct ov5670 *ov5670;
> > >     const char *err_msg;
> > >     u32 input_clk =3D 0;
> > > +   bool powered_off;
> > >     int ret;
> > >
> > >     device_property_read_u32(&client->dev, "clock-frequency", &input_=
clk);
> > > @@ -2460,11 +2461,14 @@ static int ov5670_probe(struct i2c_client *cl=
ient)
> > >     /* Initialize subdev */
> > >     v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
> > >
> > > -   /* Check module identity */
> > > -   ret =3D ov5670_identify_module(ov5670);
> > > -   if (ret) {
> > > -           err_msg =3D "ov5670_identify_module() error";
> > > -           goto error_print;
> > > +   powered_off =3D acpi_dev_powered_off_for_probe(&client->dev);
> > > +   if (!powered_off) {
> > > +           /* Check module identity */
> > > +           ret =3D ov5670_identify_module(ov5670);
> > > +           if (ret) {
> > > +                   err_msg =3D "ov5670_identify_module() error";
> > > +                   goto error_print;
> > > +           }
> > >     }
> >
> > I don't like the fact that we can't detect any hardware connection issu=
e
> > here anymore and we would actually get some obscure failure when we
> > actually start streaming.
> >
> > Wouldn't it be possible to still keep this behavior of not powering on
> > the device at boot-up if no driver is bound and then have this driver
> > built as a module and loaded later when the camera is to be used for th=
e
> > first time after the system boots?
>
> That'd be a way to work around this, but the downside would be that the
> user space would need to know not only which drivers to load, but also
> which drivers _not_ to load. The user space could obtain the former from
> the kernel but not the latter, it'd be system specific configuration.
>
> Moving the responsibility of loading the driver to user space would also
> not address figuring out whether the sensor is accessible through its
> control bus: you have to power it on to do that. In fact, if you want to =
be
> sure that the hardware is all right, you have to start streaming on the
> device first and that is not a part of a typical driver initialisation
> sequence. Just checking the sensor is accessible over I=E6=B6=8E is not e=
nough.
>
> The proposed solution addresses the problem without user space changes.

I guess that makes sense indeed. If going this way, why not just move
all the hardware access from probe to streamon and avoid any
conditional checks at all?

Best regards,
Tomasz
