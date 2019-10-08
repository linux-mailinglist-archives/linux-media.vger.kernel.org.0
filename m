Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F29CFB86
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 15:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJHNpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 09:45:21 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:39213 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbfJHNpV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 09:45:21 -0400
Received: from [IPv6:2001:983:e9a7:1:a406:d42:889e:ff00] ([IPv6:2001:983:e9a7:1:a406:d42:889e:ff00])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HpnbiWwDzjZ8vHpnciCe30; Tue, 08 Oct 2019 15:45:18 +0200
Subject: Re: [PATCH 0/2] media: meson: vdec: Add compliant H264 support
To:     Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
References: <20191007145909.29979-1-mjourdan@baylibre.com>
 <8563127e-fe2c-a633-556b-8a883cebb171@xs4all.nl>
 <977c48e8-8275-c96a-688b-ccfbb873eb79@baylibre.com>
 <65a88bfc-d82b-1487-7983-507149b11673@xs4all.nl>
 <acef4f1e-0b59-30f5-f31f-9fc22f393072@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9683df7b-348c-71c7-122e-484457a4fd81@xs4all.nl>
Date:   Tue, 8 Oct 2019 15:45:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <acef4f1e-0b59-30f5-f31f-9fc22f393072@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJem3TjYXS1CNC5/nCFCdmcIprCP651g5E8hq+plDwNjDapT7SGJYZfY2ILPAH2r1uKeX4P2MxPHfqWzmHJiLspICa90WZ+NNkjbm5Q51VKIQ3XZYf8y
 jvHimksGkGoe7yw2W8pzQCKJbIsqDuKq+4gcFw+Zy/GytXScGqlR6piZyDPrwTyLZRg1TEOYDDwbgdSmIhJDWXEGxc/Yuf5dTKyuDg7LnQojeUG0+K/3Cb+5
 Lblj7p1GzxMNiaQQkA/sUnfHz4MQnPKiMJ3h57DZ8vmlWnR95t8h/rc6SSOXwi38H0klEkfL9XML2WXJwIovorCtQQne6Eji6tl5YvP7H+IzjcHWIV45K+wl
 EwR1KR9hJRuzhDGnImUniAL0GzJkQByj/Fx7oLOfDh6Z2xi6r8VzQQEbMH7UhccnZqMypSCdibY/mV3Sm69Rvkl4NR82ezGLfD52MUZ3+ARCNIm/K62nHqOE
 rflZ/U6VSHAeNjoq5qzP/oKnI9ih2gZskMbugqygPQZIZwtfwAxHkSTfiSCJ/go0OAjvE2WWJj2sa8D9W4NyGB3Se/G3+W2I6QYe/BU/s274KfMLZKx4OeLR
 vKRIq1fFh3w78/kNTfJY3GNlVaEGQvY/NSEKPVY436ehqymJq0+9jUUnc/VjhXuHPxaTb8/4J0UNJSlFpTXPs6YD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/19 3:40 PM, Maxime Jourdan wrote:
