Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602823F72CA
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 12:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239641AbhHYKST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 06:18:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47912 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239525AbhHYKST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 06:18:19 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:c5f4:b90c:545d:197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DAAC61F436B4;
        Wed, 25 Aug 2021 11:17:31 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        dafna.hirschfeld@collabora.com, kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        hverkuil@xs4all.nl, dafna3@gmail.com, mchehab@kernel.org,
        tfiga@chromium.org, minghsiu.tsai@mediatek.com,
        houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com,
        tiffany.lin@mediatek.com, matthias.bgg@gmail.com,
        courbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org
Subject: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date:   Wed, 25 Aug 2021 12:17:17 +0200
Message-Id: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This patch ensures the copy of a multile of 8 size by calling
round_up(len, 8) when copying

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
changes since v2:
1. do the extra copy only if len is not multiple of 8

changes since v1:
1. change sign-off-by tags
2. change values to memset

 drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index ec290dde59cf..658161ee3e4e 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	if (len % 8 != 0) {
+		unsigned char data[SHARE_BUF_SIZE];
+
+		memset(data + len, 0, sizeof(data) - len);
+		memcpy(data, buf, len);
+		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
+	} else {
+		memcpy_toio(send_obj->share_buf, buf, len);
+	}
+
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
 
-- 
2.17.1

