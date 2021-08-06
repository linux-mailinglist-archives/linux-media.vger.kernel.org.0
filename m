Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFCE3E261B
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 10:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243442AbhHFI3n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 04:29:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43504 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244664AbhHFI3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 04:29:17 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86E691F413B3;
        Fri,  6 Aug 2021 09:28:59 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, tfiga@chromium.org, minghsiu.tsai@mediatek.com,
        houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com,
        tiffany.lin@mediatek.com, matthias.bgg@gmail.com,
        courbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH v2] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date:   Fri,  6 Aug 2021 10:28:10 +0200
Message-Id: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This patch ensure copy of a multile of 8 size by calling
round_up(len, 8) when copying

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
changes since v1:
1. change sign-off-by tags
2. change values to memset

 drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index ec290dde59cf..66276c5a1bc3 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
 	struct share_obj __iomem *send_obj = vpu->send_buf;
+	unsigned char data[SHARE_BUF_SIZE];
 	unsigned long timeout;
 	int ret = 0;
 
@@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	memset(data + len, 0, sizeof(data) - len);
+	memcpy(data, buf, len);
+	memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
 
-- 
2.17.1

