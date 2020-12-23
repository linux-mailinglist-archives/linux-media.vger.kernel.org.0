Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C4F2E13C2
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 03:37:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbgLWCeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 21:34:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:52234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729472AbgLWCYy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 21:24:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F09B223137;
        Wed, 23 Dec 2020 02:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608690278;
        bh=THXEJ2+KwvgBooBQ7/cKKxZhDPTzR9NF/UkHJgtdvjg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B8XifmyNiJPpcQhU5aLxVsdZcAxJJyUgqevxMN7kQsP3wz69+eD2QWPB9TDIFpmK8
         KzumC7YQ6K7XqjdBjiEcWtraRp7tEb37IV/2L12Ynj6Nm3PuNEewGdTA84uqKakaJ3
         eAK9LNcad0JTkqHuC9cEIJk6OlQLUEX+kvb6jQX7Ejcdi3khhAKnKD9s/bhNnVRD+8
         CP/8D9m7TgY5ICAmDcDskxCrUOAm9ExPR4l/GMv9ZkBU7wXYs6Yag5i46mLbSjb5oI
         RTvxr5BqOV39ucdF1dLlwVq0TYNH5F3YczHHwMOmJTngKPBB4jKjOJ/fa2WWPz47oI
         qztz7fMWEGZew==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 18/48] media: isif: reset global state
Date:   Tue, 22 Dec 2020 21:23:46 -0500
Message-Id: <20201223022417.2794032-18-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022417.2794032-1-sashal@kernel.org>
References: <20201223022417.2794032-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit 6651dba2bd838f34cf5a1e84229aaa579b1a94fe ]

isif_probe() invokes iounmap() on error handling paths, but it does not
reset the global state. So, later it can invoke iounmap() even when
ioremap() fails. This is the case also for isif_remove(). The patch
resets the global state after invoking iounmap() to avoid this.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/davinci/isif.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
index b51b875c5a612..3507aa867ba12 100644
--- a/drivers/media/platform/davinci/isif.c
+++ b/drivers/media/platform/davinci/isif.c
@@ -1090,10 +1090,14 @@ static int isif_probe(struct platform_device *pdev)
 	release_mem_region(res->start, resource_size(res));
 	i--;
 fail_nobase_res:
-	if (isif_cfg.base_addr)
+	if (isif_cfg.base_addr) {
 		iounmap(isif_cfg.base_addr);
-	if (isif_cfg.linear_tbl0_addr)
+		isif_cfg.base_addr = NULL;
+	}
+	if (isif_cfg.linear_tbl0_addr) {
 		iounmap(isif_cfg.linear_tbl0_addr);
+		isif_cfg.linear_tbl0_addr = NULL;
+	}
 
 	while (i >= 0) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
@@ -1111,8 +1115,11 @@ static int isif_remove(struct platform_device *pdev)
 	int i = 0;
 
 	iounmap(isif_cfg.base_addr);
+	isif_cfg.base_addr = NULL;
 	iounmap(isif_cfg.linear_tbl0_addr);
+	isif_cfg.linear_tbl0_addr = NULL;
 	iounmap(isif_cfg.linear_tbl1_addr);
+	isif_cfg.linear_tbl1_addr = NULL;
 	while (i < 3) {
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		if (res)
-- 
2.27.0

