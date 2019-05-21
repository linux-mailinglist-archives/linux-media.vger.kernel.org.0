Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA89C24EEB
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 14:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfEUM1f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 08:27:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59143 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbfEUM1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 08:27:35 -0400
Received: from [IPv6:2001:420:44c1:2579:1066:b00f:a986:b5ce] ([IPv6:2001:420:44c1:2579:1066:b00f:a986:b5ce])
        by smtp-cloud7.xs4all.net with ESMTPA
        id T3rbh21ur3qlsT3rfhtxFC; Tue, 21 May 2019 14:27:32 +0200
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org>
 <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org>
 <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
 <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl>
Date:   Tue, 21 May 2019 14:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP9bAukXy5w9F+0DSaJeryRUlQHgly/WAZNpSOm5vDrb5wQN6Tp+5l4syU+U0MtYFPNMhu99vp6ZC77Wmop+slCcF5GhXSjfhZxHmgSAhDp1qV2foHIw
 b+siH/56q9y/8iMro4xbAfxiUxpc0bH7MxH3cU+KcfuT5OxEFn+2kEgM1FzpKBoUbuoP91KC/MlMuhgmbR0sL/a8lxvx2hb5tRSJ86Tka7eaM5F1l/OPGonT
 rmXwRF/7jNaKWJAaSODHUuKMld3MUdu8o3D/43RE0eWGbal4srwMWph5Kbc0znzB62DkRscG0V1Z4Q4UBw7wCPhYCuJ2LFPMfasePRQOi9ISP6yYPMcfUMxu
 NIOs3wOXcxbvGSz6XsRLem45JZxt6KuLFzFj4XfUd8ocTRDLbRaEFaOyVNikLmbzEyKaXr0qumoxKLtQaeikQYHzCGVzOomp73kCtxdkwWTQHxAtov4bjuma
 XApR+XB++T5PBCkWf5j2Oia41FnSmqnuGfFs98W32MMA6gbXTu0tUcmOV0R4JTAky+3jyzY3bYpSVtmPu+jbdzVDg87U2ToKqEJDOktskx3CUzwJ2Ch/bcXC
 SSs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/21/19 11:09 AM, Tomasz Figa wrote:
> Hi Stan,
> 
> On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Tomasz,
>>
>> On 4/24/19 3:39 PM, Tomasz Figa wrote:
>>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
>>> <stanimir.varbanov@linaro.org> wrote:
>>>>
>>>> Hi Hans,
>>>>
>>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
>>>>> Hi Stanimir,
>>>>>
>>>>> I never paid much attention to this patch series since others were busy
>>>>> discussing it and I had a lot of other things on my plate, but then I heard
>>>>> that this patch made G_FMT blocking.
>>>>
>>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
>>>> is received that the stream is parsed and the resolution is correctly
>>>> set by application. Just to note that I'd think to this like a temporal
>>>> solution until gstreamer implements v4l events.
>>>>
>>>> Is that looks good to you?
>>>
>>> Hmm, I thought we concluded that gstreamer sets the width and height
>>> in OUTPUT queue before querying the CAPTURE queue and so making the
>>> driver calculate the CAPTURE format based on what's set on OUTPUT
>>> would work fine. Did I miss something?
>>
>> Nobody is miss something.
>>
>> First some background about how Venus implements stateful codec API.
>>
>> The Venus firmware can generate two events "sufficient" and
>> "insufficient" buffer requirements (this includes decoder output buffer
>> size and internal/scratch buffer sizes). Presently I always set minimum
>> possible decoder resolution no matter what the user said, and by that
>> way I'm sure that "insufficient" event will always be triggered by the
>> firmware (the other reason to take this path is because this is the
>> least-common-divider for all supported Venus hw/fw versions thus common
>> code in the driver). The reconfiguration (during codec Initialization
>> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
>> re-configuration happen I need to wait for "insufficient" event from
>> firmware in order to know the real coded resolution.
>>
>> In the case of gstreamer where v4l2_events support is missing I have to
>> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
>> STREAMON(CAPTURE) (vb2::start_streaming).
>>
>> I tried to set the coded resolution to the firmware as-is it set by
>> gstreamer but then I cannot receive the "sufficient" event for VP8 and
>> VP9 codecs. So I return back to the solution with minimum resolution above.
>>
>> I'm open for suggestions.
> 
> I think you could still keep setting the minimum size and wait for the
> "insufficient" event. At the same time, you could speculatively
> advertise the expected "sufficient" size on the CAPTURE queue before
> the hardware signals those. Even if you mispredict them, you'll get
> the event, update the CAPTURE resolution and send the source change
> event to the application, which would then give you the correct
> buffers. Would that work for you?

As I understand it this still would require event support, which gstreamer
doesn't have.

I think it is OK to have REQBUFS sleep in this case. However, I would only
enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
event. That's easy enough to check in the driver. And that means that if the
application is well written, then the driver will behave in a completely
standard way that the compliance test can check.

Regards,

	Hans
