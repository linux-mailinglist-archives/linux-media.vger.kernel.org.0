Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5F41E726B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 04:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404742AbgE2CIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 22:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404550AbgE2CIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 22:08:45 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD8EC08C5C7
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 19:08:45 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g18so731475qtu.13
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 19:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1Srg2kiVtDIqAxCmwdqEiGbRZzrsJfX2EcQ00O1GLuA=;
        b=rVJdJfkw+43y+c5dOLcirHVDd6yZDXrM8CGpD0gMwUswVua8yZaEiEsqOFdS4IPP3I
         z2VnFtuH/jSOSuqHOh7XMm9nG2loSL/LU9812Y7g59i3RLagdtDzFrq2Q3jcuJ6iCeOZ
         j8oqorWoECfPlvmeWp8ihtrUOg0qKQA4fKrB/V6NzEfOrqcz0/aoTy6ztR3DcbLhVCV2
         1u0sAdzOf3zEigZ5so+rqo6DgE0t44ov81m/BBcT2Y+1loChNeJze7j5y19zvv0H+b20
         PFm97R5mGKHHleTpQeNTjVahuVY2NYB7M1jbVmflfgPQIVHuK9m+sWei8HDVPf73z8O0
         zejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1Srg2kiVtDIqAxCmwdqEiGbRZzrsJfX2EcQ00O1GLuA=;
        b=HmEwpbBik4+8jOuBSZN/RjFcOY0vCP41k+VfML30OlL1ejzUhlC3zEVLvIo9n2M/7s
         pvvkhFe6sRyUUvhrmMf93bNlU6mh5VASh8wb5dn6Hn3izGM17V4MspWciPhn8rC0qzVO
         yPEQhmtBnBzrnavyHBjoeUY78NUyuCWvJP70NvtrShlc3iB9w32rC3O3g9Dnw0YMqtl6
         lUZan+Icd47gUHC2EYYsWWniIDvLudWx4g/DgFjxmWq3U3BeDUA3OMRtfF4805GrZFA1
         +4l87J7jv2S9xJLmBx84GMi1ojO0QUpulwWOzDVSmM+Qf5+j6yE+5zWb9cvs0z67ZVTW
         KsWw==
X-Gm-Message-State: AOAM5321Adz1j7tnS3LIKOdrHeE6MuVXKT88Zg7DlqS8AHwMJ/gK6Ag8
        QTb8xjM8f2MgOH6lZNNgA08LZw==
X-Google-Smtp-Source: ABdhPJzfMuloPPTz0Emk075cAByeHMgrlY6Uo1yZ9GuguxfMKVY7fn1tSkeuT7ZmFngiyQw4zViW1A==
X-Received: by 2002:ac8:2f7a:: with SMTP id k55mr6473848qta.34.1590718124200;
        Thu, 28 May 2020 19:08:44 -0700 (PDT)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id h77sm6586557qke.37.2020.05.28.19.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:08:43 -0700 (PDT)
Message-ID: <3081cdd2b29eb08bc31b7e87a298b2184a57fad9.camel@ndufresne.ca>
Subject: Re: [RFC] METADATA design using V4l2 Request API
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Yunfei Dong <yunfei.dong@mediatek.com>
Date:   Thu, 28 May 2020 22:08:41 -0400
In-Reply-To: <b866e94a-1af2-5646-9e1c-6d027d172b97@xs4all.nl>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
         <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
         <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
         <b866e94a-1af2-5646-9e1c-6d027d172b97@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 28 mai 2020 à 13:24 +0200, Hans Verkuil a écrit :
