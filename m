Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A897BD7AA9
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 17:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732717AbfJOP6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 11:58:22 -0400
Received: from mailoutvs8.siol.net ([185.57.226.199]:56061 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfJOP6W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 11:58:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id DDF90523B1B;
        Tue, 15 Oct 2019 17:58:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id NsoSFTlSzvY1; Tue, 15 Oct 2019 17:58:17 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 7B70C523B57;
        Tue, 15 Oct 2019 17:58:17 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id AEF47523B1B;
        Tue, 15 Oct 2019 17:58:16 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCHv4 0/6] media: cedrus: h264: Support multi-slice frames
Date:   Tue, 15 Oct 2019 17:58:16 +0200
Message-ID: <2098405.rfSs0az2Eu@jernej-laptop>
In-Reply-To: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
References: <20191011093245.33366-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne petek, 11. oktober 2019 ob 11:32:39 CEST je Hans Verkuil napisal(a):
> This series adds support for decoding multi-slice H264 frames along with
> support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.
> 
> This has only been compile-tested. Jernej, can you test with ffmpeg?

Tested and it works. Thanks!

You can add:
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>

to any patch you find appropriate.

Best regards,
Jernej

> 
> This series is based on
> https://www.spinics.net/lists/linux-media/msg158081.html plus ideas from
> https://www.spinics.net/lists/linux-media/msg158625.html.
> 
> Changes since v3:
> 
> - Fix two 'unused variable' warnings in patch 2.
> - Dropped patch 6/8 since this is no longer needed.
> - Combined patches 7/8 and 8/8.
> - Dropped an unnecessary cast in 8/8.
> 
> Changes since v2:
> 
> - Move the code to detect if a capture buffer is done to
>   the v4l2-mem2mem core framework.
> - Move the first-slice detection to the core as well.
> - Add a new v4l2_m2m_buf_done_and_job_finish() function that
>   finishes a job taking held capture buffers into account.
>   Marking buffers as done and finishing the job has to be
>   done with job_spinlock held to avoid race conditions with
>   v4l2_m2m_ioctl_stateless_decoder_cmd().
> - v4l2_m2m_ioctl_stateless_decoder_cmd takes the job_spinlock
>   to prevent race conditions.
> 
> Regards,
> 
>         Hans
> 
> Hans Verkuil (4):
>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>   v4l2-mem2mem: support held capture buffers
>   videodev2.h: add V4L2_DEC_CMD_FLUSH
>   v4l2-mem2mem: add new_frame detection
> 
> Jernej Skrabec (2):
>   media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
>   media: cedrus: h264: Support multiple slices per frame
> 
>  Documentation/media/uapi/v4l/buffer.rst       |  13 ++
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |  10 +-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |   6 +
>  .../media/videodev2.h.rst.exceptions          |   1 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  12 +-
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 190 +++++++++++++++---
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  12 +-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  16 +-
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  14 ++
>  include/media/v4l2-mem2mem.h                  |  44 +++-
>  include/media/videobuf2-core.h                |   3 +
>  include/media/videobuf2-v4l2.h                |   5 +
>  include/uapi/linux/videodev2.h                |  14 +-
>  13 files changed, 282 insertions(+), 58 deletions(-)




