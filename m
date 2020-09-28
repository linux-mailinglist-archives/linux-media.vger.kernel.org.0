Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502EE27AF71
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgI1NyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 09:54:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43582 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI1NyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 09:54:23 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 878CAA58;
        Mon, 28 Sep 2020 15:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601301259;
        bh=bZAKoiRdZrRlK46EOfYvhtKpqNBeK3DGkw60PEaufYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tvhdx5qGzHaMoaX4EbxVwKrMcaLKAZRTOYwauOrMO1r9e89fHZ1jCxV4QFOLFSVVe
         Tz4j6eHFHh89mrED2ygHhSCczoQGpiBnr06jYWvjflbelTogGY2QyTZmbkw5PztTtU
         ugYwLJfF2XSPRoF4kutQynOWShyTSXDCbgazf92I=
Date:   Mon, 28 Sep 2020 16:53:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFT/RFC v2 00/47] staging: media: bring back zoran driver
Message-ID: <20200928135344.GD23539@pendragon.ideasonboard.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
 <34662073-bbf3-8eaf-47b4-c715337f4021@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34662073-bbf3-8eaf-47b4-c715337f4021@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Sep 28, 2020 at 03:45:03PM +0200, Hans Verkuil wrote:
> On 25/09/2020 20:30, Corentin Labbe wrote:
> > Hello
> > 
> > The zoran driver was removed in 5.3
> > The main reason of the removing was lack of motivation to convert it to
> > VB2
> > Since I need it, I worked on bringing it back.
> > 
> > So the plan to achieve it was:
> > - clean up the coding style.
> > - convert old usage/API
> > - clean unused code
> > - convert to VB2
> > 
> > I have tried to split a bit the VB2 patch (by adding/removing code in
> > another patch), but the result is unfortunately still a big patch.
> > 
> > The result of this serie is a working zoran driver.
> > Furthermore it is now compliant to v4l-compliance.
> > 
> > In the process some old (useless) feature (fbuf, overlay) was removed
> > for simplifying maintenance.
> > 
> > The zoran hardware support MJPEG decompression, but this feature is
> > temporarily disabled by this serie.
> > But basically, this feature was unusable, since the only tool which
> > permitted to use it was a mplayer option.
> > But this mplayer option no longer compile (probably since a long time)
> > and is such a hack (a copy of some private ffmpeg structure) that it is
> > unfixable.
> > Happily, when I started to work on zoran, a patch was posted on ffmpeg
> > ML which permit it to output non-raw video stream (and so MJPEG for
> > zoran case).
> > But the zoran hw does not like some part of JPEG header it receives, so
> > a filter need to be written.
> > Anyway, this disabling is not a regression, since this feature was not
> > usable since a long time.
> > 
> > Since the driver was in staging, I targeted staging, but probably the
> > driver is in a sufficient good shape to target media and bypass staging.
> > 
> > This driver is tested on a DC10+ (on x86). Tests on different hardware
> > are welcome.
> > 
> > I would like to thanks all people that helped me to achieve this (mostly
> > #v4l)
> > 
> > Regards
> > 
> > PS: this serie is resent a bit soon since linux-media didnt get some patch
> > and cover letter
> 
> Thank you very much for your hard work!
> 
> I've just posted a PR for this driver since it is in good enough shape to
> resurrect in staging.
> 
> This means that starting with 5.10 this driver will once again be available.
> 
> There are some things that I would like to see fixed before moving it out
> of staging:
> 
> 1) Check the driver with checkpatch --strict: I noticed various warnings
> that would be good to fix. Let's have this cleaned up before moving it
> out of staging.
> 
> 2) I would like to see the output support fixed.

As lots of time has elapsed since the very first driver for this card
was merged, and the (Linux) world has changed quite a bit since then,
would it make sense to expose this feature through DRM/KMS instead ?