> On 07/10/2019 18:39, Hans Verkuil wrote:
>> On 10/7/19 6:24 PM, Maxime Jourdan wrote:
>>> On 07/10/2019 17:12, Hans Verkuil wrote:
>>>> On 10/7/19 4:59 PM, Maxime Jourdan wrote:
>>>>> Hello,
>>>>>
>>>>> This patch series aims to bring H.264 support as well as compliance update
>>>>> to the amlogic stateful video decoder driver.
>>>>>
>>>>> There is 1 issue that remains currently:
>>>>>
>>>>>    - The following codepath had to be commented out from v4l2-compliance as
>>>>> it led to stalling:
>>>>>
>>>>> if (node->codec_mask & STATEFUL_DECODER) {
>>>>>      struct v4l2_decoder_cmd cmd;
>>>>>      buffer buf_cap(m2m_q);
>>>>>
>>>>>      memset(&cmd, 0, sizeof(cmd));
>>>>>      cmd.cmd = V4L2_DEC_CMD_STOP;
>>>>>
>>>>>      /* No buffers are queued, call STREAMON, then STOP */
>>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>>
>>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>>>
>>>>>      /* Call STREAMON, queue one CAPTURE buffer, then STOP */
>>>>>      fail_on_test(node->streamon(q.g_type()));
>>>>>      fail_on_test(node->streamon(m2m_q.g_type()));
>>>>>      fail_on_test(buf_cap.querybuf(node, 0));
>>>>>      fail_on_test(buf_cap.qbuf(node));
>>>>>      fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>>>>>
>>>>>      fail_on_test(buf_cap.dqbuf(node));
>>>>>      fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
>>>>>      for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>>>>>          fail_on_test(buf_cap.g_bytesused(p));
>>>>>      fail_on_test(node->streamoff(q.g_type()));
>>>>>      fail_on_test(node->streamoff(m2m_q.g_type()));
>>>>> }
>>>>>
>>>>> The reason for this is because the driver has a limitation where all
>>>>> capturebuffers must be queued to the driver before STREAMON is effective.
>>>>> The firmware needs to know in advance what all the buffers are before
>>>>> starting to decode.
>>>>> This limitation is enforced via q->min_buffers_needed.
>>>>> As such, in this compliance codepath, STREAMON is never actually called
>>>>> driver-side and there is a stall on fail_on_test(buf_cap.dqbuf(node));
>>>>
>>>> That's interesting. I will have to look more closely at this.
>>>>
>>>>>
>>>>>
>>>>> One last detail: V4L2_FMT_FLAG_DYN_RESOLUTION is currently not recognized
>>>>> by v4l2-compliance, so it was left out for the test. However, it is
>>>>> present in the patch series.
>>>>
>>>> It is definitely recognized by v4l2-compliance.
>>>>
>>>>>
>>>>> The second patch has 3 "Alignment should match open parenthesis" lines
>>>>> where I preferred to keep them that way.
>>>>>
>>>>> Thanks Stanimir for sharing your HDR file creation tools, this was very
>>>>> helpful :).
>>>>>
>>>>> Maxime
>>>>>
>>>>> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
>>>>> v4l2-compliance SHA: a162244d47d4bb01d0692da879dce5a070f118e7, 64 bits
>>>>
>>>> But this SHA isn't in the v4l-utils repo, so this makes me wonder where you
>>>> got this repo from.
>>>>
>>>
>>> I am based off the hverkuil/vicodec branch. The SHA I am on is actually 05387265053bc6f9 ("test-media: add vicodec tests"), but it wasn't updated as I found out it requires a new bootstrap to refresh
>>> the SHA. Maybe some rebasing at some point got rid of a162244d.
>>
>> Don't use the hverkuil/vicodec branch. Everything there has been merged into the
>> regular v4l-utils repo some time ago. So just clone git://linuxtv.org/v4l-utils.git
>> and use that.
>>
> 
> Here is v4l2-compliance master without removing the flag from the driver this time. I however had to keep the codepath mentionned earlier commented.
> 
> # v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
> v4l2-compliance SHA: fd74ecee9020fcf80b3b9628f277d9311b443395, 64 bits

Ah, that looks much better :-)

The stall on 'fail_on_test(buf_cap.dqbuf(node));' I understand, and is something I need to take a closer look at.

Regards,

	Hans

> 
> Compliance test for meson-vdec device /dev/video0:
> 
> Driver Info:
>     Driver name      : meson-vdec
>     Card type        : Amlogic Video Decoder
>     Bus info         : platform:meson-vdec
>     Driver version   : 5.4.0
>     Capabilities     : 0x84204000
>         Video Memory-to-Memory Multiplanar
>         Streaming
>         Extended Pix Format
>         Device Capabilities
>     Device Caps      : 0x04204000
>         Video Memory-to-Memory Multiplanar
>         Streaming
>         Extended Pix Format
>     Detected Stateful Decoder
> 
> Required ioctls:
>     test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>     test second /dev/video0 open: OK
>     test VIDIOC_QUERYCAP: OK
>     test VIDIOC_G/S_PRIORITY: OK
>     test for unlimited opens: OK
> 
> Debug ioctls:
>     test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>     test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>     Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>     Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>     test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>     test VIDIOC_QUERYCTRL: OK
>     test VIDIOC_G/S_CTRL: OK
>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>     Standard Controls: 2 Private Controls: 0
> 
> Format ioctls:
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>     test VIDIOC_G/S_PARM: OK (Not Supported)
>     test VIDIOC_G_FBUF: OK (Not Supported)
>     test VIDIOC_G_FMT: OK
>     test VIDIOC_TRY_FMT: OK
>     test VIDIOC_S_FMT: OK
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     test Cropping: OK (Not Supported)
>     test Composing: OK (Not Supported)
>     test Scaling: OK
> 
> Codec ioctls:
>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>     test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>     test VIDIOC_EXPBUF: OK
>     test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>     test read/write: OK (Not Supported)
>     test blocking wait: OK
>     Video Capture Multiplanar: Captured 250 buffers
>     test MMAP (select): OK
>     Video Capture Multiplanar: Captured 250 buffers
>     test MMAP (epoll): OK
>     test USERPTR (select): OK (Not Supported)
>     test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> Maxime
> 
>>
>> Regards,
>>
>>     Hans
>>
> 

