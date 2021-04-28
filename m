Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6318336DA54
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240688AbhD1OzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:36738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240400AbhD1Oxs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9882D6192C;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=Z5Yp+Q0q2yqOayRyZCcv1BilN9Ip1CW26ivzhLbxUjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N6119slbKp7xKpHK7jY2N8QjZug1qcVWXOfLByFNNeGoy3Vj3JMny2WxtD3OXQZoe
         rNwfv3MIW+m4EAbkrPp/7C2duKZV0SMWzp00ls4/aXYbJzf4ILmBzgnv3OSRMXptP1
         ZMpgf5x9q6W1XIaYKYJiQq7Az7WcT2yJl1E9zIX/9sPSUgckGx7jXJzO75mqUfgubL
         71QkdB7FU4/t66ILdDfb+Q0CQVdhLaghByNUq0tSSWG2IgezZsDbcs5OFUvoI9TPxk
         5x0CA8cav47vhS4QFCvVvpj+dbNhxfyXYYGQcj8k0fBH85+IPu+HrzihfwHzzsmxWa
         ILJ4mlCf07p0A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsd-DE; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 63/79] media: exynos-gsc: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:24 +0200
Message-Id: <31bdadf2f59e86c6a315ec390b44c6c681af6647.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 27a3c92c73bc..09551e96ac15 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -58,7 +58,7 @@ static int gsc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct gsc_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->gsc_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->gsc_dev->pdev->dev);
 	return ret > 0 ? 0 : ret;
 }
 
-- 
2.30.2

