Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E801544A352
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 02:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243050AbhKIB0j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 20:26:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:44184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242517AbhKIBRf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 20:17:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEA84611BF;
        Tue,  9 Nov 2021 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636420037;
        bh=dCwoXnhB7rCQYl8wLUkS+EPFS16+T+dDRIuuteO4X8c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EZK9PK07Q6ox5zdcF1wqH8eVBkYnYvtrI9iHCSY22r9DCFE9vSNTq+4UwmZ1ntgI7
         4Z6zE7X2fPB2W2VfQCqbrhqDCG7Xf6bAls0+Trkod2u+87qhVX4AMUhCDfOv7i+wfR
         WWJonEgW/bkddy9NLQEj38pvmhrKVXr1XWWBcfnSEGi+ZDv6YAjRCCG2BveGDPzosH
         OE8aOwX0FsLxZZ4JmaS155wjdtK51CV61pY46jlawVuqEVIf6+SGN7/3y+XV870jpt
         3ON+8rfgdJGb5pYTLCL8WIWjsuyaDTcZEmjvuLQzMhmoLmkHi5xvaMAduq+pDhj+Zw
         pTJ0ltR5C7hYw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, a.hajda@samsung.com,
        mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 16/39] media: s5p-mfc: Add checking to s5p_mfc_probe().
Date:   Mon,  8 Nov 2021 20:06:26 -0500
Message-Id: <20211109010649.1191041-16-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109010649.1191041-1-sashal@kernel.org>
References: <20211109010649.1191041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nadezda Lutovinova <lutovinova@ispras.ru>

[ Upstream commit cdfaf4752e6915a4b455ad4400133e540e4dc965 ]

If of_device_get_match_data() return NULL,
then null pointer dereference occurs in  s5p_mfc_init_pm().
The patch adds checking if dev->variant is NULL.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Nadezda Lutovinova <lutovinova@ispras.ru>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 63d46fae9b289..75be40608bae8 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1285,6 +1285,10 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	}
 
 	dev->variant = of_device_get_match_data(&pdev->dev);
+	if (!dev->variant) {
+		dev_err(&pdev->dev, "Failed to get device MFC hardware variant information\n");
+		return -ENOENT;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->regs_base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.33.0

