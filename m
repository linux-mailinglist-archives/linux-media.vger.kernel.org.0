Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946B19CC7E
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 11:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730903AbfHZJVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 05:21:37 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41531 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHZJVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 05:21:37 -0400
Received: by mail-ed1-f68.google.com with SMTP id w5so25507389edl.8
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rhUbb4I4hOvyBOfSpMcmGydYU4d0wJQGd5ssHK1Y+Mw=;
        b=frdlw7+yhNmDD/60qsRg6wF9GR5nqL8SKONmGxNgi1si+CeUHw8SrJagBR2rwwA1pT
         YW9owHoY7IwlUms2BfqEmrF5oUwtS6VhmgHleV0J1W9yOhZThmBUeP7kmfuWa+keYYzI
         f1DCA7j2gQtadIuAwHQVwzK263Cc3baRieJNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rhUbb4I4hOvyBOfSpMcmGydYU4d0wJQGd5ssHK1Y+Mw=;
        b=XWt13QVwK/QeSJMIVOyYLxP3tyRADFkX9kxf5VSiS0VNVuoCi08/JYFJUilv8HxkH+
         DYn4cj6Yo3kykVOplGC3GvzuK+vJ4DgfJ/85FTR/YY+2gfUgDl9QsuEBMQ6I48HLuSdd
         R200riCCCnlQWeZxxTnAyIPNTVJIHa1xed9TjLbMCK+alnZ4aKGcd/oqjgBN/09KCEvy
         b99HtHqqq4ERYjrZ8fFZCOdhnrC2ogiGBqYneKoAnUkEL8B29Q+Ne9B0f7Nu1sA1XEAY
         R0FLEkzI66OCKPapKEUBRBr/PfrB1ueM3CtyL3S0tKPOsDo8tjbyFWGF5ghgXWmT3JaB
         zYFA==
X-Gm-Message-State: APjAAAWMFTgkkoKobr4Elw7+IqVsKwhdNeCUVy9lfUf59oHJkmqJKt8N
        B8w0D246rdDx6vW+aHS2O0tUwyh8sd6AAg==
X-Google-Smtp-Source: APXvYqwS9ARzkrVMqbdr8p4/+kBDomGWubjklrB+yzmzWWW3s4YlzsaRb6LVHMn/5OXbgNHBielUyA==
X-Received: by 2002:a17:906:3c7:: with SMTP id c7mr15812804eja.187.1566811294556;
        Mon, 26 Aug 2019 02:21:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id ay8sm2805128ejb.4.2019.08.26.02.21.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2019 02:21:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id b16so14551341wrq.9
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 02:21:33 -0700 (PDT)
X-Received: by 2002:adf:f851:: with SMTP id d17mr21238372wrq.77.1566811293556;
 Mon, 26 Aug 2019 02:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190510100930.14641-1-sakari.ailus@linux.intel.com>
 <20190510100930.14641-4-sakari.ailus@linux.intel.com> <20190605070752.GA126683@chromium.org>
 <20190605101535.4sydewuv656x6c2g@kekkonen.localdomain> <CAAFQd5D+RZS0E6xpZ3v8gC5zerj5fd6b6YxcAS_TeWei6vGvUA@mail.gmail.com>
 <20190826083813.GK31967@paasikivi.fi.intel.com>
In-Reply-To: <20190826083813.GK31967@paasikivi.fi.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 26 Aug 2019 18:21:21 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CL9asYPguLpP-sQJeuvzwMjjfED7z37OcYXqmyGZMyTg@mail.gmail.com>
Message-ID: <CAAFQd5CL9asYPguLpP-sQJeuvzwMjjfED7z37OcYXqmyGZMyTg@mail.gmail.com>
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

