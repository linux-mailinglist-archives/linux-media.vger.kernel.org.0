Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63990369F19
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhDXGqO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230174AbhDXGqL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9C3E61483;
        Sat, 24 Apr 2021 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=HLe4KX/Ouhc4/WYApYd3CynqFlO8CSujJDb9/8qfwSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GBL4bWOnVTK1kJcRfLdnm0x7AaZqDixllJExz1LOznP0I/P4vYOO3De43EBSeUOqx
         /6MF86gghR2iamcgjhxxnkW9CGyD+Ur1ZWVSEJF1WBi7WLPKVX2wqeztFx+PJ6gj8R
         JY4PdMMMbGoSqoGHhmWsqqNrMGEF3yfXEhlcYPoZTBCdEn4/LOTwJ7dNGSCfR0zDIz
         VgWWB4Bk0+XPmJkZ46eKeN3kZpoaTmzGsa0qXsD2sRL/G8u+S2XqGWLVYbvPpZ8lQ7
         RGf87MupwMkPEh1KN+nTgYizLR/1huqaFbQk1pf4/KsDDG7Xfxxzyx1Yth6pG6UBzu
         UtAfZgFl0dYlg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Je3-2U; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/78] media: s5p: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:17 +0200
Message-Id: <fa58c9a2230058116a30f682a03e496c732b9255.1619191723.git.mchehab+huawei@kernel.org>
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

While here, check if the PM runtime was caught at
s5p_cec_adap_enable().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
index 2a3e7ffefe0a..2250c1cbc64e 100644
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