> 3) I want to test with my zoran hardware before moving it out of staging.
> That said, it will be a few months before I can do that since I don't
> have access to the HW at the moment. It depends on when I travel to the
> Netherlands, and with the COVID-19 situation I have no idea when that
> will be. I hope December, but there is no guarantee.
> 
> Since 3) will take 1-2 kernel cycles anyway, that will hopefully allow
> for enough time to tackle 1 and 2 while it is still in staging.
> 
> > Changes since RFC1
> > - removed fallthough patch
> > - removed unsplit lines patch
> > - fixed line size in "Use DMA coherent for stat_com" patch
> > 
> > Corentin Labbe (47):
> >   staging: media: Revert "media: zoran: remove deprecated driver"
> >   MAINTAINERS: change maintainer of the zoran driver
> >   staging: media: zoran: datasheet is no longer available from zoran.com
> >   staging: media: zoran: Documentation: fix typo
> >   staging: media: zoran: fix checkpatch issue
> >   staging: media: zoran: do not forward declare zr36057_init_vfe
> >   staging: media: zoran: convert all error dprintk to pci_err/pr_err
> >   staging: media: zoran: convert dprintk warn
> >   staging: media: zoran: convert dprintk info to pci_info
> >   staging: media: zoran: convert dprintk debug
> >   staging: media: zoran: zoran_device.c: convert pr_x to pci_x
> >   staging: media: zoran: remove proc_fs
> >   staging: media: zoran: use VFL_TYPE_VIDEO
> >   staging: media: zoran: use v4l2_buffer_set_timestamp
> >   staging: media: zoran: do not print random guest 0
> >   staging: media: zoran: move buffer_size out of zoran_fh
> >   staging: media: zoran: move v4l_settings out of zoran_fh
> >   staging: media: zoran: move jpg_settings out of zoran_fh
> >   staging: media: zoran: move overlay_settings out of zoran_fh
> >   staging: media: zoran: Use video_drvdata to get struct zoran
> >   staging: media: zoran: Change zoran_v4l_set_format parameter from
> >     zoran_fh to zoran
> >   staging: media: zoran: remove overlay
> >   staging: media: zoran: Use DMA coherent for stat_com
> >   staging: media: zoran: use ZR_NORM
> >   staging: media: zoran: zoran does not support STD_ALL
> >   staging: media: zoran: convert irq to pci irq
> >   staging: media: zoran: convert zoran alloc to devm
> >   staging: media: zoran: convert mdelay to udelay
> >   staging: media: zoran: use devm for videocodec_master alloc
> >   staging: media: zoran: use pci_request_regions
> >   staging: media: zoran: use devm_ioremap
> >   staging: media: zoran: add stat_com buffer
> >   staging: media: zoran: constify struct tvnorm
> >   staging: media: zoran: constify codec_name
> >   staging: media: zoran: Add more check for compliance
> >   staging: media: zoran: Add vb_queue
> >   staging: media: zoran: disable output
> >   staging: media: zoran: device support only 32bit DMA address
> >   staging: media: zoran: enable makefile
> >   staging: media: zoran: remove framebuffer support
> >   staging: media: zoran: add vidioc_g_parm
> >   staging: media: zoran: remove test_interrupts
> >   staging: media: zoran: fix use of buffer_size and sizeimage
> >   staging: media: zoran: fix some compliance test
> >   staging: media: zoran: remove deprecated .vidioc_g_jpegcomp
> >   staging: media: zoran: convert to vb2
> >   staging: media: zoran: update TODO
> > 
> >  Documentation/media/v4l-drivers/zoran.rst  |  575 +++++++++
> >  MAINTAINERS                                |   10 +
> >  drivers/staging/media/Kconfig              |    2 +
> >  drivers/staging/media/Makefile             |    1 +
> >  drivers/staging/media/zoran/Kconfig        |   76 ++
> >  drivers/staging/media/zoran/Makefile       |    7 +
> >  drivers/staging/media/zoran/TODO           |   19 +
> >  drivers/staging/media/zoran/videocodec.c   |  330 +++++
> >  drivers/staging/media/zoran/videocodec.h   |  308 +++++
> >  drivers/staging/media/zoran/zoran.h        |  320 +++++
> >  drivers/staging/media/zoran/zoran_card.c   | 1333 ++++++++++++++++++++
> >  drivers/staging/media/zoran/zoran_card.h   |   30 +
> >  drivers/staging/media/zoran/zoran_device.c | 1013 +++++++++++++++
> >  drivers/staging/media/zoran/zoran_device.h |   64 +
> >  drivers/staging/media/zoran/zoran_driver.c | 1038 +++++++++++++++
> >  drivers/staging/media/zoran/zr36016.c      |  433 +++++++
> >  drivers/staging/media/zoran/zr36016.h      |   92 ++
> >  drivers/staging/media/zoran/zr36050.c      |  842 +++++++++++++
> >  drivers/staging/media/zoran/zr36050.h      |  163 +++
> >  drivers/staging/media/zoran/zr36057.h      |  154 +++
> >  drivers/staging/media/zoran/zr36060.c      |  872 +++++++++++++
> >  drivers/staging/media/zoran/zr36060.h      |  201 +++
> >  22 files changed, 7883 insertions(+)
> >  create mode 100644 Documentation/media/v4l-drivers/zoran.rst
> >  create mode 100644 drivers/staging/media/zoran/Kconfig
> >  create mode 100644 drivers/staging/media/zoran/Makefile
> >  create mode 100644 drivers/staging/media/zoran/TODO
> >  create mode 100644 drivers/staging/media/zoran/videocodec.c
> >  create mode 100644 drivers/staging/media/zoran/videocodec.h
> >  create mode 100644 drivers/staging/media/zoran/zoran.h
> >  create mode 100644 drivers/staging/media/zoran/zoran_card.c
> >  create mode 100644 drivers/staging/media/zoran/zoran_card.h
> >  create mode 100644 drivers/staging/media/zoran/zoran_device.c
> >  create mode 100644 drivers/staging/media/zoran/zoran_device.h
> >  create mode 100644 drivers/staging/media/zoran/zoran_driver.c
> >  create mode 100644 drivers/staging/media/zoran/zr36016.c
> >  create mode 100644 drivers/staging/media/zoran/zr36016.h
> >  create mode 100644 drivers/staging/media/zoran/zr36050.c
> >  create mode 100644 drivers/staging/media/zoran/zr36050.h
> >  create mode 100644 drivers/staging/media/zoran/zr36057.h
> >  create mode 100644 drivers/staging/media/zoran/zr36060.c
> >  create mode 100644 drivers/staging/media/zoran/zr36060.h

-- 
Regards,

Laurent Pinchart
