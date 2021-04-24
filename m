Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D8369F34
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbhDXGqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232511AbhDXGqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2653761584;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=9FSuKWFuUqPUC2dP9taAm5sC7kLWnC4fEOP9jl+QpYQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P1rlvfWICHzYQjAeRTWZGi1fek8JE31SKg6P3Ng3YeBzD7uQ0kL4JFugJmcA8+HeC
         7ezVuETYnfrNuzsaCSzS7VlniCF5gfAc/o52ejMmVuqLZ+WhhJ93+OtiHkBmjXLgst
         Wru9FQFEHDlwd5nKcN2UsvcmcBrfSy++XpuEEnCDrWE3UEeclMaHrIf/3LT9sa7ZIl
         CNksrXcVYYlYLSiVABqo1YjlSHxsHKzpElve+Nw1ZLk3970A57yj5edAtzNoB7hGlU
         PIWGLkJQTsIclDvQF8SXkRblltt4ZRn7lLam1HCghaGlbMc6AawBleHKkca0h//g50
         DvTK196PQ2BXQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JeR-9z; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 15/78] staging: media: ipu3: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:25 +0200
Message-Id: <568cb990e646be64c7d8017c1845621f66d1b9cc.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/staging/media/ipu3/ipu3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index ee1bba6bdcac..8e1e9e46e604 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -392,10 +392,9 @@ int imgu_s_stream(struct imgu_device *imgu, int enable)
 	}
 
 	/* Set Power */
-	r = pm_runtime_get_sync(dev);
+	r = pm_runtime_resume_and_get(dev);
 	if (r < 0) {
 		dev_err(dev, "failed to set imgu power\n");
-		pm_runtime_put(dev);
 		return r;
 	}
 
-- 
2.30.2

