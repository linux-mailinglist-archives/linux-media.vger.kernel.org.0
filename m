Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EAA489EDC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 19:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238816AbiAJSLu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 13:11:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238807AbiAJSLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 13:11:49 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAC1C06173F;
        Mon, 10 Jan 2022 10:11:48 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id br17so16197598lfb.6;
        Mon, 10 Jan 2022 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TxcZWOqaSZZ9PyBej12PZTUOtsPwpsaX7uD28Kv4sDs=;
        b=J/rUh/mbh3C8U5t+wGNSUxiciDgI1KqNL1OKkFgcc/NuQMpXQkr1fkNXy3OLwxkyzo
         KH2lsq6CEBgq+VgWS4MdJp44MJe7wLyTf0JNA0gbvv7n4quamUOK9z873O+gWw6T725u
         U+ousj8PGuuwQS1ZLnWQSGGpqkPVM7BAGSMH5T4RcB4nn1VBDakM4y85oUDD2cWvQ31p
         DMmjt+pP5sxNCmqXJzdxZE1Iw1XOXDQeObd5TAlZVqoK2172UioVDIXNBPMn6AbBzSpm
         vKNJGSOA4oSYkEErRl+OnNqExp2nD70yQAgtMuQEvAJXRH5EU9rM39ZCy+0FniGw5n1t
         iUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TxcZWOqaSZZ9PyBej12PZTUOtsPwpsaX7uD28Kv4sDs=;
        b=ah4cu/a9WG4X1GvC9ocMWNdbNSR3JYfFjw6Uw+F6RdvNGKTgrOI8NU6yhIa6+ZgfHl
         8nziP9zh3+2RwOIvpc5QBH8Id0QiDDfwzVFDQhNoYvywsxw7h6W+B7wSaIOY+61ehNpN
         AxUSS3kh0Z7+vlWMFPDC7Z5E2biAKG2BeT9BjXVMoerTGX2rm+Zyd97/LVUSieBBautu
         naz0p1RaVZ55JvYyxWe2KZfha8NmjJaJKN+T4qKXUqVJnWjdUmeEKHbqbV2oY+TdFjV4
         UsvDpajOocB9eKLXCoNtAMg/uihaYJc9vOgM+BMhSrgQ+wUAaYntWROEQm2594DSFuLQ
         HPWA==
X-Gm-Message-State: AOAM531J8g/eYcW8LLwO8BOJBE2TF4HS4QJVNS4KiNnA7+r6QLoxFxhg
        NMKioSCY0sHVUqMAAC3ltq0=
X-Google-Smtp-Source: ABdhPJyRGaRPYh9YiaYd9HxEMgIbCX9gjnO6ex78tIjcJ6zB1KEx3JGVYlZSwXYAZO/nQq6CM0Hvqw==
X-Received: by 2002:a05:6512:251f:: with SMTP id be31mr653510lfb.46.1641838307198;
        Mon, 10 Jan 2022 10:11:47 -0800 (PST)
Received: from dell.intranet (178235254230.gdansk.vectranet.pl. [178.235.254.230])
        by smtp.gmail.com with ESMTPSA id n20sm738661lfu.306.2022.01.10.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 10:11:46 -0800 (PST)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of .set_mbus_config()
Date:   Mon, 10 Jan 2022 19:11:45 +0100
Message-ID: <1808044.CQOukoFCf9@dell>
In-Reply-To: <YdhDH/HmJ44B3Rxa@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com> <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com> <YdhDH/HmJ44B3Rxa@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Friday, 7 January 2022 14:41:51 CET Sakari Ailus wrote:
> Hi Janusz,
> 
> On Wed, Jan 05, 2022 at 10:31:41PM +0100, Janusz Krzysztofik wrote:
> > Hi Laurent,
> > 
> > On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> > > Hi Sakari,
> > >
> > > On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > > > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > > > kernel calls it, so drop its implementation from the ov6650 driver.
> > > > >
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > > > >  1 file changed, 37 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > > > index f67412150b16..455a627e35a0 100644
> > > > > --- a/drivers/media/i2c/ov6650.c
> > > > > +++ b/drivers/media/i2c/ov6650.c
> > > > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > > > >   return 0;
> > > > >  }
> > > > >
> > > > > -/* Alter bus settings on camera side */
> > > > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > > > -                           unsigned int pad,
> > > > > -                           struct v4l2_mbus_config *cfg)
> > > > > -{
> > > > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > > - int ret = 0;
> > > > > -
> > > > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> > > >
> > > > I think this configuration should come from the endpoint which the driver
> > > > currently does not parse. In fact, there are no even DT bindings for the
> > > > device.
> > >
> > > There's also no OF match table. While this isn't strictly required, it
> > > may indicate that the sensor hasn't been tested much on DT-based
> > > systems.
> > >
> > > I agree that the configuration should come from the device tree, but I
> > > can't test that, so I'm tempted to let someone else implement it if the
> > > driver is actually still in use (I can also write a patch if someone can
> > > test it).
> > 
> > This driver was used with omap1_camera, removed from the tree a few years
> > ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
> > updated but I gave up due to lack of response to my submissions.  That also
> > blocked my attempts to rework and reintroduce omap1_camera.
> 
> My apologies for this --- I indeed to see a set of unreviewed ov6650 patches
> from you. Please do ping me if you expect an answer but do not get one.

OK, thanks.

> > I think I'm still able to update my local (v4l2, non-mc) version of
> > omap1_camera to the extent required to test any changes to ov6650.
> > However, the OMAP1 platform does not support DT, and will probably never
> > do.  Then,  I think that it makes sense to spend my time on that only if
> > you (media maintainers) are not going to depreciate non-DT support any
> > soon.  Are you?
> 
> Commenting just this and not the discussion later in this thread --- it is
> possible to support such sensor drivers without DT or ACPI nowadays,
> through software nodes. See e.g. drivers/media/pci/intel/ipu3/cio2-bridge.c

Thanks for bringing this possibility to my awareness, I didn't know it 
existed.  AFAICS, I2C sensor drivers like ov6650 can now be provided by 
board files with device properties via i2c_board_info.swnode.

If I find a solution to implement a non-v4l2-clk clock device in 
omap1_camera driver, I'll try to get back to updating ov6650 as time 
permits.

Thanks,
Janusz


