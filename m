Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26F30372
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 22:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfE3Uo4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 16:44:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36112 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfE3Uo4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 16:44:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id u22so4701015pfm.3;
        Thu, 30 May 2019 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/hPlUeB7QRpyN6BSt70ooadjF9ShdcJ+0NksjNsmhh0=;
        b=uKKRLTmncKTjtxKELbCXFl5nzpsLeSsv0/mFeIa1Kwzu6/0IluuiQYREF0JV52ti87
         24ftLE7f10ZtXt2t58I2xh0TS7VRACLjvVhLKd9ac1fM/62Zff5mXSP5sgXHRKNNJzNR
         RbDwJl8LTRnqRonNgCwMcv81iLVYdI2cTnTGE+oh5XREr5lhHXHbbymzjLz5UdEn/YdZ
         3s61awU9uHL4DmNc9kefNJg1d5e+sbMbUIoMLk0syQ2Vu/YJADT/YqpZTvod+dDpwYDR
         65he84OO8Vw+2wiXAVyk1EG+xVRS9SqhEXwouE9ksqxVU6QpwYZk0JwRHled32uLz220
         WUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/hPlUeB7QRpyN6BSt70ooadjF9ShdcJ+0NksjNsmhh0=;
        b=GjCrpnj69e1bzLOwNuY7X+4oHqH0xLqXPcIRyUzWYgI/+pQiTJXzOwmZWXdjM3v2v2
         4v5ZiTTACGLX4yoaTMlmmuJ/Pz2Vynl6DiZZe6uhBogOoxl55+iAC8p8HvEBGE5CqiY0
         yfpqZLgpSJnpfNN5SZ1joyHeVj+BxDmHMMOm8mAcocp5gGBwldmyZj1u1JXLyINxKYfb
         uKmKatXbt6vofiCOQNcKzY91BKAO2LyKh7abnnfLfc+mMQ4XyA0b+tIH/KmysjX+7NF/
         LfSUibZQFLjwEROj96fVMsFNwwd4wFLvJ9sjAazlyw/Z+Qnejtf+Nbo/GN7v3WUSiG4/
         gOsQ==
X-Gm-Message-State: APjAAAVjpzct6OKwzluQ8R64df1i3fWezNWO//3fn6Ns9v7iMuyTBjJb
        Kg6HOsxhIZr67FSei91Ji9M=
X-Google-Smtp-Source: APXvYqw+Yo4R3R765xOoY+EQq7QfZBlrNtGwrfx7gj15NKiG+YxtY1cTchBUX7FPnyS7Iu2Yfa8GkQ==
X-Received: by 2002:aa7:9a1d:: with SMTP id w29mr5577340pfj.81.1559249095511;
        Thu, 30 May 2019 13:44:55 -0700 (PDT)
Received: from localhost.localdomain ([47.15.209.13])
        by smtp.gmail.com with ESMTPSA id z9sm3235029pgc.82.2019.05.30.13.44.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 13:44:55 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     digetx@gmail.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathan@nvidia.com,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] staging: media: tegra-vde: Remove variable
Date:   Fri, 31 May 2019 02:14:39 +0530
Message-Id: <20190530204439.29830-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unnecessary variable iram_tables and use its value directly.
Issue found using Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index a5020dbf6eef..3205973218e4 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -273,12 +273,10 @@ static void tegra_vde_setup_iram_entry(struct tegra_vde *vde,
 				       unsigned int row,
 				       u32 value1, u32 value2)
 {
-	u32 *iram_tables = vde->iram;
-
 	trace_vde_setup_iram_entry(table, row, value1, value2);
 
-	iram_tables[0x20 * table + row * 2] = value1;
-	iram_tables[0x20 * table + row * 2 + 1] = value2;
+	vde->iram[0x20 * table + row * 2] = value1;
+	vde->iram[0x20 * table + row * 2 + 1] = value2;
 }
 
 static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
-- 
2.19.1

