Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6E0369F95
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhDXGs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:36096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237130AbhDXGqj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6E0F61945;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=g3U42mTCX58vPHFzw5e1ALRdM6DIRlxQAAjJ/CS5BaU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ep+v57zmsmwNsCZzxBz83Nt0ye7KmeHxGupEj1EPkuJLCMe5JmH0Kx+g/YJVdjFJ1
         ranNjMSngZaBhiqxld55EdgLZlsFYgWk8m9kr2BkZLxjAK1ZU5U4yqLMkNaB2UYbsl
         PDygjW7h0lUOnciUMWE0LFH4JaoUeF7wkIPR3EWYQU65k8ArN//UHUR+yoa29QYRoN
         ctlSP0sHwcqnryqUGu/7gv6DjZnKxlD6ARvPRQyNU/6AnsZETMaHxAlEkud4qN+Ejw
         LUfReYxdQN1jV1pwpdj1X4v2IhZvk7awtx2IG1ZXIHAoHT9gQVwshMy/I/Q4FsAwme
         Rc8WQqRMprmDQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004JgQ-Gi; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 56/78] media: coda: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:06 +0200
Message-Id: <5102aef0e5d4ccfafed92087e3800ffaca4736ba.1619191723.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index bd666c858fa1..fea1c136a42c 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -2660,7 +2660,7 @@ static int coda_open(struct file *file)
 	ctx->use_vdoa = false;
 
 	/* Power up and upload firmware if necessary */
-	ret = pm_runtime_get_sync(dev->dev);
+	ret = pm_runtime_resume_and_get(dev->dev);
 	if (ret < 0) {
 		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
 		goto err_pm_get;
-- 
2.30.2

