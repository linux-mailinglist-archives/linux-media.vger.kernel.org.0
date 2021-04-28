Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1384D36DA17
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240426AbhD1Oxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:36356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240291AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21675614A7;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=W1MZ5fUp2z9NMPUzLbsMjuPOyaCJXem6s4s1Qkfcwz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j2TOTcw5C445poYixO6MB4771lIkivCDk6l1WcyEeoHLXx/19d6xJ7PwFCbd9A7zF
         nvUAN9xfF2FVM2yBWLaiNmalMlFsxj5A/UBsSSi6eDtBqBG1TUqiwtAMuwwuBPz4Wa
         T6MVM6CztEmBDxh1mW/Jz/Xs5VyReq83re7kSzaJaSFdmsHDnc89Y8hn9PjRx1ehzZ
         OFEAxVTSyd6mB4N7MKW6xKmWnVg/yWiU0CN6VtsO3ruHXAhRALU0U9raQ1OvIeylA6
         0nG8cb9T4w9p+CmQzNnwUlsyp9YqwWAVvIbjdlCaN70KmHaX5tX8q8E6rdVLzQeGTA
         +JpqFWntku3vg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DqV-3i; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 19/79] media: sunxi: fix pm_runtime_get_sync() usage count
Date:   Wed, 28 Apr 2021 16:51:40 +0200
Message-Id: <17cf60c9e5190ff83de40284bb858581bb0ec4a6.1619621413.git.mchehab+huawei@kernel.org>
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

