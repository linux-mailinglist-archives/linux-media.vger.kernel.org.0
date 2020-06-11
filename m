Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A7F1F65A6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 12:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgFKKZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 06:25:57 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23911 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726684AbgFKKZ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 06:25:56 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jun 2020 15:55:52 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Jun 2020 15:55:28 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 5A1213BDB; Thu, 11 Jun 2020 15:55:27 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        ribalda@kernel.org, paul.kocialkowski@bootlin.com,
        posciak@chromium.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RFC PATCH 0/1] Add LTR controls
Date:   Thu, 11 Jun 2020 15:55:20 +0530
Message-Id: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LTR (Long Term Reference) frames are the frames that are encoded sometime in the past
and stored in the DPB buffer list to be used as reference to encode future frames.
One usage of LTR encoding is to reduce error propagation for video transmission
in packet lossy networks.  For example, encoder may want to specify some key frames as
LTR pictures and use them as reference frames for encoding. With extra protection
selectively on these LTR frames or synchronization with the receiver of reception of
the LTR frames during transmission, decoder can receive reference frames more reliably
than other non-reference frames. As a result, transmission error can be effectively
restricted within certain frames rather than propagated to future frames.

We are introducing below V4l2 Controls for this feature
1. V4L2_CID_MPEG_VIDEO_LTRCOUNT
    a. This is used to query or configure the number of LTR frames.
       This is a static control and is controlled by the client.
    b. The LTR index varies from 0 to the max LTR-1.
    c. If LTR Count is more than max supported LTR count (max LTR) by driver, it will be rejected.
    d. Auto Marking : If LTR count is non zero,
        1) first LTR count frames would be mark as LTR automatically after
      	   every IDR frame (inclusive).
        2) For multilayer encoding: first LTR count base layer reference frames starting after
           every IDR frame (inclusive) in encoding order would be marked as LTR frames by the encoder.
        3) Auto marking of LTR due to IDR should consider following conditions:
            1. The frame is not already set to be marked as LTR.
            2. The frame is part of the base layer in the hierarchical layer case.
            3. The number of frames currently marked as LTR is less than the maximum LTR frame index plus 1.
    e. Encoder needs to handle explicit Mark/Use command when encoder is still doing "auto" marking

2. V4L2_CID_MPEG_VIDEO_MARKLTRFRAME :
    a. This signals to mark the current frame as LTR frame. It is a dynamic control and also provide the LTR index to be used.
    b. the LTR index provided by this control should never exceed the max LTR-1. Else it will be rejected.

3. V4L2_CID_MPEG_VIDEO_USELTRFRAME :
    a. This specifies the LTR frame(s) to be used for encoding the current frame. This is a dynamic control.
    b. LTR Use Bitmap : this consists of bits [0, 15]. A total of N LSB bits of this field are valid,
       where N is the maximum number of LTRs supported. All the other bits are invalid and should be rejected.
       The LSB corresponds to the LTR index 0. Bit N-1 from the LSB corresponds to the LTR index max LTR-1.

Dikshita Agarwal (1):
  media: v4l2-ctrls:  add control for ltr

 drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 10 insertions(+)

-- 
1.9.1

