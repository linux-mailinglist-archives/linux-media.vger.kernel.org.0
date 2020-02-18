Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD683162C8F
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 18:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRRVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 12:21:23 -0500
Received: from retiisi.org.uk ([95.216.213.190]:53286 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726475AbgBRRVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 12:21:23 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CA1DB634C87;
        Tue, 18 Feb 2020 19:20:42 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j46Y7-0001Rc-Cm; Tue, 18 Feb 2020 19:20:43 +0200
Date:   Tue, 18 Feb 2020 19:20:43 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL for 5.6] Sensor, V4L2 fwnode and ImgU driver patches
Message-ID: <20200218172043.GA5023@valkosipuli.retiisi.org.uk>
References: <20200121164816.GW856@valkosipuli.retiisi.org.uk>
 <c71dc46b-920a-9095-88e7-21a2d5016a8a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c71dc46b-920a-9095-88e7-21a2d5016a8a@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Tue, Feb 18, 2020 at 02:18:47PM -0300, Helen Koike wrote:
> Hi,
> 
> On 1/21/20 2:48 PM, Sakari Ailus wrote:
> > Hi Mauro,
> > 
> > Here's a set that contains a driver for imx290 as well as fixes and
> > improvements for other sensors and ImgU.
> > 
> > This replaces my earlier pull request which I marked as superseded.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:
> > 
> >   media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-5.6-3.1-signed
> > 
> > for you to fetch changes up to de44ad35385894b1a2af5be57f48eadcae09e62c:
> > 
> >   media: staging/intel-ipu3: remove TODO item about acronyms (2020-01-21 18:06:12 +0200)
> > 
> > ----------------------------------------------------------------
> > Sensor, fwnode and ImgU patches for 5.6
> > 
> > ----------------------------------------------------------------
> > Andrey Konovalov (1):
> >       dt-bindings: media: i2c: Add IMX219 CMOS sensor binding
> > 
> > Bingbu Cao (3):
> >       Revert "media: staging/intel-ipu3: make imgu use fixed running mode"
> >       media: ipu3.rst: add imgu pipe config tool link
> >       media: staging/intel-ipu3: remove TODO item about acronyms
> > 
> > Dave Stevenson (1):
> >       media: i2c: Add driver for Sony IMX219 sensor
> > 
> > Julia Lawall (1):
> >       media: mt9v111: constify copied structure
> > 
> > Sakari Ailus (1):
> >       v4l2-fwnode: Print the node name while parsing endpoints
> > 
> > Shawn Tu (1):
> >       ov5675: add vflip/hflip control support
> > 
> >  .../devicetree/bindings/media/i2c/imx219.yaml      |  114 ++
> >  Documentation/media/v4l-drivers/ipu3.rst           |   17 +-
> >  MAINTAINERS                                        |    8 +
> >  drivers/media/i2c/Kconfig                          |   11 +
> >  drivers/media/i2c/Makefile                         |    1 +
> >  drivers/media/i2c/imx219.c                         | 1312 ++++++++++++++++++++
> >  drivers/media/i2c/mt9v111.c                        |    2 +-
> >  drivers/media/i2c/ov5675.c                         |   82 +-
> >  drivers/media/v4l2-core/v4l2-fwnode.c              |    6 +-
> >  drivers/staging/media/ipu3/TODO                    |    5 -
> >  drivers/staging/media/ipu3/include/intel-ipu3.h    |    4 +
> >  drivers/staging/media/ipu3/ipu3-v4l2.c             |   74 +-
> >  drivers/staging/media/ipu3/ipu3.h                  |    5 +-
> >  13 files changed, 1607 insertions(+), 34 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx219.yaml
> >  create mode 100644 drivers/media/i2c/imx219.c
> > 
> 
> Unless I saw something wrong, this PR didn't reach 5.6.
> I was wondering if anything happen, I don't see any particular error in the tests.

Not all the patches in it made it to 5.6, no. I'll send soonish another one
that contains the rest, among other new patches.

-- 
Kind regards,

Sakari Ailus
