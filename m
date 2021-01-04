Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69FD2E9F0C
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 21:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbhADUy1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 15:54:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35668 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADUy0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 15:54:26 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 01D381F44F7A
Message-ID: <9ee2560d0580ea636a08fae0a41c004473a617be.camel@collabora.com>
Subject: Re: [PATCH 0/6] Remove last users of v4l2-clk and remove v4l2-clk
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Daniel Mack <daniel@zonque.org>, kernel@collabora.com,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Petr Cvek <petrcvekcz@gmail.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Mon, 04 Jan 2021 17:51:55 -0300
In-Reply-To: <20210104165739.116404-1-ezequiel@collabora.com>
References: <20210104165739.116404-1-ezequiel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Robert's mailbox is bouncing, so let's add Daniel
and Haojian.

Could you guys review the PXA changes?

Thanks,
Ezequiel

On Mon, 2021-01-04 at 13:57 -0300, Ezequiel Garcia wrote:
> The V4L2 temporary clock helper API is used by just one last capture
> driver, pxa-camera, which registers a dummy clock; and then by just
> a few sensor drivers, consuming clocks through the v4l2-clk API.
> 
> It's possible to convert these few last users, and so remove
> the v4l2-clk API, which hasn't been used for a few years.
> 
> The sensor drivers are already using the CCF API,
> which v4l2-clk API uses as fallback.
> 
> To convert the pxa-camera driver, a fixed-rate clock
> is registered for the mach-based platforms that still exist,
> for mt9m111 to work (the only sensor that PXA currently
> registers).
> 
> Ezequiel Garcia (6):
>   media: mach-pxa: Register the camera sensor fixed-rate clock
>   media: pxa_camera: Drop the v4l2-clk clock register
>   media: ov9640: Use the generic clock framework
>   media: mt9m111: Use the generic clock framework
>   media: ov6650: Use the generic clock framework
>   media: Remove the legacy v4l2-clk API
> 
>  .../driver-api/media/v4l2-clocks.rst          |  31 --
>  Documentation/driver-api/media/v4l2-core.rst  |   1 -
>  arch/arm/mach-pxa/devices.c                   |   8 +
>  drivers/media/i2c/mt9m111.c                   |  17 +-
>  drivers/media/i2c/ov6650.c                    |  26 +-
>  drivers/media/i2c/ov9640.c                    |  15 +-
>  drivers/media/i2c/ov9640.h                    |   4 +-
>  drivers/media/platform/pxa_camera.c           |  30 +-
>  drivers/media/v4l2-core/Makefile              |   2 +-
>  drivers/media/v4l2-core/v4l2-clk.c            | 321 ------------------
>  include/media/v4l2-clk.h                      |  73 ----
>  11 files changed, 37 insertions(+), 491 deletions(-)
>  delete mode 100644 Documentation/driver-api/media/v4l2-clocks.rst
>  delete mode 100644 drivers/media/v4l2-core/v4l2-clk.c
>  delete mode 100644 include/media/v4l2-clk.h
> 
> -- 
> 2.29.2
> 
> 


