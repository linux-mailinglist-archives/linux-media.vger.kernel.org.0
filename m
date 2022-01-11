Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3BF48B8B9
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 21:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243820AbiAKUhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 15:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiAKUhK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 15:37:10 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583ECC06173F;
        Tue, 11 Jan 2022 12:37:10 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id br17so820030lfb.6;
        Tue, 11 Jan 2022 12:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQDameqITU1NojR7HvknVY2IQ36ItvkGUfxcogAKzgo=;
        b=HI/ZMy4fGfeiE8fpirPiZx960CweGnA2lPkrcWv+I061XY7LPXy4Z4u4TaXwJ8eGNM
         juohAD87i6Z/4l8CzRu8LVUUXbP+udrLNeaANXETUuEc2tMhRDPEIh+woCcm7rOrp0Nb
         qi0NEvxwA9b0MLpWkO5oAI5c87dVGoYAb3Oimp8RVKvKmz1jEHWmr9LjKS6IpzcLlgIh
         kA6pyvlG+QzfPoENGKXq+LQaOS1Q0Rq7oKOIK/MXWFTbtsg9SCMGvnQUmF262Gh05yKC
         EfH8yUf347r0xIlGR/yBJZWr5a3iGGov7Kwm6oatCd8gdXgGUnGY9yRN/0BqyjRS2cIN
         ePiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQDameqITU1NojR7HvknVY2IQ36ItvkGUfxcogAKzgo=;
        b=zDnazc9gOZoIx2mGpGyVu6r5rqCEtcBaKfc8JnmKMrCwUyBgF6w4N3F/IZV49q2lEh
         Q/eMlqmBkhcUCcgAGoCyB06vlsa0Ts9OmHaveEJcm5OgUYmY9u8v0o8uL/DlQYkg3WYN
         58JEREVKzq7G20QBuJIi++xurNeakE8aN1m0U5wwkzHNLWDqswX/SjmVYg5lqetP203c
         R4nUGd38MK4q/7bF3sQyo/kS7eKTCkLMbL1R3ArHB0vMCJp6r0Heob9s9wkXZ+Yj4S8P
         aB5BwhKUCJnvIf27mmHXnTN33+PpJWXFDN6lyHFSZAHnkR2goMzXwN8s2RkWFBfEo9C7
         WRSQ==
X-Gm-Message-State: AOAM5333zz6jOON7rPkP909Nrx9exkbFlMH3tRtAaTAjkSf8hWXp+vjH
        V1kTfeogRRsaKPAoOD8RGP4=
X-Google-Smtp-Source: ABdhPJzcc5xBDRuDlV1jTOEXPFMYCtnn7xBlwNB/0/n8RaIUYL+VDFmfvWgaYbfXpSZmjttO0f1wzw==
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr4119768lfp.49.1641933428702;
        Tue, 11 Jan 2022 12:37:08 -0800 (PST)
Received: from dell.intranet (178235254230.gdansk.vectranet.pl. [178.235.254.230])
        by smtp.gmail.com with ESMTPSA id b23sm1122987lfv.84.2022.01.11.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:37:08 -0800 (PST)
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
Date:   Tue, 11 Jan 2022 21:37:06 +0100
Message-ID: <3111564.aV6nBDHxoP@dell>
In-Reply-To: <Yd1vhs+3F2ISkW9S@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com> <1808044.CQOukoFCf9@dell> <Yd1vhs+3F2ISkW9S@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tuesday, 11 January 2022 12:52:38 CET Sakari Ailus wrote:
> Hi Janusz,
> 
> On Mon, Jan 10, 2022 at 07:11:45PM +0100, Janusz Krzysztofik wrote:
> > Hi Sakari,
> > 
> > On Friday, 7 January 2022 14:41:51 CET Sakari Ailus wrote:
> > > Hi Janusz,
> > > 
> > > On Wed, Jan 05, 2022 at 10:31:41PM +0100, Janusz Krzysztofik wrote:
> > > > Hi Laurent,
> > > > 
> > > > On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > > > > > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > > > > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > > > > > kernel calls it, so drop its implementation from the ov6650 driver.
> > > > > > >
> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > > > > > >  1 file changed, 37 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > > > > > index f67412150b16..455a627e35a0 100644
> > > > > > > --- a/drivers/media/i2c/ov6650.c
> > > > > > > +++ b/drivers/media/i2c/ov6650.c
> > > > > > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > > > > > >   return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > -/* Alter bus settings on camera side */
> > > > > > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > > > > > -                           unsigned int pad,
> > > > > > > -                           struct v4l2_mbus_config *cfg)
> > > > > > > -{
> > > > > > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > > > > - int ret = 0;
> > > > > > > -
> > > > > > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > > > > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > > > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> > > > > >
> > > > > > I think this configuration should come from the endpoint which the driver
> > > > > > currently does not parse. In fact, there are no even DT bindings for the
> > > > > > device.
> > > > >
> > > > > There's also no OF match table. While this isn't strictly required, it
> > > > > may indicate that the sensor hasn't been tested much on DT-based
> > > > > systems.
> > > > >
> > > > > I agree that the configuration should come from the device tree, but I
> > > > > can't test that, so I'm tempted to let someone else implement it if the
> > > > > driver is actually still in use (I can also write a patch if someone can
> > > > > test it).
> > > > 
> > > > This driver was used with omap1_camera, removed from the tree a few years
> > > > ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
> > > > updated but I gave up due to lack of response to my submissions.  That also
> > > > blocked my attempts to rework and reintroduce omap1_camera.
> > > 
> > > My apologies for this --- I indeed to see a set of unreviewed ov6650 patches
> > > from you. Please do ping me if you expect an answer but do not get one.
> > 
> > OK, thanks.
> > 
> > > > I think I'm still able to update my local (v4l2, non-mc) version of
> > > > omap1_camera to the extent required to test any changes to ov6650.
> > > > However, the OMAP1 platform does not support DT, and will probably never
> > > > do.  Then,  I think that it makes sense to spend my time on that only if
> > > > you (media maintainers) are not going to depreciate non-DT support any
> > > > soon.  Are you?
> > > 
> > > Commenting just this and not the discussion later in this thread --- it is
> > > possible to support such sensor drivers without DT or ACPI nowadays,
> > > through software nodes. See e.g. drivers/media/pci/intel/ipu3/cio2-bridge.c
> > 
> > Thanks for bringing this possibility to my awareness, I didn't know it 
> > existed.  AFAICS, I2C sensor drivers like ov6650 can now be provided by 
> > board files with device properties via i2c_board_info.swnode.
> 
> Looking at i2c_new_client_device(), it only takes a single software node.
> For an endpoint at least three are required, meaning you'll need to do that
> separately. At least that seems to be the case at the moment.

Thanks, I'll take a closer look.

> > 
> > If I find a solution to implement a non-v4l2-clk clock device in 
> > omap1_camera driver, I'll try to get back to updating ov6650 as time 
> > permits.
> 
> Looking forward to that. Btw. I've taken the four patches you posted
> earlier, rebased them a little and pushed them here:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>
> 
> Let me know if they're (not) fine.

Should be fine, thank you.

Janusz

> 
> 




