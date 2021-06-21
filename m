Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1AD3AE87A
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhFUL7H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhFUL7H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:59:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2179661108;
        Mon, 21 Jun 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624276613;
        bh=eKQAKkLLipiPydD36jq5fQOg8fFfg7eqxulZXVht4ac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hVX9hvurJiChkgzV1uDiAOYCLzGabkN66JjHWqDHrWZd1/+WCcxVs/SH0DOxZq8Kv
         U+konUGRUxfz5aT4jAYSTzX7Ib0wsr3RNXx5rnV/AyiBnIL3Sy2AS5d5DaafdvTIhS
         kmJDIkiE2APzZ8szgzvRe5A7/f9yEE0dMG4JtooLcZpxjlRnYCouIOLXOX3tkGGaFM
         gd/XbSx0+DJmFK6aK9x7prjXkbuLKkdbQX42Qa535Sf5nJYwxrPvAy1cRxdKgMjNmC
         SNekzqR+U+TB4Y0v3nGNLQ/+vWSytzILq5eJ/nezNrSFRJ9cAIyYiH4pmtCxXalUG2
         n19sCkSOiE+Sg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lvIXr-000Hcw-2Y; Mon, 21 Jun 2021 13:56:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 5/5] media: sti: don't copy past the size
Date:   Mon, 21 Jun 2021 13:56:49 +0200
Message-Id: <1c043f5c26b9cf5b4520241e2015feeae8445f58.1624276138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624276137.git.mchehab+huawei@kernel.org>
References: <cover.1624276137.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The logic at delta_ipc_open() tries to copy past the size of
the name passed to it:

	drivers/media/platform/sti/delta/delta-ipc.c:178 delta_ipc_open() error: __memcpy() 'name' too small (17 vs 32)

Basically,this function is called just one with:

	ret = delta_ipc_open(pctx, "JPEG_DECODER_HW0", ...);

The string used there has just 17 bytes. Yet, the logic tries
to copy the entire name size (32 bytes), which is plain wrong.

Replace it by strscpy, which is good enough to copy the string,
warranting that this will be NUL-terminated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/delta/delta-ipc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/delta/delta-ipc.c b/drivers/media/platform/sti/delta/delta-ipc.c
index 186d88f02ecd..21d3e08e259a 100644
--- a/drivers/media/platform/sti/delta/delta-ipc.c
+++ b/drivers/media/platform/sti/delta/delta-ipc.c
@@ -175,8 +175,7 @@ int delta_ipc_open(struct delta_ctx *pctx, const char *name,
 	msg.ipc_buf_size = ipc_buf_size;
 	msg.ipc_buf_paddr = ctx->ipc_buf->paddr;
 
-	memcpy(msg.name, name, sizeof(msg.name));
-	msg.name[sizeof(msg.name) - 1] = 0;
+	strscpy(msg.name, name, sizeof(msg.name));
 
 	msg.param_size = param->size;
 	memcpy(ctx->ipc_buf->vaddr, param->data, msg.param_size);
-- 
2.31.1

