Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9851436C39C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238263AbhD0K27 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235783AbhD0K2M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87AC76141B;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=rChg/pXG2Qjbehywcb/+z5hE6+LFH66GvNnoCtLFEBo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QoTamJiO+JxWdt3o4Hs6vYrg2jgI81cjPn/kT0glZGbqmWBM9aOjPXJVl8cyWQmQy
         26cQBTSG214To1rzhZwxEd8DWaeNPXaYCPNgx9TjugtyzxzqP17ni7VfGq7JyR1YGt
         eluVYYOH8buCEmvbeDPmH+SnnxwSJWplGFoFQrxxCI9hutBi63CEyGn6RHjyNcmng8
         XOQDYhQy3IYrSTx5pqC/lwZGxHm+ZoMJ/+a3ms26yWuqp5hKZpmOQZhbIVa71JY/AP
         +H+DNnw5dL0SKM/yN62bnrs6zSaJHLl64PNMQR3QGkuJI1GUGG6sLkl/MVozaGldFl
         WaHNIK2jM2a8g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2b-7s; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 70/79] media: rkisp1: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:00 +0200
Message-Id: <ed910c61ae00f88fcd29d15282e1018c1d894b56.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 5f6c9d1623e4..3730376897d9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -1003,9 +1003,8 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
 	if (ret)
 		goto err_pipeline_stop;
 
-	ret = pm_runtime_get_sync(cap->rkisp1->dev);
+	ret = pm_runtime_resume_and_get(cap->rkisp1->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(cap->rkisp1->dev);
 		dev_err(cap->rkisp1->dev, "power up failed %d\n", ret);
 		goto err_destroy_dummy;
 	}
-- 
2.30.2

