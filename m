Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C3D4BFE38
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 17:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbiBVQNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 11:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiBVQNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 11:13:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B017C165C29
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:13:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A38A61665
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 16:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253F0C340EB;
        Tue, 22 Feb 2022 16:13:16 +0000 (UTC)
Message-ID: <1a642717-126b-f059-1983-e09248679ef4@xs4all.nl>
Date:   Tue, 22 Feb 2022 17:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Venus v4l2-compliance failures
Content-Language: en-US
To:     Fritz Koenig <frkoenig@chromium.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
 <fff5d698-99b3-3d92-5fc3-23e217554a79@xs4all.nl>
 <CAMfZQbwRc0vcbzC42bYYASc_L0Sh+MizPH-LvrURBprNTao90w@mail.gmail.com>
 <ff8c7cf1-3c96-2ba0-2c42-ad1557e7bcea@xs4all.nl>
 <CAMfZQbx6LrDqR_gT_u92TmKnegW_-G=PsvK4kjZVSgaEQeF0_Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAMfZQbx6LrDqR_gT_u92TmKnegW_-G=PsvK4kjZVSgaEQeF0_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2/22/22 17:11, Fritz Koenig wrote:
> Hi Hans,
> 
> On Tue, Feb 22, 2022 at 10:50 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Fritz,
>>
>> On 2/22/22 16:10, Fritz Koenig wrote:
>>> On Thu, Feb 17, 2022 at 9:35 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> On 17/02/2022 15:12, Stanimir Varbanov wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Presently we have two failures while running v4l2-compliance on venus
>>>>> stateful decoder:
>>>>>
>>>>> 1. fail: v4l2-compliance.cpp(753): !ok
>>>>>         test for unlimited opens: FAIL
>>>>>
>>>>> 2. fail: v4l2-test-formats.cpp(1668): IS_DECODER(node)
>>>>>         test Cropping: FAIL
>>>>>    fail: v4l2-test-codecs.cpp(104): node->function !=
>>>>> MEDIA_ENT_F_PROC_VIDEO_DECODER
>>>>>         test VIDIOC_(TRY_)DECODER_CMD: FAIL
>>>>>
>>>>> Failure #1 is related to the limitation we made in decoder open(). The
>>>>> maximum parallel decoding sessions is limited to 16 and the check
>>>>> for this maximum is made in decoder open() because the clients wanted to
>>>>> know that earlier. For example, Chromium browser can open 16 hw
>>>>> accelerated decoder sessions (in separate Tabs) and from 17 and upward
>>>>> it will fallback to sw decoder. I wonder how that failure can be fixed.
>>>>
>>>> I'm wondering if this isn't better done via a read-only control that
>>>> reports the max number of parallel sessions.
>>>>
>>> Do you see this as a constant value?  It would be burdensome if the
>>> client had to keep track of how many contexts are in use.  Or do you
>>> see this as a number of currently available contexts?
>>
>> I haven't really thought about it. It probably depends on the HW design:
>> i.e. it might be a hard limit as per the number of instances, or more
>> of a resource (bandwidth/memory) limitation that also depends on the
>> bitrate etc. From what I gather it is a hard limit to the number of
>> instances in the case of the venus driver. So here it would be a read-only
>> control that has a constant value.
>>
> I might be misunderstanding you here.  In my mind a constant value
> read-only control would be difficult to use with a multiprocess
> system.  The client would read how many contexts could be open, but
> wouldn't be easily able to track how many are currently in use.
> 
> I see a control that could return the number of contexts currently in
> use, and the maximum number available.  I think that would be
> preferable to a control that only returns the number of currently
> available contexts.  But maybe that is a nuance of the client or the
> driver doing the subtraction.

Yes, that's actually what I had in mind. A read-only control that
reports the number of instances in use, and the maximum value (as
returned by QUERYCTRL) would be the max number of instances.

Regards,

	Hans

> 
> -Fritz
> 
>>>
>>>> I really hate artificial open() limitations, it's very much against the
>>>> v4l2 philosophy.
>>>>
>>> From a client stand point it just seems like extra round trips.
>>> Everytime the device is opened another call needs to be made right
>>> away to check and see if there are resources available.
>>>
>>> If that's the philosophy, the client can adapt.  If the control was
>>> queried and it returned 0 for the number of available contexts, then
>>> the handle could be closed and then a sw codec could be used instead.
>>>
>>>> Reporting it with a standard control makes it also much easier for software
>>>> to anticipate when it needs to switch to SW en/decoding.
>>>>
>>> I think you are talking about the codec controls[1], correct? I didn't
>>> see an existing control present that would report the number of
>>> currently open contexts and/or the number of maximum contexts.
>>
>> Yes, this would be a new codec control.
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> [1]: https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-codec.html
>>>>>
>>>>>
>>>>> Failure #2 is related to a commit [1] which add checks for
>>>>> MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
>>>>> for stateless encoders (Request API) but Venus driver has no use of
>>>>> media-controller API. Did I miss something?
>>>>
>>>> For item 2, can you try the patch below?
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>>> -----------------------------------------------------------------------
>>>>
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> ---
>>>> diff --git a/utils/v4l2-compliance/v4l2-test-codecs.cpp b/utils/v4l2-compliance/v4l2-test-codecs.cpp
>>>> index 22175eef..3f06070f 100644
>>>> --- a/utils/v4l2-compliance/v4l2-test-codecs.cpp
>>>> +++ b/utils/v4l2-compliance/v4l2-test-codecs.cpp
>>>> @@ -29,9 +29,10 @@ int testEncoder(struct node *node)
>>>>  {
>>>>         struct v4l2_encoder_cmd cmd;
>>>>         bool is_encoder = node->codec_mask & (STATEFUL_ENCODER | JPEG_ENCODER);
>>>> +       bool is_stateless_encoder = node->codec_mask & STATELESS_ENCODER;
>>>>         int ret;
>>>>
>>>> -       if (IS_ENCODER(node))
>>>> +       if (is_stateless_encoder)
>>>>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_ENCODER);
>>>>         memset(&cmd, 0xff, sizeof(cmd));
>>>>         memset(&cmd.raw, 0, sizeof(cmd.raw));
>>>> @@ -98,9 +99,10 @@ int testDecoder(struct node *node)
>>>>  {
>>>>         struct v4l2_decoder_cmd cmd;
>>>>         bool is_decoder = node->codec_mask & (STATEFUL_DECODER | JPEG_DECODER);
>>>> +       bool is_stateless_decoder = node->codec_mask & STATELESS_DECODER;
>>>>         int ret;
>>>>
>>>> -       if (IS_DECODER(node))
>>>> +       if (is_stateless_decoder)
>>>>                 fail_on_test(node->function != MEDIA_ENT_F_PROC_VIDEO_DECODER);
>>>>         memset(&cmd, 0xff, sizeof(cmd));
>>>>         memset(&cmd.raw, 0, sizeof(cmd.raw));
