Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AB93463BF
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 16:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhCWPzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 11:55:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23082 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhCWPy5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:57 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Mar 2021 08:54:57 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Mar 2021 08:54:55 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Mar 2021 21:24:38 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 9634B2168C; Tue, 23 Mar 2021 21:24:35 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v9 0/2] Add encoder ctrls for long term reference
Date:   Tue, 23 Mar 2021 21:24:25 +0530
Message-Id: <1616514867-16496-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series add the encoder controls for long term reference (LTR)
and support for the same in venus driver.

Dikshita Agarwal (2):
  media: v4l2-ctrl: add controls for long term reference.
  venus: venc: Add support for Long Term Reference (LTR) controls

Changes since v8:
- Update 2/2 patch to allow LTR MARK and USE control setting
  only after stream on.

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 18 +++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 55 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 14 ++++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 4 files changed, 89 insertions(+), 1 deletion(-)

-- 
2.7.4

