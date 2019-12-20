Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056381276DC
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 09:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfLTIA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 03:00:28 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:33491 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbfLTIA1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 03:00:27 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Dec 2019 13:30:23 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Dec 2019 13:30:09 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B39D2348A; Fri, 20 Dec 2019 13:30:08 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2,0/3] Enable video on sc7180
Date:   Fri, 20 Dec 2019 13:29:17 +0530
Message-Id: <1576828760-13176-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series enables video functionality for SC7180.
Here is v2 with the following changes:

 - updated the place of venus DT node to have it sorted by address

 - added dt-binding schema

 - added DT compatible string and resource structure

These changes depend on patch series [1] and [2].

Regards,
Dikshita

[1] https://patchwork.kernel.org/project/linux-media/list/?series=219021
[2] https://patchwork.kernel.org/project/linux-media/list/?series=214797

Dikshita Agarwal (3):
  arm64: dts: sc7180: Add Venus video codec DT node
  dt-bindings: media: venus: Add sc7180 DT schema
  venus: core: add sc7180 DT compatible and resource struct

 .../bindings/media/qcom,venus-sc7180.yaml          | 131 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  36 ++++++
 drivers/media/platform/qcom/venus/core.c           |  58 ++++++++-
 3 files changed, 224 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,venus-sc7180.yaml

-- 
1.9.1

