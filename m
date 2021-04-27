Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D089636C3D7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbhD0K3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237792AbhD0K21 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FA7661413;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=Q1WsziPcbnwAb2cpqQFZbO8zttZnZQq1oIpn6yJZI+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=unDnKlP9o6a+vxQh5qp31nQEN88CtW9mWtX/Ua4La5wmjMW1KGY78blmf7pj1Wyzu
         qOd5WCV5sohjttf/sTUtf/TFTmUB7bVJS60pepQ3fMX8QkcX166Y1a0xMCkZlVDm9g
         6FK7Q97cE9jt2NrzFL1Znnbw60l7ea7hOWisMYSG1QCZV2IVSqS2r62lZ5FWloprq5
         ubcfvLclPeOS5Cr6TkAs9PqHcykmOSm9xjyMvLsp+5caennZjML9l+hWjfMbDF2j0n
         Z9vVkjalJG50mw6RGDcTxUSSfXV+z9OBGleyf9GzxMqu0VvA3W0f3PyAI7IG/GmKoN
         x8KFr3FfvGuZw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2q-KC; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 75/79] media: sunxi: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:05 +0200
Message-Id: <f1901bc5c3e2a6e88e678f5763b97509cc706bf5.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 4785faddf630..54b909987caa 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -206,9 +206,9 @@ static int sun4i_csi_open(struct file *file)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0)
-		goto err_pm_put;
+		goto err_unlock;
 
 	ret = v4l2_pipeline_pm_get(&csi->vdev.entity);
 	if (ret)
@@ -227,6 +227,8 @@ static int sun4i_csi_open(struct file *file)
 
 err_pm_put:
 	pm_runtime_put(csi->dev);
+
+err_unlock:
 	mutex_unlock(&csi->lock);
 
 	return ret;
-- 
2.30.2

