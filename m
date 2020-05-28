Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BC61E5E2D
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 13:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388314AbgE1LYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 07:24:50 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38101 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388198AbgE1LYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 07:24:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id eGePjURnAdPgTeGeTj3eDH; Thu, 28 May 2020 13:24:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590665086; bh=zkoZkOP9/Yld/uRYcymzjoOsuo33r6zxyrm9m+Wec8E=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rBsejXAhy/oRSe+cx3BReZ0+jRDme52jJXKUlYoAEgrqr8rDAQySyZNckg15tJDEF
         5DxyiTuMUEyfKLCMJ0VNNh5HSnm/tQVK1/tfFgbvoT0PD/tow0b/K4IndJo2Bm6qTD
         5DXzMLFK/Qcs+qqpMbnQMwFYldClRnLF9w54ad5DhVEYlLxNlx89WwXuasLphXyWIk
         ejHDcdAXXC5dwfd/L5joRv3/zfjshf2qpg3l1n5Jur99XW28xU+QMXpVReXXmWzc2Y
         tCD9umwbWcKKTgcrxaK/gVO6kwK5miXeBOXc7X2PPluAzHYlrpiTltA2luFzdvmhsm
         Os2js8fzFo10A==
Subject: Re: [RFC] METADATA design using V4l2 Request API
To:     dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Yunfei Dong <yunfei.dong@mediatek.com>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
 <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
 <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b866e94a-1af2-5646-9e1c-6d027d172b97@xs4all.nl>
Date:   Thu, 28 May 2020 13:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNNSHJAQt+GoBdu65BZAYfVWWaLfQ0OZ3MxfGe8nqvIcTh1jkUPMv2NfXicmJumgdr+vT/zFw2OMyvLVn06pz6z2TURWWnhL2YBnFiCNT0aNSLGurR+H
 5meUSF4PAdey3V2WcBQvUmMzS1ATA1H59kQ5cBmLgnsvihaXkWCVQyzSlNSVWW1Rx2AylGgSknQRhqd1QUtJ3TqwU0TU/zSTm+QPVbwFeD25/42CGP9fHwVv
 Ir7YLYEMRPxSlQufbcDQMEyLbTtLroVe3NKlkj2R04piyyyIVRYdO/hQmAprvwhMph5ZDBYspzSsrTtKjvWqjmwYIikyVl5Vhkhj6DJi0E7bJ+CdxjP2cQFp
 el0INBTdvz3OcmDzUSD+MlyCQSrNdinyQ88B/peO25zwTEddaH6NI932svrPoNW+RAGQTXrMxt6eg0W3/PNYlxQNcxPmTbi8we8BTvAHFH4SIzisyi5KkLfP
 AuFBYnqOihtAihcB
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/05/2020 12:48, dikshita@codeaurora.org wrote:
> Hi Hans,
> 
> Thanks for the review.
> 
> On 2020-05-26 16:27, Hans Verkuil wrote:
>> Hi Dikshita,
>>
>> My apologies for the delay, this was (mostly) due to various vacation 
>> days.
>>
>> On 08/05/2020 08:21, Dikshita Agarwal wrote:
>>> There are many commercialized video use cases which needs metadata 
>>> info
>>> to be circulated between v4l2 client and v4l2 driver.
>>>
>>> METADATA has following requirements associated:
>>> •Metadata is an optional info available for a buffer. It is not 
>>> mandatorily for every buffer.
>>>  For ex. consider metadata ROI (Region Of Interest). ROI is specified 
>>> by clients to indicate
>>>  the region where enhanced quality is desired. This metadata is given 
>>> as an input information
>>>  to encoder output plane. Client may or may not specify the ROI for a 
>>> frame during encode as
>>>  an input metadata. Also if the client has not provided ROI metadata 
>>> for a given frame,
>>>  it would be incorrect to take the metadata from previous frame. If 
>>> the data and
>>>  metadata is asynchronous, it would be difficult for hardware to 
>>> decide if it
>>>  needs to wait for metadata buffer or not before processing the input 
>>> frame for encoding.
>>> •Synchronize the buffer requirement across both the video node/session
>>>  (incase metadata is being processed as a separate v4l2 video 
>>> node/session).
>>>  This is to avoid buffer starvation.
>>> •Associate the metadata buffer with the data buffer without adding any 
>>> pipeline delay
>>>  in waiting for each other. This is applicable both at the hardware 
>>> side (the processing end)
>>>  and client side (the receiving end).
>>> •Low latency usecases like WFD/split rendering/game streaming/IMS have 
>>> sub-50ms e2e latency
>>>  requirements, and it is not practical to stall the pipeline due to 
>>> inherent framework latencies.
>>>  High performance usecase like high-frame rate playback/record can 
>>> lead to frame loss during any pipeline latency.
>>>
>>> To address all above requirements, we used v4l2 Request API as 
>>> interlace.
>>>
>>> As an experiment, We have introduced new control 
>>> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>>> to contain the METADATA info. Exact controls can be finalized once the 
>>> interface is discussed.
>>>
>>> For setting metadata from userspace to kernel, let say on encode 
>>> output plane,
>>> following code sequence was followed
>>> 1. Video driver is registering for media device and creating a media 
>>> node in /dev
>>> 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on 
>>> media fd.
>>> 3. METADATA configuration is being applied on request fd using 
>>> VIDIOC_S_EXT_CTRLS IOCTL
>>>    and the same request fd is added to buf structure structure before 
>>> calling VIDIOC_QBUF on video fd.
>>> 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to 
>>> driver then, as a result
>>>    to which METADATA control will be applied to buffer through S_CTRL.
>>> 5. Once control is applied and request is completed, 
>>> MEDIA_REQUEST_IOC_REINIT IOCTL is called
>>>    to re-initialize the request.
>>
>> This is fine and should work well. It's what the Request API is for,
>> so no problems here.
>>
>>>
>>> We could achieve the same on capture plane as well by removing few 
>>> checks present currently
>>> in v4l2 core which restrict the implementation to only output plane.
>>
>> Why do you need the Request API for the capture side in a
>> memory-to-memory driver? It is not
>> clear from this patch series what the use-case is. There are reasons
>> why this is currently
>> not allowed. So I need to know more about this.
>>
>> Regards,
>>
>> 	Hans
>>
> we need this for use cases like HDR10+ where metadata info is part of 
> the bitstream.
> To handle such frame specific data, support for request api on capture 
> plane would be needed.

