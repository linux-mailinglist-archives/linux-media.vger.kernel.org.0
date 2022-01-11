Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0479B48AD09
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 12:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239323AbiAKLxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 06:53:00 -0500
Received: from lahtoruutu.iki.fi ([185.185.170.37]:58930 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239285AbiAKLwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 06:52:43 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 8244C1B00056;
        Tue, 11 Jan 2022 13:52:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1641901959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2SirRMDX3hGebQVAnY8e3MT0zjnGkkczJi2lAJ1SLIE=;
        b=LQ4nQTJoxqp7ZbbnkA7tcIQZZBXx+3g1lGq48v1KrF/qc5aZnKp7/W/nBEhoiF2rYMnhaP
        /ZXZmvmZbcl3cb01zJ6DknsHCBR/aNhBd59l++pnOnJlc16HyeoYidUNGJg5zPwTENb9Vc
        jj2qoBcRzNjrMQssAe+3Qe5OBJSiP8emohpB6+x9i+BhMoNKgjDoEYIKOw8MoD4d0P3x4l
        5AVIg0pqOkFuXMFfyKEEF+zdnjuJ7F8dqX+uypONDnMvFUMxCx8pe8IpQdSw14n2uq7jy7
        3Tr/XUrtw3N9GB7WKcdlyxxdjUGuq0LG+g1fCNw1Ck+YA6KSU/Zj5oIQcmzsBw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 794C3634C90;
        Tue, 11 Jan 2022 13:52:38 +0200 (EET)
Date:   Tue, 11 Jan 2022 13:52:38 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of
 .set_mbus_config()
Message-ID: <Yd1vhs+3F2ISkW9S@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
 <YdhDH/HmJ44B3Rxa@valkosipuli.retiisi.eu>
 <1808044.CQOukoFCf9@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1808044.CQOukoFCf9@dell>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1641901959; a=rsa-sha256;
        cv=none;
        b=Z0bFyWucmUdvBN39Sku994sVYuZ8i74GgfArqrc9Ipoj4AynBaE7l4TOJKvazWzJnSdJdL
        8AY1JY2BhnPypiPr0uKdPwUp+BKqdKioU0//Dky7SFphxS6yYVYeOFB+IjxuPXYRkjJZG8
        +6ZJx8gcXPEJhPyNopTr26qhhUQSh7gXCZDjnZUI7saBQy8f7XpxyjJS+LLgYE6CQxTPoh
        fvDJ8fzK3/GfwhDtt0TZoURyi6HY0OtlBKdrsamInbOpUkcVQmHiwU256aDuQvKXCRNzxA
        3VtxLKhslQqZ8rD7Zol0oHU8DcwSYdqusK9O+epMGLsPqh23hyOgcPtMUDUxoA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1641901959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2SirRMDX3hGebQVAnY8e3MT0zjnGkkczJi2lAJ1SLIE=;
        b=aktGZh9XuUb8olwHqHpW89dwGu56F1DNKk+gnmBrTFlHk27Fb81JKMWKVnnYSVRnHoVxow
        o56o2Lfxzdo2ztnXBXHdSKQCGhCnieDl+n5GasqGqfmFEVB8tCy4xJjoiMaemj1ltZA15U
        CoZjPInrVTaJfvMSMHGLr9NUyWurQsrSb1R0tlWO8hWCqo/kE4+0ha0ptj+00Z81Vy6Xep
        grDyqyg+zBMAafuTnHJVFn2hFXZUGU7hgOpc7mX9YdN4Vdv1VIvSc6tYI/jwfsKT/KmRm9
        /hbK/FCMGR0Yrikg3tDDSmyof6p43zeeP39u/DpNv80I+Q1qwpQshHhBMWvJ9Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Mon, Jan 10, 2022 at 07:11:45PM +0100, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Friday, 7 January 2022 14:41:51 CET Sakari Ailus wrote:
> > Hi Janusz,
> > 
> > On Wed, Jan 05, 2022 at 10:31:41PM +0100, Janusz Krzysztofik wrote:
> > > Hi Laurent,
> > > 
> > > On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > >
> > > > On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > > > > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > > > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > > > > kernel calls it, so drop its implementation from the ov6650 driver.
> > > > > >
> > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > > > > >  1 file changed, 37 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > > > > index f67412150b16..455a627e35a0 100644
> > > > > > --- a/drivers/media/i2c/ov6650.c
> > > > > > +++ b/drivers/media/i2c/ov6650.c
> > > > > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > > > > >   return 0;
> > > > > >  }
> > > > > >
> > > > > > -/* Alter bus settings on camera side */
> > > > > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > > > > -                           unsigned int pad,
> > > > > > -                           struct v4l2_mbus_config *cfg)
> > > > > > -{
> > > > > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > > > - int ret = 0;
> > > > > > -
> > > > > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > > > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> > > > >
> > > > > I think this configuration should come from the endpoint which the driver
> > > > > currently does not parse. In fact, there are no even DT bindings for the
> > > > > device.
> > > >
> > > > There's also no OF match table. While this isn't strictly required, it
> > > > may indicate that the sensor hasn't been tested much on DT-based
> > > > systems.
> > > >
> > > > I agree that the configuration should come from the device tree, but I
> > > > can't test that, so I'm tempted to let someone else implement it if the
> > > > driver is actually still in use (I can also write a patch if someone can
> > > > test it).
> > > 
> > > This driver was used with omap1_camera, removed from the tree a few years
> > > ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
> > > updated but I gave up due to lack of response to my submissions.  That also
> > > blocked my attempts to rework and reintroduce omap1_camera.
> > 
> > My apologies for this --- I indeed to see a set of unreviewed ov6650 patches
> > from you. Please do ping me if you expect an answer but do not get one.
> 
> OK, thanks.
> 
> > > I think I'm still able to update my local (v4l2, non-mc) version of
> > > omap1_camera to the extent required to test any changes to ov6650.
> > > However, the OMAP1 platform does not support DT, and will probably never
> > > do.  Then,  I think that it makes sense to spend my time on that only if
> > > you (media maintainers) are not going to depreciate non-DT support any
> > > soon.  Are you?
> > 
> > Commenting just this and not the discussion later in this thread --- it is
> > possible to support such sensor drivers without DT or ACPI nowadays,
> > through software nodes. See e.g. drivers/media/pci/intel/ipu3/cio2-bridge.c
> 
> Thanks for bringing this possibility to my awareness, I didn't know it 
> existed.  AFAICS, I2C sensor drivers like ov6650 can now be provided by 
> board files with device properties via i2c_board_info.swnode.

Looking at i2c_new_client_device(), it only takes a single software node.
For an endpoint at least three are required, meaning you'll need to do that
separately. At least that seems to be the case at the moment.

> 
> If I find a solution to implement a non-v4l2-clk clock device in 
> omap1_camera driver, I'll try to get back to updating ov6650 as time 
> permits.

Looking forward to that. Btw. I've taken the four patches you posted
earlier, rebased them a little and pushed them here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>

Let me know if they're (not) fine.

-- 
Kind regards,

Sakari Ailus
