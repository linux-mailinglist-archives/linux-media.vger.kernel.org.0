Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213536DA19
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240421AbhD1Oxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240292AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 104BD61482;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=kZnJ3c5lxpnyMUPcou0x/B7YpZdYmZe9W/fJf9NvZfI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oSFD5gjj1UhSA5WJUYg4n0cCSF6kFkwx1Z8v9LX72qbiifLtfs4O1M80mPTmB3eiD
         1Z3J6u++rlX0YrXAOv52opoAPVUF8J+4HEipvqGNBiUUP9+sRWU+o5F6usoKHSmFN3
         cw7tzFyLyyXm0tbSNHbbrYXx6bp77puSsAxEskJJbQiaGlFvfthvfT2F2fZPAbuVuZ
         hR4kRBVabfZyU1ygSCPEgS/ehEcYcOWjh/j4SrJb/vQpr/uvfzRu+ku5zpoc3/2S4H
         MdaO1KxTiCxV9v3hblGbNnAwcEBnkLskuGC7XS5upffVde2RDJy9RoRGsbxw1N1uNw
         70d/68RpzcNVQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DqP-1s; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 17/79] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:38 +0200
Message-Id: <83a1f7979382d5d5c44964baae819589c94d80c2.1619621413.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s5p-jpeg/jpeg-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 026111505f5a..c4f19418a460 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2568,7 +2568,7 @@ static int s5p_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct s5p_jpeg_ctx *ctx = vb2_get_drv_priv(q);
 	int ret;
 
-	ret = pm_runtime_get_sync(ctx->jpeg->dev);
+	ret = pm_runtime_resume_and_get(ctx->jpeg->dev);
 
 	return ret > 0 ? 0 : ret;
 }
-- 
2.30.2

