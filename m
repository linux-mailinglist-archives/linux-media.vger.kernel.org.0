Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A1D2E9039
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbhADFm4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:42:56 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:50004 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADFm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:42:56 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jan 2021 21:42:15 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jan 2021 21:42:13 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Jan 2021 11:11:57 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id AF06F214AD; Mon,  4 Jan 2021 11:11:56 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 0/2] Add base layer priority id control
Date:   Mon,  4 Jan 2021 11:11:52 +0530
Message-Id: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds base layer priority id control for encoder
and support for the same in venus driver.

Changes since v3:
- Rebased the changes on latest media tree.
- Addressed the comments.
- Added driver side implementation for new control.

Dikshita Agarwal (2):
  media: v4l2-ctrl: Add base layer priority id control.
  venus: venc : Add support for priority ID control.

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 9 +++++++++
 drivers/media/platform/qcom/venus/core.h                  | 2 ++
 drivers/media/platform/qcom/venus/venc_ctrls.c            | 9 ++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
 include/uapi/linux/v4l2-controls.h                        | 1 +
 5 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.7.4

