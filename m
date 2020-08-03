Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2281D23A35A
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 13:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgHCLco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 07:32:44 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57871 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725945AbgHCLcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 07:32:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2YhkkOH4nywL52YhlkxJl7; Mon, 03 Aug 2020 13:32:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596454358; bh=IUtKB69KG30jF305PDTnQOHZGidF3PQ52VyItc7984s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kEAyDN4f2luXkHHOZHfZT0wzxY6W2gSNbqzfiY9X5Iqi/OgJ3Yjy5x3nm1B8aPyse
         FMwof5wTJ4dZk52ky7mFKV+AV5r5bS9eTrFOlebECwYbd2Lz2u2gkFompsaP2z7zXq
         A4hl4BMoNsh4S43nHGiKo91s52pPKlZrLbT1O5wR4IK/OF2MYQi4jpi6sKd+tQjRoz
         zEXX5ITHZIY0Rz4ATzLgfAQHRMD0o1XPlcFDSsPwDs2SsfsZJbWLvi9yH/IlA5Q7/t
         PAla4sZ6IeYUMSGg2XZ2wivId35GrKslyjDY01yOHZIVAfd6vyEZXyi1u/PJQAcsOS
         YWSHi4jTD2rjg==
Subject: Re: [RFC] METADATA design using V4l2 Request API
To:     dikshita@codeaurora.org, Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dylan Yip <dylany@xilinx.com>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
 <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
 <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
 <b866e94a-1af2-5646-9e1c-6d027d172b97@xs4all.nl>
 <3081cdd2b29eb08bc31b7e87a298b2184a57fad9.camel@ndufresne.ca>
 <78b743fc3788b73b9a3387d7d0a7a3dff7fdb9d0.camel@ndufresne.ca>
 <b7d058b1-2ad2-03df-e968-6004349038cc@xs4all.nl>
 <36a298cc54febae7237631c985c7c4d29ed3e6c4.camel@ndufresne.ca>
 <fce526f61e1a0e575f83cc45f969a55c@codeaurora.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <00834122-a45d-7fc4-2801-01e0a6e48820@xs4all.nl>
Date:   Mon, 3 Aug 2020 13:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fce526f61e1a0e575f83cc45f969a55c@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDkE7ym1GDDrGpNBcukTsC6HkrtToiipxQlg0eS/5Xr/O+cayO46DFT7OO6j+9tthUcQIV6wisL1KO2IVbH08wqO6cTezbcbNWbpnZvxJi0zHH0sTP9O
 Jye7N+3JrXgQxN7Sx9xu0BX5M5GujlDk/xuTbptPn3q9vc9BDdyygI1N8ehLXVRW4yoBBg6dREbdj5uSeTHK9qeH8UHhOsG4+IkW6xUUMAtmJlLyr1DHAskH
 CQm2MK07Dny+SHwyGFh4qTEhVtf37hzC2z1j3t8BPcUiYqh3uDX87lSYrTxvTH9Id26vzp203EDQH/nqWgYKvzUXwMrAaVQlBs5Wjvxn196kk+zD5UnZDqgQ
 Smf3/XX6i+u7eEr9WTLCF8k6LDYH7EtYUxaWlJME8MLboItBYrO8yUmfl6olhTAHIUKuRilBc9xRQXBFjZIN3SrSXIj38+A4EXDkIj0f7huSZ+WW0aFa3OE9
 FNrYMwvZSS+hsoeE/HXE/+bQLV+FXhYE4W4KXtDy/zBSQIt5nyzvSdnOtljRyZaQ2YHmb9cHSeb2r1a81pXVikxTP23SuylaYGEzO9SkKG0+uXSvauKYkNXU
 5/XhOeZgu/TXtFx9NMp/OIU1qTIrRTL8PMm6UnQ9FAbVpw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/06/2020 15:00, dikshita@codeaurora.org wrote:
