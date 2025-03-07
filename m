Return-Path: <linux-media+bounces-27829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE3A5652C
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 11:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3BD63B4DF2
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20B22147F6;
	Fri,  7 Mar 2025 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XctVTEVJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13582139A2;
	Fri,  7 Mar 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343076; cv=none; b=PB4bSDg8oG7gVZuFMou5SjgxMs/aBeXMH2EATA5Ds4x0BNCNg8oKBwX+JoJrE0HSao2Xopv8SBTAiTfJmapD0Vuk5wnWdnAKUQ+W6o3GZC2TqhpeWa6/q9GSALQMZ/mOGslMGPM5/zQ2eGsOblJxfcj8pmYBNZeeRaZGuGH6poA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343076; c=relaxed/simple;
	bh=HeDIxAdEuAAa3TOF0TBW/06fHRb1X6hHqGgLAIC4cBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jxnf3PvbxHkXvHLcTOvpnMv7j+4r+npu6mgR+4qRchyi/C0dThT8SSHWRKXXdul9EIJ63lAU/+wpBKI8WGBEhvBGE4GCvYB83z0RptZjntOgYAi/x00aAyUbIwNlOfYJCQF2XkZDNJ5cuiLbfQ8QLguFKf33H46gouxhOorNuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XctVTEVJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1162C4CED1;
	Fri,  7 Mar 2025 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741343075;
	bh=HeDIxAdEuAAa3TOF0TBW/06fHRb1X6hHqGgLAIC4cBE=;
	h=From:To:Cc:Subject:Date:From;
	b=XctVTEVJRnVQ9XGxH2L0Jk8Zo4JjD8Giv4AeoyuEm2v3B+LnqoaEQUbMhcQmYWWey
	 2IbYgMTA5Sw2hv9kYox+qfP9B/SGbfruqUr02bD+YkrQlKq9KoY0YIjqssKJ5YXFxa
	 GLtZn0cK5vyPk0TyNrK36EhYvyNMCUnn+327IeHdvMLqrDUdnSc6Boi3JSH7wMN9uP
	 oOdnhiyG2LYwkyQuXjtoAScjak0Y7mWOo6gFs+DtvCamRwlxQJxi0XIMxmfEW9D8u6
	 Slz+144smcR8CdjFVZrryDejVSthfyL797WG8wbl5vyOo9m0KXUOfYy8PXq5DhzJAw
	 GI5S1ZoB8GKRw==
From: Arnd Bergmann <arnd@kernel.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: pci: mgb4: include linux/errno.h
Date: Fri,  7 Mar 2025 11:24:27 +0100
Message-Id: <20250307102431.73506-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The errno.h header is not always included indirectly, leading
to rare randconfig build warnings.

drivers/media/pci/mgb4/mgb4_regs.c:20:11: error: use of undeclared identifier 'EINVAL'
   20 |                 return -EINVAL;

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/mgb4/mgb4_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 31befd722d72..b45537dbfafa 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/ioport.h>
+#include <linux/errno.h>
 #include "mgb4_regs.h"
 
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
-- 
2.39.5


