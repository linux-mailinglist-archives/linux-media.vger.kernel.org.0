Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C639A3456
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfH3JpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:45:03 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55717 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726653AbfH3JpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:45:03 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3dShiYEL4DqPe3dSkiRS9z; Fri, 30 Aug 2019 11:45:00 +0200
Subject: Re: [PATCH 2/8] videodev2.h: add V4L2_DEC_CMD_FLUSH
To:     Alexandre Courbot <acourbot@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wens@csie.org>,
        gregkh@linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, jonas@kwiboo.se
References: <20190822194500.2071-1-jernej.skrabec@siol.net>
 <20190822194500.2071-3-jernej.skrabec@siol.net>
 <CAPBb6MUChtZcNSTa2uT50k6uPU9T68wofLYGUFRJntDhjH8+iw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <907f3c43-b994-f1c7-a15b-116566e19003@xs4all.nl>
Date:   Fri, 30 Aug 2019 11:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MUChtZcNSTa2uT50k6uPU9T68wofLYGUFRJntDhjH8+iw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB4Iwpuxa4ZWt3WM5IScwN1zIREASBWnbgJamG02lqSTKf0f6j1jls/icFEBpt/+ljEr/9Y5Sq5Zd9sZVR6ANFlk/wmVSJVnMrssJpDPeJBWRqvn+U/p
 LVEEMt39B1UHj6sOC490LO9wF2NWibQ78kCPGnUAWmwR3oWf++lVNsd1bmDFh4tBqyCG4RjLtz+vPkfOYhbPEeoOa7+xOnaCdbl4H7IhWoAAXXIgl9IflOxH
 cc1PFgWU6u4fVCy3OJoqsgnYEWRFujH3WodDTFiTFlKM51XUi7nVSeigAS14/3E1BU4EqYrOkJlGmcgQzLN8XJmQ52J74mkYg7qSyzrmKWZ/4ZC2CEjeWQJZ
 XJk0wPWGnvRKw2bb+tiHbwkRY6r6CgAGmm8bu2mUaN/SZrqw4TVAHQuJtb8WvnSsKaijD5bREj07kRg4iflyy8L5MAAme/LpzwT2IMXyRsoSyuqOu3NBP1Z3
 tzjcdWh2vLp/fcnK+DOELBvNwrvpRn6J6U4UKgf4j0MER/dsnK8hbKKzzMDwaQcSsCCZC1cHXRbDbrgZEY7hKCb/jdU5vyAdLncmCfmQDUGUajlV4vm07AF6
 1RitpU4Y+gnyKJ6XOCngTKZ91X4yTPrdGy//Ui2pdXkitnE+yvdwRjlIcSjHYCwjGNoXohLW8KGcEHXZslxfljBBeBnZoRiHWZhS3dzUqz9aQkvfaq3E2a8N
 p4F05ydyvQwCdZKvYLxrSfrlWaxEa7nP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/30/19 11:38 AM, Alexandre Courbot wrote:
> On Fri, Aug 23, 2019 at 4:45 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>>
>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>
>> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> ---
>>  Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst | 11 ++++++++++-
>>  Documentation/media/videodev2.h.rst.exceptions      |  1 +
>>  include/uapi/linux/videodev2.h                      |  1 +
>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
>> index 57f0066f4cff..0bffef6058f7 100644
>> --- a/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
>> +++ b/Documentation/media/uapi/v4l/vidioc-decoder-cmd.rst
>> @@ -208,7 +208,16 @@ introduced in Linux 3.3. They are, however, mandatory for stateful mem2mem decod
>>         been started yet, the driver will return an ``EPERM`` error code. When
>>         the decoder is already running, this command does nothing. No
>>         flags are defined for this command.
>> -
>> +    * - ``V4L2_DEC_CMD_FLUSH``
>> +      - 4
>> +      - Flush any held capture buffers. Only valid for stateless decoders,
>> +        and only if ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` was set.
>> +       This command is typically used when the application reached the
>> +       end of the stream and the last output buffer had the
>> +       ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
>> +       dequeueing the last capture buffer containing the last decoded frame.
>> +       So this command can be used to explicitly flush that last decoded
>> +       frame.
> 
> Just for safety, can we also specify that it is valid to call this
> command even if no buffer was held (in which case it is a no-op), as
> this can help make user-space code simpler?

Ah yes, thanks for the reminder.

Jernej, when you post the next version of this series, can you change the text
above to:

- Flush any held capture buffers. Only valid for stateless decoders.
  This command is typically used when the application reached the
  end of the stream and the last output buffer had the
  ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag set. This would prevent
  dequeueing the capture buffer containing the last decoded frame.
  So this command can be used to explicitly flush that final decoded
  frame. This command does nothing if there are no held capture buffers.

Regards,

	Hans

> 
>>
>>  Return Value
>>  ============
>> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
>> index adeb6b7a15cb..a79028e4d929 100644
>> --- a/Documentation/media/videodev2.h.rst.exceptions
>> +++ b/Documentation/media/videodev2.h.rst.exceptions
>> @@ -434,6 +434,7 @@ replace define V4L2_DEC_CMD_START decoder-cmds
>>  replace define V4L2_DEC_CMD_STOP decoder-cmds
>>  replace define V4L2_DEC_CMD_PAUSE decoder-cmds
>>  replace define V4L2_DEC_CMD_RESUME decoder-cmds
>> +replace define V4L2_DEC_CMD_FLUSH decoder-cmds
>>
>>  replace define V4L2_DEC_CMD_START_MUTE_AUDIO decoder-cmds
>>  replace define V4L2_DEC_CMD_PAUSE_TO_BLACK decoder-cmds
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 4fa9f543742d..91a79e16089c 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1978,6 +1978,7 @@ struct v4l2_encoder_cmd {
>>  #define V4L2_DEC_CMD_STOP        (1)
>>  #define V4L2_DEC_CMD_PAUSE       (2)
>>  #define V4L2_DEC_CMD_RESUME      (3)
>> +#define V4L2_DEC_CMD_FLUSH       (4)
>>
>>  /* Flags for V4L2_DEC_CMD_START */
>>  #define V4L2_DEC_CMD_START_MUTE_AUDIO  (1 << 0)
>> --
>> 2.22.1
>>

