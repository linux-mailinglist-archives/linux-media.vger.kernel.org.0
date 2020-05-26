Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0211E1B4D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 08:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgEZGbZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 02:31:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23637 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727804AbgEZGbY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 02:31:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590474682; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Z3frdJL/Om4AQkZCuaqLndOFOJJ7lNBDzBIioM+V9gs=;
 b=CVrfCu/QoKHCj7feowppJZIUEAQuiOfl48C94Hscoz93bD5CGbgfsfJJRpPnPT/+hOwld1Ea
 uck9EwJfVZ53gtmMxNxi5g2rkkTw8fGuc9BVfxMXCWSOKCVsFMGNjcv2vcj1R+Ch1LU9C5h3
 cxrT/+YYv/XzShhc+PLmWMemlb8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eccb7af.7f93aff7bab0-smtp-out-n04;
 Tue, 26 May 2020 06:31:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A510AC433CA; Tue, 26 May 2020 06:31:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0DEFC433C6;
        Tue, 26 May 2020 06:31:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 26 May 2020 12:01:10 +0530
From:   dikshita@codeaurora.org
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        linux-media-owner@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] METADATA design using V4l2 Request API
In-Reply-To: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
Message-ID: <66208196d7668fe184f6c9d8c6c69c8b@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

A gentle reminder for the review.

On 2020-05-08 11:51, Dikshita Agarwal wrote:
> There are many commercialized video use cases which needs metadata info
> to be circulated between v4l2 client and v4l2 driver.
> 
> METADATA has following requirements associated:
> •Metadata is an optional info available for a buffer. It is not
> mandatorily for every buffer.
>  For ex. consider metadata ROI (Region Of Interest). ROI is specified
> by clients to indicate
>  the region where enhanced quality is desired. This metadata is given
> as an input information
>  to encoder output plane. Client may or may not specify the ROI for a
> frame during encode as
>  an input metadata. Also if the client has not provided ROI metadata
> for a given frame,
>  it would be incorrect to take the metadata from previous frame. If the 
> data and
>  metadata is asynchronous, it would be difficult for hardware to decide 
> if it
>  needs to wait for metadata buffer or not before processing the input
> frame for encoding.
> •Synchronize the buffer requirement across both the video node/session
>  (incase metadata is being processed as a separate v4l2 video 
> node/session).
>  This is to avoid buffer starvation.
> •Associate the metadata buffer with the data buffer without adding any
> pipeline delay
>  in waiting for each other. This is applicable both at the hardware
> side (the processing end)
>  and client side (the receiving end).
> •Low latency usecases like WFD/split rendering/game streaming/IMS have
> sub-50ms e2e latency
>  requirements, and it is not practical to stall the pipeline due to
> inherent framework latencies.
>  High performance usecase like high-frame rate playback/record can
> lead to frame loss during any pipeline latency.
> 
> To address all above requirements, we used v4l2 Request API as 
> interlace.
> 
> As an experiment, We have introduced new control
> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
> to contain the METADATA info. Exact controls can be finalized once the
> interface is discussed.
> 
> For setting metadata from userspace to kernel, let say on encode output 
> plane,
> following code sequence was followed
> 1. Video driver is registering for media device and creating a media
> node in /dev
> 2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on 
> media fd.
> 3. METADATA configuration is being applied on request fd using
> VIDIOC_S_EXT_CTRLS IOCTL
>    and the same request fd is added to buf structure structure before
> calling VIDIOC_QBUF on video fd.
> 4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to
> driver then, as a result
>    to which METADATA control will be applied to buffer through S_CTRL.
> 5. Once control is applied and request is completed,
> MEDIA_REQUEST_IOC_REINIT IOCTL is called
>    to re-initialize the request.
> 
> We could achieve the same on capture plane as well by removing few
> checks present currently
> in v4l2 core which restrict the implementation to only output plane.
> 
> We profiled below data with this implementation :
> 1. Total time taken ( round trip ) for setting up control data on video 
> driver
>    with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
> 2. Time taken for first QBUF on Output plane to reach driver with
> REQUEST API enabled (One way): 723us
> 3. Time taken for first QBUF on Output plane to reach driver without
> REQUEST API (One way) : 250us
> 4. Time taken by each IOCTL to complete ( round trip ) with REQUEST
> API enabled :
>     a. VIDIOC_S_EXT_CTRLS : 201us
>     b. VIDIOC_QBUF : 92us
>     c. MEDIA_REQUEST_IOC_QUEUE: 386us
> 
> Kindly share your feedback/comments on the design/call sequence.
> Also as we experimented and enabled the metadata on capture plane as
> well, please comment if any issue in
> allowing the metadata exchange on capture plane as well.
> 
> Reference for client side implementation can be found at [1].
> 
> Thanks,
> Dikshita
> 
> [1]
> https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api
> 
> Dikshita Agarwal (3):
>   Register for media device
>     - Initialize and register for media device
>     - define venus_m2m_media_ops
>     - Implement APIs to register/unregister media controller.
>   Enable Request API for output buffers
>     - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.
>     - Initialize vb2 ops buf_out_validate and buf_request_complete.
>     - Add support for custom Metadata control
> V4L2_CID_MPEG_VIDEO_VENUS_METADATA
>     - Implemeted/Integrated APIs for Request setup/complete.
>   Enable Request API for Capture Buffers
> 
>  drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
>  drivers/media/platform/Kconfig                  |   2 +-
>  drivers/media/platform/qcom/venus/core.h        |  36 ++++
>  drivers/media/platform/qcom/venus/helpers.c     | 247 
> +++++++++++++++++++++++-
>  drivers/media/platform/qcom/venus/helpers.h     |  15 ++
>  drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
>  drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
>  drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
>  include/media/v4l2-ctrls.h                      |   1 +
>  include/media/venus-ctrls.h                     |  22 +++
>  11 files changed, 465 insertions(+), 13 deletions(-)
>  create mode 100644 include/media/venus-ctrls.h
