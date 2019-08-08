Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 545E285EE6
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 11:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732519AbfHHJmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 05:42:08 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32939 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732494AbfHHJmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Aug 2019 05:42:07 -0400
Received: from [IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93] ([IPv6:2001:983:e9a7:1:dd78:ec97:6537:dc93])
        by smtp-cloud9.xs4all.net with ESMTPA
        id vevkhs1w4AffAvevmhBakW; Thu, 08 Aug 2019 11:42:05 +0200
Subject: Re: [PATCH v4 0/3] DCMI bridge support
To:     Hugues FRUCHET <hugues.fruchet@st.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
 <28a2a9ac-d5b9-a312-616a-620e0385cf66@xs4all.nl>
 <85edd40f-68cc-13aa-52e0-6ec832bf6c2f@st.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c58613a7-a1d2-cc1b-5f94-beb2bd753e5e@xs4all.nl>
Date:   Thu, 8 Aug 2019 11:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <85edd40f-68cc-13aa-52e0-6ec832bf6c2f@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC5ACmRPuS3YAAfyW4BnQN1UU1u9dTyjgbg6D28/ejMIlmwugAn4Lgm1gsP6k6qYQh4okcjxQa6xKfGl3g7c0oahlOIl6COVcn55qS8YgJi50OtIMALk
 UpVPWPmdB93XfcDjw18IkPJNc1hzjo3yOXJKMruxlLcC3KV0RZQ6jk8V33UWiY+wtN6T15kPmbrc4MAB4D9EZuVhoTuhZOZegwHhtkpb0fT7F16op6Xg7GpY
 teNn385Qaho8zI6uA5Msq6r7aGTNVRUpNdp6E2w7iHDk4GQ53BtipOWyB+8073y1wFMhu7/DZ7CN+pyXT2CXHRcjScxinU7alz88DCGqjZdMRwsx2WmibCmM
 wA1SmNp3E74eSFzb9m9ywfUSvmkHUwAVWrRSn7qm8CdSAHwDcDGrcRznYfurxSQq7zWkwbeS7sj2bWDNKxlxWMgs1cN4Luv/QbbwAwJZlvTwzyvNyGmp7zTP
 4ibGCs6B4F7LJLLI7gvSa2anue8cejdrz8InncEcgIYdaTPCUep+igNV1lBm1u5eBHthRBUryy98B7W6AmHwN8CQt/Qlyx12zmVZbE5MiQvwJ0P+yT+7+g7p
 HlNEkD5OGeKlm/kqO2HHJF6ZQ3jKacnuCRCJnZ7lAmbqmXeYCGjjnUb0AWNbtbTMJw2R5TALI4FMwOUqeqY4i0ohHeHNZjUIM1jViP4V/IYeXpt94AyeOcec
 L5o5hrZ04iI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On 8/8/19 11:38 AM, Hugues FRUCHET wrote:
> Hi Hans,
> 
> You're welcome, here it is:
> 
> 1) v4l-utils master branch, commit 
> 6aa15f7447d4aeca6af1ed7ee9644a0c7e891ece "v4l2-ctl: fix double 
> decrementing of stream_count"
> 
> 2) Cropping test is failed as usual because of OV5640 discrete framesizes
> 
> 3) No more /dev/media* and /dev/v4l-*:
> root@stm32mp1-av96:~# ls -al /dev/video0
> crw-rw---- 1 root video 81, 0 Mar 19 17:42 /dev/video0
> root@stm32mp1-av96:~# ls -al /dev/media*
> ls: cannot access '/dev/media*': No such file or directory
> root@stm32mp1-av96:~# ls -al /dev/v4l-*
> ls: cannot access '/dev/v4l-*': No such file or directory

Good. One more question: is this tested with two subdevs? So a bridge+sensor?

Regards,

	Hans

> 
> 
> root@stm32mp1-av96:~# v4l2-compliance -s
> v4l2-compliance SHA: 6aa15f7447d4aeca6af1ed7ee9644a0c7e891ece, 32 bits
> 
> Compliance test for stm32-dcmi device /dev/video0:
> 
> Driver Info:
>          Driver name      : stm32-dcmi
>          Card type        : STM32 Camera Memory Interface
>          Bus info         : platform:dcmi
>          Driver version   : 4.19.49
>          Capabilities     : 0x85200001
>                  Video Capture
>                  Read/Write
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x05200001
>                  Video Capture
>                  Read/Write
>                  Streaming
>                  Extended Pix Format
> 
> Required ioctls:
>          test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>          test VIDIOC_QUERYCTRL: OK
>          test VIDIOC_G/S_CTRL: OK
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 18 Private Controls: 0
> 
> Format ioctls (Input 0):
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>                  fail: 
> ../../../../../../../../../sources/v4l-utils/utils/v4l2-compliance/v4l2-test-formats.cpp(1414): 
> node->frmsizes_count[pixfm
> t] > 1
>          test Cropping: FAIL
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>          test read/write: OK
>          test blocking wait: OK
>          test MMAP (no poll): OK
>          test MMAP (select): OK
>          test MMAP (epoll): OK
>          test USERPTR (no poll): OK (Not Supported)
>          test USERPTR (select): OK (Not Supported)
>          test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for stm32-dcmi device /dev/video0: 51, Succeeded: 50, Failed: 1, 
> Warnings: 0
> 
> 
> On 8/7/19 12:15 PM, Hans Verkuil wrote:
>> Hi Hugues,
>>
>> Can you provide the output of the most recent v4l2-compliance?
>>
>> Use 'v4l2-compliance -s'.
>>
>> Also, just to confirm, with this v4 there are no /dev/mediaX or
>> /dev/v4l-subdevX devices created anymore, right?
>>
>> This v4 looks good to me, I just want to have these final checks
>> done.
>>
>> Regards,
>>
>> 	Hans
>>
> 
> Best regards,
> Hugues.
> 

