Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D5136C2E8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbhD0KQn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:34910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235942AbhD0KPO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1700B61968;
        Tue, 27 Apr 2021 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518434;
        bh=HzlriyHzqlZAHsYOJEVourXS9CSW2DolwRX6O+Dbyqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J5cpkI1Qlep4gAdUE4qBI4ZNx6+hd1seEK/CICW3B85BWgCm2lMSWzseaXUPQe/uX
         5RYajuL18Bpdj1iUMcupp0yxEK4NyK2WTRCAhqalYBtgCP+chu/RmMlaC1ek6zFZ5i
         1ytXSg/mrycAk2IjTDYxZHHxbqNP3oqRG4WOLmw5mOIhQ+fHxeNdguB06OEA467LJG
         HKJXBf18OAdGMv8wSYZEXdB/1GoA6kdBaxSiwkQ6Ks7LgTQQtbp3lJQMDAUdGpddAa
         W9GT6tyWCHRRUe6D3rPXXAhBRKG+YNlE24bAqE5RVdJMXUWuRa/wt5lXE6ZexoqjP7
         KHtMtI3aI8Ntg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj2-000j8J-9i; Tue, 27 Apr 2021 12:13:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 77/79] media: vsp1: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:44 +0200
Message-Id: <f956707120baf1b718c27ebeea1a5c4c84100e7b.1619518193.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index aa66e4f5f3f3..c2bdb6629657 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -561,11 +561,9 @@ int vsp1_device_get(struct vsp1_device *vsp1)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(vsp1->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vsp1->dev);
+	ret = pm_runtime_resume_and_get(vsp1->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.30.2

