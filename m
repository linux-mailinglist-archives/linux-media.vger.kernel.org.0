Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2763F8A5B
	for <lists+linux-media@lfdr.de>; Thu, 26 Aug 2021 16:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242866AbhHZOqR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Aug 2021 10:46:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40790 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbhHZOqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Aug 2021 10:46:16 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:b4b4:99cd:b7bb:6e84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC1F31F44473;
        Thu, 26 Aug 2021 15:45:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, enric.balletbo@collabora.com,
        houlong.wei@mediatek.com, hsinyi@chromium.org, hverkuil@xs4all.nl,
        irui.wang@mediatek.com, maoguang.meng@mediatek.com,
        matthias.bgg@gmail.com, mchehab@kernel.org,
        minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com, catalin.marinas@arm.com,
        Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable media drivers of mediatek
Date:   Thu, 26 Aug 2021 16:45:16 +0200
Message-Id: <20210826144516.6359-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

add as modules:
VIDEO_MEDIATEK_VPU
VIDEO_MEDIATEK_MDP
VIDEO_MEDIATEK_VCODEC

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..f97da10a21ea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -669,6 +669,9 @@ CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_MEDIATEK_VPU=m
+CONFIG_VIDEO_MEDIATEK_MDP=m
+CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_MALI_DISPLAY=m
-- 
2.17.1

