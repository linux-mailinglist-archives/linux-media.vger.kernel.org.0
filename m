Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE0C369F9D
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244343AbhDXGsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237218AbhDXGql (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFFA56195A;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=HzlriyHzqlZAHsYOJEVourXS9CSW2DolwRX6O+Dbyqk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GVrdrc5OimlaxC6opChoqdFRAlbPB1BNRFjPJXeW7rKz4/Y8Ubpb7IR1AeWIue7EE
         1AbE8wwsAvIrb/rdYUuFZT51Sa2LZ/MzgioT/y4N+0MXNzjmOSBPQKR/rja63+eWvY
         YT1TD1WSOR32R6OQ5zLWWTdxj0AVD0g9vdqvREINu9JXeTFxJ4clU9+L3zJu48mIy/
         ydwGOPHeKgA2HcTfQWnRg96aoZDlcAJ27Rt20akKuCU1q5jzkkARtrpkjsHse4NXTP
         b0Ich01R3n2qDuVgWCzpasiBZjx0cu1HYSgX1OQzGXXVVA1fzImiMQtNKkjc8D2TxU
         mmk4jhLsCgZqA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2n-004Jih-Kx; Sat, 24 Apr 2021 08:45:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 78/78] media: vsp1: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:28 +0200
Message-Id: <967b4268e89ebd073af3f68898aa7de66a23d9e6.1619191723.git.mchehab+huawei@kernel.org>
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

