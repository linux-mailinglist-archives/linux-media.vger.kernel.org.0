Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 997F1F6FB5
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 09:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfKKI3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 03:29:14 -0500
Received: from mail-m972.mail.163.com ([123.126.97.2]:55062 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKI3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 03:29:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=IXLiI1+30Yp1RuwY8a
        32SvH9+dLBFK6vlJn+vl0EBD4=; b=jhlJHk32iaOL14/7IKFs9pVbyX4D/1jRo4
        OXp1ELbN0c78vZb76E9lhgCTrKrgTejCqJ5h8HJGTROMBBS8GW1IECYYfzQZ5FL6
        vgfMmJax8Xs5oKHB21V1VC9ySa39QDiPTXeF1RLOSnmhE491JH2x0gtPMLuXEG90
        OpCM8x3xQ=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by smtp2 (Coremail) with SMTP id GtxpCgDXMCOsG8ld_t9zAg--.4268S3;
        Mon, 11 Nov 2019 16:28:35 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: [PATCH v2] media: rockchip/rga: fix potential use after free
Date:   Mon, 11 Nov 2019 16:28:22 +0800
Message-Id: <1573460902-18563-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: GtxpCgDXMCOsG8ld_t9zAg--.4268S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DAr4ruFW3urW8KFWUCFg_yoW8WF15pa
        1kGa4xKFWFg3yUuwsrJr4DuFyrGa4Iya1FkrW3G34SkFy3KryDt34xJFyFqFWUZ3s7CFWa
        yw43tr47Ca10vFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UJgA7UUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBZBNqclQHHkd+IQAAs6
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable vga->vfd is an alias for vfd. Therefore, releasing vfd and
then unregister vga->vfd will lead to a use after free bug. In fact, the
free operation and the unregister operation are reversed.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
v2: update the goto label names consistently
---
 drivers/media/platform/rockchip/rga/rga.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index e9ff12b6b5bb..d2297abafc69 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -863,7 +863,7 @@ static int rga_probe(struct platform_device *pdev)
 	if (IS_ERR(rga->m2m_dev)) {
 		v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(rga->m2m_dev);
-		goto unreg_video_dev;
+		goto rel_vdev;
 	}
 
 	pm_runtime_get_sync(rga->dev);
@@ -892,7 +892,7 @@ static int rga_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_GRABBER, -1);
 	if (ret) {
 		v4l2_err(&rga->v4l2_dev, "Failed to register video device\n");
-		goto rel_vdev;
+		goto unreg_dev;
 	}
 
 	v4l2_info(&rga->v4l2_dev, "Registered %s as /dev/%s\n",
@@ -900,10 +900,10 @@ static int rga_probe(struct platform_device *pdev)
 
 	return 0;
 
+unreg_dev:
+	video_unregister_device(rga->vfd);
 rel_vdev:
 	video_device_release(vfd);
-unreg_video_dev:
-	video_unregister_device(rga->vfd);
 unreg_v4l2_dev:
 	v4l2_device_unregister(&rga->v4l2_dev);
 err_put_clk:
-- 
2.7.4

