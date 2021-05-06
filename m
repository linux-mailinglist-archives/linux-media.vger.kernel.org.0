Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3643756CE
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbhEFP1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235349AbhEFP1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B75661922;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=GlCvanyZeZRx9KVkDMbg84X3Nl/epjQxFII8vak4mR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SczDGoVSUqwH5SFEk5OOp94u7cVZf7I+09IWLlfBEG5J4XBhTmgF1CnPo3WNRpBZN
         IaKyZ+scWvdbl4zjSO9DcL2P8lxI2PSIPsZvShJ0bWSZAJu+kGq8a5CkDmjuQpIbP9
         8TWf0dU9zCgk8l1tXdfXfRq2wavnfXytqlL8RNbLqoZCBWYHUc524/5G1070IQq2Xb
         9qDa3or5xfH7anhAokS+kPvNFz8yYsQKT0yk1YE9+G0bJuh7lfBaF83GsV24G9Uwmq
         DNRbdjSVZZl68TYukqJ+TUP3iQ0jj5ViQ/iKiTDfHJQYaoED1I2VV/fga5ioxb3trI
         0YU5gyYqfzqiQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCF-92; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v5 19/25] media: s5p-mfc: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:57 +0200
Message-Id: <1f7bfc6a99e3d63217599588452638f364ed096c.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
index 62d2320a7218..88b7d33c9197 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
@@ -78,11 +78,9 @@ int s5p_mfc_power_on(void)
 {
 	int i, ret = 0;
 
-	ret = pm_runtime_get_sync(pm->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(pm->device);
+	ret = pm_runtime_resume_and_get(pm->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* clock control */
 	for (i = 0; i < pm->num_clocks; i++) {
-- 
2.30.2

