Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E9D1CA3C4
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 08:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgEHGWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 02:22:23 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:3643 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgEHGWQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 02:22:16 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 May 2020 11:52:06 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 May 2020 11:51:53 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 838473AD3; Fri,  8 May 2020 11:51:51 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RFC] METADATA design using V4l2 Request API
Date:   Fri,  8 May 2020 11:51:27 +0530
Message-Id: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are many commercialized video use cases which needs metadata info
to be circulated between v4l2 client and v4l2 driver.

METADATA has following requirements associated:
•Metadata is an optional info available for a buffer. It is not mandatorily for every buffer.
 For ex. consider metadata ROI (Region Of Interest). ROI is specified by clients to indicate
 the region where enhanced quality is desired. This metadata is given as an input information
 to encoder output plane. Client may or may not specify the ROI for a frame during encode as
 an input metadata. Also if the client has not provided ROI metadata for a given frame,
 it would be incorrect to take the metadata from previous frame. If the data and
 metadata is asynchronous, it would be difficult for hardware to decide if it
 needs to wait for metadata buffer or not before processing the input frame for encoding.
•Synchronize the buffer requirement across both the video node/session
 (incase metadata is being processed as a separate v4l2 video node/session).
 This is to avoid buffer starvation.
•Associate the metadata buffer with the data buffer without adding any pipeline delay
 in waiting for each other. This is applicable both at the hardware side (the processing end)
 and client side (the receiving end).
•Low latency usecases like WFD/split rendering/game streaming/IMS have sub-50ms e2e latency
 requirements, and it is not practical to stall the pipeline due to inherent framework latencies.
 High performance usecase like high-frame rate playback/record can lead to frame loss during any pipeline latency.
 
To address all above requirements, we used v4l2 Request API as interlace.

As an experiment, We have introduced new control V4L2_CID_MPEG_VIDEO_VENUS_METADATA
to contain the METADATA info. Exact controls can be finalized once the interface is discussed.

For setting metadata from userspace to kernel, let say on encode output plane,
following code sequence was followed
1. Video driver is registering for media device and creating a media node in /dev
2. Request fd is allocated by calling MEDIA_IOC_REQUEST_ALLOC IOCTL on media fd.
3. METADATA configuration is being applied on request fd using VIDIOC_S_EXT_CTRLS IOCTL
   and the same request fd is added to buf structure structure before calling VIDIOC_QBUF on video fd.
4. The same request is queued through MEDIA_REQUEST_IOC_QUEUE IOCTL to driver then, as a result
   to which METADATA control will be applied to buffer through S_CTRL.
5. Once control is applied and request is completed, MEDIA_REQUEST_IOC_REINIT IOCTL is called
   to re-initialize the request.

We could achieve the same on capture plane as well by removing few checks present currently
in v4l2 core which restrict the implementation to only output plane.

We profiled below data with this implementation :
1. Total time taken ( round trip ) for setting up control data on video driver
   with VIDIOC_S_EXT_CTRLS, QBUF and Queue Request: 737us
2. Time taken for first QBUF on Output plane to reach driver with REQUEST API enabled (One way): 723us
3. Time taken for first QBUF on Output plane to reach driver without REQUEST API (One way) : 250us
4. Time taken by each IOCTL to complete ( round trip ) with REQUEST API enabled :
    a. VIDIOC_S_EXT_CTRLS : 201us
    b. VIDIOC_QBUF : 92us
    c. MEDIA_REQUEST_IOC_QUEUE: 386us

Kindly share your feedback/comments on the design/call sequence.
Also as we experimented and enabled the metadata on capture plane as well, please comment if any issue in
allowing the metadata exchange on capture plane as well.

Reference for client side implementation can be found at [1].

Thanks,
Dikshita

[1] https://git.linaro.org/people/stanimir.varbanov/v4l2-encode.git/log/?h=dikshita/request-api

Dikshita Agarwal (3):
  Register for media device     
    - Initialize and register for media device     
    - define venus_m2m_media_ops     
    - Implement APIs to register/unregister media controller.
  Enable Request API for output buffers     
    - Add dependency on MEDIA_CONTROLLER_REQUEST_API in Kconfig.     
    - Initialize vb2 ops buf_out_validate and buf_request_complete.     
    - Add support for custom Metadata control V4L2_CID_MPEG_VIDEO_VENUS_METADATA     
    - Implemeted/Integrated APIs for Request setup/complete.
  Enable Request API for Capture Buffers

 drivers/media/common/videobuf2/videobuf2-v4l2.c |   4 +-
 drivers/media/platform/Kconfig                  |   2 +-
 drivers/media/platform/qcom/venus/core.h        |  36 ++++
 drivers/media/platform/qcom/venus/helpers.c     | 247 +++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h     |  15 ++
 drivers/media/platform/qcom/venus/venc.c        |  63 +++++-
 drivers/media/platform/qcom/venus/venc_ctrls.c  |  61 +++++-
 drivers/media/v4l2-core/v4l2-ctrls.c            |  10 +
 drivers/media/v4l2-core/v4l2-mem2mem.c          |  17 +-
 include/media/v4l2-ctrls.h                      |   1 +
 include/media/venus-ctrls.h                     |  22 +++
 11 files changed, 465 insertions(+), 13 deletions(-)
 create mode 100644 include/media/venus-ctrls.h

-- 
1.9.1

