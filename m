Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D8A59DB0
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfF1OZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:25:36 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49665 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726657AbfF1OZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:25:36 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id groghmkzvSfvXgrojhSKck; Fri, 28 Jun 2019 16:25:34 +0200
Subject: Re: [PATCH v2 00/11] Venus stateful Codec API
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
 <9c3399a8-4fc6-3117-10ee-3395cee034da@xs4all.nl>
 <997204c7-c702-868c-9a49-52fefc9ab3d2@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eba506ce-4d63-649a-80e6-efad20125263@xs4all.nl>
Date:   Fri, 28 Jun 2019 16:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <997204c7-c702-868c-9a49-52fefc9ab3d2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP4U0sffZFgGGIjkmEosNs6f8o7NOxHPyMVsD+CxZXiAQGf73FZsgd7fjOZUeonrrYp06FI1VKvQgVZPLQJwpSyEVCBQPquDAvfI+bXMAQr4ZY9SIX65
 tn01Ckgk+ig51I7C58IE97XClt/1iWtq3bMOiH+KUCHlWeBTO33Xo8OA3w6Cha7j3iDHCLiKClFQf8jQ6cZ1ewCZ+u4mufTc+QUz4f0XL8ZjlokPZvwA0wEE
 ARGUB13+yYMC5oCvBn03IdESqlKGVadj4izCPOUTvcOxuMp2w/cyvXGrrQnVngAEdJMklvcia0QHMKKPCN9MvtcX29gVqhgXeV6ifLKc5+6Hniwabv1pjVJE
 g6KtR9uU73bqfDnII6h+70q8wHtgyHxKVzFDOVRvY6ttHOqW38r8fnEz3tcsGjE3p3Ik7vlB5qh7tn80drLUbY/yhP50Vg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/19 4:23 PM, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 6/28/19 4:37 PM, Hans Verkuil wrote:
>> On 6/28/19 2:59 PM, Stanimir Varbanov wrote:
>>> Hello,
>>>
>>> Here is v2 of the Venus transition to stateful codec API
>>> compliance. The v2 can be found at [1].
>>>
>>> Changes since v1:
>>>  * codec_state is now enum
>>>  * dropped IS_OUT and IS_CAP macros and use vb2_start_streaming_called()
>>>  * corrected g_fmt and reconfig logic
>>>  * s/vdec_dst_buffers_done/vdec_cancel_dst_buffers
>>>  * use v4l2_m2m_ioctl_try_decoder_cmd M2M helper
>>>  * various fixes to make v4l2-compliance pass the streaming test
>>>
>>> To test the streaming with --stream-from-hdr v4l2-compliance option I have
>>> to make the following hack (it is needed because the size of decoder input
>>> buffers (OUTPUT queue) is not enough for the h264 bitstream, i.e the driver
>>> default resolution is 64x64 but the h264 stream is 320x240):
>>>
>>> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> index c71dcf65b721..dc0fcf20d3e4 100644
>>> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
>>> @@ -1294,6 +1294,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>>>                                         fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>>>                         }
>>>                         fail_on_test(q.create_bufs(node, 1, &fmt));
>>> +
>>> +                       for (unsigned p = 0; p < fmt.g_num_planes(); p++)
>>> +                               fmt.s_sizeimage(fmt.g_sizeimage(p) * 2, p);
>>> +                       node->s_fmt(fmt);
>>> +
>>>                         fail_on_test(q.reqbufs(node, 2));
>>>                 }
>>>                 if (v4l_type_is_output(type))
>>
>> Does the venus driver set sizeimage based on the given output resolution?
> 
> Yes.
> 
>>
>> E.g. if v4l2-compliance would first set the output resolution to 320x240,
>> is the returned sizeimage value OK in that case?
> 
> Yes.
> 
> Here are few options to me:
>  - set the correct resolution
>  - set 0x0 and sizeimage at some arbitrary value (1 or 2MB). Despite if
> the bitstream is 4K it will not be enough if the bitrate is huge.
>  - invent some mechanism to trigger reconfiguration on the OUTPUT queue
> as well (similar to the CAPTURE queue)
> 
>>
>> And this also means that the venus driver requires each buffer to have
>> a single compressed frame, right? I.e. it can't be spread over multiple
>> OUTPUT buffers.
> 
> I cannot say for sure but that is how all downstream cases uses it i.e.
> one compressed frame per input buffer. I wonder if you fill input
> decoder buffer with many compressed frames in one input decoder buffer
> how you pass the timestamp for every packet?
> 
>>
>> We really need to let userspace know about such restrictions.
>>
>> Stanimir, can you list the restrictions of the decoder for the various
>> codecs?
> 
> What you mean? Restrictions like "one compressed frame per input buffer"?
> 

Yes :-)

Regards,

	Hans
