Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4033737D9
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbhEEJn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:48636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232413AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 440076141C;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=e6cg3vt5gdRSnzuWDjBWlr3jZ9qzDtzBe//Hw9aDZms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UTRFnfuFAjc8bTsLJzXYCs7bJJiLrJT4aQkq1wE9ELZ6bKZpIV6DU2/2WkfulFbcY
         cPj0VkZ3DAStETq7XrOAHya7zoBwOUAHf+uBYsaugIK2BUoPEEe3EIZiCXKxs/H3PY
         S1h4gng4dzYhzkIbwKC4FdNUn5hhX/jlvDXh1hQ2fZlbOI1zLz5ag+IGIh73Y2393A
         tHkNN1cFwcAc2/pPzizSb1l8tNLjGGzGmumw9eyhWgCrXvEmc52XZSyALnDEbkMIhF
         AOHskWLYGBMnAxEGxWrWYKHX9r+giFf3kl/zSllgbc8vInNM8g3KVFaa0jolGb1PLT
         nu9zA4ms+MRMA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwX-8H; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 15/25] media: s5p: fix pm_runtime_get_sync() usage count
Date:   Wed,  5 May 2021 11:42:05 +0200
Message-Id: <57a141a2c538b253f1c9502a790c370007d2ed83.1620207353.git.mchehab+huawei@kernel.org>
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

While here, check if the PM runtime error was caught at
s5p_cec_adap_enable().

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 3c7c4c3c798c..028a09a7531e 100644
--- a/drivers/media/cec/platform/s5p/s5p_cec.c
+++ b/drivers/media/cec/platform/s5p/s5p_cec.c
@@ -35,10 +35,13 @@ MODULE_PARM_DESC(debug, "debug level (0-2)");
 
 static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
+	int ret;
 	struct s5p_cec_dev *cec = cec_get_drvdata(adap);
 
 	if (enable) {
-		pm_runtime_get_sync(cec->dev);
+		ret = pm_runtime_resume_and_get(cec->dev);
+		if (ret < 0)
+			return ret;
 
 		s5p_cec_reset(cec);
 
-- 
2.30.2

