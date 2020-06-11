Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722A41F6A95
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 17:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgFKPGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 11:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbgFKPGO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 11:06:14 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4ED8C08C5C3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 08:06:13 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id q8so5814531qkm.12
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2020 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=HzLgIYSvEJUDNW//jH3MewtijJNgoOuCxY2mbejIfu8=;
        b=AqbuvIO+U50IJ9wT5vyYF4LiH6rk0I0dM4U2c5QBcGKusu+uyhmz5gj0WclF5fFT6L
         TRjl0OACIqXxyFEOkmwSJtz9gf0rVIr+BTL7FMksFt61N7z5QNkhnUX7Hp05/EP0BAy2
         HPE3pW2VPr25cDv1nYHAWvED3pW8rtsTcdfX48HnB5JLUEjcmEBet9EaBD77YU6hiEwI
         iMaKAGaTvGNyJcoCDGVj1YKA/AEqstcF4IWgmlrlyx4BQKSbNO42KFFSFSEHKxwA1GHw
         9hXT2MZ2wAiMjn/6TRDv3mgekladFN9YaZzOebhA1yicESCEJ6Fp5MRbzdYT6iMTO1/A
         a6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=HzLgIYSvEJUDNW//jH3MewtijJNgoOuCxY2mbejIfu8=;
        b=dYDxN8uTyJ/u3RylHdTe+qTD/CWUA1SDvJoIIDSs7HMpNKqjckpvmRB/M62UYVNkSo
         6qc1QwaSkximgu5svp7QbXeZAEzkxGocNdqN7H6l27USE9yQEQ3VC6gcbUmwzw/C6jt8
         6DnKLoGZGZ8A9hQpzy/My9ov27D52GIMFr4yhiAfjmb0U2kp0KeOa48v70+L+B8VID3O
         aTQyDo0TVfvk2wHKQYX4/tyL5ivygbsWEih6puikNtbtPpzlVpKsdcLtY49wjm7Jflry
         X7cz8IE2VXTg6VrAwMI/2K2cTva0Dr+oXK8syezwuovf3IbW3pau3NPKqxB+vjNCemIg
         D1ZA==
X-Gm-Message-State: AOAM533tVSF+5To7ImqFUVgX2pL1v6lilprHYvorTuC7KfIK990K64Ou
        W+jz/Jxoss3PAE0pi9ewyuDUWg==
X-Google-Smtp-Source: ABdhPJzCN+8p+k9Ijg6OLtv61lQ4rjQ4ZOuQwyorQGhjKLdpVxO0Yc7DD6W0D3TTezmcsid9Y2mT0g==
X-Received: by 2002:ae9:ef8c:: with SMTP id d134mr8977472qkg.66.1591887971808;
        Thu, 11 Jun 2020 08:06:11 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id q187sm2421435qka.34.2020.06.11.08.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 08:06:10 -0700 (PDT)
Message-ID: <78b743fc3788b73b9a3387d7d0a7a3dff7fdb9d0.camel@ndufresne.ca>
Subject: Re: [RFC] METADATA design using V4l2 Request API
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Dylan Yip <dylany@xilinx.com>
Date:   Thu, 11 Jun 2020 11:06:09 -0400
In-Reply-To: <3081cdd2b29eb08bc31b7e87a298b2184a57fad9.camel@ndufresne.ca>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
         <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
         <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
         <b866e94a-1af2-5646-9e1c-6d027d172b97@xs4all.nl>
         <3081cdd2b29eb08bc31b7e87a298b2184a57fad9.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 28 mai 2020 à 22:08 -0400, Nicolas Dufresne a écrit :
