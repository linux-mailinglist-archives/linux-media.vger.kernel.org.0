Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3D41162C7B
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 18:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRRSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 12:18:54 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54792 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgBRRSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 12:18:54 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B340A294372
Subject: Re: [GIT PULL for 5.6] Sensor, V4L2 fwnode and ImgU driver patches
To:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200121164816.GW856@valkosipuli.retiisi.org.uk>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c71dc46b-920a-9095-88e7-21a2d5016a8a@collabora.com>
Date:   Tue, 18 Feb 2020 14:18:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200121164816.GW856@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/21/20 2:48 PM, Sakari Ailus wrote:
> Hi Mauro,
> 
> Here's a set that contains a driver for imx290 as well as fixes and
> improvements for other sensors and ImgU.
> 
> This replaces my earlier pull request which I marked as superseded.
> 
> Please pull.
> 
> 
> The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:
> 
>   media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-5.6-3.1-signed
> 
> for you to fetch changes up to de44ad35385894b1a2af5be57f48eadcae09e62c:
> 
>   media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-21 18:06:12 +0200)
> 
> ----------------------------------------------------------------
> Sensor, fwnode and ImgU patches for 5.6
> 
> ----------------------------------------------------------------
> Andrey Konovalov (1):
>       dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
> 
> Bingbu Cao (3):
>       Revert "media: staging/intel-ipu3: make imgu use fixed running mode"
>       media: ipu3.rst: add imgu pipe config tool link
>       media: staging/intel-ipu3: remove TODO item about acronyms
> 
> Dave Stevenson (1):
>       media: i2c: Add driver for Sony IMX219 sensor
> 
> Julia Lawall (1):
>       media: mt9v111: constify copied structure
> 
> Sakari Ailus (1):
>       v4l2-fwnode: Print the node name while parsing endpoints
> 
> Shawn Tu (1):
>       ov5675: add vflip/hflip control support
> 
>  .../devicetree/bindings/media/i2c/imx219.yaml      |  114 ++
>  Documentation/media/v4l-drivers/ipu3.rst           |   17 +-
>  MAINTAINERS                                        |    8 +
>  drivers/media/i2c/Kconfig                          |   11 +
>  drivers/media/i2c/Makefile                         |    1 +
>  drivers/media/i2c/imx219.c                         | 1312 ++++++++++++++++++++
>  drivers/media/i2c/mt9v111.c                        |    2 +-
>  drivers/media/i2c/ov5675.c                         |   82 +-
>  drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
>  drivers/staging/media/ipu3/TODO                    |    5 -
>  drivers/staging/media/ipu3/include/intel-ipu3.h    |    4 +
>  drivers/staging/media/ipu3/ipu3-v4l2.c             |   74 +-
>  drivers/staging/media/ipu3/ipu3.h                  |    5 +-
>  13 files changed, 1607 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
>  create mode 100644 drivers/media/i2c/imx219.c
> 

Unless I saw something wrong, this PR didn't reach 5.6.
I was wondering if anything happen, I don't see any particular error in the tests.

Thanks
Helen
