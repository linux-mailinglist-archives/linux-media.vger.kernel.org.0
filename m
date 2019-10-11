Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80097D39D6
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 09:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbfJKHII convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Oct 2019 03:08:08 -0400
Received: from mailoutvs11.siol.net ([185.57.226.202]:38831 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726679AbfJKHII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 03:08:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B7D4A520C00;
        Fri, 11 Oct 2019 09:08:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5r1OjYe0xja7; Fri, 11 Oct 2019 09:08:04 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 3DB31520B8A;
        Fri, 11 Oct 2019 09:08:04 +0200 (CEST)
Received: from jernej-laptop.localnet (unknown [89.216.49.66])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id E86AF520E04;
        Fri, 11 Oct 2019 09:08:02 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCHv3 0/8] media: cedrus: h264: Support multi-slice frames
Date:   Fri, 11 Oct 2019 09:07:36 +0200
Message-ID: <8631386.LGH57gnQEz@jernej-laptop>
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 10. oktober 2019 ob 15:11:44 CEST je Hans Verkuil napisal(a):
> This series adds support for decoding multi-slice H264 frames along with
> support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.
> 
> This has only been compile-tested. Jernej, can you test with ffmpeg?

Sure, but not before Tuesday, unfortunatelly.

Best regards,
Jernej

> 
> This series is based on
> https://www.spinics.net/lists/linux-media/msg158081.html plus ideas from
> https://www.spinics.net/lists/linux-media/msg158625.html.
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
> Jernej Skrabec (4):
>   media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
>   media: cedrus: Detect first slice of a frame
>   media: cedrus: h264: Support multiple slices per frame
>   media: cedrus: Add support for holding capture buffer
> 
>  Documentation/media/uapi/v4l/buffer.rst       |  13 ++
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     |  10 +-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |   6 +
>  .../media/videodev2.h.rst.exceptions          |   1 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  12 +-
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 188 +++++++++++++++---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   1 +
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |  12 +-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  16 +-
>  .../staging/media/sunxi/cedrus/cedrus_video.c |  14 ++
>  include/media/v4l2-mem2mem.h                  |  44 +++-
>  include/media/videobuf2-core.h                |   3 +
>  include/media/videobuf2-v4l2.h                |   5 +
>  include/uapi/linux/videodev2.h                |  14 +-
>  15 files changed, 283 insertions(+), 57 deletions(-)