> On 28/05/2020 12:48, dikshita@codeaurora.org wrote:
> > Hi Hans,
> > 
> > Thanks for the review.
> > 
> > On 2020-05-26 16:27, Hans Verkuil wrote:
> > > Hi Dikshita,
> > > 
> > > My apologies for the delay, this was (mostly) due to various vacation 
> > > days.
> > > 
> > > On 08/05/2020 08:21, Dikshita Agarwal wrote:
> > > > There are many commercialized video use cases which needs metadata 
> > > > info
> > > > to be circulated between v4l2 client and v4l2 driver.
> > > > 
> > > > METADATA has following requirements associated:
> > > > •Metadata is an optional info available for a buffer. It is not 
> > > > mandatorily for every buffer.
> > > >  For ex. consider metadata ROI (Region Of Interest). ROI is specified 
> > > > by clients to indicate
> > > >  the region where enhanced quality is desired. This metadata is given 
> > > > as an input information
> > > >  to encoder output plane. Client may or may not specify the ROI for a 
> > > > frame during encode as
> > > >  an input metadata. Also if the client has not provided ROI metadata 
> > > > for a given frame,
> > > >  it would be incorrect to take the metadata from previous frame. If 
> > > > the data and
> > > >  metadata is asynchronous, it would be difficult for hardware to 
> > > > decide if it
> > > >  needs to wait for metadata buffer or not before processing the input 
> > > > frame for encoding.
> > > > •Synchronize the buffer requirement across both the video node/session
> > > >  (incase metadata is being processed as a separate v4l2 video 
> > > > node/session).
> > > >  This is to avoid buffer starvation.
> > > > •Associate the metadata buffer with the data buffer without adding any 
> > > > pipeline delay
> > > >  in waiting for each other. This is applicable both at the hardware 
> > > > side (the processing end)
> > > >  and client side (the receiving end).
> > > > •Low latency usecases like WFD/split rendering/game streaming/IMS have 
> > > > sub-50ms e2e latency
> > > >  requirements, and it is not practical to stall the pipeline due to 
> > > > inherent framework latencies.
> > > >  High performance usecase like high-frame rate playback/record can 
> > > > lead to frame loss during any pipeline latency.
> > > > 
> > > > To address all above requirements, we used v4l2 Request API as 
> > > > interlace.
> > > > 
> > > > As an experiment, We have introduced new control 
> > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
> > > > to contain the METADATA info. Exact controls can be finalized once the 
> > > > interface is discussed.
> > > > 
> > > > For setting metadata from userspace to kernel, let say on encode 
> > > > output plane,
> > > > following code sequence was followed
> > > > 1. Video driver is registering for media device and creating a media 
> > > > node in /dev
> > > > 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on 
> > > > media fd.
> > > > 3. METADATA configuration is being applied on request fd using 
> > > > VIDIOC_S_EXT_CTRLS IOCTL
> > > >    and the same request fd is added to buf structure structure before 
> > > > calling VIDIOC_QBUF on video fd.
> > > > 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to 
> > > > driver then, as a result
> > > >    to which METADATA control will be applied to buffer through S_CTRL.
> > > > 5. Once control is applied and request is completed, 
> > > > MEDIA_REQUEST_IOC_REINIT IOCTL is called
> > > >    to re-initialize the request.
> > > 
> > > This is fine and should work well. It's what the Request API is for,
> > > so no problems here.
> > > 
> > > > We could achieve the same on capture plane as well by removing few 
> > > > checks present currently
> > > > in v4l2 core which restrict the implementation to only output plane.
> > > 
> > > Why do you need the Request API for the capture side in a
> > > memory-to-memory driver? It is not
> > > clear from this patch series what the use-case is. There are reasons
> > > why this is currently
> > > not allowed. So I need to know more about this.
> > > 
> > > Regards,
> > > 
> > > 	Hans
> > > 
> > we need this for use cases like HDR10+ where metadata info is part of 
> > the bitstream.
> > To handle such frame specific data, support for request api on capture 
> > plane would be needed.
> 
> That's for the decoder, right? So the decoder extracts the HDR10+ metadata
> and fills in a control with the metadata?
> 
> If that's the case, then it matches a similar request I got from mediatek.
> What is needed is support for 'read-only' requests: i.e. the driver can
> associate controls with a capture buffer and return that to userspace. But
> it is not possible to *set* controls in userspace when queuing the request.
> 
> If you think about it you'll see that setting controls in userspace for
> a capture queue request makes no sense, but having the driver add set
> read-only controls when the request is finished is fine and makes sense.

Hi Hans,

I'm not sure I follow you on what will this look like in userspace. Can you post
an RFC of your idea, describing the userspace flow ? Particularly, I'm not sure
how the request helps in synchronizing the read of the metadata controls (over
simply reading the control after a DQBUF, which we can match to a specific input
using the provided timestamp). I also fail to understand how this aligns with
Stanimir concern with the performance of the get control interface.

> 
> Implementing this shouldn't be a big job: you'd need a new
> V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
> capability, a corresponding new flag in struct vb2_queue, a new ro_requests
> flag in
> struct v4l2_ctrl_handler, and try_set_ext_ctrls() should check that flag and
> refuse to
> try/set any controls if it is true.
> 
> Finally, the v4l2_m2m_qbuf() function should be updated to just refuse the
> case where both
> capture and output queue set V4L2_BUF_CAP_SUPPORTS_REQUESTS.
> 
> And the documentation needs to be updated.
> 
> I've added Yunfei Dong to the CC list, perhaps mediatek did some work on
> this already.
> 
> Regards,
> 
> 	Hans
> 
> > Thanks,
> > Dikshita
> > > > We profiled below data with this implementation :
> > > > 1. Total time taken ( round trip ) for setting up control data on 
> > > > video driver
> > > >    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
> > > > 2. Time taken for first QBUF on Output plane to reach driver with 
> > > > REQUEST API enabled (One way): 723us
> > > > 3. Time taken for first QBUF on Output plane to reach driver without 
> > > > REQUEST API (One way) : 250us
> > > > 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST 
> > > > API enabled :
> > > >     a. VIDIOC_S_EXT_CTRLS : 201us
> > > >     b. VIDIOC_QBUF : 92us
> > > >     c. MEDIA_REQUEST_IOC_QUEUE: 386us
> > > > 
> > > > Kindly share your feedback/comments on the design/call sequence.
> > > > Also as we experimented and enabled the metadata on capture plane as 
> > > > well, please comment if any issue in
> > > > allowing the metadata exchange on capture plane as well.
> > > > 
> > > > Reference for client side implementation can be found at [1].
> > > > 
> > > > Thanks,
> > > > Dikshita
> > > > 
> > > > [1] 
> > > > https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
> > > > 
> > > > Dikshita Agarwal (3):
> > > >   Register for media device
> > > >     - Initialize and register for media device
> > > >     - define venus_m2m_media_ops
> > > >     - Implement APIs to register/unregister media controller.
> > > >   Enable Request API for output buffers
> > > >     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
> > > >     - Initialize vb2 ops buf_out_validate and buf_request_complete.
> > > >     - Add support for custom Metadata control 
> > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
> > > >     - Implemeted/Integrated APIs for Request setup/complete.
> > > >   Enable Request API for Capture Buffers
> > > > 
> > > >  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
> > > >  drivers/media/platform/Kconfig                  |   2 +-
> > > >  drivers/media/platform/qcom/venus/core.h        |  36 ++++
> > > >  drivers/media/platform/qcom/venus/helpers.c     | 247 
> > > > +++++++++++++++++++++++-
> > > >  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
> > > >  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
> > > >  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
> > > >  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
> > > >  include/media/v4l2-ctrls.h                      |   1 +
> > > >  include/media/venus-ctrls.h                     |  22 +++
> > > >  11 files changed, 465 insertions(+), 13 deletions(-)
> > > >  create mode 100644 include/media/venus-ctrls.h
> > > > 

