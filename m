Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FD913A9C0
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 13:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgANMyD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 07:54:03 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:65131 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbgANMyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 07:54:03 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jan 2020 18:24:00 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Jan 2020 18:23:47 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id EB3EA3587; Tue, 14 Jan 2020 18:23:45 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH V4 0/4] Enable video on sc7180
Date:   Tue, 14 Jan 2020 18:23:32 +0530
Message-Id: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Changes since v3:

  - addressed DT and DT schema review comments.

  - renamed DT schema file.

v3 can be found at [1].
These changes depend on patch series [2] - [6].

Thanks,
Dikshita

[1] https://lkml.org/lkml/2020/1/2/267
[2] https://patchwork.kernel.org/project/linux-media/list/?series=219021
[3] https://patchwork.kernel.org/project/linux-media/list/?series=214797
[4] https://lkml.org/lkml/2019/12/27/73
[5] https://lore.kernel.org/patchwork/project/lkml/list/?series=418681
[6] https://lore.kernel.org/patchwork/project/lkml/list/?series=424054

Dikshita Agarwal (4):
  arm64: dts: sc7180: Add Venus video codec DT node
  dt-bindings: media: venus: Add sc7180 DT schema
  venus: core: add sc7180 DT compatible and resource struct
  arm64: dts: sc7180: Add Venus firmware subnode

 .../bindings/media/qcom,sc7180-venus.yaml          | 144 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  36 ++++++
 drivers/media/platform/qcom/venus/core.c           |  45 +++++++
 4 files changed, 231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml

-- 
1.9.1

