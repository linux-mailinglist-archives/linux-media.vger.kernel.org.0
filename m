Return-Path: <linux-media+bounces-11707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364748CB236
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 18:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE72BB23949
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 16:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727CF130A4D;
	Tue, 21 May 2024 16:31:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D06770FA;
	Tue, 21 May 2024 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716309117; cv=none; b=ZBFdXvzkf9GXWAMRJ1ZZqtNQKf95U6742xYAxCNl6XTVZ0gPkc8A7A/TEJmvthQ3eqi+xL4D7bH3Mx4zT3+xaZ1MlteSFWHRdZi1LPCLnvMOUJyNsf65cx1edJWjhlznKqGEWNKqkgNWZj7+wAnsW11mZ/YCZfKbVEAQ72IpP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716309117; c=relaxed/simple;
	bh=oxguKI1qcmt3W5qVgb31faLtwWPB+K37V7CO7pLboS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bDwqU+2NOhznAWl/Cy4xUXVtbkpXxDiuVdaokStN6L2kOe6cB+uyUdxSy7NKpjzUG72zxtyxTq7iVjPk6kGI0Sr+4q11pesaZiO4fWZK+cxXZWbuG6nAoocfl3D9JyneZ4nQVFHGxNkvMGn9PU1PyLDTQk0oZl7JgN+G1IocJ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 6FE8F5B0BE;
	Tue, 21 May 2024 18:23:03 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media: mgb4: Fix double debugfs remove
Date: Tue, 21 May 2024 18:22:54 +0200
Message-ID: <20240521162254.3025-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Fixes an error where debugfs_remove_recursive() is called first on a parent
directory and then again on a child which causes a kernel panic.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 60498a5abebf..ab4f07e2e560 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -642,9 +642,6 @@ static void mgb4_remove(struct pci_dev *pdev)
 	struct mgb4_dev *mgbdev = pci_get_drvdata(pdev);
 	int i;
 
-#ifdef CONFIG_DEBUG_FS
-	debugfs_remove_recursive(mgbdev->debugfs);
-#endif
 #if IS_REACHABLE(CONFIG_HWMON)
 	hwmon_device_unregister(mgbdev->hwmon_dev);
 #endif
@@ -659,6 +656,10 @@ static void mgb4_remove(struct pci_dev *pdev)
 		if (mgbdev->vin[i])
 			mgb4_vin_free(mgbdev->vin[i]);
 
+#ifdef CONFIG_DEBUG_FS
+	debugfs_remove_recursive(mgbdev->debugfs);
+#endif
+
 	device_remove_groups(&mgbdev->pdev->dev, mgb4_pci_groups);
 	free_spi(mgbdev);
 	free_i2c(mgbdev);

base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
-- 
2.44.0


