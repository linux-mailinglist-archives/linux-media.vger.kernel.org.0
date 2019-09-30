Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56923C1C94
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 10:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbfI3ILF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 04:11:05 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42451 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725767AbfI3ILE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 04:11:04 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id EqldicaL79D4hEqlgiKoVb; Mon, 30 Sep 2019 10:11:02 +0200
Subject: Re: [PATCH v2 0/6] media: cedrus: h264: Support multi-slice frames
To:     Jernej Skrabec <jernej.skrabec@siol.net>, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com, mripard@kernel.org,
        pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org
Cc:     gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9ec1c07e-b0e8-f50c-7f46-df7ca303a5bc@xs4all.nl>
Date:   Mon, 30 Sep 2019 10:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929200023.215831-1-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK9IKuZNeGFEGO1ipU974FZ/22u7b0eHb52sOVTjDWar12s23xSk7+3/qAGZaBOAOIslIwDo31TGsQr/hao3CJLYeYsH4Skz//+KsV/33q5632Vxor0Q
 t4Tkji1xtcf7hwG67KNTFDYRdVo2uQ591OX3mZdbTCca6XOdpC8VVuMTh7WHjR1TyD8qtLrp7HxYqYrHrN7Id71XtQFBpCIyo3sJid0lBgcxoo25VBmoKBy9
 Nr046jks4iF//5HfqDbwQPEgRiIX5bNmxSrECW+67UpopUihzusX4rRYXiQHZrc/2IIBA3exeyT7hkDTPK+LSkNKvAvsUC00Ylj5E5HFK+YHAn282Va1G7zX
 AMGknbLA17cEeMbREFO3L00c0zbhFlkMBxnEQBe3eHIbRlJMPYAbqIgfiWbgB5ahz2oG/8cj1DBSJGr48iIVTTi4YvbLyHaUd/qqnTi6qVk4ss4CWSWj7LZ9
 2JLc5F5cvfY3UcBm7Wk8fRs755HtOtRvInPRLIp8QzIo6NGStiPvvUa0DUs6ThUOtRqnMT8zW4AsTHgA/RZulXK+to07S+YIoqABQm9bbruKx9iguqi1/yuW
 gM+TE6g2gkwUPnyhQFcjEmcn4Vq+7FFc+ea4oWewNURg2iOd/VI2LAYlp5pkVoT4acMj6GXO9ZIpDcXe5uj7NSOSesvXygOeGdF7iS+OGu30cdPW1FWrKzPH
 ZexuRooJtfNwe+g2S6wzE5DBMEVIH9zp9ihXMvzqzEY3nNjvp51hhQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/29/19 10:00 PM, Jernej Skrabec wrote:
> This series adds support for decoding multi-slice H264 frames along with
> support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.
> 
> Code was tested by modified ffmpeg, which can be found here:
> https://github.com/jernejsk/FFmpeg, branch mainline-test
> It has to be configured with at least following options:
> --enable-v4l2-request --enable-libudev --enable-libdrm
> 
> Samples used for testing:
> http://jernej.libreelec.tv/videos/h264/BA1_FT_C.mp4
> http://jernej.libreelec.tv/videos/h264/h264.mp4
> 
> Command line used for testing:
> ffmpeg -hwaccel drm -hwaccel_device /dev/dri/card0 -i h264.mp4 -pix_fmt bgra -f fbdev /dev/fb0
> 
> Please note that V4L2_DEC_CMD_FLUSH was not tested because I'm
> not sure how. ffmpeg follows exactly which slice is last in frame
> and sets hold flag accordingly. Improper usage of hold flag would
> corrupt ffmpeg assumptions and it would probably crash. Any ideas
> how to test this are welcome!

It can be tested partially at least: if ffmpeg tells you it is the last
slice, then queue the slice with the HOLD flag set, then call FLUSH afterwards.
This should clear the HOLD flag again. In this case the queued buffer is
probably not yet processed, so the flag is cleared before the decode job starts.

You can also try to add a sleep before calling FLUSH to see what happens
if the last queued buffer is already decoded.

Regards,

	Hans

> 
> Thanks to Jonas for adjusting ffmpeg.
> 
> Please let me know what you think.
> 
> Best regards,
> Jernej
> 
> Changes from v1:
> - added Rb tags
> - updated V4L2_DEC_CMD_FLUSH documentation
> - updated first slice detection in Cedrus
> - hold capture buffer flag is set according to source format
> - added v4l m2m stateless_(try_)decoder_cmd ioctl helpers
> 
> Hans Verkuil (2):
>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>   videodev2.h: add V4L2_DEC_CMD_FLUSH
> 
> Jernej Skrabec (4):
>   media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
>   media: cedrus: Detect first slice of a frame
>   media: cedrus: h264: Support multiple slices per frame
>   media: cedrus: Add support for holding capture buffer
> 
>  Documentation/media/uapi/v4l/buffer.rst       | 13 ++++++
>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     | 10 +++-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  6 +++
>  .../media/videodev2.h.rst.exceptions          |  1 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 35 ++++++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   | 11 +++++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 11 ++++-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  8 ++--
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 14 ++++++
>  include/media/v4l2-mem2mem.h                  | 46 +++++++++++++++++++
>  include/media/videobuf2-core.h                |  3 ++
>  include/media/videobuf2-v4l2.h                |  5 ++
>  include/uapi/linux/videodev2.h                | 14 ++++--
>  15 files changed, 175 insertions(+), 11 deletions(-)
> 

