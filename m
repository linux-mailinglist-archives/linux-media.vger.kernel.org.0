Return-Path: <linux-media+bounces-38927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86208B1B3E0
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 14:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5430917AC4A
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A40F2727FA;
	Tue,  5 Aug 2025 12:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgUQaeNV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96792264D5;
	Tue,  5 Aug 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754398705; cv=none; b=Abk+v/6/MbXSqsScaHBFAuyXwlK2lZ6gyrA9I6zgyZ90gnpZq5Zgyx61qiZnODu0rjkoeAiWcuktwC8W3DD0HA/fuMNd1SAhNzYcW9UlrX/ZGhsZQVMWxSgnsNXwLJxZp+XtUwcwxAJgezjP7BQGxhnum4EKR+bfhohrwjYwtRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754398705; c=relaxed/simple;
	bh=glX1qBDWMliAILn2yECfXMlPBfXqqrIH6GdM1dkn39I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EoB/R1codHwbekBwR7/jIM+nFBW7IGBw2k1a2z5DOsu4VE3eEgtdpFnjY95EZ9SDh1RblhwfWOaTOQ95AgFwa8wzkOuRzKPuKnYU0I7BIX2BnTN8qhsJYcBH91BWDfO1uRvXXUxLGxhggaPKD0OFuSp4bgKLabAKySnMDZvX+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgUQaeNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F75C4CEF0;
	Tue,  5 Aug 2025 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754398705;
	bh=glX1qBDWMliAILn2yECfXMlPBfXqqrIH6GdM1dkn39I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgUQaeNVBWcYBuhj3rO/yGQ/EKhBj0jfC4alsHZkCTnyknbeFoRcXwc2EpFrhu1R3
	 8ara+dyQa7uoTdiufFcdNRf+SOPiHvOxgDpcMNJl3+GFE1E99lWvVgBT4yl+o3f4SY
	 +YE5IW01c/MwNACgoqxZBGTGKt/Gzj2BLe3OzPc31AjGX/GOaXyLma0lbvaVAfbQ5s
	 ciY2rqQHkGI0RRp6gGGBW/u+3wetYJw7v+Hjuid4SseynLv3JSndv688Tgu22TKQbE
	 EZdchT2KnQbR9NdZIxGkItNs2lDl3UdtdGhabfQ8QmL9Mb6m8+1Yo921X+hxOIcW/h
	 bxElNwjK0AL4A==
From: Sasha Levin <sashal@kernel.org>
To: mchehab+huawei@kernel.org
Cc: akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	hverkuil@xs4all.nl,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	torvalds@linux-foundation.org,
	quic_renjiang@quicinc.com,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] media: venus: Fix OPP table error handling
Date: Tue,  5 Aug 2025 08:58:20 -0400
Message-Id: <20250805125820.463356-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731172724.5de121a3@sal.lan>
References: <20250731172724.5de121a3@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The venus driver fails to check if dev_pm_opp_find_freq_{ceil,floor}()
returns an error pointer before calling dev_pm_opp_put(). This causes
a crash when OPP tables are not present in device tree.

Unable to handle kernel access to user memory outside uaccess routines
at virtual address 000000000000002e
...
pc : dev_pm_opp_put+0x1c/0x4c
lr : core_clks_enable+0x4c/0x16c [venus_core]

Add IS_ERR() checks before calling dev_pm_opp_put() to avoid
dereferencing error pointers.

Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

This addresses a new boot failure introduced in this PR and reported by
LKFT. Looks like the offending commit completely skipped linux-next :( 

https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.16-11579-g35a813e010b9/testrun/29378041/suite/log-parser-boot/test/internal-error-oops-oops-smp/log

 drivers/media/platform/qcom/venus/pm_helpers.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 8dd5a9b0d060..e32f8862a9f9 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -48,7 +48,8 @@ static int core_clks_enable(struct venus_core *core)
 	int ret;
 
 	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
-	dev_pm_opp_put(opp);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
 
 	for (i = 0; i < res->clks_num; i++) {
 		if (IS_V6(core)) {
@@ -660,7 +661,8 @@ static int decide_core(struct venus_inst *inst)
 	/*TODO : divide this inst->load by work_route */
 
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
-	dev_pm_opp_put(opp);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
 
 	min_loaded_core(inst, &min_coreid, &min_load, false);
 	min_loaded_core(inst, &min_lp_coreid, &min_lp_load, true);
@@ -1121,7 +1123,8 @@ static int load_scale_v4(struct venus_inst *inst)
 	freq = max(freq_core1, freq_core2);
 
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
-	dev_pm_opp_put(opp);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
 
 	if (freq > max_freq) {
 		dev_dbg(dev, VDBGL "requested clock rate: %lu scaling clock rate : %lu\n",
@@ -1131,7 +1134,8 @@ static int load_scale_v4(struct venus_inst *inst)
 	}
 
 	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
-	dev_pm_opp_put(opp);
+	if (!IS_ERR(opp))
+		dev_pm_opp_put(opp);
 
 set_freq:
 
-- 
2.39.5


