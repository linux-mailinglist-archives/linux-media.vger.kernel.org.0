Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F72634751E
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 10:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhCXJzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 05:55:10 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:48975 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbhCXJy4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 05:54:56 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Mar 2021 02:54:56 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Mar 2021 02:54:54 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Mar 2021 15:24:34 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id C9A5C21694; Wed, 24 Mar 2021 15:24:33 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v10 0/2] Add encoder ctrls for long term reference
Date:   Wed, 24 Mar 2021 15:24:30 +0530
Message-Id: <1616579672-13898-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series add the encoder controls for long term reference (LTR)
and support for the same in venus driver.

Dikshita Agarwal (2):
  media: v4l2-ctrl: add controls for long term reference.
  venus: venc: Add support for Long Term Reference (LTR) controls

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 18 ++++++++
 drivers/media/platform/qcom/venus/core.h           |  2 +
 drivers/media/platform/qcom/venus/venc.c           |  9 ++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 48 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 14 +++++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 6 files changed, 93 insertions(+), 1 deletion(-)

-- 
2.7.4

