Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C454E067
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 12:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfD2KSD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 06:18:03 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55955 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727428AbfD2KSD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 06:18:03 -0400
Received: from [192.168.2.10] ([46.9.232.72])
        by smtp-cloud8.xs4all.net with ESMTPA
        id L3MDhKlWwb8gSL3MGh7sXz; Mon, 29 Apr 2019 12:18:00 +0200
Subject: Re: [PATCH v5 00/14] media: vimc: Add support for multiplanar formats
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lucmaga@gmail.com,
        lkcamp@lists.libreplanetbr.org
References: <20190426195114.5002-1-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b2d1bfb0-bcca-2729-88ed-6d226661b8a1@xs4all.nl>
Date:   Mon, 29 Apr 2019 12:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190426195114.5002-1-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPDc0S8nX9fACGarV3oSCB+aVrLFnM8EjvMeI7JzHK3kiq0xt+72AExIt202X52ERdcFT9irU/ORzUXKhr6bqRMML4JY4qSr5lY2ApRbbtvI+9AR8Igk
 YL2hEHRQwCH79Xt0x+w0P0pft1kjhsG8npPUVQ2dPRvEqD1EvvueYN3qJ2FyuxTi73f2OpgAJnIRWaxcAKRJGunIqLq0vmtrOKQcWA2IGzTWllulKG5hp4rq
 aKomgieybc0/Ai1xcuoON8SB0Y+w5x6kXCOVfHDoeKLA8k7x4Hm/HzEx2i3Uu81cI/IO76HJvU8RyceOGFGfW0i8VGwsVPruyk2KqlbpRlQrf79l1frWvyYC
 vPngURcRRCE80zoE8dBHA9ZIjhP8rg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi André,

Thank you for you work on this. I've posted a few review comments (nothing
major), so this should be ready for be merged for 5.3 once v6 is posted.

On 4/26/19 9:51 PM, André Almeida wrote:
> Hello,
> 
> This series implements support for multiplane pixel formats at Vimc.
> A lot of changes were required since vimc support for singleplane
> was "hardcoded". The code has been adapted in order to support both
> formats. When was possible, the functions were written generically,
> avoiding functions for just one type of pixel format.
> 
> The debayer subdevice is the only one that currently doesn't supports
> multiplanar formats. Documentation to each device will be made in a
> future patch. In hardcoded topology, the exposed capture device
> `RGB/YUV Capture` have a debayer in the pipeline, so it will fail when
> tested with multiplanar formats.
> 
> The last commit of this series was tested using Hans' virtme.sh[1]
> script here are the summary of results:
> 
> Grand Total for vivid device /dev/media0: 631, Succeeded: 631, Failed: 0, Warnings: 6
> Grand Total for vivid device /dev/media1: 631, Succeeded: 631, Failed: 0, Warnings: 6
> Grand Total for vim2m device /dev/media3: 61, Succeeded: 61, Failed: 0, Warnings: 0
> Grand Total for vimc device /dev/media3: 478, Succeeded: 478, Failed: 0, Warnings: 0
> Final Summary: 1801, Succeeded: 1801, Failed: 0, Warnings: 12

It would be great if you can also post a separate patch to update contrib/test/test-media
so vimc is tested twice: once in singleplanar and once in multiplanar mode.

The current vimc test should be done in a for loop so it is tested twice.

Thanks!

	Hans

> 
> Thanks,
> 	André
> 
> [1] https://hverkuil.home.xs4all.nl/virtme/virtme.sh
> 
> Changes in v5:
> - Remove bpp from vimc_sca_device
> 
> Changes in v4:
> - Remove unutilized commit "Propagate multiplanar state in the stream" 
> - Split "Create multiplanar parameter and ioctls"
> - Check for try_fmt return value
> - Change ret from `unsigned int` to `int`
> - Remove label `free_planes` from else scope
> - Change vars at vimc-scaler
> 
> Changes in v3:
> - Refactor vimc_frame and vimc_fill_frame in order to be more clear and
> simple
> - Squash "Add handler for multiplanar fmt ioctls" and "Create multiplanar
> parameter"
> - Define format ioctls of capture device according to it capabilities
> - Get rid of `IS_MULTIPLANAR(vcap)` verification on format ioctls
> - Remove some format ioctl handlers
> - Reorder "Move sp2mp functions to v4l2-common"
> - Minimal code style and comments changes
> - Assign ioctls according to capture device capabilities
> 
> Changes in v2:
> - Fix typos
> - Fix indentations
> - Enhance v4l2_fmt_* documentation
> - Change the order of commits, now the multiplanar parameter is the last
> one with the commit to set the device capabilities
> - Squash "unnecessary checks" commits together
> - In v1, the whole media device was in singleplanar or in multiplanar
> format. Now, each stream/pipeline can be in a format
> - Check the capture capabilities to get if the stream is in
> singleplanar/multiplanar mode, instead of checking the module parameter.
> - Change `if (multiplanar)` to `if (IS_MULTIPLANAR(vcap))`
> - Add a new commit to propagate in the stream if the capture device is
> in multiplanar or singleplanar mode
> 
> André Almeida (14):
>   media: vimc: Remove unnecessary stream checks
>   media: vimc: cap: Change vimc_cap_device.format type
>   media: vimc: cap: Dynamically define stream pixelformat
>   media: Move sp2mp functions to v4l2-common
>   media: vimc: cap: refactor singleplanar as a subset of multiplanar
>   media: vimc: cap: Add handler for multiplanar fmt ioctls
>   media: vimc: cap: Add multiplanar formats
>   media: vimc: cap: Add multiplanar default format
>   media: vimc: cap: Allocate and verify mplanar buffers
>   media: vimc: Add and use new struct vimc_frame
>   media: vimc: sen: Add support for multiplanar formats
>   media: vimc: sca: Add support for multiplanar formats
>   media: vimc: cap: Add support for multiplanar formats
>   media: vimc: Create multiplanar parameter
> 
>  drivers/media/platform/vimc/vimc-capture.c    | 288 ++++++++++++++----
>  drivers/media/platform/vimc/vimc-common.c     |   8 +
>  drivers/media/platform/vimc/vimc-common.h     |  41 ++-
>  drivers/media/platform/vimc/vimc-debayer.c    |  38 ++-
>  drivers/media/platform/vimc/vimc-scaler.c     | 127 ++++----
>  drivers/media/platform/vimc/vimc-sensor.c     |  67 ++--
>  drivers/media/platform/vimc/vimc-streamer.c   |   2 +-
>  drivers/media/platform/vivid/vivid-vid-cap.c  |   6 +-
>  .../media/platform/vivid/vivid-vid-common.c   |  59 ----
>  .../media/platform/vivid/vivid-vid-common.h   |   9 -
>  drivers/media/platform/vivid/vivid-vid-out.c  |   6 +-
>  drivers/media/v4l2-core/v4l2-common.c         |  62 ++++
>  include/media/v4l2-common.h                   |  37 +++
>  13 files changed, 511 insertions(+), 239 deletions(-)
> 