> Le jeudi 28 mai 2020 à 13:24 +0200, Hans Verkuil a écrit :
> > On 28/05/2020 12:48, dikshita@codeaurora.org wrote:
> > > Hi Hans,
> > > 
> > > Thanks for the review.
> > > 
> > > On 2020-05-26 16:27, Hans Verkuil wrote:
> > > > Hi Dikshita,
> > > > 
> > > > My apologies for the delay, this was (mostly) due to various vacation 
> > > > days.
> > > > 
> > > > On 08/05/2020 08:21, Dikshita Agarwal wrote:
> > > > > There are many commercialized video use cases which needs metadata 
> > > > > info
> > > > > to be circulated between v4l2 client and v4l2 driver.
> > > > > 
> > > > > METADATA has following requirements associated:
> > > > > •Metadata is an optional info available for a buffer. It is not 
> > > > > mandatorily for every buffer.
> > > > >  For ex. consider metadata ROI (Region Of Interest). ROI is specified 
> > > > > by clients to indicate
> > > > >  the region where enhanced quality is desired. This metadata is given 
> > > > > as an input information
> > > > >  to encoder output plane. Client may or may not specify the ROI for a 
> > > > > frame during encode as
> > > > >  an input metadata. Also if the client has not provided ROI metadata 
> > > > > for a given frame,
> > > > >  it would be incorrect to take the metadata from previous frame. If 
> > > > > the data and
> > > > >  metadata is asynchronous, it would be difficult for hardware to 
> > > > > decide if it
> > > > >  needs to wait for metadata buffer or not before processing the input 
> > > > > frame for encoding.
> > > > > •Synchronize the buffer requirement across both the video node/session
> > > > >  (incase metadata is being processed as a separate v4l2 video 
> > > > > node/session).
> > > > >  This is to avoid buffer starvation.
> > > > > •Associate the metadata buffer with the data buffer without adding any 
> > > > > pipeline delay
> > > > >  in waiting for each other. This is applicable both at the hardware 
> > > > > side (the processing end)
> > > > >  and client side (the receiving end).
> > > > > •Low latency usecases like WFD/split rendering/game streaming/IMS have 
> > > > > sub-50ms e2e latency
> > > > >  requirements, and it is not practical to stall the pipeline due to 
> > > > > inherent framework latencies.
> > > > >  High performance usecase like high-frame rate playback/record can 
> > > > > lead to frame loss during any pipeline latency.
> > > > > 
> > > > > To address all above requirements, we used v4l2 Request API as 
> > > > > interlace.
> > > > > 
> > > > > As an experiment, We have introduced new control 
> > > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
> > > > > to contain the METADATA info. Exact controls can be finalized once the 
> > > > > interface is discussed.
> > > > > 
> > > > > For setting metadata from userspace to kernel, let say on encode 
> > > > > output plane,
> > > > > following code sequence was followed
> > > > > 1. Video driver is registering for media device and creating a media 
> > > > > node in /dev
> > > > > 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on 
> > > > > media fd.
> > > > > 3. METADATA configuration is being applied on request fd using 
> > > > > VIDIOC_S_EXT_CTRLS IOCTL
> > > > >    and the same request fd is added to buf structure structure before 
> > > > > calling VIDIOC_QBUF on video fd.
> > > > > 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to 
> > > > > driver then, as a result
> > > > >    to which METADATA control will be applied to buffer through S_CTRL.
> > > > > 5. Once control is applied and request is completed, 
> > > > > MEDIA_REQUEST_IOC_REINIT IOCTL is called
> > > > >    to re-initialize the request.
> > > > 
> > > > This is fine and should work well. It's what the Request API is for,
> > > > so no problems here.
> > > > 
> > > > > We could achieve the same on capture plane as well by removing few 
> > > > > checks present currently
> > > > > in v4l2 core which restrict the implementation to only output plane.
> > > > 
> > > > Why do you need the Request API for the capture side in a
> > > > memory-to-memory driver? It is not
> > > > clear from this patch series what the use-case is. There are reasons
> > > > why this is currently
> > > > not allowed. So I need to know more about this.
> > > > 
> > > > Regards,
> > > > 
> > > > 	Hans
> > > > 
> > > we need this for use cases like HDR10+ where metadata info is part of 
> > > the bitstream.
> > > To handle such frame specific data, support for request api on capture 
> > > plane would be needed.
> > 
> > That's for the decoder, right? So the decoder extracts the HDR10+ metadata
> > and fills in a control with the metadata?
> > 
> > If that's the case, then it matches a similar request I got from mediatek.
> > What is needed is support for 'read-only' requests: i.e. the driver can
> > associate controls with a capture buffer and return that to userspace. But
> > it is not possible to *set* controls in userspace when queuing the request.
> > 
> > If you think about it you'll see that setting controls in userspace for
> > a capture queue request makes no sense, but having the driver add set
> > read-only controls when the request is finished is fine and makes sense.
> 
> Hi Hans,
> 
> I'm not sure I follow you on what will this look like in userspace. Can you post
> an RFC of your idea, describing the userspace flow ? Particularly, I'm not sure
> how the request helps in synchronizing the read of the metadata controls (over
> simply reading the control after a DQBUF, which we can match to a specific input
> using the provided timestamp). I also fail to understand how this aligns with
> Stanimir concern with the performance of the get control interface.

