Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B0C4685C6
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 15:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235057AbhLDOvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 09:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhLDOvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Dec 2021 09:51:09 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C69C061751
        for <linux-media@vger.kernel.org>; Sat,  4 Dec 2021 06:47:44 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1409:4a00:6988:6ac4:851c:3f63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 603991F46305;
        Sat,  4 Dec 2021 14:47:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638629262; bh=NV0cIhtEfLZjaWrPyxnl9CYdjfgbGzZZlsGLWRmNCq8=;
        h=From:To:Cc:Subject:Date:From;
        b=A6xi4m2Bzqg1oxEOmrJVifXqJUnhRS8JgndUOMAK5oajizaJSKMbaUB0s0tWpb/Kv
         vll64//+xmlhia5KX14nA8/82LAwYPIPj2z6qOj0dOmHDiXZQAmQMFQtndivQIsNJd
         hOww1S7zhF9boolIgmBVARtd1Zw9O0oMLFMWarQAxT/U1cKy8mGSsgFMDKDYzF2H35
         ULqxfVWHsEU5uKxPP3MKlb4+sDV5n0iP3BsT7YYG78B/Oues/XUIW2a+OAfZvQwfZT
         JXovntl8xc823IIJO8FzoeDlPo6UCYC+a6LK9PI5o7w0pHF2/GDKASZvf3Fax0kHtZ
         sfb0ak+9GrXSQ==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        dafna.hirschfeld@collabora.com, kernel@collabora.com,
        dafna3@gmail.com, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, minghsiu.tsai@mediatek.com,
        houlong.wei@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, hverkuil@xs4all.nl
Subject: [PATCH v5] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date:   Sat,  4 Dec 2021 16:47:32 +0200
Message-Id: <20211204144732.13472-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This is because in ARM64, memcpy_toio does byte-size access
when the length is not a multiple of 8 while access to the
vpu iomem must be 4 aligned.

This patch ensures the copy of a multiple of 8 size by calling
round_up(len, 8) when copying

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
---
changes since v4:
1. replace data[SHARE_BUF_SIZE]; with data[sizeof(send_obj->share_buf)]
2. Add the explanation for the failure in commit log and inline doc

changes since v3:
1. multile -> multiple
2. add inline doc

changes since v2:
1. do the extra copy only if len is not multiple of 8

changes since v1:
1. change sign-off-by tags
2. change values to memset

 drivers/media/platform/mtk-vpu/mtk_vpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 7f1647da0ade..2ef93db239b9 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -349,7 +349,22 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	/*
+	 * On Arm64, the memcpy_toio does byte-size access as long as address or length are
+	 * not 8 aligned. Access to the vpu iomem must be 4 aligned. Byte-size access is
+	 * not allowed and cause processing to fail. Therefore make sure the length
+	 * sent to memcpy_toio is a multiply of 8.
+	 */
+	if (len % 8 != 0) {
+		unsigned char data[sizeof(send_obj->share_buf)];
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

