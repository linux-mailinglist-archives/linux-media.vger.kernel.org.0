Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7156C291F81
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 22:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgJRTS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 15:18:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:56470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727533AbgJRTS0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 15:18:26 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B449A222C8;
        Sun, 18 Oct 2020 19:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048705;
        bh=oDOnjFHkVgiIoA7tw0e2d0rfAy5TH6MzhU8d0U9ZVbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kTJv401WLbNVxL+wpODQyII0kVA2sYXBsP0jRg0Y6OVuKpYb0adez6Fo4MEufAk88
         QI3Pb4ehZdELhJn05TCZq1cbLfosv2lq269pKpvzjOUdwuO5Ejfa/3VUOD/U6G5PHa
         K+tFlTzq/2dfvshTmX/RRSOAzsXrOqfCMWtH8Mos=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 014/111] media: vsp1: Fix runtime PM imbalance on error
Date:   Sun, 18 Oct 2020 15:16:30 -0400
Message-Id: <20201018191807.4052726-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dinghao Liu <dinghao.liu@zju.edu.cn>

[ Upstream commit 98fae901c8883640202802174a4bd70a1b9118bd ]

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index c650e45bb0ad1..dc62533cf32ce 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -562,7 +562,12 @@ int vsp1_device_get(struct vsp1_device *vsp1)
 	int ret;
 
 	ret = pm_runtime_get_sync(vsp1->dev);
-	return ret < 0 ? ret : 0;
+	if (ret < 0) {
+		pm_runtime_put_noidle(vsp1->dev);
+		return ret;
+	}
+
+	return 0;
 }
 
 /*
@@ -845,12 +850,12 @@ static int vsp1_probe(struct platform_device *pdev)
 	/* Configure device parameters based on the version register. */
 	pm_runtime_enable(&pdev->dev);
 
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = vsp1_device_get(vsp1);
 	if (ret < 0)
 		goto done;
 
 	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
-	pm_runtime_put_sync(&pdev->dev);
+	vsp1_device_put(vsp1);
 
 	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
 		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
-- 
2.25.1

