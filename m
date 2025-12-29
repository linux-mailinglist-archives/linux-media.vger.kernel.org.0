Return-Path: <linux-media+bounces-49631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB126CE6120
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 08:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 693B63007C6D
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FED2D323D;
	Mon, 29 Dec 2025 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBPbaYDH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79325265606
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766991700; cv=none; b=D+ZkSqOnDC1lIYgKpLnRcojM13/oSQQ4poXtavlnzFyHjsBtX/gGPhaclkp4Sf9u6ohwwaJ2LSfGWrCDoh7/778aX55ifwZsTz6SNsLfu3E7qM+4kvWoD91QJ25GnJghOCV32HYdnnA4LI9KtiheA1XcDSzBSBF8SXcB9gO8qGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766991700; c=relaxed/simple;
	bh=h2keJZQTTt4orCNWk1YI1WP1CMKaiyM8tZBdR25fcFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZNvuH4naUixSnM0VoMaeoI7G0qxaGtLZ9lLem7f1mz/QQryeEwakoiOg7rhVa920yjfgLwyUoKyUaI5jz4XngohP3KoBfeOOH4kS7b8BA9fFYwM+mbbj2S66DaRzrZehreDz0iOpIoXVtNc1Qg/GAqyuqBcWxSm9OqGINcN/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBPbaYDH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so5414510a12.3
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 23:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766991699; x=1767596499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=ZBPbaYDH0xuJKjqCgutSEDZSTGc04FGk7hfaPe75+gzjaLvZ0fdV4zocAHJN+kj3S0
         n4IBlzQ0rso5bFwhhU6JY4CMboQr1le/5Ll6ygjdCjJ14MjWrvRj/a3daX0hJJnJYvMF
         HBiW0iaJquQR6XURPrkoPvQmoZ7b7bT5Orma5Q7bGbTPoe0SdTTbGAUOtGiDbhp2zwcG
         sMnmFlBBpeCGUPEYmbnI3uj0Az2j2uq4rPTDxC1eT6aTDJVz7dQ7i14exMFJF201GkDW
         wKRCusDdx9+OGUTV06enq+0p+n9JMizC2r4DcYjMSEhFXPmjlTi5iuuOn7JzOr1cWcNP
         Q8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766991699; x=1767596499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cn1YA2jaa3c7NmmlHPNdV/Y/XHTIDC7PRzAlwxcDII=;
        b=K/OYPpHTfZZw8tgYA5sqCK+W6RmpIdMgHfqFfayhXcQwTvqerjls+nOnfkdxGDVKwC
         uELoqawd6FyeriIKjnJGAW1rOrYrnqaWk7R/VvZCQm8t3+ZDSDYsE9NztiVylOFGHzZU
         LG01lIGsRzBHy4wNg7TTPiIJ5SGx4k7URHhjrVM/jyop0WWEzUBPXwYDhoSngDfZjc7F
         Vi+m46MnLo/6JwSOnTb1+YtY01lgwsmiDvEHsyX0Qf0I+7W+Djpbnkg4NSgqDfpYJ9pH
         dtwQd1qrv8d5WTV6hTllTrGrMgI1ZacdxXMtzKG+ngteXOigWHtnTI2vXIlXbRlEHBZm
         3aAw==
X-Forwarded-Encrypted: i=1; AJvYcCUvfSbOEoqd5dYBEzjjODvSF/qylqHNMQN7OxyzShqE3abeeCaLrkjV9ngKbpu9tYANDGPz2kJ8a+JjKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaC5+fVskzu4EGtokRUuQTYnUtDazzBuZ++6In1eiBHTu49lBQ
	WTM4JTdr0lJDAazJlvmUsJ9TK46vEIT2FeaLlDol8STaEQa1ywn2f+F2
X-Gm-Gg: AY/fxX5sb2GJVvtSx0+BS/caiMLukhmRDc9G40go+c8oFIRetMxYMhQV76bQYdlALue
	a5nKQyIhcLsGOHHSnYfgAvgmwg6CtBMgLxgAVlX//cXQgdr4NBoLJEHS+EVJPfzCIa2E7VkjEdu
	gWm8ui+v2ZIQgP3zOKJVqzXLnx2J/yAuXV1CMfriEBh4yYnR7csuI7WWv3+2PRVE+Ue8W/DoQh9
	HxaKn0JZEbprK02oh4XM0x1guRvd1vubMMKDgq/gY+smWSX/qCkAxDZd6wlzQsUMssnfvEZZP/j
	fDmSjIGy4BWGy8MaknTJY9eKggJChuw0tKs4nhTiJ+JblUzIUFiOQVV49dZgTemMJF/5obIUz4Z
	9lpdI5NMwxupLf0h8gPCLB+U0VZpYYUmYi+ti7CzMV/3SFEUb6U+XwBp/8XCy7RkBEdOujh6TOR
	kJYelqaAyhCLWdAG4e5Ufq/1X0FHcfXgHvJ8N7t+ADcPpgWGZQmkFttcqK/nC+4YIZDKkg80Dt/
	mKyGDA=
X-Google-Smtp-Source: AGHT+IEg54VjCsdGwWrQZg836LQ7kq2l1RLk9ija49iOphX2yVvtnRWpvx5GP4wRoVgfNEIVMzd4YA==
X-Received: by 2002:a05:7300:f584:b0:2ae:566b:1213 with SMTP id 5a478bee46e88-2b05ec74b3fmr17880492eec.28.1766991698499;
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm73086507eec.6.2025.12.28.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:01:38 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] staging: media: tegra-video: move tegra210_csi_soc declaration to csi.h
Date: Mon, 29 Dec 2025 15:01:25 +0800
Message-ID: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
The symbol is referenced from csi.c, so it must remain global. Move the
declaration to csi.h so users see it via the header and avoid extern
declarations in .c files.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 4 ----
 drivers/staging/media/tegra-video/csi.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..3c3f6e3fd1ec 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_210_SOC)
-extern const struct tegra_csi_soc tegra210_csi_soc;
-#endif
-
 static const struct of_device_id tegra_csi_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", .data = &tegra210_csi_soc },
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..609c5952e050 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -130,6 +130,10 @@ struct tegra_csi_soc {
 	unsigned int tpg_frmrate_table_size;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_210_SOC)
+extern const struct tegra_csi_soc tegra210_csi_soc;
+#endif
+
 /**
  * struct tegra_csi - NVIDIA Tegra CSI device structure
  *
-- 
2.43.0


