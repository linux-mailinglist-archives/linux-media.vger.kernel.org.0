Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACBF27AF51
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 15:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgI1NpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 09:45:11 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:57097 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726409AbgI1NpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 09:45:10 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MtShk6Xmzv4gEMtSkkRD0r; Mon, 28 Sep 2020 15:45:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601300707; bh=OB302w6vKZ6uavQCRPx5TLqqDKXunsgCubaCk5DARMc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GvwADxaTQQS8XWJkY6WdtdhNEGCch26vkfAjwlk4IP5ZwJk+qaCmz0bGEOc9vTrds
         WTQ8xUcoOdgMCrHkefsgJjC1jldYBJTgZrKLFVeL4sVRaOvcj1xqTvOFjxqIP5YsHZ
         4ZrTdP7bphTBckjm0oRV45rWTDAFvr3h/BV2lHBQQ/3K+lTB3bpHR2s9N/l51HbGfK
         Q7nxOpLW75o70LyG0ARhh+gKgGZzh0G9xKIXAUM0DP/JqmDqIPHHdMl5SYxyY6xwqM
         dlIe/fFDECEkXiI2/hqk6ShpkHB6IoL0hzhbYUGUOaUl6y2mxIhOQ2wPTBeVirU2gE
         ZuqkIfycj6QiQ==
Subject: Re: [PATCH RFT/RFC v2 00/47] staging: media: bring back zoran driver
To:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <34662073-bbf3-8eaf-47b4-c715337f4021@xs4all.nl>
Date:   Mon, 28 Sep 2020 15:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA6RDnaLaKpGkN7m8rTw8J0KzeWjvXoSwvOQK3i2MH+XrtEuZAtQ+mzbE/4D9ANG2OhB2flSOncYRmhhsllyPM5NaBriVjbKCnaQZC8puh+9yTwHmxVI
 oRcVZnWPctqZMin0/UH1akXW+NYB+uI50P0cZo2i9wZIedV0bO8f+J52Q1parA2wmu2kWwRPVoa/qqmVS8RIRIful18uUPZSYtguY+PI9AELH+ERRz0A/1Ac
 wN0E53GWb0rSdh0YeFAy9PVmnNwAXpCG33cIrldsR5Jen4mdAKaJdz3beY8SV261FkrLmh38VIql09gIp+D/V5gGuayxEBOSmozjhPWT2mqEr8AvtseM/9Xp
 GSAOcOl2dvk5ZvTGCC8rsSVuxGs/voxL7zDccuDqM7TJSpEuTN6MZ3RNwLuXCsbY7S87T3zX
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Corentin,

On 25/09/2020 20:30, Corentin Labbe wrote:
> Hello
> 
> The zoran driver was removed in 5.3
> The main reason of the removing was lack of motivation to convert it to
> VB2
> Since I need it, I worked on bringing it back.
> 
> So the plan to achieve it was:
> - clean up the coding style.
> - convert old usage/API
> - clean unused code
> - convert to VB2
> 
> I have tried to split a bit the VB2 patch (by adding/removing code in
> another patch), but the result is unfortunately still a big patch.
> 
> The result of this serie is a working zoran driver.
> Furthermore it is now compliant to v4l-compliance.
> 
> In the process some old (useless) feature (fbuf, overlay) was removed
> for simplifying maintenance.
> 
> The zoran hardware support MJPEG decompression, but this feature is
> temporarily disabled by this serie.
> But basically, this feature was unusable, since the only tool which
> permitted to use it was a mplayer option.
> But this mplayer option no longer compile (probably since a long time)
> and is such a hack (a copy of some private ffmpeg structure) that it is
> unfixable.
> Happily, when I started to work on zoran, a patch was posted on ffmpeg
> ML which permit it to output non-raw video stream (and so MJPEG for
> zoran case).
> But the zoran hw does not like some part of JPEG header it receives, so
> a filter need to be written.
> Anyway, this disabling is not a regression, since this feature was not
> usable since a long time.
> 
> Since the driver was in staging, I targeted staging, but probably the
> driver is in a sufficient good shape to target media and bypass staging.
> 
> This driver is tested on a DC10+ (on x86). Tests on different hardware
> are welcome.
> 
> I would like to thanks all people that helped me to achieve this (mostly
> #v4l)
> 
> Regards
> 
> PS: this serie is resent a bit soon since linux-media didnt get some patch
> and cover letter

Thank you very much for your hard work!

I've just posted a PR for this driver since it is in good enough shape to
resurrect in staging.

This means that starting with 5.10 this driver will once again be available.

There are some things that I would like to see fixed before moving it out
of staging:

1) Check the driver with checkpatch --strict: I noticed various warnings
that would be good to fix. Let's have this cleaned up before moving it
out of staging.

2) I would like to see the output support fixed.

3) I want to test with my zoran hardware before moving it out of staging.
That said, it will be a few months before I can do that since I don't
have access to the HW at the moment. It depends on when I travel to the
Netherlands, and with the COVID-19 situation I have no idea when that
will be. I hope December, but there is no guarantee.

Since 3) will take 1-2 kernel cycles anyway, that will hopefully allow
for enough time to tackle 1 and 2 while it is still in staging.

Regards,

	Hans

