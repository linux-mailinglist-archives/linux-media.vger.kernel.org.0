Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC50B36C2E2
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236731AbhD0KQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235790AbhD0KPL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCE406195E;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=/R60wucnhMxzatTcaaq6aX+wA4KyHRrla+Ogrsx7GxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AZ9IAMfTbC6VCIWCPQlVZ4eZKImP4UuqT9UAattBwUeM/l8qVA4Noq1J7332fl49c
         ug7YMVGmUJ0d1CgHbsv8SOYob4GcnKR1mdjUe128o5oRbp/PHT9sjwKcANpAzOt9GC
         8TUDuldsBLF9F+f6rkbpa8VVrYGzLE9DM0AFV6pUGs/cV+trIcFZD1Q9tINtrZ29Ai
         RU4FmZTlQdW+xhZ7w6ktbcDzef+/f7qc3xjYo31aaPkzZc4UdCCpmGPVTlnbGdjlBk
         h0FBsIog30AT+u8t68xZs81J5kjlh94OMVu05Zc/tofpbeqZIjOiW5Rfw0XSpSrd3C
         TtUvtp88E1l9w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj2-000j8A-3K; Tue, 27 Apr 2021 12:13:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 74/79] media: stm32: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:41 +0200
Message-Id: <138647d154e523f6e0ff04af1dd94e8bd0facff3.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/stm32/stm32-dcmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index bbcc2254fa2e..5f4e1db8cfcd 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -723,11 +723,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	u32 val = 0;
 	int ret;
 
-	ret = pm_runtime_get_sync(dcmi->dev);
+	ret = pm_runtime_resume_and_get(dcmi->dev);
 	if (ret < 0) {
 		dev_err(dcmi->dev, "%s: Failed to start streaming, cannot get sync (%d)\n",
 			__func__, ret);
-		goto err_pm_put;
+		goto err_unlock;
 	}
 
 	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
@@ -848,6 +848,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_pm_put:
 	pm_runtime_put(dcmi->dev);
+err_unlock:
 	spin_lock_irq(&dcmi->irqlock);
 	/*
 	 * Return all buffers to vb2 in QUEUED state.
-- 
2.30.2

