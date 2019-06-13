Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBB943D8D
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731850AbfFMPmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:42:54 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35051 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731840AbfFMJrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 05:47:45 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190613094741euoutp0103d226b3c2d264f01125b5c9e393af96~nuQ0Ak0Gu1323513235euoutp01L;
        Thu, 13 Jun 2019 09:47:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190613094741euoutp0103d226b3c2d264f01125b5c9e393af96~nuQ0Ak0Gu1323513235euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560419261;
        bh=EJzzKLb9Iz9qHgQgZmOsFGwgKWlFY0C1qHjIt3S80sU=;
        h=From:To:Cc:Subject:Date:References:From;
        b=rA5Fz+AamxfcQRkk5VXCqjGoHw6RKBYUm9OGPqa9GpxOKbU0NobtBwIdo581G50DK
         PrrRgg/mX1zVbtfRmlNTAgIuFSNb6DgAbrDiQDu2A6aXRbkA9XxM5ZUxzbY6tbTNPP
         ngzjmrpkoIn2N48G7UCeV3Ipt6+LmllSkKGTeyRE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190613094740eucas1p241473b488dbc3a2b98e24fe82fa855f4~nuQzi1lec3182131821eucas1p2b;
        Thu, 13 Jun 2019 09:47:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6D.26.04325.CBB120D5; Thu, 13
        Jun 2019 10:47:40 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190613094740eucas1p2e6f55ce5ffbc90c8893167fa4f23af91~nuQy4Way70548205482eucas1p2v;
        Thu, 13 Jun 2019 09:47:40 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-44-5d021bbc65bd
Received: from eusync4.samsung.com ( [203.254.199.214]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id FF.E3.04140.BBB120D5; Thu, 13
        Jun 2019 10:47:39 +0100 (BST)
Received: from AMDC2765.DIGITAL.local ([106.120.51.73]) by
        eusync4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PT100M6Z77BO730@eusync4.samsung.com>;
        Thu, 13 Jun 2019 10:47:39 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] media: s5p-mfc: Make additional clocks optional
Date:   Thu, 13 Jun 2019 11:47:30 +0200
Message-id: <20190613094730.31677-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsWy7djPc7p7pJliDVoWq1jcWneO1aJnw1ZW
        ixnn9zFZrD1yl93i8Jt2VgdWj74tqxg9Pm+SC2CK4rJJSc3JLEst0rdL4MrYt/swY0EzV8XR
        3nb2Bsb1HF2MnBwSAiYSjb1n2LoYuTiEBFYwSny7/pkJwvnMKLH94HMWmKrejqnsEIlljBK9
        d/ZCVf1nlJix9yErSBWbgKFE19suNhBbRMBJYuGsv2AdzALNjBKn2x+BJYQFHCSWHPgF1sAi
        oCrRurqFCcTmFbCVeN4zgxlinbzE6g0HmEGaJQROskqc7l8INIkDyHGR6LvGA1EjI3F5cjcL
        RA3Qgofn1rJDOD2MEpebZjBCVFlLHD5+EWwbswCfxKRt05khBvFKdLQJQZR4SKxYt4sdxBYS
        iJWY8/Qf+wRG8QWMDKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECI+T0v+NfdzDu+5N0
        iFGAg1GJh3cHO2OsEGtiWXFl7iFGCQ5mJRHeHwxMsUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
        qxkeRAsJpCeWpGanphakFsFkmTg4pRoYT2z3/Hpmxj5HrW0zWyZmTec5oa+b991lz0qJ0KhO
        /tpNUtOuv9a4XR3IbZOm+neix/k/2u92d63iUPA6HXosptVg9YY2FbsJRTlK3Wuf7Zg8Kzx1
        mn0mn9Gzvf9tXI9IuLydKedbqfk6v+os29Qvgdff2yZKVzMorDzyX2JN56b7ezzYKtruK7EU
        ZyQaajEXFScCAPQiLDKMAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGJMWRmVeSWpSXmKPExsVy+t/xa7q7pZliDVb8NrG4te4cq0XPhq2s
        FjPO72OyWHvkLrvF4TftrA6sHn1bVjF6fN4kF8AUxWWTkpqTWZZapG+XwJWxb/dhxoJmroqj
        ve3sDYzrOboYOTkkBEwkejumsoPYQgJLGCW2vIrvYuQCshuZJF5e62ACSbAJGEp0ve1iA7FF
        BJwkFs76yw5SxCzQyiixeXM7C0hCWMBBYsmBX6wgNouAqkTr6hawZl4BW4nnPTOYIbbJS6ze
        cIB5AiPXAkaGVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIG+3Xbs55YdjF3vgg8xCnAwKvHw
        7mBnjBViTSwrrsw9xCjBwawkwvuDgSlWiDclsbIqtSg/vqg0J7X4EKM0B4uSOG+HwMEYIYH0
        xJLU7NTUgtQimCwTB6dUA6Pe2egjL3qvvFIveVO9RE+5e/V3OdaGT9rxnw7cYvRWu8r/xPrg
        b6M3C5+YrFV6uMjrLJ9Kc1za1jNhjxuPPzOa7ldycELvkQpPqwXaq/YfmrviQcTKMC7vHKnL
        DU8fOKj1T7CXs2TNOB8fqfhkcmrb5137jhdnKljqfzUp+5yc0vUhMqXidJkSS3FGoqEWc1Fx
        IgD/JaU/6QEAAA==
X-CMS-MailID: 20190613094740eucas1p2e6f55ce5ffbc90c8893167fa4f23af91
CMS-TYPE: 201P
X-CMS-RootMailID: 20190613094740eucas1p2e6f55ce5ffbc90c8893167fa4f23af91
References: <CGME20190613094740eucas1p2e6f55ce5ffbc90c8893167fa4f23af91@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the beginning the second clock ('special', 'sclk') was optional and
it is not available on some variants of Exynos SoCs (i.e. Exynos5420 with
v7 of MFC hardware). However commit 1bce6fb3edf1 made handling of all
specified clocks mandatory. This patch restores original behavior of the
driver and fixes its operation on Exynos5420 SoCs.

Fixes: 1bce6fb3edf1 ("[media] s5p-mfc: Rework clock handling")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
index 2e62f8721fa5..d2872e19dd9d 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
@@ -34,6 +34,11 @@ int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
 	for (i = 0; i < pm->num_clocks; i++) {
 		pm->clocks[i] = devm_clk_get(pm->device, pm->clk_names[i]);
 		if (IS_ERR(pm->clocks[i])) {
+			/* additional clocks are optional */
+			if (i && PTR_ERR(pm->clocks[i] == -ENOENT)) {
+				pm->clocks[i] = NULL;
+				continue;
+			}
 			mfc_err("Failed to get clock: %s\n",
 				pm->clk_names[i]);
 			return PTR_ERR(pm->clocks[i]);
-- 
2.17.1

