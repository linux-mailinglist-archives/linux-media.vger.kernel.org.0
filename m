Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C4444A267
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 02:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242554AbhKIBRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 20:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:38612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241468AbhKIBMo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 20:12:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB32761A7F;
        Tue,  9 Nov 2021 01:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636419911;
        bh=yATXGdaUzZgEZsx70fgb68NdEgPLCYLLlzykAUdNEcA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S3N4n6cu9D3xQrERafZPllKFwj5zJ4kaKt2vK4nQ9+bLrALk2qxT1yleEUawjECIg
         gphgfDAizfPgTxjN+1rusYOWbkyBn5LbS4CHKIR3fSFMBhOrK71eJUlWE1EyNNI9Ee
         Qv3G0L5RqmJyISBRX9upt3309rCPQHL1qOoiULfUaXmyX8OCDUP2M/KXgoakV3lSo2
         UxNQb4+mb/EdT9mE5hYCmJc0KDfzOV9W0ZVgzyfoCrMGmXOJ87qlvF7TJwcP5PWKAU
         4MpcETP7NVJ8FuELHXpt8CyyfVNisCNrbCa3FD0zbMW4uNEdnoQo1fEyPFYh0M53La
         sZcONrvbhyPVg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nadezda Lutovinova <lutovinova@ispras.ru>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, a.hajda@samsung.com,
        mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 26/74] media: s5p-mfc: Add checking to s5p_mfc_probe().
Date:   Mon,  8 Nov 2021 12:48:53 -0500
Message-Id: <20211108174942.1189927-26-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174942.1189927-1-sashal@kernel.org>
References: <20211108174942.1189927-1-sashal@kernel.org>
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
index f8a5ed6bb9d7a..9faecd049002f 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1284,6 +1284,10 @@ static int s5p_mfc_probe(struct platform_device *pdev)
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

