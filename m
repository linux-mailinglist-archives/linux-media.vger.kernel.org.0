Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882B7369F38
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237054AbhDXGqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232082AbhDXGqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D7556157E;
        Sat, 24 Apr 2021 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=fa2a2FGqdZmNJgSzuDaYm63kRJBm/KAm+F+LdF2Flv8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hubJqfWD8OECliazbjEYhWPBZOSRrw05HyOZAlE6dGK9YwaAISlP3vdGFO+D9LYoH
         zHAzqZtCofN9Q/MAeCwUFi1cvXh6x4W2VBk7cB6XdrOO/VVUBduLOaz0aLVY5BVemL
         uW7jkF7ltd3OisRsbpZKSWvuvJACwSufWPnTE747HmUGbwiD65nk8E0oJZcR+Cb2Ko
         WrrN84duaUFNGa3KZ71CsI/PcFmRZAgWyxBOr+oX+mkvO8OzJDvozO0Wlr3lqM7CoI
         JhOQAuYCBbOt13KbWte44AI+/9cTrlRGD35RF6rzX9/oSW2YX6Hewk6ox13HMGrpYj
         Gj7fw4Slkr/dg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jdx-0b; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 05/78] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:15 +0200
Message-Id: <6ff9d0c049f94f38fd0b172fe3a6dbb36ba2b87e.1619191723.git.mchehab+huawei@kernel.org>
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

While here, check if the PM runtime was caught during
chipset probing time.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rockchip/rga/rga.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 9d122429706e..bf3fd71ec3af 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -866,7 +866,9 @@ static int rga_probe(struct platform_device *pdev)
 		goto unreg_video_dev;
 	}
 
-	pm_runtime_get_sync(rga->dev);
+	ret = pm_runtime_resume_and_get(rga->dev);
+	if (ret < 0)
+		goto unreg_video_dev;
 
 	rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
 	rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
-- 
2.30.2

