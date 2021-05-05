Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB923737E6
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhEEJne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232432AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74FF061443;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=xqjVaoUsuvsxOD3cWDtjlqWziU1GM7gOpoA6IP+HHjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=USQxtYLCvlBgP5V/QBTap4t8elEYo77Tb1JnmJSdCTKlUDmhPFWlnGSIPZaJCyloV
         x+5zQzze2KZs0VukHfF62wzi+yw6y+3VvDnquHBFoVkXk573kcQGUODGVoRGmV/CWy
         l8HvH85dBOt8yrn9AuSCfEgQuprIKqO1CgHRtiXOyNHXA2wjSCbjBPWpPaPcmsmKp6
         w+rNH8Ok5yKHPwN0SbkIp+Jm4wvWbOdI1swTVQvKNqbXxAmhMEBYYuKv7OpwNLvic7
         3V/R3+wn/WSfQiwK4xRJhrfFCwRCqYMUKa05ZQLhI5dJKJ1nYbESOjJYu1gIzDEhVa
         F5Pw9vh6UUS0w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwj-Dl; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 19/25] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Wed,  5 May 2021 11:42:09 +0200
Message-Id: <534deda71f3cf5f865611aa839a5279e43ebe1c9.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter, avoiding
a potential PM usage counter leak.

As a plus, pm_runtime_resume_and_get() doesn't return
positive numbers, so the return code validation can
be removed.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
 
-	ret = pm_runtime_get_sync(ctx->jpeg->dev);
-
-	return ret > 0 ? 0 : ret;
+	return pm_runtime_resume_and_get(ctx->jpeg->dev);
 }
 
 static void s5p_jpeg_stop_streaming(struct vb2_queue *q)
-- 
2.30.2