As there was no answer, I'll try and ask a more precise question. While
I still believe it's better done in userspace for M2M decoder, there is
a need for HDMI receivers (hence adding direct CC to Dylan Yip from
Xilinx).

Would this match your expected userspace workflow ?

1. Allocate capture buffers
2. Allocate the same number of request fd (ro request)
3. For each capture buffer
  3.1 Queue the capture buffer (passing the request)
  3.2 Queue the request 
4. Wait for capture buffer to be ready
5. Dequeue a capture buffer, and lookup it's request FD
6. Wait for the request to complete (needed ?)
7. Read the meta control passing the request

I'm not sure if 6. is required, driver could just to things in the
right order (store the meta in the request before marking the buffer
done). Now this is pretty heavy, but does not seems broken. The
question is how to you avoid reading the control if it haven't changed
? Can driver guaranty to send the control change event before marking a
buffer done ? (this is for static HDR meta, which will change when
stream is change, e.g. starting/ending of adds on TV). While for HDR10+
and similar dynamic meta, we expect a new value for every run, HDR10+
data is much much bigger. Do we really want that to be model around a
control ?

> 
> > Implementing this shouldn't be a big job: you'd need a new
> > V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
> > capability, a corresponding new flag in struct vb2_queue, a new ro_requests
> > flag in
> > struct v4l2_ctrl_handler, and try_set_ext_ctrls() should check that flag and
> > refuse to
> > try/set any controls if it is true.
> > 
> > Finally, the v4l2_m2m_qbuf() function should be updated to just refuse the
> > case where both
> > capture and output queue set V4L2_BUF_CAP_SUPPORTS_REQUESTS.
> > 
> > And the documentation needs to be updated.
> > 
> > I've added Yunfei Dong to the CC list, perhaps mediatek did some work on
> > this already.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> > > Thanks,
> > > Dikshita
> > > > > We profiled below data with this implementation :
> > > > > 1. Total time taken ( round trip ) for setting up control data on 
> > > > > video driver
> > > > >    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
> > > > > 2. Time taken for first QBUF on Output plane to reach driver with 
> > > > > REQUEST API enabled (One way): 723us
> > > > > 3. Time taken for first QBUF on Output plane to reach driver without 
> > > > > REQUEST API (One way) : 250us
> > > > > 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST 
> > > > > API enabled :
> > > > >     a. VIDIOC_S_EXT_CTRLS : 201us
> > > > >     b. VIDIOC_QBUF : 92us
> > > > >     c. MEDIA_REQUEST_IOC_QUEUE: 386us
> > > > > 
> > > > > Kindly share your feedback/comments on the design/call sequence.
> > > > > Also as we experimented and enabled the metadata on capture plane as 
> > > > > well, please comment if any issue in
> > > > > allowing the metadata exchange on capture plane as well.
> > > > > 
> > > > > Reference for client side implementation can be found at [1].
> > > > > 
> > > > > Thanks,
> > > > > Dikshita
> > > > > 
> > > > > [1] 
> > > > > https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
> > > > > 
> > > > > Dikshita Agarwal (3):
> > > > >   Register for media device
> > > > >     - Initialize and register for media device
> > > > >     - define venus_m2m_media_ops
> > > > >     - Implement APIs to register/unregister media controller.
> > > > >   Enable Request API for output buffers
> > > > >     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
> > > > >     - Initialize vb2 ops buf_out_validate and buf_request_complete.
> > > > >     - Add support for custom Metadata control 
> > > > > V4L2_CID_MPEG_VIDEO_VENUS_METADATA
> > > > >     - Implemeted/Integrated APIs for Request setup/complete.
> > > > >   Enable Request API for Capture Buffers
> > > > > 
> > > > >  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
> > > > >  drivers/media/platform/Kconfig                  |   2 +-
> > > > >  drivers/media/platform/qcom/venus/core.h        |  36 ++++
> > > > >  drivers/media/platform/qcom/venus/helpers.c     | 247 
> > > > > +++++++++++++++++++++++-
> > > > >  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
> > > > >  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
> > > > >  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
> > > > >  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
> > > > >  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
> > > > >  include/media/v4l2-ctrls.h                      |   1 +
> > > > >  include/media/venus-ctrls.h                     |  22 +++
> > > > >  11 files changed, 465 insertions(+), 13 deletions(-)
> > > > >  create mode 100644 include/media/venus-ctrls.h
> > > > > 

