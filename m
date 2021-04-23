Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36CC369849
	for <lists+linux-media@lfdr.de>; Fri, 23 Apr 2021 19:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhDWR2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 13:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDWR2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 13:28:31 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC32C061574;
        Fri, 23 Apr 2021 10:27:54 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:79a2:c598:7744:783a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 735381F43D84;
        Fri, 23 Apr 2021 18:27:52 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, kernel@collabora.com,
        dafna3@gmail.com, enric.balletbo@collabora.com,
        tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org
Subject: [PATCH] media: mtk-vpu: on suspend, read/write regs only if vpu is running
Date:   Fri, 23 Apr 2021 19:27:45 +0200
Message-Id: <20210423172745.30092-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the vpu is not running, we should not relay on VPU_IDLE_REG
value. In this case, the suspend cb should only unprepare the
clock. This fixes a system-wide suspend to ram failure:

[  273.073363] PM: suspend entry (deep)
[  273.410502] mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]
[  273.455926] Filesystems sync: 0.378 seconds
[  273.589707] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  273.600104] OOM killer disabled.
[  273.603409] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  273.613361] mwifiex_sdio mmc2:0001:1: None of the WOWLAN triggers enabled
[  274.784952] mtk_vpu 10020000.vpu: vpu idle timeout
[  274.789764] PM: dpm_run_callback(): platform_pm_suspend+0x0/0x70 returns -5
[  274.796740] mtk_vpu 10020000.vpu: PM: failed to suspend: error -5
[  274.802842] PM: Some devices failed to suspend, or early wake event detected
[  275.426489] OOM killer enabled.
[  275.429718] Restarting tasks ...
[  275.435765] done.
[  275.447510] PM: suspend exit

Fixes: 1f565e263c3e ("media: mtk-vpu: VPU should be in idle state before system is suspended")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 043894f7188c..f49f6d53a941 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -987,6 +987,12 @@ static int mtk_vpu_suspend(struct device *dev)
 		return ret;
 	}
 
+	if (!vpu_running(vpu)) {
+		vpu_clock_disable(vpu);
+		clk_unprepare(vpu->clk);
+		return 0;
+	}
+
 	mutex_lock(&vpu->vpu_mutex);
 	/* disable vpu timer interrupt */
 	vpu_cfg_writel(vpu, vpu_cfg_readl(vpu, VPU_INT_STATUS) | VPU_IDLE_STATE,
-- 
2.17.1