On Mon, Aug 26, 2019 at 5:38 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Tomasz,
>
> On Fri, Jun 07, 2019 at 04:54:06PM +0900, Tomasz Figa wrote:
> > On Wed, Jun 5, 2019 at 7:15 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, Jun 05, 2019 at 04:07:52PM +0900, Tomasz Figa wrote:
> > > > Hi Sakari,
> > > >
> > > > On Fri, May 10, 2019 at 01:09:28PM +0300, Sakari Ailus wrote:
> > > > > Tell ACPI device PM code that the driver supports the device bein=
g powered
> > > > > off when the driver's probe function is entered.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov5670.c | 25 ++++++++++++++-----------
> > > > >  1 file changed, 14 insertions(+), 11 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov567=
0.c
> > > > > index 041fcbb4eebdf..57e8b92f90e09 100644
> > > > > --- a/drivers/media/i2c/ov5670.c
> > > > > +++ b/drivers/media/i2c/ov5670.c
> > > > > @@ -2444,6 +2444,7 @@ static int ov5670_probe(struct i2c_client *=
client)
> > > > >     struct ov5670 *ov5670;
> > > > >     const char *err_msg;
> > > > >     u32 input_clk =3D 0;
> > > > > +   bool powered_off;
> > > > >     int ret;
> > > > >
> > > > >     device_property_read_u32(&client->dev, "clock-frequency", &in=
put_clk);
> > > > > @@ -2460,11 +2461,14 @@ static int ov5670_probe(struct i2c_client=
 *client)
> > > > >     /* Initialize subdev */
> > > > >     v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops)=
;
> > > > >
> > > > > -   /* Check module identity */
> > > > > -   ret =3D ov5670_identify_module(ov5670);
> > > > > -   if (ret) {
> > > > > -           err_msg =3D "ov5670_identify_module() error";
> > > > > -           goto error_print;
> > > > > +   powered_off =3D acpi_dev_powered_off_for_probe(&client->dev);
> > > > > +   if (!powered_off) {
> > > > > +           /* Check module identity */
> > > > > +           ret =3D ov5670_identify_module(ov5670);
> > > > > +           if (ret) {
> > > > > +                   err_msg =3D "ov5670_identify_module() error";
> > > > > +                   goto error_print;
> > > > > +           }
> > > > >     }
> > > >
> > > > I don't like the fact that we can't detect any hardware connection =
issue
> > > > here anymore and we would actually get some obscure failure when we
> > > > actually start streaming.
> > > >
> > > > Wouldn't it be possible to still keep this behavior of not powering=
 on
> > > > the device at boot-up if no driver is bound and then have this driv=
er
> > > > built as a module and loaded later when the camera is to be used fo=
r the
> > > > first time after the system boots?
> > >
> > > That'd be a way to work around this, but the downside would be that t=
he
> > > user space would need to know not only which drivers to load, but als=
o
> > > which drivers _not_ to load. The user space could obtain the former f=
rom
> > > the kernel but not the latter, it'd be system specific configuration.
> > >
> > > Moving the responsibility of loading the driver to user space would a=
lso
> > > not address figuring out whether the sensor is accessible through its
> > > control bus: you have to power it on to do that. In fact, if you want=
 to be
> > > sure that the hardware is all right, you have to start streaming on t=
he
> > > device first and that is not a part of a typical driver initialisatio=
n
> > > sequence. Just checking the sensor is accessible over I=E6=B6=8E is n=
ot enough.
> > >
> > > The proposed solution addresses the problem without user space change=
s.
> >
> > I guess that makes sense indeed. If going this way, why not just move
> > all the hardware access from probe to streamon and avoid any
> > conditional checks at all?
>
> My apologies for the late answer.
>
> In that case there would be no way to verify the hardware actually is
> there, even on systems where there is no adverse effect from doing that.
> For a sensor driver this could be just fine, but I have doubts it'd be
> appropriate for e.g. the at24 driver.

For an eeprom, the first read could fail. That said, I agree that for
systems on which there is no such concern it would still be desirable
to check if the device is accessible in probe.

Anyway, I think you convinced me. :)

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