> 
> Changes since RFC1
> - removed fallthough patch
> - removed unsplit lines patch
> - fixed line size in "Use DMA coherent for stat_com" patch
> 
> Corentin Labbe (47):
>   staging: media: Revert "media: zoran: remove deprecated driver"
>   MAINTAINERS: change maintainer of the zoran driver
>   staging: media: zoran: datasheet is no longer available from zoran.com
>   staging: media: zoran: Documentation: fix typo
>   staging: media: zoran: fix checkpatch issue
>   staging: media: zoran: do not forward declare zr36057_init_vfe
>   staging: media: zoran: convert all error dprintk to pci_err/pr_err
>   staging: media: zoran: convert dprintk warn
>   staging: media: zoran: convert dprintk info to pci_info
>   staging: media: zoran: convert dprintk debug
>   staging: media: zoran: zoran_device.c: convert pr_x to pci_x
>   staging: media: zoran: remove proc_fs
>   staging: media: zoran: use VFL_TYPE_VIDEO
>   staging: media: zoran: use v4l2_buffer_set_timestamp
>   staging: media: zoran: do not print random guest 0
>   staging: media: zoran: move buffer_size out of zoran_fh
>   staging: media: zoran: move v4l_settings out of zoran_fh
>   staging: media: zoran: move jpg_settings out of zoran_fh
>   staging: media: zoran: move overlay_settings out of zoran_fh
>   staging: media: zoran: Use video_drvdata to get struct zoran
>   staging: media: zoran: Change zoran_v4l_set_format parameter from
>     zoran_fh to zoran
>   staging: media: zoran: remove overlay
>   staging: media: zoran: Use DMA coherent for stat_com
>   staging: media: zoran: use ZR_NORM
>   staging: media: zoran: zoran does not support STD_ALL
>   staging: media: zoran: convert irq to pci irq
>   staging: media: zoran: convert zoran alloc to devm
>   staging: media: zoran: convert mdelay to udelay
>   staging: media: zoran: use devm for videocodec_master alloc
>   staging: media: zoran: use pci_request_regions
>   staging: media: zoran: use devm_ioremap
>   staging: media: zoran: add stat_com buffer
>   staging: media: zoran: constify struct tvnorm
>   staging: media: zoran: constify codec_name
>   staging: media: zoran: Add more check for compliance
>   staging: media: zoran: Add vb_queue
>   staging: media: zoran: disable output
>   staging: media: zoran: device support only 32bit DMA address
>   staging: media: zoran: enable makefile
>   staging: media: zoran: remove framebuffer support
>   staging: media: zoran: add vidioc_g_parm
>   staging: media: zoran: remove test_interrupts
>   staging: media: zoran: fix use of buffer_size and sizeimage
>   staging: media: zoran: fix some compliance test
>   staging: media: zoran: remove deprecated .vidioc_g_jpegcomp
>   staging: media: zoran: convert to vb2
>   staging: media: zoran: update TODO
> 
>  Documentation/media/v4l-drivers/zoran.rst  |  575 +++++++++
>  MAINTAINERS                                |   10 +
>  drivers/staging/media/Kconfig              |    2 +
>  drivers/staging/media/Makefile             |    1 +
>  drivers/staging/media/zoran/Kconfig        |   76 ++
>  drivers/staging/media/zoran/Makefile       |    7 +
>  drivers/staging/media/zoran/TODO           |   19 +
>  drivers/staging/media/zoran/videocodec.c   |  330 +++++
>  drivers/staging/media/zoran/videocodec.h   |  308 +++++
>  drivers/staging/media/zoran/zoran.h        |  320 +++++
>  drivers/staging/media/zoran/zoran_card.c   | 1333 ++++++++++++++++++++
>  drivers/staging/media/zoran/zoran_card.h   |   30 +
>  drivers/staging/media/zoran/zoran_device.c | 1013 +++++++++++++++
>  drivers/staging/media/zoran/zoran_device.h |   64 +
>  drivers/staging/media/zoran/zoran_driver.c | 1038 +++++++++++++++
>  drivers/staging/media/zoran/zr36016.c      |  433 +++++++
>  drivers/staging/media/zoran/zr36016.h      |   92 ++
>  drivers/staging/media/zoran/zr36050.c      |  842 +++++++++++++
>  drivers/staging/media/zoran/zr36050.h      |  163 +++
>  drivers/staging/media/zoran/zr36057.h      |  154 +++
>  drivers/staging/media/zoran/zr36060.c      |  872 +++++++++++++
>  drivers/staging/media/zoran/zr36060.h      |  201 +++
>  22 files changed, 7883 insertions(+)
>  create mode 100644 Documentation/media/v4l-drivers/zoran.rst
>  create mode 100644 drivers/staging/media/zoran/Kconfig
>  create mode 100644 drivers/staging/media/zoran/Makefile
>  create mode 100644 drivers/staging/media/zoran/TODO
>  create mode 100644 drivers/staging/media/zoran/videocodec.c
>  create mode 100644 drivers/staging/media/zoran/videocodec.h
>  create mode 100644 drivers/staging/media/zoran/zoran.h
>  create mode 100644 drivers/staging/media/zoran/zoran_card.c
>  create mode 100644 drivers/staging/media/zoran/zoran_card.h
>  create mode 100644 drivers/staging/media/zoran/zoran_device.c
>  create mode 100644 drivers/staging/media/zoran/zoran_device.h
>  create mode 100644 drivers/staging/media/zoran/zoran_driver.c
>  create mode 100644 drivers/staging/media/zoran/zr36016.c
>  create mode 100644 drivers/staging/media/zoran/zr36016.h
>  create mode 100644 drivers/staging/media/zoran/zr36050.c
>  create mode 100644 drivers/staging/media/zoran/zr36050.h
>  create mode 100644 drivers/staging/media/zoran/zr36057.h
>  create mode 100644 drivers/staging/media/zoran/zr36060.c
>  create mode 100644 drivers/staging/media/zoran/zr36060.h
> 

