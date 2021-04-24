Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0664369F57
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237338AbhDXGqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233077AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4908861621;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=HPXSSHVNkadxpReM7bF5CuY3s1w7BYlO9tOtwx586ao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uU/J4RVwTdifXUXHaWtAFQnuBjrZsl2Tze9MFfsxMVFh8KugwkvcLGaJqH9CeN7lQ
         DYbqKgfIqc8fPzWqecO47Zudi2mkwPaGLSUXxAgHNenVZT5/olSkrTeoqvG4TLYHx9
         HBarVv+6R/lacN5IT+7O9rCGBVw/fv/jcSjXIs4Pc4rrU/9FkW7Z3mem7I3uD5JFBO
         DW5v6Z8HerHHlWbXREGMuPIbVIyWu4ThStFcAxHe5ULgz0QqdEp8Y82S5+Po2DAA04
         9OYqIDtHwaK2RydimZaH9LVfvkbUXcx5d4AqQER52UtnQnMEAGiiKXvLyV67XpIo35
         cpeGyfHPBaLeA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jej-Fu; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 21/78] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:31 +0200
Message-Id: <01560ba01a8e6ecb0e2e525e9b47a544c04f735c.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

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

