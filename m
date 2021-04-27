Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEA736C2D1
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbhD0KQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235596AbhD0KOt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4995C61929;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=TKtKuWw4arj9gE1QW5A97zHnmgQIngfUHjaR8gvLIr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CXnGRQfdAOPG4LJPaz3UjdbjxgfUeP8HomujIYINFkYzY4GB4o8CWCVIW2GR3ELGc
         5VGBnYyV04LVREAkDn5MotNmwlQp6dsIqISTpDhAd0dhDLLIGNBe2Gjae0SAUi4ROq
         mGKXux/PbUCtrheYJMPCFBkmymM9RYnDn7xFnsaP9dFf5uBgC8V34u5OROpWfcBFAd
         fGqm160n6TzCGEFuhYSOSkSzR9TUP4iZTOz7JlU8tNCOFCEkc0S2vMUYHbZbwtWV55
         OcMo3vIL2HzqIFRk11Kbv5ZxQXw7dRpm98Taptk8whbD+RAHd8tH1iIy/UOaMML6X5
         KN+ZVDA5jsD6g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7d-Gj; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 63/79] media: exynos-gsc: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:30 +0200
Message-Id: <6ba2ed04d791b8a1529977920bcc3930c2f3238e.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

