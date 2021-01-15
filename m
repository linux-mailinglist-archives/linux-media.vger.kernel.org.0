Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0BC02F84D7
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387920AbhAOSxz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:53:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731525AbhAOSxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:53:52 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5293BC061794
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:52:57 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C49401F659;
        Fri, 15 Jan 2021 19:52:53 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 0/2] SDM630/660 Venus hardware video decoder/encoder
Date:   Fri, 15 Jan 2021 19:52:50 +0100
Message-Id: <20210115185252.333562-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series enables the Venus hardware video decoder/encoder
on the SDM630/660 series of SoCs.

Please keep in mind that these patches (especially the dt-bindings one)
depend on series 480030 (SDM630/660 GCC/MMCC/GPUCC clock controllers),
as the MultiMedia Clock Controller and related fixes in the GCC one
are needed to enable functionality of the Venus block.

This series was tested on SDM630 and SDM636 on the following smartphones:
- Sony Xperia 10 (SDM630)
- Sony Xperia 10 Plus (SDM636)
- Sony Xperia XA2 (SDM630)
- Sony Xperia XA2 Ultra (SDM630)

P.S.: Remember! SDM636 is a variant of SDM660, *not* a variant of 630.

AngeloGioacchino Del Regno (2):
  media: venus: core: Add sdm660 DT compatible and resource struct
  media: dt-bindings: media: venus: Add sdm660 DT schema

 .../bindings/media/qcom,sdm660-venus.yaml     | 164 ++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c      |  66 +++++++
 2 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml


base-commit: 012bd807cf654b992cdc4db7eab85c1e95f9d571
prerequisite-patch-id: 734bdefdb043a8f91a48916246cc9a36fb5966e5
prerequisite-patch-id: 999517c02973237996492a41ed5bfc2990083932
prerequisite-patch-id: a48910425fac61948a7a26bec4d40d63e3368569
prerequisite-patch-id: b1a1a4216eed0d04dd16e6e8e1053dee185d06d8
prerequisite-patch-id: dff12be2631cc21ef1c3c930fba49d979f5055fe
-- 
2.29.2

