Return-Path: <linux-media+bounces-44802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E611BE684E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BBC84E5224
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936EF30EF95;
	Fri, 17 Oct 2025 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6Ih8iVd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04227A91D;
	Fri, 17 Oct 2025 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680975; cv=none; b=BnAAiIxGenMBCc+di/vEke8oH07vUp1H1PobBf1AQgTyqFDfG0rt+OV9DwkSBHZtbMdSr1wTezFralWt7Pkc8ub/fEZJvTu8bjshDxvE07T3TtVWI5Q0ZgtHEtG89UJBKGO8BZJ03QA/iBaPxffcjdzN4rbZVcvIgnmAw6HuFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680975; c=relaxed/simple;
	bh=Yc9T0RJVVdZ5ujO5xGQoIn2XXLd2RQMyZCGmF/B4H8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGlcbWTys7+n1iC7jpcGY02do1nNin8UmVIMOr4X4Cv4mxZFRlTQxtcAhaBCAvJNHzvVFACZVUiZgBWuUkj9Vnwsp5Y0gJQo4gzwA9EFG5nGqvqAwZj3vc0C6f6fdYwiI3phyZyr5QWOhI6Xr79Ltgi+1K4ZJEisa+CjVlPpCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6Ih8iVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B63C4CEF9;
	Fri, 17 Oct 2025 06:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680974;
	bh=Yc9T0RJVVdZ5ujO5xGQoIn2XXLd2RQMyZCGmF/B4H8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6Ih8iVdDmxfXRZf6mS/xtSvQfPTPM6pN2FCD6xCCTbhEswBIiUG2tMGDtO0ZAP+A
	 Rwi4DThtrZfDK3rnWUQiJIW9U3w5n/iCyFzOivKKQ5t/zKKLLSmo1rvtMMV4XYT/J9
	 hJ0Zgo6SuooTzAPwFtsN/kL0RlXNrMTE0FVA9NnbDjPQ8XVhnaYLrb/TgpwJFT2knW
	 WkKzhihLp4VK9VOecjIS2S7fYSRjeb1Wrxya/hg3dGXwXknk2AyGWqU+XhAYowTbce
	 oAnD3rDBfRE4WB0Uf6cBdDWiLzDi41srwJalx0R6ov6LnjfdIMtLmHtHlZ4ZH1+qlu
	 aUta/KMJMPS/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dYG-000000002Bb-488B;
	Fri, 17 Oct 2025 08:02:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] media: exynos4-is: fimc-lite: drop unused module alias
Date: Fri, 17 Oct 2025 08:02:49 +0200
Message-ID: <20251017060249.8386-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251017060249.8386-1-johan@kernel.org>
References: <20251017060249.8386-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not support anything but OF probing since commit
47d1f33ff43e ("[media] exynos4-is: Drop drvdata handling in fimc-lite
for non-dt platforms") so drop the unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 0ce293b0718b..8be20fd32d1c 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1662,4 +1662,3 @@ static struct platform_driver fimc_lite_driver = {
 module_platform_driver(fimc_lite_driver);
 MODULE_DESCRIPTION("Samsung EXYNOS FIMC-LITE (camera host interface) driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" FIMC_LITE_DRV_NAME);
-- 
2.49.1


