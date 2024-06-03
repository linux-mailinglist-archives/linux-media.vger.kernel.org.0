Return-Path: <linux-media+bounces-12452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BFE8D7F9D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 12:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13B051F257C5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB04824AB;
	Mon,  3 Jun 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T6MnWyrb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7617E796
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717409042; cv=none; b=W6T6DO1RY7P3ogY2Fgdoxq+qHE2gQJjQWHdqB3aaaKBttIHFHEdShkq2cw2jVe0BGEep9xu0pHB+KaJJbBvhTM1x3mW5/RyYUKIWzUyhFEcLy8jeRyXDEykkqW1GDFtpYmk9apNzrwPImCMJryeO4nyBuK5903twIKd5Mt5FpQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717409042; c=relaxed/simple;
	bh=Uwm71QwiZiskaFNE5hC3kDx6Ghn2eJwESg9uo3KSEzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GJX6yaX/EZt0TSmtKOIELXeiRA9+epyhNvU4scCVJZOipurzITzfav2E3WjCueLfqt9tjouGSGlvdEvUp52NCdwXAFyPEnvlN4zsz7C2/KYcU20NyZ2yOFhQJXlYxFL4WcKPaPQ2EKCyMBnkK2uRufau06xtrYQtryMgS35gytg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T6MnWyrb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/RLCNyizVaI6Dm
	AjebjIJepF3QUYj0BeBbucccNDlEc=; b=T6MnWyrb0h/vF3FCuyteOwdtBPggtj
	qePz2QgVmsibLy3Esa9SnAcFvF8HrJDG3FoMiSmi7rtmuTEnMQnjLktDqPOdVPGE
	8VZsQFI9h5rD+J23Hox2+XsHKY/FRMs6TIsKFFO0mc/4v8j0tMW6qCsV6qdmdcgA
	RoR75keyI2EYAfguBluRuOi7ZgNiEJuD5oayAMcNEq6nTdFIr8Axchzyf8a1Q9dC
	st5UEcU34JhIx77WZDwOHVK3RsILipKePp0JtKet+afgOFU5SohRbFsKUs6ptpgc
	aqj/9wufPE6eo/MW8dZ/VZMq58QKD3LHmgq+0ods6l7rKpZu4FoSoiHA==
Received: (qmail 1913243 invoked from network); 3 Jun 2024 12:03:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 12:03:56 +0200
X-UD-Smtp-Session: l3s3148p1@fBSFc/kZjJ8gAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: delete email for Anton Sviridenko
Date: Mon,  3 Jun 2024 12:01:17 +0200
Message-ID: <20240603100346.10678-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address bounced. I couldn't find a newer one in recent git history,
so update MAINTAINERS accordingly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 523d84b2d613..947f9b25d139 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20724,7 +20724,6 @@ F:	include/uapi/rdma/rdma_user_rxe.h
 
 SOFTLOGIC 6x10 MPEG CODEC
 M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
-M:	Anton Sviridenko <anton@corp.bluecherry.net>
 M:	Andrey Utkin <andrey_utkin@fastmail.com>
 M:	Ismael Luceno <ismael@iodev.co.uk>
 L:	linux-media@vger.kernel.org
@@ -22927,7 +22926,6 @@ F:	tools/testing/selftests/turbostat/
 
 TW5864 VIDEO4LINUX DRIVER
 M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
-M:	Anton Sviridenko <anton@corp.bluecherry.net>
 M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
 M:	Andrey Utkin <andrey_utkin@fastmail.com>
 L:	linux-media@vger.kernel.org
-- 
2.43.0


