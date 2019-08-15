Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6E8EAC0
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 13:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731136AbfHOLxv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 07:53:51 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42771 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728922AbfHOLxv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 07:53:51 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yEK9hvNNyDqPeyEKChXwPI; Thu, 15 Aug 2019 13:53:49 +0200
Subject: Re: [PATCHv2 10/12] videodev2.h: add V4L2_DEC_CMD_FLUSH
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-11-hverkuil-cisco@xs4all.nl>
 <CAPBb6MVTGJJH_rFjvQy37NDLzT1b_=dBRF6UkFb2hWMwD6EC=A@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ba4402b1-eca5-893e-7ad6-fe6650c316ff@xs4all.nl>
Date:   Thu, 15 Aug 2019 13:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAPBb6MVTGJJH_rFjvQy37NDLzT1b_=dBRF6UkFb2hWMwD6EC=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPflCPH0I5Lu3LUzAjEuHYscxJynpEO/oAkRPx8yy28wCHABFaWVhiWc3wYcalHM5+2ljqh+ftSMXtm2XK/a/85kneV4snmIzdJtbY3Iua/5z4l1pr08
 X5WstDSnw5Lb0p7kk37ZXA6gVkhVPnjCmEzwy2ZccHrx2pp1RZ7rfeIanlEHIE+wismewyl1j/Al9bJ05RlzVsDYcQnsWELyHhiDOY5zvGim8bs/JQkS1nTg
 58Wdbnsm5RCtY5d5OWL9+0j8a3F13VuWpMFB5ECfHoHVmUe0NYoMcBO7JhTr22k9rJ5a1znEHtP049LaNutS00cR4CpTWPprMRPGo5B6Wb0e15peTJ2lwuxE
 fjIuK9pf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/19 10:12 AM, Alexandre Courbot wrote:
> On Mon, Aug 12, 2019 at 8:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Add this new V4L2_DEC_CMD_FLUSH decoder command and document it.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
> I'm a bit confused here, isn't this command referred to as
> V4L2_DEC_CMD_STOP in the previous patch?

That was a typo in the previous patch. It really is FLUSH.

Regards,

	Hans

> 
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
>> 2.20.1
>>

