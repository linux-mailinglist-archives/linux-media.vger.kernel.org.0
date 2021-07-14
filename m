Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599523C7EDF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 09:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbhGNHEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 03:04:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:57571 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238118AbhGNHEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 03:04:32 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 14 Jul 2021 00:01:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jul 2021 00:01:40 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Jul 2021 12:31:20 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id D300D21B6B; Wed, 14 Jul 2021 12:31:18 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 0/7] media: venus: Enable venus support on sc7280
Date:   Wed, 14 Jul 2021 12:31:01 +0530
Message-Id: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series enables support for 6xx venus encode/decode on sc7280.

The driver changes are dependent on [1]yaml and [2]dts patches.

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=484019
[2] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=484727

Changes since v2:
 - no longer considering client buffer requirement to calculate
   output buffer min count.
 - addressed comments on v2 (stanimir).

Dikshita Agarwal (7):
  venus: firmware: enable no tz fw loading for sc7280
  media: venus: core: Add sc7280 DT compatible and resource data
  media: venus: Add num_vpp_pipes to resource structure
  media: venus: hfi: Skip AON register programming for V6 1pipe
  venus: vdec: set work route to fw
  media: venus: helpers: update NUM_MBS macro calculation
  media: venus: Set buffer to FW based on FW min count requirement.

 drivers/media/platform/qcom/venus/core.c           | 54 ++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h           |  2 +
 drivers/media/platform/qcom/venus/firmware.c       | 42 ++++++++++++-----
 drivers/media/platform/qcom/venus/helpers.c        | 26 +++++++----
 drivers/media/platform/qcom/venus/hfi_cmds.c       |  7 +++
 drivers/media/platform/qcom/venus/hfi_helper.h     | 14 ++++++
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  7 +++
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |  6 ++-
 drivers/media/platform/qcom/venus/hfi_platform.c   | 13 ------
 drivers/media/platform/qcom/venus/hfi_platform.h   |  2 -
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  6 ---
 drivers/media/platform/qcom/venus/hfi_venus.c      |  4 ++
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |  2 +
 drivers/media/platform/qcom/venus/vdec.c           | 42 ++++++++++++++---
 14 files changed, 178 insertions(+), 49 deletions(-)

-- 
2.7.4

