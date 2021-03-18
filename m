Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E65C340703
	for <lists+linux-media@lfdr.de>; Thu, 18 Mar 2021 14:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhCRNiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Mar 2021 09:38:02 -0400
Received: from m12-18.163.com ([220.181.12.18]:42784 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229951AbhCRNhy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Mar 2021 09:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3Qe0L
        Vz4zCcGuUrxPrkUKDKeLuAg+MUbaKUkg2ec1CI=; b=nfD+JUr6ePI40NdGH2HWf
        8fjxPePojS55PgGakYaVwWNsbD+iFxJ4zCM+v+dbYdl/ww14hagHiNkUURYaQr4I
        Wg5QEycbuH0pdDsBTUkH5MzxxcKr4PQaP5eOm9RzKiQRHIo3TavYVwQPBJOf78sD
        wDswST7p+aFijtRf/+8XS4=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
        by smtp14 (Coremail) with SMTP id EsCowAAnI_GDV1NgHojUZQ--.56749S2;
        Thu, 18 Mar 2021 21:37:19 +0800 (CST)
From:   ChunyouTang <tangchunyou@163.com>
To:     dongchun.zhu@mediatek.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tangchunyou@yulong.com
Subject: [PATCH] driver/media/i2c:fix unneeded semicolon
Date:   Thu, 18 Mar 2021 21:37:04 +0800
Message-Id: <20210318133704.678-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAAnI_GDV1NgHojUZQ--.56749S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4BTYUUUUU
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHhBZUVSItU27ngAAsH
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: tangchunyou <tangchunyou@yulong.com>

delete unneeded semicolon

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/media/i2c/ov02a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 60b4bc6..c47b1d4 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -700,7 +700,7 @@ static int ov02a10_set_ctrl(struct v4l2_ctrl *ctrl)
 	default:
 		ret = -EINVAL;
 		break;
-	};
+	}
 
 	pm_runtime_put(&client->dev);
 
-- 
1.9.1


