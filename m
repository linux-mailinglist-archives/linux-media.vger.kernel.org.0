Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B893C5FFDFA
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 09:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJPHeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 03:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiJPHeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 03:34:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1410CBC8A
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 00:34:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id u21so12078433edi.9
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ol23f0mTip3eN5UsZYfUoAc5S9yMrd+dnrxtsXL66bM=;
        b=anmOiWsylxu+yhtRSqHjuaxWUv+DLObv6uilibAG+C9qr6NHX0vOPsIvZWPUgpc10q
         Mn4BNayZfmm2fqdKEg8TvOfjw3jRzVHi+b8MZJgTjWmZsm1lJE/GhzgGtNVR25MG7j7N
         dwqHN+XupPnJhC+Elj45Ij+gGSZTpMtIvVnEP4VPZx3rEsu9H7C7aquG27eLafRaso/d
         g0Gtz6Q/im4v0aSIDMY4q8DRL4w0lrzt521RchYlT+DIF07M3HkU61eA0BM2l7/c+SjE
         x7eumnEJ2mswoiA24qkbmTzGR2Rjmz1zZusUtoINs+CBtAa8gm8dX+/7Oxl8aoOqNsJW
         isDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol23f0mTip3eN5UsZYfUoAc5S9yMrd+dnrxtsXL66bM=;
        b=YNb+A9/HRxiqRcr51l7stlhNNAJoiqzmBxllj51JuhjOPnoxnaIe2nzULfHWCSundt
         blrtrilUso7Pb1jyrPk/kOp+HteXxVAtpLJAFXHsNKoV+nVGFNI36r1qwaIumR0YdPQk
         UDABBNyoUuE9j+wts3aCC0LsodChEkVVw4dSrtOemeEjLXoOVu3NsdaiejR2B5RqjN5s
         r869GGsd2vOOlJ/KOyQ+GXt3Ph4C+shhuYDGQNCF9t3vsBPxuFnkTZdACf5iXvSWkgsl
         ZcN+bT/5K+Pa2kH9PpyJCc6OYOwGT88jjY8cnURUWnxaEjX4O8+Gi+kyA/IZFXxIXthL
         KU3A==
X-Gm-Message-State: ACrzQf0o9/gJ047rmjKPsXzSHaizJOFy4cXwg3033fS1wPA4abpc7h1S
        fO4a46MkbodxLH1quoH6BXEYGiptWh8DtCy+TxdIH0lT92I=
X-Google-Smtp-Source: AMsMyM7EUV54esUxoDwo/zKoibopB+oI4dO1CrZVSuzf00cBChJvsTPBRwAigj2DaL3kCuhot7KLSP2SrkHpud0i+Qs=
X-Received: by 2002:a05:6402:c4d:b0:457:99ec:1837 with SMTP id
 cs13-20020a0564020c4d00b0045799ec1837mr5078636edb.86.1665905670614; Sun, 16
 Oct 2022 00:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
 <YwQpT5JpyfXBEIVE@pendragon.ideasonboard.com> <CAPY8ntAsJNOAJ2te2vQSK6AeXj8LyB6Krepc88FL=6U6O9zb2g@mail.gmail.com>
 <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
In-Reply-To: <Y0uYhiny89r9J8//@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Sun, 16 Oct 2022 08:34:15 +0100
Message-ID: <CAPY8ntDJ0-hLSHWtX5+bHaDR9quu=usP1+gaHFcZupAHtQYAFg@mail.gmail.com>
Subject: Re: [PATCH 00/19] media: i2c: imx290: Miscellaneous improvements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sun, 16 Oct 2022 at 06:37, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Mon, Oct 10, 2022 at 11:31:33AM +0100, Dave Stevenson wrote:
> > Hi Laurent
> >
> > Do you have plans for a v2 on this patch set? I also have a number of
> > patches for imx290 and there's little point in causing grief to each
> > other with conflicts.
> > Or I could take the non-controversial patches from your set and send a
> > combined patch set?
>
> I'm working on a v2, I'll send it shortly. Do I assume correctly you'll
> submit IMX327 support on top ? :-)

Thanks - I'll review it tomorrow and sort my patches on top again.

This driver is effectively IMX327 - max 1920x1080@60fps in 12 bit.

IMX290 adds a 1920x1080@120fps 10bit only mode which isn't currently
supported by the driver. I have patches to add 10bit support, but I
don't increase the frame rate in them.

IMX462 adds that 1920x1080@120fps mode in both 10 and 12 bit, but
again I haven't looked at adding support, partly as I don't have a
datasheet for that variant. I may see if the change for 120fps 10bit
on imx290 works in 12 bit mode for IMX462.
For IMX290, 1080p120 needs a link frequency of 445.5MHz on 4 lanes to
be supported (2 lanes not permitted), so there will be more link
frequency messing required to support it. The basic numbers say that
is fast enough for 12bit as well, so there's hope.

  Dave

> > On Tue, 23 Aug 2022 at 02:12, Laurent Pinchart wrote:
> > >
> > > Hi Sakari,
> > >
> > > Could you already pick up patches 01/19, 02/19, 04/19, 05/19 and 06/19
> > > in your tree ? Your opinion on 03/19 woud be appreciated too, I think
> > > it's a candidate for merge as well.
> > >
> > > On Thu, Jul 21, 2022 at 11:35:21AM +0300, Laurent Pinchart wrote:
> > > > Hello,
> > > >
> > > > This patch series gathers miscellaneous improvements for the imx290
> > > > driver. The most notable changes on the kernel side is patch 07/19 that
> > > > simplifies register access, and on the userspace API side patches 14/19,
> > > > 15/19 and 18/19 that extend the driver with controls and selection
> > > > rectangles required by libcamera.
> > > >
> > > > Laurent Pinchart (19):
> > > >   media: i2c: imx290: Use device lock for the control handler
> > > >   media: i2c: imx290: Print error code when I2C transfer fails
> > > >   media: i2c: imx290: Specify HMAX values in decimal
> > > >   media: i2c: imx290: Replace macro with explicit ARRAY_SIZE()
> > > >   media: i2c: imx290: Drop imx290_write_buffered_reg()
> > > >   media: i2c: imx290: Drop regmap cache
> > > >   media: i2c: imx290: Support variable-sized registers
> > > >   media: i2c: imx290: Correct register sizes
> > > >   media: i2c: imx290: Simplify error handling when writing registers
> > > >   media: i2c: imx290: Define more register macros
> > > >   media: i2c: imx290: Add exposure time control
> > > >   media: i2c: imx290: Fix max gain value
> > > >   media: i2c: imx290: Split control initialization to separate function
> > > >   media: i2c: imx290: Implement HBLANK and VBLANK controls
> > > >   media: i2c: imx290: Create controls for fwnode properties
> > > >   media: i2c: imx290: Move registers with fixed value to init array
> > > >   media: i2c: imx290: Factor out format retrieval to separate function
> > > >   media: i2c: imx290: Add crop selection targets support
> > > >   media: i2c: imx290: Replace GAIN control with ANALOGUE_GAIN
> > > >
> > > >  drivers/media/i2c/imx290.c | 781 ++++++++++++++++++++++---------------
> > > >  1 file changed, 458 insertions(+), 323 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
