Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED6036C344
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhD0K2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235353AbhD0K17 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:27:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9EB6613B0;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=cJmIogEt8DtaRrLuirE0smJSOENxo/aAnd7cgWYfYDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=an5zXV4X4Z3N7pCHC/a/6eYE7scIqU4vlkIl+I7UH2FlGFBDBxKWTw6XmhfMDOITS
         VHft04reu6+NJE9JmenhS5NxnuekX3RtZ0ipRFGENclmNwHrveYuRGAo9cES6dQH9S
         YF87XkXE25CYGMNoRznmrPZ5amfrFy6Qk3y8Q1ulo82EJgWa33cVg2d9IuE5Aci9e4
         NJgU+orRAJb4ucqo86+R7URiJqIE9D25KyNAsmM7t7b8LZRpKbUt8w+ue7pu2lBBN8
         FdFl6ZnFLoOO+DWqn2dLwfKiZloqt1IyvR7K/XTcrOvcT8fzRaITg30hlt7aDtcqqU
         FYpkEtiYCZkHw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000o02-PS; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 17/79] media: s5p-jpeg: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:26:07 +0200
Message-Id: <7ef9d9ec7810a6d2ff53ba8685fcc91a952bbbb5.1619519080.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
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