That's for the decoder, right? So the decoder extracts the HDR10+ metadata
and fills in a control with the metadata?

If that's the case, then it matches a similar request I got from mediatek.
What is needed is support for 'read-only' requests: i.e. the driver can
associate controls with a capture buffer and return that to userspace. But
it is not possible to *set* controls in userspace when queuing the request.

If you think about it you'll see that setting controls in userspace for
a capture queue request makes no sense, but having the driver add set
read-only controls when the request is finished is fine and makes sense.

Implementing this shouldn't be a big job: you'd need a new V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
capability, a corresponding new flag in struct vb2_queue, a new ro_requests flag in
struct v4l2_ctrl_handler, and try_set_ext_ctrls() should check that flag and refuse to
try/set any controls if it is true.

Finally, the v4l2_m2m_qbuf() function should be updated to just refuse the case where both
capture and output queue set V4L2_BUF_CAP_SUPPORTS_REQUESTS.

And the documentation needs to be updated.

I've added Yunfei Dong to the CC list, perhaps mediatek did some work on
this already.

Regards,

	Hans

> 
> Thanks,
> Dikshita
>>>
>>> We profiled below data with this implementation :
>>> 1. Total time taken ( round trip ) for setting up control data on 
>>> video driver
>>>    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
>>> 2. Time taken for first QBUF on Output plane to reach driver with 
>>> REQUEST API enabled (One way): 723us
>>> 3. Time taken for first QBUF on Output plane to reach driver without 
>>> REQUEST API (One way) : 250us
>>> 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST 
>>> API enabled :
>>>     a. VIDIOC_S_EXT_CTRLS : 201us
>>>     b. VIDIOC_QBUF : 92us
>>>     c. MEDIA_REQUEST_IOC_QUEUE: 386us
>>>
>>> Kindly share your feedback/comments on the design/call sequence.
>>> Also as we experimented and enabled the metadata on capture plane as 
>>> well, please comment if any issue in
>>> allowing the metadata exchange on capture plane as well.
>>>
>>> Reference for client side implementation can be found at [1].
>>>
>>> Thanks,
>>> Dikshita
>>>
>>> [1] 
>>> https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
>>>
>>> Dikshita Agarwal (3):
>>>   Register for media device
>>>     - Initialize and register for media device
>>>     - define venus_m2m_media_ops
>>>     - Implement APIs to register/unregister media controller.
>>>   Enable Request API for output buffers
>>>     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
>>>     - Initialize vb2 ops buf_out_validate and buf_request_complete.
>>>     - Add support for custom Metadata control 
>>> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>>>     - Implemeted/Integrated APIs for Request setup/complete.
>>>   Enable Request API for Capture Buffers
>>>
>>>  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
>>>  drivers/media/platform/Kconfig                  |   2 +-
>>>  drivers/media/platform/qcom/venus/core.h        |  36 ++++
>>>  drivers/media/platform/qcom/venus/helpers.c     | 247 
>>> +++++++++++++++++++++++-
>>>  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
>>>  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
>>>  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
>>>  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
>>>  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
>>>  include/media/v4l2-ctrls.h                      |   1 +
>>>  include/media/venus-ctrls.h                     |  22 +++
>>>  11 files changed, 465 insertions(+), 13 deletions(-)
>>>  create mode 100644 include/media/venus-ctrls.h
>>>

