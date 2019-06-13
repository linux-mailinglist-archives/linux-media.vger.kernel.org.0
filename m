Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2042A43BE6
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfFMPcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:32:20 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47009 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbfFMKsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 06:48:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190613104844euoutp02d3f82bca08543d1d51698134da781609~nvGHTLYfn2137921379euoutp02P;
        Thu, 13 Jun 2019 10:48:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190613104844euoutp02d3f82bca08543d1d51698134da781609~nvGHTLYfn2137921379euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560422924;
        bh=Se9z/XgvOyTh19Wph2uXSpM4e/wz4ZxyFtwrJMg612c=;
        h=From:To:Cc:Subject:Date:In-reply-to:References:From;
        b=D+fYkguQppx7ng0M4FslU7W6olzqlS9ged8CeafYFdZ6BgWcvq9Qa2NJjjOySU6F8
         RhTfbYleTIYxlXz/G1yDJQT1K247dJqJvSfArv3DGLw7F0XXbS5BAIdfKwsauV3rGW
         2Ao4cjBg4AyvbdP+pSxALa2TsoXKWIbkCV7elDN0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190613104843eucas1p12bc52108ed8761b7233dae7d792cfd62~nvGG5yB-00898208982eucas1p1d;
        Thu, 13 Jun 2019 10:48:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A4.DD.04325.B0A220D5; Thu, 13
        Jun 2019 11:48:43 +0100 (BST)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190613104843eucas1p1a3c23fc9d97041384dc1108ed923245e~nvGGLqVr90899508995eucas1p1P;
        Thu, 13 Jun 2019 10:48:43 +0000 (GMT)
X-AuditID: cbfec7f5-fbbf09c0000010e5-ca-5d022a0b2d0b
Received: from eusync3.samsung.com ( [203.254.199.213]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.90.04146.A0A220D5; Thu, 13
        Jun 2019 11:48:42 +0100 (BST)
Received: from AMDC2765.DIGITAL.local ([106.120.51.73]) by
        eusync3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PT100BHVA12R000@eusync3.samsung.com>;
        Thu, 13 Jun 2019 11:48:42 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2] media: s5p-mfc: Make additional clocks optional
Date:   Thu, 13 Jun 2019 12:48:34 +0200
Message-id: <20190613104834.9781-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-reply-to: <20190613094730.31677-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZduznOV1uLaZYg55L8ha31p1jtejZsJXV
        Ysb5fUwWa4/cZbc4/Kad1YHVo2/LKkaPz5vkApiiuGxSUnMyy1KL9O0SuDL+7F3JXHCGq+Ld
        mT0sDYwvOboYOTkkBEwk7t2bxtjFyMUhJLCCUeLb9u8sEM5nRokvb6+wwVTNv/2RGSKxjFHi
        aeMvdgjnP6PElNf7mEGq2AQMJbredoF1iAg4SSyc9ResiFmgmVHidPsjoAQHh7CAs8SnCXwg
        NSwCqhJLd05mBgnzCthIrHjnCLFMXmL1hgNgIzkF7CT2vWgCGyMh8JRVYs70p8wQRS4Sf348
        h7JlJDo7DjJBFAHtenhuLVRHD6PE5aYZjBBV1hKHj19kBbGZBfgkJm2bDrZZQoBXoqNNCKLE
        Q+LxngZoYExklPjz+xTTBEaJBYwMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQIj5/S/
        4193MO77k3SIUYCDUYmHdwc7Y6wQa2JZcWXuIUYJDmYlEd4fDEyxQrwpiZVVqUX58UWlOanF
        hxilOViUxHmrGR5ECwmkJ5akZqemFqQWwWSZODilGhhXJnKoB1Y6/dnUrZF5T7jGQH5lS6zi
        g/mWsid8ej/K912SncI4U/9wNcOBg7/XzbwZJcyyMvvBx5WafPN7ol2j94W16nzzunGdwfHw
        zYmzpObEs2vtufh6bsySjc2q+assYhxjdCa4zhK52ry9a27HtHilG8ujw1+kv78raXZ4leLk
        +QoeWU5KLMUZiYZazEXFiQBu6YC7mAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLJMWRmVeSWpSXmKPExsVy+t/xq7pcWkyxBsde6FncWneO1aJnw1ZW
        ixnn9zFZrD1yl93i8Jt2VgdWj74tqxg9Pm+SC2CK4rJJSc3JLEst0rdL4Mr4s3clc8EZrop3
        Z/awNDC+5Ohi5OSQEDCRmH/7I3MXIxeHkMASRomdT/8zQjiNTBJ/J55nA6liEzCU6HrbBWaL
        CDhJLJz1lx2kiFmglVFi8+Z2li5GDg5hAWeJTxP4QGpYBFQllu6czAwS5hWwkVjxzhFimbzE
        6g0HmEFsTgE7iX0vmthBbCEBW4mern6mCYw8CxgZVjGKpJYW56bnFhvqFSfmFpfmpesl5+du
        YgQGwrZjPzfvYLy0MfgQowAHoxIP7w52xlgh1sSy4srcQ4wSHMxKIrw/GJhihXhTEiurUovy
        44tKc1KLDzFKc7AoifN2CByMERJITyxJzU5NLUgtgskycXBKNTBOyGd7m/qq0uKtHNdR8ShH
        9lXVTO2xi/nucDuvPiWyb89WVn2TYO8P3XkTtr7ZvX/H6T0RHJJ//m3aZzX/847/Dy65cJ67
        m+zya8eLPyvVPvQXqieKa2RP9lRjFT5z9pS1TqZDa7pjff17jzku6z9cY+JMPf5t56/nm4KY
        lG/sq5zLLqJt1j9HiaU4I9FQi7moOBEAOi0woQACAAA=
X-CMS-MailID: 20190613104843eucas1p1a3c23fc9d97041384dc1108ed923245e
CMS-TYPE: 201P
X-CMS-RootMailID: 20190613104843eucas1p1a3c23fc9d97041384dc1108ed923245e
References: <20190613094730.31677-1-m.szyprowski@samsung.com>
        <CGME20190613104843eucas1p1a3c23fc9d97041384dc1108ed923245e@eucas1p1.samsung.com>
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
v2: this is the correct version, v1 had parenthesis in wrong place
---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
index 2e62f8721fa5..7d52431c2c83 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
@@ -34,6 +34,11 @@ int s5p_mfc_init_pm(struct s5p_mfc_dev *dev)
 	for (i = 0; i < pm->num_clocks; i++) {
 		pm->clocks[i] = devm_clk_get(pm->device, pm->clk_names[i]);
 		if (IS_ERR(pm->clocks[i])) {
+			/* additional clocks are optional */
+			if (i && PTR_ERR(pm->clocks[i]) == -ENOENT) {
+				pm->clocks[i] = NULL;
+				continue;
+			}
 			mfc_err("Failed to get clock: %s\n",
 				pm->clk_names[i]);
 			return PTR_ERR(pm->clocks[i]);
-- 
2.17.1

