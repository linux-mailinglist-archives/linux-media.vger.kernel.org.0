Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D1936C39D
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238268AbhD0K3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235770AbhD0K2M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73FC66140F;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=HzlriyHzqlZAHsYOJEVourXS9CSW2DolwRX6O+Dbyqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HxVP4KEkcKlNvIkQOkmBxLuatgvSRun1ZqFvIYnxgCB/3a7y570rBkCO09tODIHe3
         ZE9I2P7BPtdg/pzsuKQ48T9XwJlMQ/RvX9MIHqQcjTlUnGR6ESI2k2CRiYxjbg7x33
         SgNWhDzVC/jQ1yxmFFgrj4hGryrt0y+GFNjyI6n9YhGwtT5A7fHIR31ZlIv1FU1YE+
         ZhUXWPCLN0eyqiW/xAARYZsg2AZzVNgQUQb7EqGjNNWSUstlHqHnt44+86lbmdUTLS
         Pt/K5vVh6gI61Bpw+wJ8zDMOaJEtKZf1Z4zVwq005d9Uf2VHRk2kL9O8FnGl8YPutX
         QYPVLG6GBYJLA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2w-P3; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 77/79] media: vsp1: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:07 +0200
Message-Id: <a1470adef5eb86291f8fe72c9270ae54b84d6b28.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

