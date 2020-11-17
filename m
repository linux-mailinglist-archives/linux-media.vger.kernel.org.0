Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22C92B571A
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 03:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKQCwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 21:52:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8098 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgKQCwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 21:52:14 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CZr7Y0RJfzLnv3;
        Tue, 17 Nov 2020 10:51:53 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 17 Nov 2020
 10:52:05 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-kernel@vger.kernel.org>
CC:     <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH] [media] omap4iss: return error code when omap4iss_get() failed
Date:   Tue, 17 Nov 2020 10:50:41 +0800
Message-ID: <20201117025041.3424574-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If omap4iss_get() failed, it need return error code in iss_probe().

Fixes: 59f0ad807681 ("[media] v4l: omap4iss: Add support for OMAP4...")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/media/omap4iss/iss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index e06ea7ea1e50..3dac35f68238 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -1236,8 +1236,10 @@ static int iss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
-	if (!omap4iss_get(iss))
+	if (!omap4iss_get(iss)) {
+		ret = -EINVAL;
 		goto error;
+	}
 
 	ret = iss_reset(iss);
 	if (ret < 0)
-- 
2.25.1

