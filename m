Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945EA36C28C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhD0KO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:34882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235372AbhD0KOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C7F0613DD;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=W1MZ5fUp2z9NMPUzLbsMjuPOyaCJXem6s4s1Qkfcwz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hl/iigHU0Oesf/zRgLXJO++yUuqv4vZAop3JusfzFYwsnudK1Vk+a+6STjFmKVJ5K
         a90uNH8biqOVfPM0kvWAOBbHAmIn0mMUy8D21LXMu+GjGo0NvEbJdAALGMhihek27N
         fKQsNlLivJ9Dcg3sPs/svUGoUTeSF1v1wTrrWiCh6gYzSp9x9yl+RyqZXmw24tJ3mp
         +w6itUbrY+OKDLexMH8dmcU1OwZkSlrLiwaNrtA3SS+kNrwmKfUHx2TCJQFMThaBQK
         SJHqjlKP/V7frEdSh8gPHjlTrr1dGBKARpKtq4RqDwet5P2vfGoy6GTPOVA9QM7fyr
         MLKKSSwnemUgQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j5V-Th; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 19/79] media: sun8i_rotate: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:12:46 +0200
Message-Id: <4e9d12ab641622cf2cd1721c257c12c52271cf05.1619518193.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index 3f81dd17755c..fbcca59a0517 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -494,7 +494,7 @@ static int rotate_start_streaming(struct vb2_queue *vq, unsigned int count)
 		struct device *dev = ctx->dev->dev;
 		int ret;
 
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to enable module\n");
 
-- 
2.30.2

