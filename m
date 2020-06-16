Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07A71FB0BC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgFPMbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPMbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:31:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57633C08C5C4
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:31:32 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t21so14095194edr.12
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/1r7CkWYB3PvqDAm7Ot1fK+BdMOnYVR/V3utAsyrDz0=;
        b=aOuc3PNIXOscLHviWkmoerLaHV3t0vKE4OF+G+AsWn4rC9b6olH2lm6AItsGUbKi/e
         Qzelbl0GduFV1NbJPGME4+loz08IxPVRkUH1xpD4JrgFlmHcaVGUwM2yAM3R52OLybtF
         AJVq5Eiv9mPIPfNpHuY0o242bSrKMv7yzzPZyBqYTSQ/LApa/njqHNMD2JXQb4wlJN3+
         aTLfGbnILz6HCmPbJtPqHK2We/agFZqzcbUkP7Y+Gyy9po2YGEDFCH8f9RPe3aG2Ak8H
         oHX3AQbe7oQ/qyRukBnOKPINVdsAWs+xEbGe6RatIhDl69YPNnR4g1I3TY+BUWJxuJyJ
         7wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/1r7CkWYB3PvqDAm7Ot1fK+BdMOnYVR/V3utAsyrDz0=;
        b=hvCo1WKpQzZlI6nOGnzN0mugxh51qkbEZcp0J3hWElm3+XcfvwCa0ttldEWMoh16dH
         7IiCJu9iNMTt1gGOrNzCnQgIKRfaNzRI/k52F1H/vbwdZfJXKMh1bcRJDjQ2GcWHWG+m
         xDJI6dk6jKC74LzN2NC32MkyUoukUMDKCJWc1X9cDABWt23GAmKKers/wsR+m5Gl3niJ
         vIknCGz7A/vQ1UrT8eaek/j79sX8x+k8iPEMr7EiyqT0WqYBFAscqkPlvuu59Tc+5OQ0
         lJpfuVtQPJEw8ntgHXTQWFbUFuoQU+12x7ZefC8L8/don2AAzlYa9inV21MYWJIIXV0U
         ZbKA==
X-Gm-Message-State: AOAM533yNRoE82z05Cw76osSuANI2Gd9/3U6VI8PznvDTMHJTMs7U8mC
        bYWXWgJxezur4ewxLIdiGOXw9H4uai9LzQ==
X-Google-Smtp-Source: ABdhPJzmX15Wn6UYFFsYF7DAkg/UYOnitBPHj6tHLVHQjeJ3Qti/lxHyPAuPlMdMfPP80Lw50X1wzQ==
X-Received: by 2002:aa7:c6c7:: with SMTP id b7mr2324483eds.213.1592310690397;
        Tue, 16 Jun 2020 05:31:30 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id p6sm11071983ejb.71.2020.06.16.05.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:31:29 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] Add two new v4l controls and implementation
Date:   Tue, 16 Jun 2020 15:29:57 +0300
Message-Id: <20200616123001.11321-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Here we add two more v4l controls:
 - V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY for encoders
 - V4L2_CID_MPEG_VIDEO_DECODE_INTRA_FRAMES_ONLY for decoders

and the implementations in Venus driver.

The original patch for CQ from Maheshwar has been rebased on top of
current media/master and the comment from Hans has been taken into
account.

Comments are welcome.

regards,
Stan

Maheshwar Ajja (1):
  media: v4l2-ctrls: Add encoder constant quality control

Stanimir Varbanov (3):
  venus: venc: Add support for constant quality control
  v4l2-ctrl: Add control for intra only decode
  venus: vdec: Add support for decode intra frames only

 .../media/v4l/ext-ctrls-codec.rst             | 19 +++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 49 ++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      |  7 +++
 .../media/platform/qcom/venus/vdec_ctrls.c    |  9 +++-
 drivers/media/platform/qcom/venus/venc.c      |  4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  4 ++
 include/uapi/linux/v4l2-controls.h            |  3 ++
 10 files changed, 103 insertions(+), 4 deletions(-)

-- 
2.17.1

