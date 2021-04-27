Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECD736C299
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhD0KPI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235415AbhD0KOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918DE6141E;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=WqKoYQevkaStNcKaOzNIvfyWSTMDPdaJk89Ynu0GOzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LoUuZ1TaQvQ5CxmEUPAH4lqIsqWPje2SWXVaMT/ZtNuDfR3nTI8ZWAsmwr41p2IMM
         3z5seHicv+2UAiVd2MiUEchixXZRWwMB+hqJI78+10zMnyEU29EAhOhtUinvb8MGoq
         ixDj4arF48KriUB2ZlDwz59DGcaI77Eb661OQ3kRbGm0dh27eMsHsnxTR5djV4sSx1
         aa6pT5jaxD+42cb2avrORk2voD1zCEF+Gzm9xQh/g/wH5DZhiDbL4Axet3h3E08OuX
         L/ZcTQiacEtoeseaM0YCvjBIStKyG5ImGvs+LialnnAcTyRvuiLvRUskwOkyICBiv0
         O3Uc5it5DhGIg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j5A-MC; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 12/79] media: renesas-ceu: Properly check for PM errors
Date:   Tue, 27 Apr 2021 12:12:39 +0200
Message-Id: <442ba0816c3977dddf01212659443ee13f90bd5d.1619518193.git.mchehab+huawei@kernel.org>
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

Right now, the driver just assumes that PM runtime resume
worked, but it may fail.

Well, the pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.

So, using it is tricky. Let's replace it by the new
pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
and return an error if something bad happens.

This should ensure that the PM runtime usage_count will be
properly decremented if an error happens at open time.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/renesas-ceu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index cd137101d41e..17f01b6e3fe0 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -1099,10 +1099,10 @@ static int ceu_open(struct file *file)
 
 	mutex_lock(&ceudev->mlock);
 	/* Causes soft-reset and sensor power on on first open */
-	pm_runtime_get_sync(ceudev->dev);
+	ret = pm_runtime_resume_and_get(ceudev->dev);
 	mutex_unlock(&ceudev->mlock);
 
-	return 0;
+	return ret;
 }
 
 static int ceu_release(struct file *file)
-- 
2.30.2

