Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39ADC2CEE
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 07:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbfJAFdZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 1 Oct 2019 01:33:25 -0400
Received: from mailoutvs48.siol.net ([185.57.226.239]:46752 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725817AbfJAFdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Oct 2019 01:33:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 01FBE5214A7;
        Tue,  1 Oct 2019 07:33:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id C3Ar8QFXxW9r; Tue,  1 Oct 2019 07:33:19 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 4E5C25214C3;
        Tue,  1 Oct 2019 07:33:19 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id E624C5214A7;
        Tue,  1 Oct 2019 07:33:17 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        mripard@kernel.org, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
Subject: Re: [PATCH v2 0/6] media: cedrus: h264: Support multi-slice frames
Date:   Tue, 01 Oct 2019 07:33:17 +0200
Message-ID: <1947541.RCUY4WSgCv@jernej-laptop>
In-Reply-To: <eb127b9a-e226-d230-67b5-069795bd76fb@xs4all.nl>
References: <20190929200023.215831-1-jernej.skrabec@siol.net> <4342181.Ehiz7mZe5m@jernej-laptop> <eb127b9a-e226-d230-67b5-069795bd76fb@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne torek, 01. oktober 2019 ob 00:43:34 CEST je Hans Verkuil napisal(a):
> On 10/1/19 12:27 AM, Jernej Škrabec wrote:
> > Dne ponedeljek, 30. september 2019 ob 10:10:48 CEST je Hans Verkuil
> > 
> > napisal(a):
> >> On 9/29/19 10:00 PM, Jernej Skrabec wrote:
> >>> This series adds support for decoding multi-slice H264 frames along with
> >>> support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.
> >>> 
> >>> Code was tested by modified ffmpeg, which can be found here:
> >>> https://github.com/jernejsk/FFmpeg, branch mainline-test
> >>> It has to be configured with at least following options:
> >>> --enable-v4l2-request --enable-libudev --enable-libdrm
> >>> 
> >>> Samples used for testing:
> >>> http://jernej.libreelec.tv/videos/h264/BA1_FT_C.mp4
> >>> http://jernej.libreelec.tv/videos/h264/h264.mp4
> >>> 
> >>> Command line used for testing:
> >>> ffmpeg -hwaccel drm -hwaccel_device /dev/dri/card0 -i h264.mp4 -pix_fmt
> >>> bgra -f fbdev /dev/fb0
> >>> 
> >>> Please note that V4L2_DEC_CMD_FLUSH was not tested because I'm
> >>> not sure how. ffmpeg follows exactly which slice is last in frame
> >>> and sets hold flag accordingly. Improper usage of hold flag would
> >>> corrupt ffmpeg assumptions and it would probably crash. Any ideas
> >>> how to test this are welcome!
> >> 
> >> It can be tested partially at least: if ffmpeg tells you it is the last
> >> slice, then queue the slice with the HOLD flag set, then call FLUSH
> >> afterwards. This should clear the HOLD flag again. In this case the
> >> queued
> >> buffer is probably not yet processed, so the flag is cleared before the
> >> decode job starts.
> >> 
> >> You can also try to add a sleep before calling FLUSH to see what happens
> >> if the last queued buffer is already decoded.
> > 
> > Ok, I tried following code:
> > https://github.com/jernejsk/FFmpeg/blob/flush_test/libavcodec/
> > v4l2_request.c#L220-L233
> > 
> > But results are not good. It seems that out_vb in flush command is always
> > NULL and so it always marks capture buffer as done, which leads to kernel
> > warnings.
> > 
> > dmesg output with debugging messages is here: http://ix.io/1Ks8
> > 
> > Currently I'm not sure what is going on. Shouldn't be output buffer queued
> > and waiting to MEDIA_REQUEST_IOC_QUEUE which is executed after flush
> > command as it can be seen from ffmpeg code linked above?
> 
> Argh, I forgot about the fact that this uses requests.
> 
> The FLUSH should happen *after* the MEDIA_REQUEST_IOC_QUEUE ioctl. Otherwise
> it has no effect. As long as the request hasn't been queued, the buffer is
> also not queued to the driver, so out_vb will indeed be NULL.

It's better, but still not working. Currently ffmpeg sometimes reports such 
messages: https://pastebin.com/raw/9tVVtc20 This is dmesg output: http://
ix.io/1L1L

It seems to me like a race condition. Sometimes flush works as indendent and 
sometimes it influences next frame.

Best regards,
Jernje

> 
> Sorry for the confusion.
> 
> Regards,
> 
> 	Hans
> 
> > Best regards,
> > Jernej
> > 
> >> Regards,
> >> 
> >> 	Hans
> >> 	
> >>> Thanks to Jonas for adjusting ffmpeg.
> >>> 
> >>> Please let me know what you think.
> >>> 
> >>> Best regards,
> >>> Jernej
> >>> 
> >>> Changes from v1:
> >>> - added Rb tags
> >>> - updated V4L2_DEC_CMD_FLUSH documentation
> >>> - updated first slice detection in Cedrus
> >>> - hold capture buffer flag is set according to source format
> >>> - added v4l m2m stateless_(try_)decoder_cmd ioctl helpers
> >>> 
> >>> Hans Verkuil (2):
> >>>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> >>>   videodev2.h: add V4L2_DEC_CMD_FLUSH
> >>> 
> >>> Jernej Skrabec (4):
> >>>   media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
> >>>   media: cedrus: Detect first slice of a frame
> >>>   media: cedrus: h264: Support multiple slices per frame
> >>>   media: cedrus: Add support for holding capture buffer
> >>>  
> >>>  Documentation/media/uapi/v4l/buffer.rst       | 13 ++++++
> >>>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     | 10 +++-
> >>>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  6 +++
> >>>  .../media/videodev2.h.rst.exceptions          |  1 +
> >>>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
> >>>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 35 ++++++++++++++
> >>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
> >>>  .../staging/media/sunxi/cedrus/cedrus_dec.c   | 11 +++++
> >>>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 11 ++++-
> >>>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  8 ++--
> >>>  .../staging/media/sunxi/cedrus/cedrus_video.c | 14 ++++++
> >>>  include/media/v4l2-mem2mem.h                  | 46 +++++++++++++++++++
> >>>  include/media/videobuf2-core.h                |  3 ++
> >>>  include/media/videobuf2-v4l2.h                |  5 ++
> >>>  include/uapi/linux/videodev2.h                | 14 ++++--
> >>>  15 files changed, 175 insertions(+), 11 deletions(-)




