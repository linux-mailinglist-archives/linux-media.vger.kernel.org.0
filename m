Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0503EC29D3
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 00:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfI3Wnu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 18:43:50 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57229 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727118AbfI3Wnu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 18:43:50 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id F4OEioGt7z6EAF4OIiPBGS; Tue, 01 Oct 2019 00:43:47 +0200
Subject: Re: [PATCH v2 0/6] media: cedrus: h264: Support multi-slice frames
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        mripard@kernel.org, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
 <9ec1c07e-b0e8-f50c-7f46-df7ca303a5bc@xs4all.nl>
 <4342181.Ehiz7mZe5m@jernej-laptop>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <eb127b9a-e226-d230-67b5-069795bd76fb@xs4all.nl>
Date:   Tue, 1 Oct 2019 00:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4342181.Ehiz7mZe5m@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFn+kIK2GNj9+BEej5EMia6D+bB8/LawPK5czA7EcEOQoDlb7/byirHWWLuRNhM8aOvV6L4uPkBDMp/b5haMgLHJRCVz00k6BXYbFv55mOe5epSzVOdQ
 TuvdvKUkiVAWjMcfuVcfk4QvBILVf1HKZcMY6+g4Qdc4OLBZ5AhKxnOonV8xUyYWzJDKLpCOyrYCm8ouTUcDCldHPLEkvabNj/3zujhWK1a/hvCTT1gbNFlH
 CC9gI9c7SR+7xVjLuTA1YfPPX18g2xgyKEDamsFf6klifUdZplA+Q3933lfAcRVDLzYw431YEZgf+oJ80nt3BhAa/SQ3kAA9PtwXZYZtQX8vNWwsj+3eP8N+
 a/WnOrHguJimsETowgg7bowdXWe7A12/bTE4QHPY1+srUyslIUzGh5yxBG6lYuckBYeQGM1iVd112/prGDJhwS/t6tWLz4tZ6BTY23ahUA068+2hwGhPwpqx
 3blGqFcQpa7A6sLE3MCUYPDSp4oAd97HgeosNQx9yiv24TBOg0kC2VDxGgZ4XbO/IrKr0tzXmCXARcKyZjADEcs9Ac+94/V7r8HiyOJhz8TcfOMg9HvSlMt1
 sDqz9wbWFjPNIXXhaBvQao/uAqN+QFMvRa2n97UNJCe/mxtlRoIJ58QvGTf708jDS/vMzw3CSSvO93ZjuQbaZHHW54jwd4kQpPUL/ytJ63vX+M/tB1jsM1K1
 dG4zJVTTm7MMudokTRIMmA/V3Ygnek0seXag/YyZUfdy3DJlgV/XNg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/1/19 12:27 AM, Jernej Škrabec wrote:
> Dne ponedeljek, 30. september 2019 ob 10:10:48 CEST je Hans Verkuil 
> napisal(a):
>> On 9/29/19 10:00 PM, Jernej Skrabec wrote:
>>> This series adds support for decoding multi-slice H264 frames along with
>>> support for V4L2_DEC_CMD_FLUSH and V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF.
>>>
>>> Code was tested by modified ffmpeg, which can be found here:
>>> https://github.com/jernejsk/FFmpeg, branch mainline-test
>>> It has to be configured with at least following options:
>>> --enable-v4l2-request --enable-libudev --enable-libdrm
>>>
>>> Samples used for testing:
>>> http://jernej.libreelec.tv/videos/h264/BA1_FT_C.mp4
>>> http://jernej.libreelec.tv/videos/h264/h264.mp4
>>>
>>> Command line used for testing:
>>> ffmpeg -hwaccel drm -hwaccel_device /dev/dri/card0 -i h264.mp4 -pix_fmt
>>> bgra -f fbdev /dev/fb0
>>>
>>> Please note that V4L2_DEC_CMD_FLUSH was not tested because I'm
>>> not sure how. ffmpeg follows exactly which slice is last in frame
>>> and sets hold flag accordingly. Improper usage of hold flag would
>>> corrupt ffmpeg assumptions and it would probably crash. Any ideas
>>> how to test this are welcome!
>>
>> It can be tested partially at least: if ffmpeg tells you it is the last
>> slice, then queue the slice with the HOLD flag set, then call FLUSH
>> afterwards. This should clear the HOLD flag again. In this case the queued
>> buffer is probably not yet processed, so the flag is cleared before the
>> decode job starts.
>>
>> You can also try to add a sleep before calling FLUSH to see what happens
>> if the last queued buffer is already decoded.
> 
> Ok, I tried following code:
> https://github.com/jernejsk/FFmpeg/blob/flush_test/libavcodec/
> v4l2_request.c#L220-L233
> 
> But results are not good. It seems that out_vb in flush command is always NULL 
> and so it always marks capture buffer as done, which leads to kernel warnings.
> 
> dmesg output with debugging messages is here: http://ix.io/1Ks8
> 
> Currently I'm not sure what is going on. Shouldn't be output buffer queued and 
> waiting to MEDIA_REQUEST_IOC_QUEUE which is executed after flush command as it 
> can be seen from ffmpeg code linked above?

Argh, I forgot about the fact that this uses requests.

The FLUSH should happen *after* the MEDIA_REQUEST_IOC_QUEUE ioctl. Otherwise
it has no effect. As long as the request hasn't been queued, the buffer is also
not queued to the driver, so out_vb will indeed be NULL.

Sorry for the confusion.

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> Thanks to Jonas for adjusting ffmpeg.
>>>
>>> Please let me know what you think.
>>>
>>> Best regards,
>>> Jernej
>>>
>>> Changes from v1:
>>> - added Rb tags
>>> - updated V4L2_DEC_CMD_FLUSH documentation
>>> - updated first slice detection in Cedrus
>>> - hold capture buffer flag is set according to source format
>>> - added v4l m2m stateless_(try_)decoder_cmd ioctl helpers
>>>
>>> Hans Verkuil (2):
>>>   vb2: add V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
>>>   videodev2.h: add V4L2_DEC_CMD_FLUSH
>>>
>>> Jernej Skrabec (4):
>>>   media: v4l2-mem2mem: add stateless_(try_)decoder_cmd ioctl helpers
>>>   media: cedrus: Detect first slice of a frame
>>>   media: cedrus: h264: Support multiple slices per frame
>>>   media: cedrus: Add support for holding capture buffer
>>>  
>>>  Documentation/media/uapi/v4l/buffer.rst       | 13 ++++++
>>>  .../media/uapi/v4l/vidioc-decoder-cmd.rst     | 10 +++-
>>>  .../media/uapi/v4l/vidioc-reqbufs.rst         |  6 +++
>>>  .../media/videodev2.h.rst.exceptions          |  1 +
>>>  .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++-
>>>  drivers/media/v4l2-core/v4l2-mem2mem.c        | 35 ++++++++++++++
>>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>>>  .../staging/media/sunxi/cedrus/cedrus_dec.c   | 11 +++++
>>>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 11 ++++-
>>>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  8 ++--
>>>  .../staging/media/sunxi/cedrus/cedrus_video.c | 14 ++++++
>>>  include/media/v4l2-mem2mem.h                  | 46 +++++++++++++++++++
>>>  include/media/videobuf2-core.h                |  3 ++
>>>  include/media/videobuf2-v4l2.h                |  5 ++
>>>  include/uapi/linux/videodev2.h                | 14 ++++--
>>>  15 files changed, 175 insertions(+), 11 deletions(-)
> 
> 
> 
> 

