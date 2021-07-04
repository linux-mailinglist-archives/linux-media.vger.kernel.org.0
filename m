Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6327B3BB0E7
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 01:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhGDXJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Jul 2021 19:09:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231781AbhGDXJI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 4 Jul 2021 19:09:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 872FF613F3;
        Sun,  4 Jul 2021 23:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625439991;
        bh=hSjnugpCRJfdhSCYyqirPRHugjApYrssbPiR6eQSbaA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SyTphcY8UlBiYH7DJcF01DfWKLlj6Etaikx4Vy+Q9kjZiMjyiqiKnL2AeMnwu+lVI
         CWNHToZNXuJkVYaSKY1Bk0k2EAaeLy+66ew1CCScWE4PEDrwCOtfyghAxIbcSOwNdY
         eq86an74LmUVTk8UgnHHAvvpZdMyZbGE+5dan1d2CKJEnK87V/7LweM5jyK8Y2sCjV
         VOFLjkP8NDdHn9/XYLixqZfo9FUgQrUX/EIXT3r7FxkqpBOrlc4sv1sDfRKBnj/V7O
         46+oyvJtr5SkNWFEjyR/ZnxAw+MxCD3WalxeV5HPKL9R8o0/i8UWviZMsGQYXv5hoj
         NrrNojG37qYrg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 11/80] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Sun,  4 Jul 2021 19:05:07 -0400
Message-Id: <20210704230616.1489200-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230616.1489200-1-sashal@kernel.org>
References: <20210704230616.1489200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

[ Upstream commit 10343de268d10cf07b092b8b525e12ad558ead77 ]

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

As a plus, pm_runtime_resume_and_get() doesn't return
positive numbers, so the return code validation can
be removed.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 026111505f5a..d402e456f27d 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2566,11 +2566,8 @@ static void s5p_jpeg_buf_queue(struct vb2_buffer *vb)
 static int s5p_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct s5p_jpeg_ctx *ctx = vb2_get_drv_priv(q);
-	int ret;
-
-	ret = pm_runtime_get_sync(ctx->jpeg->dev);
 
-	return ret > 0 ? 0 : ret;
+	return pm_runtime_resume_and_get(ctx->jpeg->dev);
 }
 
 static void s5p_jpeg_stop_streaming(struct vb2_queue *q)
-- 
2.30.2

