Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD722B7694
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 07:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgKRGz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 01:55:29 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48123 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgKRGz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 01:55:28 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2020 22:55:28 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Nov 2020 22:55:26 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Nov 2020 12:25:10 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 5EEB0212C6; Wed, 18 Nov 2020 12:25:09 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 0/3] Add new controls for QP and layer bitrate
Date:   Wed, 18 Nov 2020 12:24:54 +0530
Message-Id: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds frame specific min/max qp controls for hevc and layer
wise bitrate control for h264.

Chnages since v2:
 - addressed comments.
 - added driver side implementation for new controls.

Dikshita Agarwal (3):
  media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
  media: v4l2-ctrl: Add layer wise bitrate controls for h264
  venus: venc: Add support for frame-specific min/max qp controls

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 72 +++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h           | 18 ++++++
 drivers/media/platform/qcom/venus/venc.c           | 21 +++++--
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 51 +++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c               | 15 +++++
 include/uapi/linux/v4l2-controls.h                 | 17 +++++
 6 files changed, 187 insertions(+), 7 deletions(-)

-- 
2.7.4