> Hi Nicolas, Hans,
> 
> Thanks for your comments and sorry for the delayed response.
> 
> On 2020-06-12 22:07, Nicolas Dufresne wrote:
>> Le vendredi 12 juin 2020 à 12:05 +0200, Hans Verkuil a écrit :
>>> On 11/06/2020 17:06, Nicolas Dufresne wrote:
>>> > Le jeudi 28 mai 2020 à 22:08 -0400, Nicolas Dufresne a écrit :
>>> > > Le jeudi 28 mai 2020 à 13:24 +0200, Hans Verkuil a écrit :
>>> > > > On 28/05/2020 12:48, dikshita@codeaurora.org wrote:
>>> > > > > Hi Hans,
>>> > > > >
>>> > > > > Thanks for the review.
>>> > > > >
>>> > > > > On 2020-05-26 16:27, Hans Verkuil wrote:
>>> > > > > > Hi Dikshita,
>>> > > > > >
>>> > > > > > My apologies for the delay, this was (mostly) due to various vacation
>>> > > > > > days.
>>> > > > > >
>>> > > > > > On 08/05/2020 08:21, Dikshita Agarwal wrote:
>>> > > > > > > There are many commercialized video use cases which needs metadata
>>> > > > > > > info
>>> > > > > > > to be circulated between v4l2 client and v4l2 driver.
>>> > > > > > >
>>> > > > > > > METADATA has following requirements associated:
>>> > > > > > > •Metadata is an optional info available for a buffer. It is not
>>> > > > > > > mandatorily for every buffer.
>>> > > > > > >  For ex. consider metadata ROI (Region Of Interest). ROI is specified
>>> > > > > > > by clients to indicate
>>> > > > > > >  the region where enhanced quality is desired. This metadata is given
>>> > > > > > > as an input information
>>> > > > > > >  to encoder output plane. Client may or may not specify the ROI for a
>>> > > > > > > frame during encode as
>>> > > > > > >  an input metadata. Also if the client has not provided ROI metadata
>>> > > > > > > for a given frame,
>>> > > > > > >  it would be incorrect to take the metadata from previous frame. If
>>> > > > > > > the data and
>>> > > > > > >  metadata is asynchronous, it would be difficult for hardware to
>>> > > > > > > decide if it
>>> > > > > > >  needs to wait for metadata buffer or not before processing the input
>>> > > > > > > frame for encoding.
>>> > > > > > > •Synchronize the buffer requirement across both the video node/session
>>> > > > > > >  (incase metadata is being processed as a separate v4l2 video
>>> > > > > > > node/session).
>>> > > > > > >  This is to avoid buffer starvation.
>>> > > > > > > •Associate the metadata buffer with the data buffer without adding any
>>> > > > > > > pipeline delay
>>> > > > > > >  in waiting for each other. This is applicable both at the hardware
>>> > > > > > > side (the processing end)
>>> > > > > > >  and client side (the receiving end).
>>> > > > > > > •Low latency usecases like WFD/split rendering/game streaming/IMS have
>>> > > > > > > sub-50ms e2e latency
>>> > > > > > >  requirements, and it is not practical to stall the pipeline due to
>>> > > > > > > inherent framework latencies.
>>> > > > > > >  High performance usecase like high-frame rate playback/record can
>>> > > > > > > lead to frame loss during any pipeline latency.
>>> > > > > > >
>>> > > > > > > To address all above requirements, we used v4l2 Request API as
>>> > > > > > > interlace.
>>> > > > > > >
>>> > > > > > > As an experiment, We have introduced new control
>>> > > > > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>>> > > > > > > to contain the METADATA info. Exact controls can be finalized once the
>>> > > > > > > interface is discussed.
>>> > > > > > >
>>> > > > > > > For setting metadata from userspace to kernel, let say on encode
>>> > > > > > > output plane,
>>> > > > > > > following code sequence was followed
>>> > > > > > > 1. Video driver is registering for media device and creating a media
>>> > > > > > > node in /dev
>>> > > > > > > 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on
>>> > > > > > > media fd.
>>> > > > > > > 3. METADATA configuration is being applied on request fd using
>>> > > > > > > VIDIOC_S_EXT_CTRLS IOCTL
>>> > > > > > >    and the same request fd is added to buf structure structure before
>>> > > > > > > calling VIDIOC_QBUF on video fd.
>>> > > > > > > 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to
>>> > > > > > > driver then, as a result
>>> > > > > > >    to which METADATA control will be applied to buffer through S_CTRL.
>>> > > > > > > 5. Once control is applied and request is completed,
>>> > > > > > > MEDIA_REQUEST_IOC_REINIT IOCTL is called
>>> > > > > > >    to re-initialize the request.
>>> > > > > >
>>> > > > > > This is fine and should work well. It's what the Request API is for,
>>> > > > > > so no problems here.
>>> > > > > >
>>> > > > > > > We could achieve the same on capture plane as well by removing few
>>> > > > > > > checks present currently
>>> > > > > > > in v4l2 core which restrict the implementation to only output plane.
>>> > > > > >
>>> > > > > > Why do you need the Request API for the capture side in a
>>> > > > > > memory-to-memory driver? It is not
>>> > > > > > clear from this patch series what the use-case is. There are reasons
>>> > > > > > why this is currently
>>> > > > > > not allowed. So I need to know more about this.
>>> > > > > >
>>> > > > > > Regards,
>>> > > > > >
>>> > > > > >     Hans
>>> > > > > >
>>> > > > > we need this for use cases like HDR10+ where metadata info is part of
>>> > > > > the bitstream.
>>> > > > > To handle such frame specific data, support for request api on capture
>>> > > > > plane would be needed.
>>> > > >
>>> > > > That's for the decoder, right? So the decoder extracts the HDR10+ metadata
>>> > > > and fills in a control with the metadata?
>>> > > >
>>> > > > If that's the case, then it matches a similar request I got from mediatek.
>>> > > > What is needed is support for 'read-only' requests: i.e. the driver can
>>> > > > associate controls with a capture buffer and return that to userspace. But
>>> > > > it is not possible to *set* controls in userspace when queuing the request.
>>> > > >
>>> > > > If you think about it you'll see that setting controls in userspace for
>>> > > > a capture queue request makes no sense, but having the driver add set
>>> > > > read-only controls when the request is finished is fine and makes sense.
> 
> I tried an experiment where I removed set control from the client for metadata,
> queued buffer and request to driver and when capture buffer was ready, I dequeued the buffer,
> extracted the request fd and called get_ext_control IOCTL on driver.
> this resulted in error from https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ctrls.c#L3678
> based on what I understood, since there was no set control for the request,
> there was no v4l2 ctrl handler object associated with it so no obj was found and
> hence the error(please correct if my understanding is wrong).
> 
> So if client is not supposed to call set control on capture plane then
> 1. how to avoid the above error?
> 2. should driver call v4l2_s_ext_ctrls() with the request once buffer and request are
>    queued to driver? Driver should be able to extract the request fd from request to
>    achieve the same right? is that possible?

