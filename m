Return-Path: <linux-media+bounces-44801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E15BE6845
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA8504ED31F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCCA30E0EB;
	Fri, 17 Oct 2025 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1dIOSRv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AE334689;
	Fri, 17 Oct 2025 06:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760680974; cv=none; b=XQv4efTXsrs4PxzaABiHkq5C+e2w1YYdrtsEfUwinX1tqgZSZHFVpjEk+UhWXvCc3WskkxL30N2evI5bMo6zb7117NAH6JJpYbvJaE/9nNYTev0F6o1D3AWNMmC0uYO1qZ24R3sz5kyFOEhszOmPzyuAyEgBkr+gad4AUs7sm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760680974; c=relaxed/simple;
	bh=Suu2arU749TuyLoGK6wvdQH3+cKUABV0OD8sFc0jGns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QHN2exa9fPq3SejobhhVCA4Izrj4sd4QXRW2wiqK2lWrnZ2rgzHDxWkVh1xJVIFtwpO8EQPkT+TppMlD9Ak7GBMTFNdHzexRd+0xOAwnSRv9SO8bb7cPOl6kNkf564R9mbvkkey4RXHkK83aP1Y/R42+qlhqFJ/FIsC5vi0CNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1dIOSRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169CAC4CEE7;
	Fri, 17 Oct 2025 06:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760680974;
	bh=Suu2arU749TuyLoGK6wvdQH3+cKUABV0OD8sFc0jGns=;
	h=From:To:Cc:Subject:Date:From;
	b=P1dIOSRv0B3FYrQQTSCymFl7CdCnjnqvc62NguVkKL9+fx+9bViNCcaxnzva0EAD7
	 T9wstWY4T5Gb98atLqcx+t5leKkGQSybfqZ5VMKKoYWDoeKAT4cqg1xDfHq9jFIg3H
	 0RpGfrsw31ooz/spFrVc8HudCSksreh19dB0CLymGw9FybEkl/x020CTT2KcdDajxh
	 uFZrbDHtePreD0/qcEyUFUzfpQCN/TwKdc7Lip9viayff7cdkVI3ckwlxcGT5SJFGg
	 wFrcBRaZ4GnPFrLytzTxx2iFaJDBI1gjPQcA6e9PCX64HsYE9g3Z4q8RdK/KuU1tPd
	 RAospn6EW7P3g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9dYG-000000002BZ-3f1N;
	Fri, 17 Oct 2025 08:02:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] media: exynos4-is: fimc-is: drop unused module alias
Date: Fri, 17 Oct 2025 08:02:48 +0200
Message-ID: <20251017060249.8386-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module alias.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
index ed7b7ca16f71..0827fdaf455a 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
@@ -996,7 +996,6 @@ static void fimc_is_module_exit(void)
 module_init(fimc_is_module_init);
 module_exit(fimc_is_module_exit);
 
-MODULE_ALIAS("platform:" FIMC_IS_DRV_NAME);
 MODULE_AUTHOR("Younghwan Joo <yhwan.joo@samsung.com>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki@samsung.com>");
 MODULE_DESCRIPTION("Samsung EXYNOS4x12 FIMC-IS (Imaging Subsystem) driver");
-- 
2.49.1


