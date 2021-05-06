Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176B13756FA
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbhEFP2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235258AbhEFP1y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8B23613FA;
        Thu,  6 May 2021 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314800;
        bh=+0zMMYy+ON6SwtYC6XQ6C9KV32b7wTDojfRwGp+w3d8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pMMoLLDhEFrrk7JMj7h1DriSIg7sK/OLajcE93vvmzfLFDDP7O/Vsyw33qkr0KLGb
         NdJKp825NUbjkwnNtNhNDVVmiX68hsw2QjrDmuB3k9eani9PHXA8bWtjV7dDh38gUO
         dBrClA9PQiFYkpGjfp1KflzCK489mV9pkzeU7fCzdxZot+OO7YRIKtDXS7BzETsxTR
         O3TygaCTWxPkOqu8IcFmlysnKpis+WNSooM4EkbpKuYxpjnYBGnrAoa7HmjeBfb1so
         tB6M8BU/B8V4MprKvHYQc2B/B+XXRCVHRfaaeUR/CWfl+mCUI2VB6FnOVQjHnziJ2N
         B3rNQ4HFzjRfQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left7-000SBP-RI; Thu, 06 May 2021 17:26:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 06/25] staging: media: tegra-video: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:44 +0200
Message-Id: <5a20f9b3cad1136586e2bea7f16e5be4444c906a.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/tegra-video/csi.c | 3 +--
 drivers/staging/media/tegra-video/vi.c  | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 033a6935c26d..e938bf4c48b6 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -298,10 +298,9 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
 	struct tegra_csi *csi = csi_chan->csi;
 	int ret, err;
 
-	ret = pm_runtime_get_sync(csi->dev);
+	ret = pm_runtime_resume_and_get(csi->dev);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(csi->dev);
 		return ret;
 	}
 
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061cda57..1298740a9c6c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -297,10 +297,9 @@ static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
 	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
 	int ret;
 
-	ret = pm_runtime_get_sync(chan->vi->dev);
+	ret = pm_runtime_resume_and_get(chan->vi->dev);
 	if (ret < 0) {
 		dev_err(chan->vi->dev, "failed to get runtime PM: %d\n", ret);
-		pm_runtime_put_noidle(chan->vi->dev);
 		return ret;
 	}
 
-- 
2.30.2