It's a bug. This RFC series provides a fix:

https://patchwork.linuxtv.org/project/linux-media/cover/20200728094851.121933-1-hverkuil-cisco@xs4all.nl/

> 
>>> > >
>>> > > Hi Hans,
>>> > >
>>> > > I'm not sure I follow you on what will this look like in userspace. Can you post
>>> > > an RFC of your idea, describing the userspace flow ? Particularly, I'm not sure
>>> > > how the request helps in synchronizing the read of the metadata controls (over
>>> > > simply reading the control after a DQBUF, which we can match to a specific input
>>> > > using the provided timestamp). I also fail to understand how this aligns with
>>> > > Stanimir concern with the performance of the get control interface.
>>>
>>> Hmm, I think I missed this email.
>>>
>>> Note that there is no guarantee that reading a control after a DQBUF will give
>>> you the value for that dequeued frame. The driver may already have generated
>>> multiple capture frames by the time userspace dequeues the oldest buffer.
>>>
>>> > As there was no answer, I'll try and ask a more precise question. While
>>> > I still believe it's better done in userspace for M2M decoder, there is
>>> > a need for HDMI receivers (hence adding direct CC to Dylan Yip from
>>> > Xilinx).
>>> >
>>> > Would this match your expected userspace workflow ?
>>> >
>>> > 1. Allocate capture buffers
>>> > 2. Allocate the same number of request fd (ro request)
>>> > 3. For each capture buffer
>>> >   3.1 Queue the capture buffer (passing the request)
>>> >   3.2 Queue the request
>>> > 4. Wait for capture buffer to be ready
>>> > 5. Dequeue a capture buffer, and lookup it's request FD
>>> > 6. Wait for the request to complete (needed ?)
>>> > 7. Read the meta control passing the request
>>>
>>> Right.
>>>
>>> > I'm not sure if 6. is required, driver could just to things in the
>>> > right order (store the meta in the request before marking the buffer
>>> > done).
>>>
>>> For HDR information you don't need 6. For histogram/statistics such
>>> information might become available after the capture buffer was ready.
>>>
>>> I would just implement this as follows:
>>>
>>> 4. Wait for the request to complete
>>
>> I should have clarified my thought, I first wrote it like this, but
>> then realized that it forces the driver into picking up capture buffer
>> in the same order they were queued. For an encoder, it might be a
>> problem as in practice it does not encode in the same order it will
>> produce (I think this depends on internal encoder implementation
>> details though).
>>
>> So in fact, I was waiting on the queue, to pop a Capture buffer to
>> figure-out which request was being involved. And then I'd get the
>> control value for that request (which may need waiting further on the
>> request, the "heavy" reference is there).
>>
>> But I think we can assume this is all in order for HDMI/SDI/CSI capture
>> (well raw/bayer capture mostly) and keep it a bit more lightweight
>> there.
>>
>>> 5. Dequeue a capture buffer, and lookup it's request FD
>>> 6. Read the meta control passing the request
>>>
>>> No need to wait for both the request and the capture buffer.
>>
>> Ack.
> 
> The sequence which I followed for implementing this is.
>  1. Allocate capture buffers
>  2. Allocate the same number of request fd
>  3. For each capture buffer
>     3.1 call VIDIOC_S_EXT_CTRLS IOCTL to the driver with metadata info and request fd
>     3.2 Queue the capture buffer (passing the request)
>     3.3 Queue the request
> 4. Wait for capture buffer to be ready
> 5. Dequeue a capture buffer, and lookup it's request FD
> 6. Call VIDIOC_G_EXT_CTRLS passing the request for the dequeued buffer.
> 
> Qualcomm H/W generates both data buffer and metadata buffer at the same time and
> provides this info to the driver in a single response, there won't be separate responses for
> data buffer and metadata buffer.
> so there is no need to wait for request completion.
> The driver will write meta info in the control before sending buffer done to the client.
> so when the buffer is available for deque, meta info will also be available.
> 
> but I agree that the wait for the request might be required for HW that generates
> data buffer and metadata buffer separately.

