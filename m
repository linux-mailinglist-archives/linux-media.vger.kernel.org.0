Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798592C3209
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 21:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgKXUg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 15:36:28 -0500
Received: from mailoutvs49.siol.net ([185.57.226.240]:51414 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727186AbgKXUg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 15:36:27 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 9ECD952140B;
        Tue, 24 Nov 2020 21:36:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id IfoQqw3X5caQ; Tue, 24 Nov 2020 21:36:23 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1E14C52133C;
        Tue, 24 Nov 2020 21:36:23 +0100 (CET)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id 6472F52140B;
        Tue, 24 Nov 2020 21:36:22 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v4 00/13] Stateless H.264 de-staging
Date:   Tue, 24 Nov 2020 21:42:24 +0100
Message-ID: <4354018.LnWUqtLeLf@kista>
In-Reply-To: <20201123144000.81310-1-ezequiel@collabora.com>
References: <20201123144000.81310-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

Dne ponedeljek, 23. november 2020 ob 15:39:47 CET je Ezequiel Garcia 
napisal(a):
> Seems we are converging, as this iteration is really small.
> 
> Just like v3, this iteration (plus a patch for VP8 VP8_FRAME_HEADER 
initialization,
> which I'll send shortly) passes v4l2-compliance with no failures.
> 
> As an additional test, Fluendo's JVT-AVC_V1 conformance test [1] passes with
> score 72/135, for the Hantro driver on i.MX8MQ (Hantro G1 VPU).
> Considering the Hantro driver only supports 4:2:0 and 4:0:0, this score
> looks quite good.
> 
> [1] https://github.com/fluendo/fluster/

Tested with ffmpeg/kodi stack on Allwinner R40 with different samples which use 
different H264 features and works without any problem.

You can add

Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>

for whole series.

Best regards,
Jernej

> 
> Thanks,
> Ezequiel
> 
> v4:
>   * Minor documentation fixes.
>   * Remove media/h264-ctrls.h, which was missing before.
>   * Thanks to feedback from Jernej, std_validation_compound
>     is now more complete, initializing non-present syntax elements.
> v3:
>   * Dropped level control from Cedrus, as agreed.
>   * Add support for H264 stateless controls in std_log and 
std_validate_compound.
>   * Added a ctrl debug error message, to help debug validation issues.
>   * Style minor fixes as requested by Hans.
> v2:
>   * Split destage changes in several patches so it's easier to review.
>   * Added missing changes to drivers/media/v4l2-core/v4l2-ctrls.c.
>   * Renamed V4L2_CID_CODEC_CX2341X_ and V4L2_CID_MPEG_MFC51_
>   * Moved the compatibility macros for MPEG to the end of the header.
> 
> Ezequiel Garcia (12):
>   media: ctrls: Add validate failure debug message
>   media: cedrus: h264: Support profile controls
>   media: Rename stateful codec control macros
>   media: Clean stateless control includes
>   media: uapi: h264: Add profile_idc macros
>   media: controls: Validate H264 stateless controls
>   media: controls: Add the stateless codec control class
>   media: uapi: Move parsed H264 pixel format out of staging
>   media: uapi: Move the H264 stateless control types out of staging
>   media: controls: Log H264 stateless controls in .std_log
>   media: uapi: move H264 stateless controls out of staging
>   media: docs: Move the H264 stateless codec uAPI
> 
> Jonas Karlman (1):
>   media: rkvdec: h264: Support profile and level controls
> 
>  .../userspace-api/media/v4l/common.rst        |   1 +
>  .../userspace-api/media/v4l/dev-mem2mem.rst   |   2 +-
>  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++
>  .../media/v4l/ext-ctrls-codec.rst             | 696 +--------------
>  .../media/v4l/extended-controls.rst           |   9 +-
>  .../media/v4l/pixfmt-compressed.rst           |  21 +-
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |   6 +-
>  drivers/media/common/cx2341x.c                |   4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  |   2 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls.c          | 198 ++++-
>  drivers/staging/media/hantro/hantro_drv.c     |  26 +-
>  drivers/staging/media/hantro/hantro_h264.c    |   8 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +-
>  drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
>  drivers/staging/media/rkvdec/rkvdec.c         |  39 +-
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  43 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
>  include/media/fwht-ctrls.h                    |   2 +-
>  include/media/h264-ctrls.h                    | 406 ---------
>  include/media/hevc-ctrls.h                    |  10 +-
>  include/media/mpeg2-ctrls.h                   |   4 +-
>  include/media/v4l2-ctrls.h                    |   1 -
>  include/media/v4l2-h264.h                     |   2 +-
>  include/media/vp8-ctrls.h                     |   2 +-
>  include/uapi/linux/v4l2-controls.h            | 804 +++++++++++++-----
>  include/uapi/linux/videodev2.h                |   8 +
>  27 files changed, 1582 insertions(+), 1412 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-
stateless.rst
>  delete mode 100644 include/media/h264-ctrls.h
> 
> -- 
> 2.27.0
> 
> 


