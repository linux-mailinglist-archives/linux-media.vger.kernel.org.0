Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0C636DA5B
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240718AbhD1Oze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240416AbhD1Oxx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D97761929;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=HzlriyHzqlZAHsYOJEVourXS9CSW2DolwRX6O+Dbyqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UYJGDEEyYE66z34lvWemVWFCJFqzhtfTFdIpQMk8g9d0nSbc7c5xbDfdLFEBo3Mur
         CU9aw59qOxdBVtfN1JISX4VjGfhRqkIRCinHxMBw4nUG7WBNhyOGY1oqXh4hbs3xa2
         uK9TyLSyLZ9awJBoIr6g5Ld13qjdKNBWqYhpYkxawzcOk2Rxxss69wn+HmwYMPhBOg
         nP4+ElqBXEIxzr+IrclBNnel3NVTgYOzaV6VUfUOSlgh8C85D1Hp2jKbwFP92y55vG
         /mq412QX5DG+HRYFNrXhF0UtJS6NBARyVgVWblYVJ6ehKbCJgTr9PmclbBJfPiZzRB
         JXvmAatLs/b4A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYS-001DtQ-34; Wed, 28 Apr 2021 16:52:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 76/79] media: vsp1: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:37 +0200
Message-Id: <78caedcf98e53939e1a1958a3fc3f76451458b72.1619621413.git.mchehab+huawei@kernel.org>
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