It is safer to wait for the request event rather than assuming knowledge of
the driver implementation.

> 
>>>
>>>  Now this is pretty heavy, but does not seems broken. The
>>> > question is how to you avoid reading the control if it haven't changed
>>> > ? Can driver guaranty to send the control change event before marking a
>>> > buffer done ? (this is for static HDR meta, which will change when
>>> > stream is change, e.g. starting/ending of adds on TV).
>>>
>>> There are two possible mechanisms today:
>>>
>>> 1) use requests for the capture queue, and then you need to query the
>>> request for the static HDR control. The advantage is that this is a
>>> 1-to-1 mapping of the control value with the buffer. The disadvantage is that
>>> it adds overhead.
> 
> Since we need 1-to-1 mapping of buffer and metadata info using this approach for
> capture queue as well should be fine, right? or there are any concerns?

Yes, that should be fine (you'd use read-only requests for this, as per the
RFC series linked to above).

> 
>>>
>>> 2) don't use requests, instead just subscribe to the control event.
>>> Whenever the static HDR meta data changes, you'll get an event. But
>>> then it isn't linked to a specific frame.
>>>
>>> A third option would be to extend struct v4l2_event_ctrl with a __u32
>>> buffer_index field to associate a capture buffer with this change. You'd
>>> need an addition control flag as well to indicate that this control is
>>> associated with a specific buffer.
>>>
>>> (Just a brainstorm, this no doubt would need some refinement)
>>
>> Or extend with a target sequence number, as we already have this unique
>> number handy.
>>
>> In fact I was already thinking about extending the event with a target
>> v4l2_buffer sequence. But then I realized that if you have two
>> consecutive changes, there is still no way to ensure you can read the
>> control value matching the event you are processing.
>>
>> So this idea would conceptually mean that instead of using the
>> "request" as a control storage, we'd be using per "buffer" control
>> storage. I wonder how realistic this is in the existing framework. But
>> could be a thread to explore.
>>
>> To add to the brainstorm, we could introduce a meta type for controls.
>> Can't think of a name now, but basically we would "pop" a control
>> value. That control would contain the information needed to identify
>> the buffer it applied to (like a sequence number). Fifo would be leaky
>> at the tail, and sized around the size of the queue. This way,
>> userspace can ignore it without causing any leaks, which also allow for
>> backward compatibility.
>>
>> The "pop" ioctl could be extended with the target sequence number, so
>> that you get exactly the control you are looking for (ignoring the
>> older one, and preventing the newer one from being extracted). Of
>> course, the event is needed to tel when something get queued for static
>> meta.
>>
>>>
>>>  While for HDR10+
>>> > and similar dynamic meta, we expect a new value for every run, HDR10+
>>> > data is much much bigger. Do we really want that to be model around a
>>> > control ?
>>>
>>> No, we don't. For that you would want a metadata video device.
>>>
>>> Dynamic metadata is a separate problem. I would also really like to know
>>> a bit more about the various HW implementations for this before deciding
>>> on a specific API. E.g., can all HW pass this data to a separate DMA engine?
>>> Would it only split off dynamic metadata or just all InfoFrames?
> 
> Qualcomm HW has a single DMA engine that stores both data and metadata buffer and
> the driver is notified by HW in a single response with both data buffer and metadata buffer.

