Return-Path: <linux-media+bounces-31760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43349AAA5DB
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 01:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0035E188A65E
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B68D28DF05;
	Mon,  5 May 2025 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+9TDjsH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E274B319430;
	Mon,  5 May 2025 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484280; cv=none; b=jLcajWabn478klHC/C6a9lFD/VLwNXz37ZibBkmNPOspnqNy1MF9xGXEpebcyoWcsF3x4+BYE3IEhSQwcJlWjSxuf4dS+mChKyooqj6fgxwPEaB0tPIIjhB2xzlk8mNd1BdqA1t+yFGfG6FLdiK16/sSwqkjaAycCYQH4QA6SSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484280; c=relaxed/simple;
	bh=v/ju6zynRUJtqKH6u2Ic/XOrJDA6okuwg9/FkbE2tGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SevnkNivsd/4QCMrv+9zG3YzEI1k/JfbdtBmC3K24OhDJPcFB9XWZbibD55jyXXZSxZCUYg9C+JWyZfpPjtaWcW/hqJDZjcdmi56dFky7u4WRMNV1E5Tww/BSK/uVG/EXWNB5DYaPpwJXAScTdEHxNOmeZKgI/kxkvpcMvz7Jik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+9TDjsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECAEC4CEEE;
	Mon,  5 May 2025 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484279;
	bh=v/ju6zynRUJtqKH6u2Ic/XOrJDA6okuwg9/FkbE2tGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A+9TDjsH975qB90gOtGzj6E8AYAO6D6H6gh72hzEOFkisAEf5JYKmoWKPAeZxcdY/
	 AjlMjaSZ2a4nx1t7J/oNri/SagdMybVPD5L9ot6Vl9CzwLHqBUXAeajdjVjTzzrxm0
	 cmu8xP+oTskjPSYxivCQaPu3PVq7iHtJ+V0eyu9HlWvBHHVAQ35gH8XMi2oi4z0xvf
	 0lAznC+zZ7JD9W7Za+OYgO4MdN9WbroaDzZeA1qdmZYWo3iIqNm3dtOAATpT7y4mVm
	 DyaMOKAGiLSQ6wlYp9XGagytxZWxlrYJ6uCKmFXeOOEzDo6TRyMZTXolysCoq3o+CH
	 h7wNrylfx7iIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 431/642] media: stm32: csi: add missing pm_runtime_put on error
Date: Mon,  5 May 2025 18:10:47 -0400
Message-Id: <20250505221419.2672473-431-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit f7cd9c94959e7a5b8c4eca33e20bd6ba1b048a64 ]

Within the stm32_csi_start function, pm_runtime_put should
be called upon error following pm_runtime_get_sync.
Rework the function error handling by putting a label in
order to have common error handling for all calls requiring
pm_runtime_put.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index a4f8db608cedd..0c776e4a7ce83 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -499,21 +499,19 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 
 	ret = pm_runtime_get_sync(csidev->dev);
 	if (ret < 0)
-		return ret;
+		goto error_put;
 
 	/* Retrieve CSI2PHY clock rate to compute CCFR value */
 	phy_clk_frate = clk_get_rate(csidev->clks[STM32_CSI_CLK_CSI2PHY].clk);
 	if (!phy_clk_frate) {
-		pm_runtime_put(csidev->dev);
 		dev_err(csidev->dev, "CSI2PHY clock rate invalid (0)\n");
-		return ret;
+		ret = -EINVAL;
+		goto error_put;
 	}
 
 	ret = stm32_csi_setup_lane_merger(csidev);
-	if (ret) {
-		pm_runtime_put(csidev->dev);
-		return ret;
-	}
+	if (ret)
+		goto error_put;
 
 	/* Enable the CSI */
 	writel_relaxed(STM32_CSI_CR_CSIEN, csidev->base + STM32_CSI_CR);
@@ -569,6 +567,10 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	writel_relaxed(0, csidev->base + STM32_CSI_PMCR);
 
 	return ret;
+
+error_put:
+	pm_runtime_put(csidev->dev);
+	return ret;
 }
 
 static void stm32_csi_stop(struct stm32_csi_dev *csidev)
-- 
2.39.5


