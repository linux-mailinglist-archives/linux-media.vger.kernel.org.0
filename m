Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F148369F51
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbhDXGqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232742AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57D6261626;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=qoORv18jmoZdLwiy2XtjoLyEheeVP14AOEUNQBQWQJ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ieDxBAbfFaxqZDSr+y9csJifDJsicJVEQJ0wjfRFLrBtUEf5xhPDf9t3dMZ+NzXzF
         J3jyIVhgdw5MLa//cBQu53DmuRneAdy2MrtXu8J3K0WnGtgv64BnxrKP/a8xJBEbH/
         sjuXjAqOtuSFABLUYt1CiN+OUI9DQCTIGihSXsVlA2wwnybntBsDprsMv+XRAnl8mu
         STkF76aBxV2Bgturo3rIVJLeNT02rVnv8WP0fOkSrd94lZfiXAE+mbyS/sAiYL8OeA
         qNE21qdWvcfAUNU43NSoT7NIRFlTRz6HbYH5KchIj3O/NrfV87aqbvxXq09vnMh5E8
         HeKxOL8gjn+cg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jep-Hm; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 23/78] media: sun8i_rotate: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:33 +0200
Message-Id: <4be9eda76abe0279438375abb0204bcf96aeb618.1619191723.git.mchehab+huawei@kernel.org>
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

