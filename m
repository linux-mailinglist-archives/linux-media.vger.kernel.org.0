Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EB836DA78
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhD1O4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240301AbhD1Oxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 465B761625;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=Q1WsziPcbnwAb2cpqQFZbO8zttZnZQq1oIpn6yJZI+I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pbVmWUko8EIn3VxKIW0ult3Zuz5CkjUtFAymk8b8ZJwX9BlYJlWjjFZMiH5bdFbbI
         Tdx94aGYJYzZfhJetROKRuHyoZNGKfypX46KoZKJch/9rvmhaHlDS+oXzK1ZXLh+YD
         GFNlPECjgVSAjn1615zi+bceklNTXLGaxMUqkvjwjQgmrtL1VfhtTdiUPrCL8auadR
         N9e4U4ROmJ98tOcdf5B3b7eNd6zJD1BQS7AsJDP79Xf3/aCZ0SV7MR3xt58e+Z0f2h
         wRNbBnKszwhMAx/5aY7FmCAi5JuLSBOWWSZP4fx7rWFvkQ/0HfkbvUkXefThX9Xjrh
         tynlVDrvf2pCg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001DtA-U9; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 74/79] media: sunxi: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:35 +0200
Message-Id: <3138e98e18858b3133b9a6e04890c29c731903f3.1619621413.git.mchehab+huawei@kernel.org>
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

