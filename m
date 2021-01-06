Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545F52EBF8D
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbhAFOZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 09:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbhAFOZh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:25:37 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4996C06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:24:56 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 61BBF1F45F29
Message-ID: <3bec40b9d5b9af50c069357cc41ad0a401e5615a.camel@collabora.com>
Subject: Re: [PATCH 0/6] Remove last users of v4l2-clk and remove v4l2-clk
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Petr Cvek <petrcvekcz@gmail.com>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 06 Jan 2021 11:24:47 -0300
In-Reply-To: <59dcd2fd-79db-fdd1-820b-5d3c5ea6446a@gmail.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
         <59dcd2fd-79db-fdd1-820b-5d3c5ea6446a@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petr,

On Tue, 2021-01-05 at 17:08 +0100, Petr Cvek wrote:
> I don't have a working magician setup at the moment, so I can only test the compilation (which works).
> 

Thanks for the testing! Does that mean I can take your Tested-by ?

> Petr
> 
> Dne 04. 01. 21 v 17:57 Ezequiel Garcia napsal(a):
> > The V4L2 temporary clock helper API is used by just one last capture
> > driver, pxa-camera, which registers a dummy clock; and then by just
> > a few sensor drivers, consuming clocks through the v4l2-clk API.
> > 
> > It's possible to convert these few last users, and so remove
> > the v4l2-clk API, which hasn't been used for a few years.
> > 
> > The sensor drivers are already using the CCF API,
> > which v4l2-clk API uses as fallback.
> > 
> > To convert the pxa-camera driver, a fixed-rate clock
> > is registered for the mach-based platforms that still exist,
> > for mt9m111 to work (the only sensor that PXA currently
> > registers).
> > 
> > Ezequiel Garcia (6):
> >   media: mach-pxa: Register the camera sensor fixed-rate clock
> >   media: pxa_camera: Drop the v4l2-clk clock register
> >   media: ov9640: Use the generic clock framework
> >   media: mt9m111: Use the generic clock framework
> >   media: ov6650: Use the generic clock framework
> >   media: Remove the legacy v4l2-clk API
> > 
> >  .../driver-api/media/v4l2-clocks.rst          |  31 --
> >  Documentation/driver-api/media/v4l2-core.rst  |   1 -
> >  arch/arm/mach-pxa/devices.c                   |   8 +
> >  drivers/media/i2c/mt9m111.c                   |  17 +-
> >  drivers/media/i2c/ov6650.c                    |  26 +-
> >  drivers/media/i2c/ov9640.c                    |  15 +-
> >  drivers/media/i2c/ov9640.h                    |   4 +-
> >  drivers/media/platform/pxa_camera.c           |  30 +-
> >  drivers/media/v4l2-core/Makefile              |   2 +-
> >  drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
> >  include/media/v4l2-clk.h                      |  73 ----
> >  11 files changed, 37 insertions(+), 491 deletions(-)
> >  delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
> >  delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
> >  delete mode 100644 include/media/v4l2-clk.h
> > 