Are the video data and meta data buffers separate? Or are they all dumped in one
buffer? How does the HW know how many bytes should be reserved for the metadata?
Is there a hardware limit?

> So using a request based approach for HDR10+ metadata or any dynamic data as well should be fine?

Not quite sure what you mean. A request based approach is certainly valid, but
do you want to use a control for the dynamic metadata or a video device?

I would prefer the latter. But that also assumes that the video and metadata
arrive in different buffers.

Regards,

	Hans

> 
> If not, what could be the other way to achieve this?
> 
>>
>> That seems like a HW question, I'll pass. Though, in my mind, the
>> separated metadata video device are only usable if there is a 1:1
>> relationship between buffers and metadata. For other use cases, it's
>> missing a notification mechanism (like described above) to avoid having
>> to introduce arbitrary (and likely bogus) latency that ensure we didn't
>> proceed without the associate metadata. To I think it's not a very
>> powerful way to pass around metadata, unless it's 1:1 with the buffers,
>> which for HDR10+ fits.
>>
>>>
>>> Regards,
>>>
>>>     Hans
>>>
>>> > > > Implementing this shouldn't be a big job: you'd need a new
>>> > > > V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
>>> > > > capability, a corresponding new flag in struct vb2_queue, a new ro_requests
>>> > > > flag in
>>> > > > struct v4l2_ctrl_handler, and try_set_ext_ctrls() should check that flag and
>>> > > > refuse to
>>> > > > try/set any controls if it is true.
>>> > > >
>>> > > > Finally, the v4l2_m2m_qbuf() function should be updated to just refuse the
>>> > > > case where both
>>> > > > capture and output queue set V4L2_BUF_CAP_SUPPORTS_REQUESTS.
>>> > > >
>>> > > > And the documentation needs to be updated.
>>> > > >
>>> > > > I've added Yunfei Dong to the CC list, perhaps mediatek did some work on
>>> > > > this already.
>>> > > >
>>> > > > Regards,
>>> > > >
>>> > > >     Hans
>>> > > >
>>> > > > > Thanks,
>>> > > > > Dikshita
>>> > > > > > > We profiled below data with this implementation :
>>> > > > > > > 1. Total time taken ( round trip ) for setting up control data on
>>> > > > > > > video driver
>>> > > > > > >    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
>>> > > > > > > 2. Time taken for first QBUF on Output plane to reach driver with
>>> > > > > > > REQUEST API enabled (One way): 723us
>>> > > > > > > 3. Time taken for first QBUF on Output plane to reach driver without
>>> > > > > > > REQUEST API (One way) : 250us
>>> > > > > > > 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST
>>> > > > > > > API enabled :
>>> > > > > > >     a. VIDIOC_S_EXT_CTRLS : 201us
>>> > > > > > >     b. VIDIOC_QBUF : 92us
>>> > > > > > >     c. MEDIA_REQUEST_IOC_QUEUE: 386us
>>> > > > > > >
>>> > > > > > > Kindly share your feedback/comments on the design/call sequence.
>>> > > > > > > Also as we experimented and enabled the metadata on capture plane as
>>> > > > > > > well, please comment if any issue in
>>> > > > > > > allowing the metadata exchange on capture plane as well.
>>> > > > > > >
>>> > > > > > > Reference for client side implementation can be found at [1].
>>> > > > > > >
>>> > > > > > > Thanks,
>>> > > > > > > Dikshita
>>> > > > > > >
>>> > > > > > > [1]
>>> > > > > > > https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
>>> > > > > > >
>>> > > > > > > Dikshita Agarwal (3):
>>> > > > > > >   Register for media device
>>> > > > > > >     - Initialize and register for media device
>>> > > > > > >     - define venus_m2m_media_ops
>>> > > > > > >     - Implement APIs to register/unregister media controller.
>>> > > > > > >   Enable Request API for output buffers
>>> > > > > > >     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
>>> > > > > > >     - Initialize vb2 ops buf_out_validate and buf_request_complete.
>>> > > > > > >     - Add support for custom Metadata control
>>> > > > > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>>> > > > > > >     - Implemeted/Integrated APIs for Request setup/complete.
>>> > > > > > >   Enable Request API for Capture Buffers
>>> > > > > > >
>>> > > > > > >  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
>>> > > > > > >  drivers/media/platform/Kconfig                  |   2 +-
>>> > > > > > >  drivers/media/platform/qcom/venus/core.h        |  36 ++++
>>> > > > > > >  drivers/media/platform/qcom/venus/helpers.c     | 247
>>> > > > > > > +++++++++++++++++++++++-
>>> > > > > > >  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
>>> > > > > > >  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
>>> > > > > > >  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
>>> > > > > > >  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
>>> > > > > > >  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
>>> > > > > > >  include/media/v4l2-ctrls.h                      |   1 +
>>> > > > > > >  include/media/venus-ctrls.h                     |  22 +++
>>> > > > > > >  11 files changed, 465 insertions(+), 13 deletions(-)
>>> > > > > > >  create mode 100644 include/media/venus-ctrls.h
>>> > > > > > >

